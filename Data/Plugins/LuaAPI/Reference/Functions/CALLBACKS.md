# Event Callbacks Reference

Complete reference for all event callback functions triggered by game server events.

---

## Table of Contents

- [Callback Types](#callback-types)
- [Connection & Authentication](#connection--authentication)
- [Server Lifecycle](#server-lifecycle)
- [Warehouse Events](#warehouse-events)
- [Special Event Entries](#special-event-entries)
- [Player Progression](#player-progression)
- [Command Handling](#command-handling)
- [NPC Interaction](#npc-interaction)
- [Inventory Management](#inventory-management)
- [Item Acquisition](#item-acquisition)
- [Equipment Events](#equipment-events)
- [Item Repair](#item-repair)
- [Map & Movement](#map--movement)
- [Combat & Death](#combat--death)
- [Shop & Trading](#shop--trading)
- [Database Queries](#database-queries)

---

## Callback Types

**Sync (Synchronous):**
- Executed synchronously in C++ event flow
- Can return values to affect game logic
- Can prevent/allow actions
- Must complete quickly to avoid blocking

**Async (Asynchronous):**
- Executed asynchronously after event
- Cannot return values
- Cannot prevent actions
- Used for logging, notifications, custom logic

---

## Connection & Authentication

### onCharacterSelectEnter

```lua
function onCharacterSelectEnter(oPlayer)
```

**Type:** Async

**Called when:** Player enters character selection screen

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player object entering character select |

**Usage:**
```lua
function onCharacterSelectEnter(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("Player entering character select: %s", oPlayer.Name))
    end
end
```

---

### onPlayerConnect

```lua
function onPlayerConnect(oPlayer)
```

**Type:** Async

**Called when:** Player successfully connects to game server

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player object that connected |

**Usage:**
```lua
function onPlayerConnect(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("Player connected: %s from IP: %s", oPlayer.Name, oPlayer.IP))
        Message.Send(0, oPlayer.Index, 1, "Welcome to the server!")
    end
end
```

---

### onPlayerLogin

```lua
function onPlayerLogin(oPlayer)
```

**Type:** Async

**Called when:** Player logs in with character

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player object that logged in |

**Usage:**
```lua
function onPlayerLogin(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s logged in - Level %d", oPlayer.Name, oPlayer.Level))
        
        -- Award daily login bonus
        if CheckDailyLogin(oPlayer.Index) then
            Player.SetMoney(oPlayer.Index, 100000, false)
            Message.Send(0, oPlayer.Index, 0, "Daily login bonus: 100,000 zen!")
        end
    end
end
```

---

### onPlayerDisconnect

```lua
function onPlayerDisconnect(oPlayer)
```

**Type:** Async

**Called when:** Player disconnects from server

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player object that disconnected |

**Usage:**
```lua
function onPlayerDisconnect(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("Player disconnected: %s", oPlayer.Name))
        
        -- Clean up player-specific data
        ClearPlayerTimers(oPlayer.Index)
        RemoveFromActiveEvents(oPlayer.Index)
    end
end
```

---

## Server Lifecycle

### onGameServerStart

```lua
function onGameServerStart()
```

**Type:** Async

**Called when:** Game server starts

**Parameters:** None

**Usage:**
```lua
function onGameServerStart()
    Log.Add("=== Game Server Started ===")
    Log.Add(string.format("Server: %s (Code: %d)", Server.GetName(), Server.GetCode()))
    Log.Add(string.format("Max Players: %d", Object.GetMaxOnlineUser()))
    
    -- Initialize server-wide systems
    InitializeEventScheduler()
    LoadItemBags()
    StartGlobalTimers()
end
```

---


### onDisconnectAllPlayers

```lua
function onDisconnectAllPlayers()
```

**Type:** Async

**Called when:** Server initiates forced shutdown (disconnects all players immediately)

**Parameters:** None

**Usage:**
```lua
function onDisconnectAllPlayers()
    Log.Add("[Server] Forced shutdown initiated - disconnecting all players")
    
    -- Save any pending data
    SaveServerState()
    
    -- Log shutdown event
    Database.LogEvent("SERVER_FORCED_SHUTDOWN", os.date("%Y-%m-%d %H:%M:%S"))
end
```

---

### onLogOutAllPlayers

```lua
function onLogOutAllPlayers()
```

**Type:** Async

**Called when:** Server initiates graceful shutdown (requests logout for all players)

**Parameters:** None

**Usage:**
```lua
function onLogOutAllPlayers()
    Log.Add("[Server] Graceful shutdown initiated - requesting all players to log out")
    
    -- Notify all players
    Message.Send(0, -1, 1, "Server maintenance in 5 minutes. Please log out safely.")
    
    -- Save all character data
    for player in Object.Iterator(Object.IteratorType.PLAYER) do
        if player ~= nil then
            Database.SaveCharacter(player.Index)
        end
    end
end
```

---

### onDisconnectAllPlayersWithReconnect

```lua
function onDisconnectAllPlayersWithReconnect()
```

**Type:** Async

**Called when:** Server initiates restart (disconnects players with reconnect allowed)

**Parameters:** None

**Usage:**
```lua
function onDisconnectAllPlayersWithReconnect()
    Log.Add("[Server] Server restart initiated - players can reconnect")
    
    -- Notify players about restart
    Message.Send(0, -1, 1, "Server restarting now. You can reconnect in 2 minutes.")
    
    -- Log restart event with timestamp
    Database.LogEvent("SERVER_RESTART", os.date("%Y-%m-%d %H:%M:%S"))
    
    -- Save restart flag for post-restart processing
    Server.SetCustomValue("last_restart_time", os.time())
end
```

---

## Warehouse Events

### onOpenWarehouse

```lua
function onOpenWarehouse(oPlayer)
```

**Type:** Async

**Called when:** Player opens warehouse

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player opening warehouse |

**Usage:**
```lua
function onOpenWarehouse(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s opened warehouse", oPlayer.Name))
        
        -- Check for VIP benefits
        if oPlayer.userData.VIPType > 0 then
            Message.Send(0, oPlayer.Index, 0, "VIP: Extended warehouse space active")
        end
    end
end
```

---

### onCloseWarehouse

```lua
function onCloseWarehouse(oPlayer)
```

**Type:** Async

**Called when:** Player closes warehouse

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player closing warehouse |

**Usage:**
```lua
function onCloseWarehouse(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s closed warehouse", oPlayer.Name))
    end
end
```

---

## Special Event Entries

### onBloodCastleEnter

```lua
function onBloodCastleEnter(oPlayer, EventLevel)
```

**Type:** Async

**Called when:** Player enters Blood Castle event

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player entering event |
| `EventLevel` | int | Blood Castle level (1-8) |

**Usage:**
```lua
function onBloodCastleEnter(oPlayer, EventLevel)
    if oPlayer ~= nil then
        Log.Add(string.format("%s entered Blood Castle Level %d", oPlayer.Name, EventLevel))
        Message.Send(0, oPlayer.Index, 1, string.format("Blood Castle %d - Good luck!", EventLevel))
    end
end
```

---

### onChaosCastleEnter

```lua
function onChaosCastleEnter(oPlayer, EventLevel)
```

**Type:** Async

**Called when:** Player enters Chaos Castle event

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player entering event |
| `EventLevel` | int | Chaos Castle level (1-7) |

**Usage:**
```lua
function onChaosCastleEnter(oPlayer, EventLevel)
    if oPlayer ~= nil then
        Log.Add(string.format("%s entered Chaos Castle Level %d", oPlayer.Name, EventLevel))
    end
end
```

---

### onDevilSquareEnter

```lua
function onDevilSquareEnter(oPlayer, EventLevel)
```

**Type:** Async

**Called when:** Player enters Devil Square event

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player entering event |
| `EventLevel` | int | Devil Square level (1-7) |

**Usage:**
```lua
function onDevilSquareEnter(oPlayer, EventLevel)
    if oPlayer ~= nil then
        Log.Add(string.format("%s entered Devil Square Level %d", oPlayer.Name, EventLevel))
    end
end
```

---

## Player Progression

### onPlayerLevelUp

```lua
function onPlayerLevelUp(oPlayer)
```

**Type:** Async

**Called when:** Player gains a level

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player that leveled up |

**Usage:**
```lua
function onPlayerLevelUp(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s reached level %d", oPlayer.Name, oPlayer.Level))
        
        -- Award level milestone rewards
        if oPlayer.Level == 400 then
            Message.Send(0, -1, 1, string.format("%s reached level 400!", oPlayer.Name))
            Player.SetMoney(oPlayer.Index, 10000000, false)
        end
    end
end
```

---

### onPlayerMasterLevelUp

```lua
function onPlayerMasterLevelUp(oPlayer)
```

**Type:** Async

**Called when:** Player gains a master level

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player that gained master level |

**Usage:**
```lua
function onPlayerMasterLevelUp(oPlayer)
    if oPlayer ~= nil then
        local mlevel = oPlayer.userData.MasterLevel
        Log.Add(string.format("%s reached master level %d", oPlayer.Name, mlevel))
        
        if mlevel == 200 then
            Message.Send(0, -1, 1, string.format("%s achieved ML 200!", oPlayer.Name))
        end
    end
end
```

---

### onUseCommand

```lua
function onUseCommand(oPlayer, szCmd)
```

**Type:** Sync (can prevent command execution)

**Called when:** Player types a command (any string starting with `/`)

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player who typed the command |
| `szCmd` | string | Full command string as typed, including the leading `/` (e.g. `"/post Hello World"`) |

**Return value:**

| Return | Effect |
|--------|--------|
| `1` | Block command — C++ stops processing it |
| `0` or `nil` | Allow command — C++ continues normal execution |

**Notes:**
- `szCmd` is the raw string. Split it into parts in Lua using `string.gmatch(szCmd, "%S+")`.
- The first part (`parts[1]`) is the command name including the `/` prefix.
- Remaining parts are arguments in order.

**Usage:**
```lua
function onUseCommand(oPlayer, szCmd)
	if oPlayer == nil then return 0 end

	-- Split into parts: "/post Hello World" -> {"/post", "Hello", "World"}
	local parts = {}
	for part in string.gmatch(szCmd, "%S+") do
		table.insert(parts, part)
	end

	local cmd = parts[1] or ""

	-- Example: custom /online command
	if cmd == "/online" then
		local count = 0
		Object.ForEachPlayer(function(oP)
			count = count + 1
			return true
		end)
		Message.Send(0, oPlayer.Index, 0, string.format("Players online: %d", count))
		return 1  -- block default handler

	-- Example: block non-GM players from using /move
	elseif cmd == "/move" then
		if oPlayer.GameMaster == 0 then
			Message.Send(0, oPlayer.Index, 0, "You don't have permission to use that command.")
			Log.Add(string.format("[CMD] %s tried to use %s", oPlayer.Name, szCmd))
			return 1  -- block
		end
	end

	return 0  -- allow all other commands
end
```

---

### onPlayerReset

```lua
function onPlayerReset(oPlayer)
```

**Type:** Sync

**Called when:** Player performs character reset

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player performing reset |

**Usage:**
```lua
function onPlayerReset(oPlayer)
    if oPlayer ~= nil then
        local resets = oPlayer.userData.Resets + 1
        Log.Add(string.format("%s performed reset #%d", oPlayer.Name, resets))
        
        -- Award reset rewards
        Message.Send(0, oPlayer.Index, 1, string.format("Reset #%d complete!", resets))
    end
end
```

---

## NPC Interaction

### onNpcTalk

```lua
function onNpcTalk(oPlayer, oNpc)
```

**Type:** Sync

**Called when:** Player talks to NPC

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player talking to NPC |
| `oNpc` | object (stObject) | NPC object (same structure as player/monster) |

**Return value:**

| Return | Effect |
|--------|--------|
| `1` | Stop processing further C++ code |
| `0` or `nil` | Allow command — C++ continues normal execution |

**Usage:**
```lua
function onNpcTalk(oPlayer, oNpc)
    if oPlayer ~= nil and oNpc ~= nil then
        Log.Add(string.format("%s talked to NPC %d", oPlayer.Name, oNpc.Class))
        
        -- Custom NPC dialog
        if oNpc.Class == 257 then  -- Custom NPC
            Message.Send(0, oPlayer.Index, 0, "Welcome to my shop!")
        end
    end
    return 0
end
```

---

### onCloseWindow

```lua
function onCloseWindow(oPlayer)
```

**Type:** Sync

**Called when:** Player end conversation with NPC by closing NPC window

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player talking to NPC |

**Return value:**

| Return | Effect |
|--------|--------|
| `1` | Stop processing further C++ code |
| `0` or `nil` | Allow command — C++ continues normal execution |

**Usage:**
```lua
function onCloseWindow(oPlayer)
    if oPlayer ~= nil then
        
    end
    return 0
end
```

---

## Inventory Management

### onInventoryMoveItem

```lua
function onInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
```

**Type:** Async

**Called when:** Player moves item in main inventory

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player moving item |
| `iItemSourcePos` | int | Source inventory slot |
| `iItemTargetPos` | int | Target inventory slot |
| `btResult` | int | Move result (1 = success, 0 = failed) |

**Usage:**
```lua
function onInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
    if oPlayer ~= nil and btResult == 1 then
        Log.Add(string.format("%s moved item from slot %d to %d", 
            oPlayer.Name, iItemSourcePos, iItemTargetPos))
    end
end
```

---

### onEventInventoryMoveItem

```lua
function onEventInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
```

**Type:** Async

**Called when:** Player moves item in event inventory

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player moving item |
| `iItemSourcePos` | int | Source event inventory slot |
| `iItemTargetPos` | int | Target event inventory slot |
| `btResult` | int | Move result (1 = success, 0 = failed) |

**Usage:**
```lua
function onEventInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
    if oPlayer ~= nil and btResult == 1 then
        Log.Add(string.format("%s moved event item %d -> %d", 
            oPlayer.Name, iItemSourcePos, iItemTargetPos))
    end
end
```

---

### onMuunInventoryMoveItem

```lua
function onMuunInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
```

**Type:** Async

**Called when:** Player moves Muun item in inventory

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player moving Muun item |
| `iItemSourcePos` | int | Source Muun inventory slot |
| `iItemTargetPos` | int | Target Muun inventory slot |
| `btResult` | int | Move result (1 = success, 0 = failed) |

**Usage:**
```lua
function onMuunInventoryMoveItem(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
    if oPlayer ~= nil and btResult == 1 then
        Log.Add(string.format("%s moved Muun item %d -> %d", 
            oPlayer.Name, iItemSourcePos, iItemTargetPos))
    end
end
```

---

## Item Acquisition

### onItemGet

```lua
function onItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
```

**Type:** Async

**Called when:** Player picks up item from ground

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player picking up item |
| `sItemType` | short | Item type ID |
| `sItemLevel` | short | Item level |
| `btItemDur` | BYTE | Item durability |
| `btItemElement` | BYTE | Item element type |

**Usage:**
```lua
function onItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
    if oPlayer ~= nil then
        local itemAttr = Item.GetAttr(sItemType)
        if itemAttr ~= nil then
            local itemName = itemAttr:GetName()
            Log.Add(string.format("%s picked up: %s +%d", 
                oPlayer.Name, itemName, sItemLevel))
        end
    end
end
```

---

### onEventItemGet

```lua
function onEventItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
```

**Type:** Async

**Called when:** Player acquires event item

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player acquiring item |
| `sItemType` | short | Item type ID |
| `sItemLevel` | short | Item level |
| `btItemDur` | BYTE | Item durability |
| `btItemElement` | BYTE | Item element type |

**Usage:**
```lua
function onEventItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
    if oPlayer ~= nil then
        Log.Add(string.format("%s got event item: %d +%d", 
            oPlayer.Name, sItemType, sItemLevel))
    end
end
```

---

### onMuunItemGet

```lua
function onMuunItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
```

**Type:** Async

**Called when:** Player acquires Muun item

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player acquiring Muun |
| `sItemType` | short | Item type ID |
| `sItemLevel` | short | Item level |
| `btItemDur` | BYTE | Item durability |
| `btItemElement` | BYTE | Item element type |

**Usage:**
```lua
function onMuunItemGet(oPlayer, sItemType, sItemLevel, btItemDur, btItemElement)
    if oPlayer ~= nil then
        Log.Add(string.format("%s acquired Muun: %d +%d", 
            oPlayer.Name, sItemType, sItemLevel))
    end
end
```

---

## Equipment Events

### onItemEquip

```lua
function onItemEquip(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
```

**Type:** Async

**Called when:** Player equips item

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player equipping item |
| `iItemSourcePos` | int | Source inventory slot |
| `iItemTargetPos` | int | Equipment slot |
| `btResult` | int | Equip result (1 = success, 0 = failed) |

**Usage:**
```lua
function onItemEquip(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
    if oPlayer ~= nil and btResult == 1 then
        local item = oPlayer:GetInventoryItem(iItemTargetPos)
        if item ~= nil then
            Log.Add(string.format("%s equipped item in slot %d", 
                oPlayer.Name, iItemTargetPos))
            
            -- Recalculate stats after equipment change
            Player.ReCalc(oPlayer.Index)
        end
    end
end
```

---

### onItemUnEquip

```lua
function onItemUnEquip(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
```

**Type:** Async

**Called when:** Player unequips item

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player unequipping item |
| `iItemSourcePos` | int | Equipment slot |
| `iItemTargetPos` | int | Target inventory slot |
| `btResult` | int | Unequip result (1 = success, 0 = failed) |

**Usage:**
```lua
function onItemUnEquip(oPlayer, iItemSourcePos, iItemTargetPos, btResult)
    if oPlayer ~= nil and btResult == 1 then
        Log.Add(string.format("%s unequipped item from slot %d", 
            oPlayer.Name, iItemSourcePos))
        
        -- Recalculate stats
        Player.ReCalc(oPlayer.Index)
    end
end
```

---

## Item Repair

### onItemRepair

```lua
function onItemRepair(oPlayer, oItem)
```

**Type:** Async

**Called when:** Player repairs item at NPC

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player repairing item |
| `oItem` | object (ItemInfo) | Item being repaired |

**Usage:**
```lua
function onItemRepair(oPlayer, oItem)
    if oPlayer ~= nil and oItem ~= nil then
        local itemAttr = Item.GetAttr(oItem.Type)
        if itemAttr ~= nil then
            local itemName = itemAttr:GetName()
            Log.Add(string.format("%s repaired: %s", oPlayer.Name, itemName))
        end
    end
end
```

---

## Map & Movement

### onCharacterJoinMap

```lua
function onCharacterJoinMap(oPlayer)
```

**Type:** Async

**Called when:** Player joins map after login or teleport

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player joining map |

**Usage:**
```lua
function onCharacterJoinMap(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s joined map %d at (%d, %d)", 
            oPlayer.Name, oPlayer.MapNumber, oPlayer.X, oPlayer.Y))
        
        -- Check for map-specific events
        if oPlayer.MapNumber == 10 then  -- Devias
            Message.Send(0, oPlayer.Index, 0, "Welcome to Devias!")
        end
    end
end
```

---

### onMoveMap

```lua
function onMoveMap(oPlayer, wMapNumber, btPosX, btPosY, iGateNumber)
```

**Type:** Async

**Called when:** Player moves between maps

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player moving |
| `wMapNumber` | WORD | Target map number |
| `btPosX` | BYTE | Target X coordinate |
| `btPosY` | BYTE | Target Y coordinate |
| `iGateNumber` | int | Gate number used (-1 if not gate) |

**Usage:**
```lua
function onMoveMap(oPlayer, wMapNumber, btPosX, btPosY, iGateNumber)
    if oPlayer ~= nil then
        Log.Add(string.format("%s moved to map %d (%d, %d) via gate %d", 
            oPlayer.Name, wMapNumber, btPosX, btPosY, iGateNumber))
    end
end
```

---

### onMapTeleport

```lua
function onMapTeleport(oPlayer, iGateNumber)
```

**Type:** Async

**Called when:** Player uses map gate/portal

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player using gate |
| `iGateNumber` | int | Gate index |

**Usage:**
```lua
function onMapTeleport(oPlayer, iGateNumber)
    if oPlayer ~= nil then
        Log.Add(string.format("%s used gate %d", oPlayer.Name, iGateNumber))
        
        -- Check gate cooldown
        local lastGateTick = oPlayer.ActionTickCount[1].tick
        if (Timer.GetTick() - lastGateTick) < 5000 then
            Message.Send(0, oPlayer.Index, 0, "Gate cooldown: 5 seconds")
        else
            ActionTick.Set(oPlayer.Index, 1, Timer.GetTick(), "Gate")
        end
    end
end
```

---

### onTeleport

```lua
function onTeleport(oPlayer, wMapNumber, btPosX, btPosY)
```

**Type:** Async

**Called when:** Player uses teleport command or item

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player teleporting |
| `wMapNumber` | WORD | Target map number |
| `btPosX` | BYTE | Target X coordinate |
| `btPosY` | BYTE | Target Y coordinate |

**Usage:**
```lua
function onTeleport(oPlayer, wMapNumber, btPosX, btPosY)
    if oPlayer ~= nil then
        Log.Add(string.format("%s teleported to map %d (%d, %d)", 
            oPlayer.Name, wMapNumber, btPosX, btPosY))
    end
end
```

---

### onTeleportMagicUse

```lua
function onTeleportMagicUse(oPlayer, btPosX, btPosY)
```

**Type:** Async

**Called when:** Player uses teleport magic skill

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player using teleport skill |
| `btPosX` | BYTE | Target X coordinate |
| `btPosY` | BYTE | Target Y coordinate |

**Usage:**
```lua
function onTeleportMagicUse(oPlayer, btPosX, btPosY)
    if oPlayer ~= nil then
        Log.Add(string.format("%s teleported to (%d, %d) using magic", 
            oPlayer.Name, btPosX, btPosY))
    end
end
```

---

## Combat & Death

### onPlayerKill

```lua
function onPlayerKill(oPlayer, oTarget)
```

**Type:** Async

**Called when:** Player kills another player

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player who killed |
| `oTarget` | object (stObject) | Player who was killed |

**Usage:**
```lua
function onPlayerKill(oPlayer, oTarget)
    if oPlayer ~= nil and oTarget ~= nil then
        Log.Add(string.format("%s killed %s", oPlayer.Name, oTarget.Name))
        
        -- Award PK points or penalties
        Message.Send(0, -1, 0, string.format("%s killed %s!", 
            oPlayer.Name, oTarget.Name))
    end
end
```

---

### onPlayerDie

```lua
function onPlayerDie(oPlayer, oTarget)
```

**Type:** Async

**Called when:** Player dies

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player who died |
| `oTarget` | Player/Monster | Object that killed player |

**Usage:**
```lua
function onPlayerDie(oPlayer, oTarget)
    if oPlayer ~= nil then
        if oTarget ~= nil then
            Log.Add(string.format("%s was killed by %s", 
                oPlayer.Name, oTarget.Name or "Monster"))
        else
            Log.Add(string.format("%s died", oPlayer.Name))
        end
        
        -- Clear player timers on death
        for i = 0, 2 do
            ActionTick.Clear(oPlayer.Index, i)
        end
    end
end
```

---

### onPlayerRespawn

```lua
function onPlayerRespawn(oPlayer)
```

**Type:** Async

**Called when:** Player respawns after death

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player respawning |

**Usage:**
```lua
function onPlayerRespawn(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("%s respawned at map %d", 
            oPlayer.Name, oPlayer.MapNumber))
        
        Message.Send(0, oPlayer.Index, 0, "You have respawned!")
    end
end
```

---

### onMonsterKill

```lua
function onMonsterKill(oPlayer, oTarget)
```

**Type:** Async

**Called when:** Player kills monster

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player who killed monster |
| `oTarget` | Monster | Monster that was killed |

**Usage:**
```lua
function onMonsterKill(oPlayer, oTarget)
    if oPlayer ~= nil and oTarget ~= nil then
        Log.Add(string.format("%s killed monster %d", 
            oPlayer.Name, oTarget.Class))
        
        -- Award bonus for specific monsters
        if oTarget.Class == 275 then  -- Golden Goblin
            Player.SetMoney(oPlayer.Index, 1000000, false)
            Message.Send(0, oPlayer.Index, 1, "Golden Goblin bonus: 1kk zen!")
        end
    end
end
```

---

### onMonsterDie

```lua
function onMonsterDie(oPlayer, oTarget)
```

**Type:** Async

**Called when:** Monster dies

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player who killed (may be nil) |
| `oTarget` | Monster | Monster that died |

**Usage:**
```lua
function onMonsterDie(oPlayer, oTarget)
    if oTarget ~= nil then
        Log.Add(string.format("Monster %d died", oTarget.Class))
        
        if oPlayer ~= nil then
            Log.Add(string.format("Killed by: %s", oPlayer.Name))
        end
    end
end
```

---

### onMonsterSpawn

```lua
function onMonsterSpawn(oMonster)
```

**Type:** Async

**Called when:** Monster spawns on map

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oMonster` | object (stObject) | Monster that spawned |

**Usage:**
```lua
function onMonsterSpawn(oMonster)
    if oMonster ~= nil then
        Log.Add(string.format("Monster %d spawned at map %d", 
            oMonster.Class, oMonster.MapNumber))
    end
end
```

---

### onMonsterRespawn

```lua
function onMonsterRespawn(oMonster)
```

**Type:** Async

**Called when:** Monster respawns after death

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oMonster` | object (stObject) | Monster that respawned |

**Usage:**
```lua
function onMonsterRespawn(oMonster)
    if oMonster ~= nil then
        Log.Add(string.format("Monster %d respawned", oMonster.Class))
    end
end
```

---

## Shop & Trading

### onShopBuyItem

```lua
function onShopBuyItem(oPlayer, oItem)
```

**Type:** Sync (can prevent purchase)

**Called when:** Player buys item from NPC shop

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player buying item |
| `oItem` | object (ItemInfo) | Item being purchased |

**Usage:**
```lua
function onShopBuyItem(oPlayer, oItem)
    if oPlayer ~= nil and oItem ~= nil then
        local itemAttr = Item.GetAttr(oItem.Type)
        if itemAttr ~= nil then
            local itemName = itemAttr:GetName()
            Log.Add(string.format("%s bought: %s", oPlayer.Name, itemName))
        end
    end
end
```

---

### onShopSellItem

```lua
function onShopSellItem(oPlayer, oItem)
```

**Type:** Sync (can prevent sale)

**Called when:** Player sells item to NPC shop

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player selling item |
| `oItem` | object (ItemInfo) | Item being sold |

**Usage:**
```lua
function onShopSellItem(oPlayer, oItem)
    if oPlayer ~= nil and oItem ~= nil then
        local itemAttr = Item.GetAttr(oItem.Type)
        if itemAttr ~= nil then
            local itemName = itemAttr:GetName()
            Log.Add(string.format("%s sold: %s", oPlayer.Name, itemName))
        end
    end
end
```

---

### onShopSellEventItem

```lua
function onShopSellEventItem(oPlayer, oItem)
```

**Type:** Async

**Called when:** Player sells event item to NPC

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `oPlayer` | object (stObject) | Player selling event item |
| `oItem` | object (ItemInfo) | Event item being sold |

**Usage:**
```lua
function onShopSellEventItem(oPlayer, oItem)
    if oPlayer ~= nil and oItem ~= nil then
        Log.Add(string.format("%s sold event item: %d", 
            oPlayer.Name, oItem.Type))
    end
end
```

---

## Database Queries

### onDSDBQueryReceive

```lua
function onDSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
```

**Type:** Async

**Called when:** DataServer database query result is received

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `iUserIndex` | int | Player index who initiated query |
| `iQueryNumber` | int | Query identifier number |
| `btIsLastPacket` | bool | `1` if last packet, `0` if more coming |
| `iCurrentRow` | int | Current row number in packet |
| `btColumnCount` | int | Total columns in result |
| `btCurrentPacket` | int | Current packet number |
| `oRow` | object (LuaQueryResultDS) | Query result row object |

**Usage:**
```lua
function onDSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
    if oRow ~= nil then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        Log.Add(string.format("Query %d: %s = %s", iQueryNumber, columnName, value))
        
        if btIsLastPacket == 1 then
            Log.Add(string.format("Query %d complete", iQueryNumber))
        end
    end
end
```

**See:** [Structures/DATABASE.md](../Structures/DATABASE.md) for detailed examples

---

### onJSDBQueryReceive

```lua
function onJSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
```

**Type:** Async

**Called when:** JoinServer database query result is received

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `iUserIndex` | int | Player index who initiated query |
| `iQueryNumber` | int | Query identifier number |
| `btIsLastPacket` | bool | `1` if last packet, `0` if more coming |
| `iCurrentRow` | int | Current row number in packet |
| `btColumnCount` | int | Total columns in result |
| `btCurrentPacket` | int | Current packet number |
| `oRow` | object (LuaQueryResultJS) | Query result row object |

**Usage:**
```lua
function onJSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
    if oRow ~= nil then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        Log.Add(string.format("Query %d: %s = %s", iQueryNumber, columnName, value))
        
        if btIsLastPacket == 1 then
            Log.Add(string.format("Query %d complete", iQueryNumber))
        end
    end
end
```

**See:** [Structures/DATABASE.md](../Structures/DATABASE.md) for detailed examples

---

## Best Practices

### 1. Always Check for nil

```lua
function onPlayerLogin(oPlayer)
    if oPlayer ~= nil then
        -- Safe to access player
    end
end
```

### 2. Sync Callbacks Must Be Fast

```lua
function onShopBuyItem(oPlayer, oItem)
    -- ✅ Quick validation
    if oPlayer == nil or oItem == nil then
        return
    end
    
    -- ❌ Don't do heavy processing
    -- ❌ Don't call database queries
    -- ❌ Don't iterate thousands of items
end
```

### 3. Use Async for Heavy Operations

```lua
function onPlayerLogin(oPlayer)
    if oPlayer ~= nil then
        -- ✅ Async - safe for DB queries
        DB.QueryDS(oPlayer.Index, 1001, 
            string.format("SELECT * FROM CustomData WHERE CharName = '%s'", oPlayer.Name))
    end
end
```

### 4. Clean Up on Disconnect

```lua
function onPlayerDisconnect(oPlayer)
    if oPlayer ~= nil then
        -- Clear timers
        for i = 0, 2 do
            ActionTick.Clear(oPlayer.Index, i)
        end
        
        -- Remove from global tables
        g_ActivePlayers[oPlayer.Index] = nil
        g_QuestData[oPlayer.Index] = nil
    end
end
```

### 5. Handle Database Results Properly

```lua
-- Send query
function onPlayerLogin(oPlayer)
    DB.QueryDS(oPlayer.Index, 1, string.format("SELECT Level FROM Character WHERE Name = '%s'", oPlayer.Name))
end

-- Handle results
function onDSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
    if iQueryNumber == 1 and oRow ~= nil then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        
        if columnName == "Level" then
            Log.Add(string.format("Player level: %s", value))
        end
    end
end
```

---

## See Also

- [PLAYER.md](../Structures/PLAYER.md) - Player object structure
- [ITEM.md](../Structures/ITEM.md) - Item structures
- [DATABASE.md](../Structures/DATABASE.md) - Database query structures
- [GLOBAL_FUNCTIONS.md](GLOBAL_FUNCTIONS.md) - All server functions
