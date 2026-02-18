# Global Functions Reference

Complete reference for all server functions exposed to Lua scripting system.

**Function Call Methods:**
- **Namespace:** `Player.GetObjByIndex(index)` ✅ PREFERRED (organized, clear)
Both methods have **identical performance** (zero overhead). Namespaces are implemented via dual-binding in C++.

---

## Table of Contents

- [Server](#server-namespace)
- [Object](#object-namespace)
- [Player](#player-namespace)
- [Combat](#combat-namespace)
- [Stats](#stats-namespace)
- [Inventory](#inventory-namespace)
- [Item](#item-namespace)
- [ItemBag](#itembag-namespace)
- [Buff](#buff-namespace)
- [Skill](#skill-namespace)
- [Viewport](#viewport-namespace)
- [Move](#move-namespace)
- [Party](#party-namespace)
- [DB](#db-namespace)
- [Message](#message-namespace)
- [Timer](#timer-namespace)
- [ActionTick](#actiontick-namespace)
- [Scheduler](#scheduler-namespace)
- [Utility](#utility-namespace)
- [Log](#log-namespace)

---

## Server Namespace

Server configuration and information functions.

### Server.GetCode

```lua
Server.GetCode()
```


**Returns:** `int` - Unique server code identifier

**Description:** Returns the unique server code identifier of current game server.

**Usage:**
```lua
local serverCode = Server.GetCode()
Log.Add(string.format("Server Code: %d", serverCode))
```

---

### Server.GetName

```lua
Server.GetName()
```


**Returns:** `string` - Server display name

**Description:** Returns the display name of current game server.

**Usage:**
```lua
local serverName = Server.GetName()
Log.Add("Server: " .. serverName)
Message.Send(0, -1, 1, string.format("Welcome to %s!", serverName))
```

---

### Server.GetVIPLevel

```lua
Server.GetVIPLevel()
```


**Returns:** `int` - VIP level setting (`-1` if not set)

**Description:** Returns VIP level setting of current game server.

**Usage:**
```lua
local vipLevel = Server.GetVIPLevel()
if vipLevel > 0 then
    Log.Add(string.format("VIP Level: %d", vipLevel))
end
```

---

### Server.IsNonPvP

```lua
Server.IsNonPvP()
```


**Returns:** `bool` - `true` if PvP disabled, `false` otherwise

**Description:** Returns whether server has PvP disabled globally.

**Usage:**
```lua
if Server.IsNonPvP() then
    Log.Add("PvP is disabled on this server")
    Message.Send(0, iPlayerIndex, 0, "This is a non-PvP server")
end
```

---

### Server.Is28Option

```lua
Server.Is28Option()
```


**Returns:** `bool` - `true` if +28 enabled, `false` otherwise

**Description:** Returns whether server has item option +28 enabled globally.

**Usage:**
```lua
if Server.Is28Option() then
    -- Allow creation of +28 items
    itemInfo.Option3 = 7  -- +28
end
```

---

### Server.GetClassPointsPerLevel

```lua
Server.GetClassPointsPerLevel(iPlayerClassType)
```


**Parameters:**
- `iPlayerClassType` (int): Character class type

**Returns:** `int` - Stat points gained per level for specified class

**Description:** Returns stat points gained per level for specified character class. This is a game rule setting.

**Usage:**
```lua
local pointsPerLevel = Server.GetClassPointsPerLevel(Enums.CharacterClassType.WIZARD)
Log.Add(string.format("Wizard gets %d points per level", pointsPerLevel))
```

---

## Object Namespace

Object management and limits.

### Object.GetMax

```lua
Object.GetMax()
```


**Returns:** `int` - Maximum total object count

**Description:** Returns maximum total object count (monsters + players + summons).

**Usage:**
```lua
local maxObjects = Object.GetMax()
Log.Add(string.format("Max objects: %d", maxObjects))
```

---

### Object.GetMaxMonster

```lua
Object.GetMaxMonster()
```


**Returns:** `int` - Maximum monster count

**Description:** Returns maximum monster object count.

**Usage:**
```lua
local maxMonsters = Object.GetMaxMonster()
```

---

### Object.GetMaxUser

```lua
Object.GetMaxUser()
```


**Returns:** `int` - Maximum user count

**Description:** Returns maximum player object count (online + queue).

**Usage:**
```lua
local maxUsers = Object.GetMaxUser()
```

---

### Object.GetMaxOnlineUser

```lua
Object.GetMaxOnlineUser()
```


**Returns:** `int` - Maximum online player capacity

**Description:** Returns maximum online player capacity.

**Usage:**
```lua
local maxOnline = Object.GetMaxOnlineUser()
Log.Add(string.format("Max online players: %d", maxOnline))
```

---

### Object.GetMaxQueueUser

```lua
Object.GetMaxQueueUser()
```


**Returns:** `int` - Maximum queue player capacity

**Description:** Returns maximum queue player capacity.

**Usage:**
```lua
local maxQueue = Object.GetMaxQueueUser()
```

---

### Object.GetMaxItem

```lua
Object.GetMaxItem()
```


**Returns:** `int` - Maximum item on ground count

**Description:** Returns maximum item on ground count.

**Usage:**
```lua
local maxItems = Object.GetMaxItem()
```

---

### Object.GetMaxSummonMonster

```lua
Object.GetMaxSummonMonster()
```


**Returns:** `int` - Maximum summoned monster count

**Description:** Returns maximum summoned monster count.

**Usage:**
```lua
local maxSummons = Object.GetMaxSummonMonster()
```

---

### Object.GetStartUserIndex

```lua
Object.GetStartUserIndex()
```


**Returns:** `int` - Starting index of player object range

**Description:** Returns starting index of player object range. Use for iterating through players.

**Usage:**
```lua
local startIndex = Object.GetStartUserIndex()
local Player.IsConnected = Player.IsConnected

for i = startIndex, Object.GetMaxUser() - 1 do
    if Player.IsConnected(i) then
        local oPlayer = Player.GetObjByIndex(i)
        -- Process player
    end
end
```

---

### Object.ForEach

```lua
Object.ForEach(callback)
```

**Parameters:**
- `callback` (function): Callback function called for each object. Receives `oObject` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through ALL objects including players, monsters, summons, and items. Skips empty slots (OBJ_EMPTY). Use when you need to process all object types.

**Usage:**
```lua
-- Count players and monsters separately using dedicated iterators
local playerCount = 0
local monsterCount = 0

Object.ForEachPlayer(function(oPlayer)
    playerCount = playerCount + 1
    return true
end)

Object.ForEachMonster(function(oMonster)
    monsterCount = monsterCount + 1
    return true
end)

Log.Add(string.format("Objects: %d players, %d monsters", playerCount, monsterCount))

-- Find players at specific coordinates
local targetX, targetY = 100, 100
Object.ForEachPlayer(function(oPlayer)
    if oPlayer.X == targetX and oPlayer.Y == targetY then
        Log.Add(string.format("Found player %s at (%d, %d)", 
            oPlayer.AccountId, targetX, targetY))
        return false  -- break
    end
    return true
end)
```

---

### Object.ForEachPlayer

```lua
Object.ForEachPlayer(callback)
```

**Parameters:**
- `callback` (function): Callback function called for each player. Receives `oPlayer` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through all connected players (PLAYER_PLAYING state). High-performance C++ iteration - 10-20x faster than Lua loops.

**Usage:**
```lua
-- Count online players
local playerCount = 0
Object.ForEachPlayer(function(oPlayer)
    playerCount = playerCount + 1
    return true  -- continue
end)
Log.Add(string.format("Players online: %d", playerCount))

-- Find specific player (break early)
Object.ForEachPlayer(function(oPlayer)
    if oPlayer.Name == "TargetPlayer" then
        Log.Add("Found player!")
        return false  -- break
    end
    return true  -- continue
end)

-- Send message to all high-level players
Object.ForEachPlayer(function(oPlayer)
    if oPlayer.Level >= 400 then
        Message.Send(0, oPlayer.Index, 1, "Elite player bonus!")
    end
    return true
end)
```

---

### Object.ForEachPlayerOnMap

```lua
Object.ForEachPlayerOnMap(mapNumber, callback)
```

**Parameters:**
- `mapNumber` (int): Map number to filter by
- `callback` (function): Callback function called for each player on map. Receives `oPlayer` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through players on specific map only. More efficient than filtering manually.

**Usage:**
```lua
-- Count players in Lorencia
local lorenciaPlayers = 0
Object.ForEachPlayerOnMap(0, function(oPlayer)
    lorenciaPlayers = lorenciaPlayers + 1
    return true
end)
Log.Add(string.format("Lorencia players: %d", lorenciaPlayers))

-- Award bonus to all players in Devias
Object.ForEachPlayerOnMap(2, function(oPlayer)
    Player.SetMoney(oPlayer.Index, 1000000, false)
    Message.Send(0, oPlayer.Index, 0, "Devias bonus: 1kk zen!")
    return true
end)

-- Teleport all players from specific map
Object.ForEachPlayerOnMap(10, function(oPlayer)
    Move.ToMap(oPlayer.Index, 0, 130, 130)  -- To Lorencia
    return true
end)
```

---

### Object.ForEachMonster

```lua
Object.ForEachMonster(callback)
```

**Parameters:**
- `callback` (function): Callback function called for each monster. Receives `oMonster` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through all alive monsters on server.

**Usage:**
```lua
-- Count all monsters
local monsterCount = 0
Object.ForEachMonster(function(oMonster)
    monsterCount = monsterCount + 1
    return true
end)
Log.Add(string.format("Total monsters: %d", monsterCount))

-- Heal all monsters
Object.ForEachMonster(function(oMonster)
    oMonster.Life = oMonster.MaxLife
    return true
end)

-- Find specific monster class
Object.ForEachMonster(function(oMonster)
    if oMonster.Class == 275 then  -- Golden Goblin
        Log.Add(string.format("Golden Goblin at map %d", oMonster.MapNumber))
    end
    return true
end)
```

---

### Object.ForEachMonsterOnMap

```lua
Object.ForEachMonsterOnMap(mapNumber, callback)
```

**Parameters:**
- `mapNumber` (int): Map number to filter by
- `callback` (function): Callback function called for each monster on map. Receives `oMonster` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through monsters on specific map only.

**Usage:**
```lua
-- Kill all monsters in Devias
Object.ForEachMonsterOnMap(2, function(oMonster)
    oMonster.Life = 0
    oMonster.Live = false
    return true
end)

-- Buff monsters in specific map
Object.ForEachMonsterOnMap(10, function(oMonster)
    oMonster.AddLife = oMonster.AddLife + 5000
    oMonster.Life = math.min(oMonster.Life + 5000, oMonster.MaxLife)
    return true
end)

-- Count monsters by map
local counts = {}
for mapNum = 0, 10 do
    local count = 0
    Object.ForEachMonsterOnMap(mapNum, function(oMonster)
        count = count + 1
        return true
    end)
    if count > 0 then
        Log.Add(string.format("Map %d: %d monsters", mapNum, count))
    end
end
```

---

### Object.ForEachMonsterByClass

```lua
Object.ForEachMonsterByClass(monsterClass, callback)
```

**Parameters:**
- `monsterClass` (int): Monster class ID to filter by
- `callback` (function): Callback function called for each monster of specified class. Receives `oMonster` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through monsters of specific class type only.

**Usage:**
```lua
-- Find all Golden Goblins
Object.ForEachMonsterByClass(275, function(oMonster)
    Log.Add(string.format("Golden Goblin: Map %d at (%d, %d)", 
        oMonster.MapNumber, oMonster.X, oMonster.Y))
    return true
end)

-- Kill all White Wizards
Object.ForEachMonsterByClass(230, function(oMonster)
    oMonster.Life = 0
    oMonster.Live = false
    return true
end)

-- Count specific monster type
local bossCount = 0
Object.ForEachMonsterByClass(666, function(oMonster)  -- Boss class
    bossCount = bossCount + 1
    return true
end)
Log.Add(string.format("Boss count: %d", bossCount))
```

---

### Object.ForEachPartyMember

```lua
Object.ForEachPartyMember(partyNumber, callback)
```

**Parameters:**
- `partyNumber` (int): Party number (from `oPlayer.PartyNumber`)
- `callback` (function): Callback function called for each party member. Receives `oPlayer` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through all members of specified party.

**Usage:**
```lua
-- Award bonus to entire party
function AwardPartyBonus(iPlayerIndex)
    local oPlayer = Player.GetObjByIndex(iPlayerIndex)
    
    if oPlayer ~= nil and oPlayer.PartyNumber >= 0 then
        Object.ForEachPartyMember(oPlayer.PartyNumber, function(oMember)
            Player.SetMoney(oMember.Index, 5000000, false)
            Message.Send(0, oMember.Index, 1, "Party bonus: 5kk zen!")
            return true
        end)
    end
end

-- Check if party is in same location
function IsPartyInMap(partyNumber, targetMap)
    local allInMap = true
    
    Object.ForEachPartyMember(partyNumber, function(oMember)
        if oMember.MapNumber ~= targetMap then
            allInMap = false
            return false  -- break early
        end
        return true
    end)
    
    return allInMap
end

-- Send party-wide message
function PartyBroadcast(partyNumber, message)
    Object.ForEachPartyMember(partyNumber, function(oMember)
        Message.Send(0, oMember.Index, 0, message)
        return true
    end)
end
```

---

### Object.ForEachGuildMember

```lua
Object.ForEachGuildMember(guildName, callback)
```

**Parameters:**
- `guildName` (string): Guild name to filter by
- `callback` (function): Callback function called for each guild member. Receives `oPlayer` (object). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through all online members of specified guild.

**Usage:**
```lua
-- Send guild-wide message
function GuildBroadcast(guildName, message)
    Object.ForEachGuildMember(guildName, function(oMember)
        Message.Send(0, oMember.Index, 2, message)
        return true
    end)
end

-- Count online guild members
function GetOnlineGuildCount(guildName)
    local count = 0
    
    Object.ForEachGuildMember(guildName, function(oMember)
        count = count + 1
        return true
    end)
    
    return count
end

-- Award guild achievement reward
Object.ForEachGuildMember("TopGuild", function(oMember)
    Player.SetMoney(oMember.Index, 10000000, false)
    Message.Send(0, oMember.Index, 1, "Guild achievement reward!")
    return true
end)

-- Check if all guild members are in same map
function IsGuildInSameMap(guildName, targetMap)
    local allInMap = true
    
    Object.ForEachGuildMember(guildName, function(oMember)
        if oMember.MapNumber ~= targetMap then
            allInMap = false
            return false  -- break early
        end
        return true
    end)
    
    return allInMap
end
```

---

### Object.ForEachNearby

```lua
Object.ForEachNearby(centerIndex, range, callback)
```

**Parameters:**
- `centerIndex` (int): Center object index
- `range` (int): Range in map units
- `callback` (function): Callback function called for each nearby object. Receives `oObject` (object) and `distance` (int). Return `false` to break iteration.

**Returns:** None

**Description:** Iterates through all objects within specified range of center object. Automatically calculates distance and filters by same map.

**Usage:**
```lua
-- AOE buff to nearby players
function ApplyAOEBuff(iPlayerIndex, range)
    local oCenter = Player.GetObjByIndex(iPlayerIndex)
    if not oCenter then return end
    
    Object.ForEachPlayerOnMap(oCenter.MapNumber, function(oPlayer)
        local dx = math.abs(oPlayer.X - oCenter.X)
        local dy = math.abs(oPlayer.Y - oCenter.Y)
        local distance = math.sqrt(dx * dx + dy * dy)
        
        if distance <= range then
            Buff.Add(oPlayer.Index, 50, 0, 100, 0, 0, 60, 0, iPlayerIndex)
            Message.Send(0, oPlayer.Index, 0, "AOE buff applied!")
        end
        return true
    end)
end

-- Find nearest monster to player
function FindNearestMonster(iPlayerIndex)
    local nearestMonster = nil
    local nearestDistance = 999999
    local oCenter = Player.GetObjByIndex(iPlayerIndex)
    if not oCenter then return nil, 0 end
    
    Object.ForEachMonsterOnMap(oCenter.MapNumber, function(oMonster)
        local dx = math.abs(oMonster.X - oCenter.X)
        local dy = math.abs(oMonster.Y - oCenter.Y)
        local distance = math.sqrt(dx * dx + dy * dy)
        
        if distance < nearestDistance and distance <= 50 then
            nearestMonster = oMonster
            nearestDistance = distance
        end
        return true
    end)
    
    return nearestMonster, nearestDistance
end

-- Count players in area
function CountPlayersInArea(iCenterIndex, radius)
    local count = 0
    local oCenter = Player.GetObjByIndex(iCenterIndex)
    if not oCenter then return 0 end
    
    Object.ForEachPlayerOnMap(oCenter.MapNumber, function(oPlayer)
        local dx = math.abs(oPlayer.X - oCenter.X)
        local dy = math.abs(oPlayer.Y - oCenter.Y)
        local distance = math.sqrt(dx * dx + dy * dy)
        
        if distance <= radius then
            count = count + 1
        end
        return true
    end)
    
    return count
end
```

---

### Object.CountPlayersOnMap

```lua
Object.CountPlayersOnMap(mapNumber)
Object.CountPlayersOnMap(mapNumber, filter)
```

**Parameters:**
- `mapNumber` (int): Map number
- `filter` (function, optional): Filter callback. Receives `oPlayer`, returns `true` to count, `false` to skip

**Returns:** `int` - Number of players matching criteria

**Description:** Count players on specific map. Optional filter callback allows custom conditions for flexible counting without full iteration overhead.

**Usage:**
```lua
-- Simple count (all players)
local totalPlayers = Object.CountPlayersOnMap(0)
if totalPlayers > 50 then
    Log.Add("Lorencia is crowded!")
end

-- Count high level players
local elitePlayers = Object.CountPlayersOnMap(0, function(oPlayer)
    return oPlayer.Level >= 400
end)

-- Count VIP players (0 = basic VIP, -1 = no VIP)
local vipCount = Object.CountPlayersOnMap(0, function(oPlayer)
    return oPlayer.userData.VIPType >= 0
end)

-- Count players with specific stats
local strongPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
    return oPlayer.userData.Strength >= 1000 and oPlayer.userData.Dexterity >= 1000
end)

-- Complex event validation
local readyPlayers = Object.CountPlayersOnMap(10, function(oPlayer)
    return oPlayer.Level >= 400 
       and oPlayer.PartyNumber >= 0
       and oPlayer.userData.Resets >= 5
       and oPlayer.userData.Money >= 10000000
end)

-- Count players in area
local playersInArea = Object.CountPlayersOnMap(2, function(oPlayer)
    return oPlayer.X >= 100 and oPlayer.X <= 150 
       and oPlayer.Y >= 100 and oPlayer.Y <= 150
end)

-- Check all maps for high level players
for mapNum = 0, 10 do
    local count = Object.CountPlayersOnMap(mapNum, function(oPlayer)
        return oPlayer.Level >= 400
    end)
    if count > 0 then
        Log.Add(string.format("Map %d: %d elite players", mapNum, count))
    end
end
```

---

### Object.CountMonstersOnMap

```lua
Object.CountMonstersOnMap(mapNumber)
Object.CountMonstersOnMap(mapNumber, filter)
```

**Parameters:**
- `mapNumber` (int): Map number
- `filter` (function, optional): Filter callback. Receives `oMonster`, returns `true` to count, `false` to skip

**Returns:** `int` - Number of monsters matching criteria

**Description:** Count monsters on specific map. Optional filter callback allows custom conditions for flexible counting.

**Usage:**
```lua
-- Simple count (all monsters)
local totalMonsters = Object.CountMonstersOnMap(2)
if totalMonsters < 10 then
    Log.Add("Devias needs respawn!")
end

-- Count boss monsters
local bossCount = Object.CountMonstersOnMap(2, function(oMonster)
    return oMonster.Class >= 200 and oMonster.Class <= 250
end)

-- Count specific monster type
local goldenGoblins = Object.CountMonstersOnMap(0, function(oMonster)
    return oMonster.Class == 275
end)

-- Count high HP monsters
local tankMonsters = Object.CountMonstersOnMap(2, function(oMonster)
    return oMonster.Life > 50000
end)

-- Count monsters in area
local monstersInArea = Object.CountMonstersOnMap(3, function(oMonster)
    return oMonster.X >= 50 and oMonster.X <= 100 
       and oMonster.Y >= 50 and oMonster.Y <= 100
end)

-- Count low HP monsters (for AOE finish)
local lowHpMonsters = Object.CountMonstersOnMap(2, function(oMonster)
    local hpPercent = (oMonster.Life / oMonster.MaxLife) * 100
    return hpPercent < 20
end)

-- Event validation
function CanStartBossEvent(mapNumber)
    -- Check if any monsters remain
    local monsterCount = Object.CountMonstersOnMap(mapNumber)
    if monsterCount > 0 then
        return false, "Map has monsters"
    end
    
    -- Check if enough players ready
    local readyPlayers = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
        return oPlayer.Level >= 400 and oPlayer.PartyNumber >= 0
    end)
    
    if readyPlayers < 5 then
        return false, "Not enough players"
    end
    
    return true, "Event can start"
end
```

---

### Object.GetObjByName

```lua
Object.GetObjByName(playerName)
```

**Parameters:**
- `playerName` (string): Player character name

**Returns:** `object|nil` - Player object if found, `nil` otherwise

**Description:** Optimized player search with early exit. More efficient than `Player.GetObjByName()` for single lookups.

**Usage:**
```lua
-- Find and teleport player
local oTarget = Object.GetObjByName("PlayerName")
if oTarget ~= nil then
    Move.ToMap(oTarget.Index, 0, 130, 130)
    Log.Add(string.format("Teleported %s", oTarget.Name))
else
    Log.Add("Player not found or offline")
end

-- Check if player is online
function IsPlayerOnline(playerName)
    return Object.GetObjByName(playerName) ~= nil
end

-- Send message to specific player
local oPlayer = Object.GetObjByName("Admin")
if oPlayer ~= nil then
    Message.Send(0, oPlayer.Index, 1, "GM message")
end
```

---

### Object.AddMonster

```lua
Object.AddMonster(iMonIndex, iMapNumber, iBeginX, iBeginY, iEndX, iEndY, iMonAttr)
```

**Parameters:**
- `iMonIndex` (int): Monster class ID (same as `oMonster.Class`)
- `iMapNumber` (int): Map to spawn the monster on
- `iBeginX` (int): Spawn area start X coordinate
- `iBeginY` (int): Spawn area start Y coordinate
- `iEndX` (int): Spawn area end X coordinate
- `iEndY` (int): Spawn area end Y coordinate
- `iMonAttr` (int): Elemental attribute — use `Enums.ElementType` values, `0` for none

**Returns:** `int` — Object index of the spawned monster, or `-1` on failure

**Description:** Spawns a monster of the given class on the specified map. The actual position is
chosen randomly within the defined bounding box. The monster is fully initialized and enters the
world immediately. If `iMonAttr > 0` the monster's pentagram main attribute is overridden.

**Notes:**
- Returns `-1` if the server object pool is full or `gObjSetMonster` fails.
- `iBeginX`/`iBeginY` can equal `iEndX`/`iEndY` to spawn at a fixed point.

**Usage:**
```lua
-- Spawn a Balrog at a fixed position on Devias (map 2)
local monIndex = Object.AddMonster(26, 2, 100, 100, 100, 100, 0)
if monIndex >= 0 then
    Log.Add(string.format("Spawned Balrog at index %d", monIndex))
end

-- Spawn a Fire-element boss in a random area
local monIndex = Object.AddMonster(275, 7, 50, 50, 80, 80, Enums.ElementType.FIRE)
if monIndex < 0 then
    Log.Add("[Error] Failed to spawn boss - object pool may be full")
end

-- Spawn wave of monsters for event
function SpawnEventWave(mapNumber, monClass, count, x1, y1, x2, y2)
    local spawned = 0
    for i = 1, count do
        local idx = Object.AddMonster(monClass, mapNumber, x1, y1, x2, y2, 0)
        if idx >= 0 then
            spawned = spawned + 1
        end
    end
    Log.Add(string.format("Spawned %d/%d monsters on map %d", spawned, count, mapNumber))
    return spawned
end
```

---

### Object.DelMonster

```lua
Object.DelMonster(aIndex)
```

**Parameters:**
- `aIndex` (int): Object index of the monster to remove

**Returns:** `int` — Result of internal `gObjDel` call

**Description:** Immediately removes the monster at the given object index from the world.
Use the index returned by `Object.AddMonster` or obtained from an iterator callback.

**Usage:**
```lua
-- Remove a specific monster by index
Object.DelMonster(monIndex)

-- Clear all monsters of a class from a map
Object.ForEachMonsterOnMap(mapNumber, function(oMonster)
    if oMonster.Class == 275 then
        Object.DelMonster(oMonster.Index)
    end
    return true
end)

-- Spawn and schedule removal after 60 seconds
local idx = Object.AddMonster(26, 2, 100, 100, 100, 100, 0)
if idx >= 0 then
    Timer.Create(60000, "remove_monster_" .. idx, function()
        Object.DelMonster(idx)
    end)
end
```

---

## Player Namespace

Player management and operations.

### Player.IsConnected

```lua
Player.IsConnected(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** `bool` - `true` if connected and playing, `false` otherwise

**Description:** Checks if player at given index is connected and in PLAYER_PLAYING state.

**Usage:**
```lua
if Player.IsConnected(iPlayerIndex) then
    Log.Add("Player is online and playing")
end
```

---

### Player.GetObjByIndex

```lua
Player.GetObjByIndex(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** `object` - Player object (stObject), or `nil` if not found

**Description:** Returns player object at specified index.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Log.Add(string.format("Player: %s, Level: %d", oPlayer.Name, oPlayer.Level))
end
```

---

### Player.GetObjByName

```lua
Player.GetObjByName(szPlayerName)
```


**Parameters:**
- `szPlayerName` (string): Player character name

**Returns:** `object` - Player object (stObject), or `nil` if not found

**Description:** Finds player by name and returns their object.

**Usage:**
```lua
local oPlayer = Player.GetObjByName("PlayerName")
if oPlayer ~= nil then
    Log.Add(string.format("Found player at index: %d", oPlayer.Index))
end
```

---

### Player.GetIndexByName

```lua
Player.GetIndexByName(szPlayerName)
```


**Parameters:**
- `szPlayerName` (string): Player character name

**Returns:** `int` - Player index, or `-1` if not found

**Description:** Finds player by name and returns their index.

**Usage:**
```lua
local index = Player.GetIndexByName("PlayerName")
if index >= 0 then
    Log.Add(string.format("Player found at index: %d", index))
    Message.Send(0, index, 0, "Hello!")
end
```

---

### Player.SetMoney

```lua
Player.SetMoney(iPlayerIndex, iAmount, bResetMoney)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iAmount` (int): Zen amount (can be negative to subtract)
- `bResetMoney` (bool): If `true`, resets to 0 first

**Returns:** None

**Description:** Sets or modifies player's zen currency.

**Usage:**
```lua
-- Add 1,000,000 zen
Player.SetMoney(iPlayerIndex, 1000000, false)

-- Reset and set to 5,000,000 zen
Player.SetMoney(iPlayerIndex, 5000000, true)

-- Subtract 500,000 zen
Player.SetMoney(iPlayerIndex, -500000, false)
```

---



### Player.SaveCharacter
Save character data to database.

```lua
Player.SaveCharacter(playerIndex)
```

**Parameters:**
- `playerIndex` (number): Player index

**Example:**
```lua
local oPlayer = Player.GetObjByIndex(100)
Player.SetMoney(oPlayer.Index, 100000, false)
Player.SaveCharacter(oPlayer.Index)
Log.Add(string.format("Saved character: %s", oPlayer.Name))
```


### Player.SetExp
Send experience packet to player (required after modifying oPlayer.Experience).

```lua
Player.SetExp(playerIndex, targetIndex, exp, attackDamage, msbFlag, monsterType)
```

**Parameters:**
- `playerIndex` (number): Player index receiving experience
- `targetIndex` (number): Source index (monster/player that gave exp)
- `exp` (number): Experience amount
- `attackDamage` (number): Damage dealt (for display)
- `msbFlag` (boolean): Master Skill Book flag
- `monsterType` (number): Monster type ID

**Example:**
```lua
-- Give experience from custom event
local oPlayer = Player.GetObjByIndex(100)
oPlayer.Experience = oPlayer.Experience + 50000
Player.SetExp(oPlayer.Index, -1, 50000, 0, false, 0)

-- Give experience after killing custom boss
function OnBossKilled(oPlayer, bossIndex)
    local expReward = 100000
    oPlayer.Experience = oPlayer.Experience + expReward
    Player.SetExp(oPlayer.Index, bossIndex, expReward, 0, false, 0)
    Message.Send(oPlayer.Index, 0, string.format("Gained %d experience!", expReward))
end

-- Party experience distribution
function GivePartyExp(partyLeaderIndex, totalExp)
    local partyCount = Party.GetCount(partyLeaderIndex)
    local expPerMember = math.floor(totalExp / partyCount)
    
    Object.ForEachPartyMember(partyLeaderIndex, function(oPlayer)
        oPlayer.Experience = oPlayer.Experience + expPerMember
        Player.SetExp(oPlayer.Index, -1, expPerMember, 0, false, 0)
    end)
end
```

**Notes:**
- Always call after modifying `oPlayer.Experience`
- Use `targetIndex = -1` for non-combat experience
- `msbFlag` and `monsterType` can be `false` and `0` for custom exp


### Player.SetRuud

```lua
Player.SetRuud(iPlayerIndex, iRuud, iObtainedRuud, bIsObtainedRuud)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iRuud` (int): Base Ruud value (used when `iObtainedRuud = 0`)
- `iObtainedRuud` (int): Ruud to add (>0) or subtract (<0)
- `bIsObtainedRuud` (bool): Show notification if `true`

**Returns:** None

**Description:** Sets or modifies player's Ruud currency.

**Usage:**
```lua
-- Add 1000 Ruud with notification
Player.SetRuud(iPlayerIndex, 0, 1000, true)

-- Set to exactly 5000 Ruud
Player.SetRuud(iPlayerIndex, 5000, 0, false)

-- Subtract 500 Ruud
Player.SetRuud(iPlayerIndex, 0, -500, false)
```

---

### Player.Reset

```lua
Player.Reset(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** None

**Description:** Performs character reset operation for specified player.

**Usage:**
```lua
Player.Reset(iPlayerIndex)
Log.Add(string.format("Player %d performed reset", iPlayerIndex))
```

---

### Player.GetEvo

```lua
Player.GetEvo(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** `int` - Evolution level (1-5), or `-1` if invalid

**Description:** Returns character evolution/class level.

**Usage:**
```lua
local evo = Player.GetEvo(iPlayerIndex)
if evo >= 3 then
    Log.Add("Player is 3rd class or higher")
    -- Allow 3rd class items
end
```

---

### Player.ReCalc

```lua
Player.ReCalc(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** None

**Description:** Recalculates all character stats, damage, defense, etc.

**Usage:**
```lua
-- After equipment change
Player.ReCalc(iPlayerIndex)

-- After stat modification
Stats.Set(iPlayerIndex, Enums.StatType.STRENGTH, 100, 0, 0)
Player.ReCalc(iPlayerIndex)
```

---

### Player.SendLife

```lua
Player.SendLife(iPlayerIndex, iLife, flag, iShield)
```

**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iLife` (int): Life value to send
- `flag` (int): Update flag — use `Enums.HPManaUpdateFlag` values
- `iShield` (int): Shield value to send

**Returns:** None

**Description:** Sends a life/shield update packet to the player's client. Must be called
after directly modifying `oPlayer.Life`, `oPlayer.MaxLife`, `oPlayer.Shield`, or
`oPlayer.MaxShield` so the client reflects the change.

**Notes:**
- Use `Enums.HPManaUpdateFlag.CURRENT_HP_MANA` (`255`) to send the current life/shield values.
- Use `Enums.HPManaUpdateFlag.MAX_HP_MANA` (`254`) after a max HP change (level up, stat change, buff).
- Use `Enums.HPManaUpdateFlag.INVENTORY_STATE_RESET` (`253`) to restore inventory interaction after a failed item operation.

**Usage:**
```lua
-- Restore player to full HP and sync client
oPlayer.Life = oPlayer.MaxLife
oPlayer.Shield = oPlayer.MaxShield
Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)

-- After a stat change that increases MaxLife, send new max values
Stats.Set(oPlayer.Index, Enums.StatType.VITALITY, oPlayer.userData.Vitality + 10, 0, 0)
Player.ReCalc(oPlayer.Index)
Player.SendLife(oPlayer.Index, (oPlayer.MaxLife + oPlayer.AddLife), Enums.HPManaUpdateFlag.MAX_HP_MANA, (oPlayer.MaxShield + oPlayer.AddShield))
```

---

### Player.SendMana

```lua
Player.SendMana(iPlayerIndex, iMana, flag, iBP)
```

**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iMana` (int): Mana value to send
- `flag` (int): Update flag — use `Enums.HPManaUpdateFlag` values
- `iBP` (int): AG/stamina value to send

**Returns:** None

**Description:** Sends a mana/AG update packet to the player's client. Must be called
after directly modifying `oPlayer.Mana`, `oPlayer.MaxMana`, `oPlayer.BP`, or
`oPlayer.MaxBP` so the client reflects the change.

**Usage:**
```lua
-- Restore mana and AG, then sync client
oPlayer.Mana = oPlayer.MaxMana
oPlayer.BP = oPlayer.MaxBP
Player.SendMana(oPlayer.Index, oPlayer.Mana, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.BP)

-- After a stat change that affects MaxMana
Player.ReCalc(oPlayer.Index)
Player.SendMana(oPlayer.Index, (oPlayer.MaxMana + oPlayer.AddMana), Enums.HPManaUpdateFlag.MAX_HP_MANA, oPlayer.MaxBP)
```

---

## Combat Namespace

Combat-related functions.

### Combat.GetTopDamageDealer

```lua
Combat.GetTopDamageDealer(aTargetMonsterIndex)
```


**Parameters:**
- `aTargetMonsterIndex` (int): Monster object index

**Returns:** `int` - Player index who dealt most damage, or `-1` if none

**Description:** Returns player index who dealt most damage to specified monster.

**Usage:**
```lua
function onMonsterDie(oPlayer, oMonster)
    if oMonster ~= nil then
        local topPlayerIndex = Combat.GetTopDamageDealer(oMonster.Index)
        
        if topPlayerIndex >= 0 then
            -- Reward top damager
            Player.SetMoney(topPlayerIndex, 1000000, false)
            Message.Send(0, topPlayerIndex, 1, "Top damage bonus: 1kk zen!")
        end
    end
end
```

---

## Stats Namespace

Character stats and leveling.

### Stats.Set

```lua
Stats.Set(iPlayerIndex, iStatType, iStatValue, iStatAddType, iLevelUpPoint)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iStatType` (int): Stat type (0=STR, 1=DEX, 2=VIT, 3=ENE, 4=CMD)
- `iStatValue` (int): Stat value to add
- `iStatAddType` (int): Add type (0=base stat, 1=additional stat)
- `iLevelUpPoint` (int): Level up points to use

**Returns:** None

**Description:** Adds to player's base or additional stats.

**Usage:**
```lua
-- Add 10 base STR
Stats.Set(iPlayerIndex, Enums.StatType.STRENGTH, 10, 0, 0)

-- Add 50 additional ENE (from items/buffs)
Stats.Set(iPlayerIndex, Enums.StatType.ENERGY, 50, 1, 0)
```

---

### Stats.SendUpdate

```lua
Stats.SendUpdate(iPlayerIndex, iStatType, iStatValue, iLevelUpPoint)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iStatType` (int): Stat type
- `iStatValue` (int): New stat value
- `iLevelUpPoint` (int): Remaining level up points

**Returns:** None

**Description:** Sends stat update packet to player client.

**Usage:**
```lua
Stats.SendUpdate(iPlayerIndex, Enums.StatType.STRENGTH, 100, 0)
```

---

### Stats.LevelUp

```lua
Stats.LevelUp(oPlayer, i64AddExp, iMonsterType, szEventType)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `i64AddExp` (UINT64): Experience points to add
- `iMonsterType` (int): Monster type (0 if not from monster)
- `szEventType` (string): Event type name

**Returns:** `bool` - `true` if level up occurred, `false` otherwise

**Description:** Adds experience points to player, handles level up if threshold reached.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Stats.LevelUp(oPlayer, 1000000, 0, "Quest")
end
```

---

## Inventory Namespace

Inventory management functions.

### Inventory.SendUpdate

```lua
Inventory.SendUpdate(iPlayerIndex, iInventoryPos)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iInventoryPos` (int): Inventory slot position

**Returns:** None

**Description:** Sends update packet for single inventory slot.

**Usage:**
```lua
-- Update weapon slot
Inventory.SendUpdate(iPlayerIndex, 0)
```

---

### Inventory.SendDelete

```lua
Inventory.SendDelete(iPlayerIndex, iInventoryPos)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iInventoryPos` (int): Inventory slot position

**Returns:** None

**Description:** Sends delete packet for inventory slot.

**Usage:**
```lua
Inventory.SendDelete(iPlayerIndex, 12)
```

---

### Inventory.SendList

```lua
Inventory.SendList(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** None

**Description:** Sends complete inventory list packet to player.

**Usage:**
```lua
Inventory.SendList(iPlayerIndex)
```

---

### Inventory.HasSpace

```lua
Inventory.HasSpace(oPlayer, iItemHeight, iItemWidth)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iItemHeight` (int): Item height (1-4)
- `iItemWidth` (int): Item width (1-2)

**Returns:** `bool` - `true` if has space, `false` otherwise

**Description:** Checks if inventory has enough empty space for item of specified dimensions.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    if Inventory.HasSpace(oPlayer, 2, 1) then
        -- Has space for 2x1 item
        Log.Add("Inventory has space")
    else
        Message.Send(0, iPlayerIndex, 0, "Inventory is full")
    end
end
```

---

### Inventory.Insert

```lua
Inventory.Insert(iPlayerIndex, oItem)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `oItem` (object): Item object (ItemInfo)

**Returns:** None

**Description:** Inserts item object into first available inventory slot.

**Usage:**
```lua
Inventory.Insert(iPlayerIndex, oItem)
```

---

### Inventory.InsertAt

```lua
Inventory.InsertAt(iPlayerIndex, oItem, btInventoryPos)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `oItem` (object): Item object (ItemInfo)
- `btInventoryPos` (BYTE): Inventory position

**Returns:** `BYTE` - Result code

**Description:** Inserts item at specific inventory position.

**Usage:**
```lua
local result = Inventory.InsertAt(iPlayerIndex, oItem, 12)
if result == 1 then
    Log.Add("Item inserted successfully")
end
```

---

### Inventory.Delete

```lua
Inventory.Delete(iPlayerIndex, iInventoryItemPos)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iInventoryItemPos` (int): Inventory slot position

**Returns:** None

**Description:** Removes item from specified inventory position.

**Usage:**
```lua
Inventory.Delete(iPlayerIndex, 12)
Log.Add("Item deleted from slot 12")
```

---

### Inventory.SetSlot

```lua
Inventory.SetSlot(iPlayerIndex, iInventoryItemStartPos, btItemType)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iInventoryItemStartPos` (int): Starting position
- `btItemType` (BYTE): Item type (use `0xFF` to clear)

**Returns:** None

**Description:** Sets inventory slot state. Use `0xFF` to clear slots occupied by item.

**Usage:**
```lua
-- Clear item slots starting at pos 12
Inventory.SetSlot(iPlayerIndex, 12, 0xFF)
```

---

### Inventory.ReduceDur

```lua
Inventory.ReduceDur(oPlayer, iInventoryItemPos, iDurabilityMinus)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iInventoryItemPos` (int): Inventory slot position
- `iDurabilityMinus` (int): Durability to subtract

**Returns:** `int` - Remaining durability

**Description:** Reduces item durability at specified inventory slot.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    local remainingDur = Inventory.ReduceDur(oPlayer, 0, 1)
    Log.Add(string.format("Remaining durability: %d", remainingDur))
end
```

---

## Item Namespace

Item information and creation functions.

### Item.IsValid

```lua
Item.IsValid(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `int` - `1` if valid, `0` otherwise

**Description:** Returns whether item ID is valid.

**Usage:**
```lua
local itemId = Helpers.MakeItemId(0, 0)
if Item.IsValid(itemId) == 1 then
    Log.Add("Valid item")
end
```

---

### Item.GetKindA

```lua
Item.GetKindA(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `int` - KindA category type

**Description:** Returns KindA attribute of specified item (primary category).

**Usage:**
```lua
local kindA = Item.GetKindA(Helpers.MakeItemId(0, 0))
if kindA == Enums.ItemKindA.WEAPON then
    Log.Add("This is a weapon")
end
```

---

### Item.GetKindB

```lua
Item.GetKindB(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `int` - KindB subcategory type

**Description:** Returns KindB attribute of specified item (secondary category/subtype).

**Usage:**
```lua
local kindB = Item.GetKindB(Helpers.MakeItemId(0, 0))
if kindB == Enums.ItemKindB.SWORD_KNIGHT then
    Log.Add("Knight sword")
end
```

---

### Item.GetAttr

```lua
Item.GetAttr(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `object` - Item attributes struct (ItemAttr)

**Description:** Returns structure containing all item attributes (width, height, durability, requirements, etc.).

**Usage:**
```lua
local itemId = Helpers.MakeItemId(0, 0)
local attr = Item.GetAttr(itemId)

if attr ~= nil then
    local itemName = attr:GetName()
    Log.Add(string.format("Item: %s", itemName))
    Log.Add(string.format("Size: %dx%d", attr.Width, attr.Height))
    Log.Add(string.format("Damage: %d-%d", attr.DamageMin, attr.DamageMax))
end
```

---

### Item.IsSocket

```lua
Item.IsSocket(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `bool` - `true` if socket item, `false` otherwise

**Description:** Returns whether item can have socket options.

**Usage:**
```lua
if Item.IsSocket(Helpers.MakeItemId(0, 0)) then
    Log.Add("Item supports sockets")
end
```

---

### Item.IsExcSocketAccessory

```lua
Item.IsExcSocketAccessory(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `bool` - `true` if excellent socket accessory, `false` otherwise

**Description:** Returns whether item is excellent socket accessory.

**Usage:**
```lua
if Item.IsExcSocketAccessory(itemId) then
    -- Handle excellent accessory
end
```

---

### Item.IsElemental

```lua
Item.IsElemental(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `bool` - `true` if elemental item, `false` otherwise

**Description:** Returns whether item is elemental type.

**Usage:**
```lua
if Item.IsElemental(itemId) then
    -- Handle elemental item
end
```

---

### Item.IsPentagram

```lua
Item.IsPentagram(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `bool` - `true` if pentagram, `false` otherwise

**Description:** Returns whether item is pentagram type.

**Usage:**
```lua
if Item.IsPentagram(itemId) then
    -- Handle pentagram
end
```

---

### Item.GetSetOption

```lua
Item.GetSetOption(iItemId)
```


**Parameters:**
- `iItemId` (int): Item ID

**Returns:** `int` - Set option index

**Description:** Generates ancient/set options and returns set index.

**Usage:**
```lua
local setIndex = Item.GetSetOption(itemId)
Log.Add(string.format("Set option: %d", setIndex))
```

---

### Item.GetRandomLevel

```lua
Item.GetRandomLevel(iMinLevel, iMaxLevel)
```


**Parameters:**
- `iMinLevel` (int): Minimum level
- `iMaxLevel` (int): Maximum level

**Returns:** `int` - Random item level

**Description:** Returns random item level between min and max range.

**Usage:**
```lua
local itemLevel = Item.GetRandomLevel(0, 9)  -- Random 0-9
Log.Add(string.format("Random level: %d", itemLevel))
```

---

### Item.Create

```lua
Item.Create(iPlayerIndex, stItemCreate)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `stItemCreate` (object): Item creation info (CreateItemInfo struct)

**Returns:** None

**Description:** Creates item based on CreateItemInfo structure. Can spawn on ground or in inventory.

**Usage:**
```lua
local itemInfo = CreateItemInfo.new()
itemInfo.MapNumber = oPlayer.MapNumber
itemInfo.X = oPlayer.X
itemInfo.Y = oPlayer.Y
itemInfo.ItemId = Helpers.MakeItemId(14, 13)  -- Jewel of Bless
itemInfo.ItemLevel = 0
itemInfo.Durability = 1
itemInfo.Option1 = 0
itemInfo.Option2 = 0
itemInfo.Option3 = 0
itemInfo.LootIndex = iPlayerIndex
itemInfo.TargetInvenPos = 255  -- Auto-find slot

Item.Create(iPlayerIndex, itemInfo)
```

---

### Item.MakeRandomSet

```lua
Item.MakeRandomSet(iPlayerIndex, bGremoryCase, bDropMasterySet)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `bGremoryCase` (int): Gremory case flag
- `bDropMasterySet` (bool): Drop mastery set flag

**Returns:** None

**Description:** Generates random set item for player, drops under player or adds to Gremory case.

**Usage:**
```lua
-- Drop random set item on ground
Item.MakeRandomSet(iPlayerIndex, 0, false)

-- Add to Gremory case
Item.MakeRandomSet(iPlayerIndex, 1, false)
```

---

## ItemBag Namespace

Item bag system functions.

### ItemBag.Add

```lua
ItemBag.Add(iBagType, iParam1, iParam2, strFileName)
```


**Parameters:**
- `iBagType` (int): Bag type (0=DROP, 1=INVENTORY, 2=MONSTER, 3=EVENT)
- `iParam1` (int): Parameter 1 (depends on bag type)
- `iParam2` (int): Parameter 2 (depends on bag type)
- `strFileName` (string): Bag file name (without .txt extension)

**Returns:** None

**Description:** Loads item bag configuration file.

**Bag Types:**
- **0 (DROP):** Drop from ground item
  - `iParam1`: Item ID
  - `iParam2`: Item level
- **1 (INVENTORY):** Open from inventory item
  - `iParam1`: Item ID
  - `iParam2`: Item level
- **2 (MONSTER):** Drop from monster
  - `iParam1`: Monster class
  - `iParam2`: Map number (0 = all maps)
- **3 (EVENT):** Event reward
  - `iParam1`: Event ID
  - `iParam2`: Event level

**Usage:**
```lua
-- Drop bag for Luck Box item
ItemBag.Add(0, Helpers.MakeItemId(14, 11), 0, 'Item_(14,11,0)_Luck_Box')

-- Inventory bag for Red Ribbon Box
ItemBag.Add(1, Helpers.MakeItemId(12, 32), 0, 'Item_(12,32,0)_Red_Ribbon_Box')

-- Monster bag for Dark Elf (class 340)
ItemBag.Add(2, 340, 0, 'Monster_(340)_Dark_Elf')

-- Event bag for Chaos Castle level 1 reward
ItemBag.Add(3, 14, 1, 'Event_ChaosCastle(1)_Reward')
```

---

### ItemBag.CreateItem

```lua
ItemBag.CreateItem(iPlayerIndex, stBagItem)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `stBagItem` (object): Bag item struct (BagItem)

**Returns:** None

**Description:** Creates and drops item from item bag structure.

**Usage:**
```lua
ItemBag.CreateItem(iPlayerIndex, bagItemStruct)
```

---

## Buff Namespace

Buff management functions.

### Buff.Add

```lua
Buff.Add(oPlayer, iBuffIndex, EffectType1, EffectValue1, EffectType2, EffectValue2, iBuffDuration, BuffSendValue, nAttackerIndex)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iBuffIndex` (int): Buff index
- `EffectType1` (BYTE): Effect type 1
- `EffectValue1` (int): Effect value 1
- `EffectType2` (BYTE): Effect type 2
- `EffectValue2` (int): Effect value 2
- `iBuffDuration` (int): Duration in seconds
- `BuffSendValue` (WORD): Send value
- `nAttackerIndex` (int): Attacker index

**Returns:** None

**Description:** Adds buff effect to player with specified parameters.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Buff.Add(oPlayer, buffIndex, 0, 100, 0, 0, 60, 0, -1)
end
```

---

### Buff.AddCashShop

```lua
Buff.AddCashShop(oPlayer, wItemID, iBuffDuration)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `wItemID` (WORD): Cash shop item ID
- `iBuffDuration` (int): Duration in seconds

**Returns:** None

**Description:** Adds buff effect from cash shop item usage.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Buff.AddCashShop(oPlayer, itemID, 3600)  -- 1 hour buff
end
```

---

### Buff.AddItem

```lua
Buff.AddItem(oPlayer, iBuffIndex)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iBuffIndex` (int): Buff index

**Returns:** None

**Description:** Adds item-based buff to player.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Buff.AddItem(oPlayer, buffIndex)
end
```

---

### Buff.Remove

```lua
Buff.Remove(oPlayer, iBuffIndex)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iBuffIndex` (int): Buff index

**Returns:** None

**Description:** Removes specified buff from player if active.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Buff.Remove(oPlayer, buffIndex)
end
```

---

### Buff.CheckUsed

```lua
Buff.CheckUsed(oPlayer, iBuffIndex)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)
- `iBuffIndex` (int): Buff index

**Returns:** `bool` - `true` if buff is active, `false` otherwise

**Description:** Returns whether player has specified buff active.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    if Buff.CheckUsed(oPlayer, buffIndex) then
        Log.Add("Buff is active")
    end
end
```

---

## Skill Namespace

Skill usage functions.

### Skill.UseDuration

```lua
Skill.UseDuration(oPlayer, oTarget, TargetXPos, TargetYPos, iPlayerDirection, iMagicNumber)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject) using skill
- `oTarget` (object): Target object (stObject)
- `TargetXPos` (int): Target X position
- `TargetYPos` (int): Target Y position
- `iPlayerDirection` (int): Player direction
- `iMagicNumber` (int): Magic/skill number

**Returns:** None

**Description:** Uses duration-based skill on target.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
local oTarget = Player.GetObjByIndex(targetIndex)

if oPlayer ~= nil and oTarget ~= nil then
    Skill.UseDuration(oPlayer, oTarget, oTarget.X, oTarget.Y, oPlayer.Dir, magicNumber)
end
```

---

### Skill.UseNormal

```lua
Skill.UseNormal(oPlayer, oTarget, iMagicNumber)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject) using skill
- `oTarget` (object): Target object (stObject)
- `iMagicNumber` (int): Magic/skill number

**Returns:** None

**Description:** Uses instant skill on target.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
local oTarget = Player.GetObjByIndex(targetIndex)

if oPlayer ~= nil and oTarget ~= nil then
    Skill.UseNormal(oPlayer, oTarget, magicNumber)
end
```

---

## Viewport Namespace

Viewport management functions.

### Viewport.Create

```lua
Viewport.Create(oPlayer)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)

**Returns:** None

**Description:** Creates viewport for player, shows surrounding objects.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Viewport.Create(oPlayer)
end
```

---

### Viewport.Destroy

```lua
Viewport.Destroy(oPlayer)
```


**Parameters:**
- `oPlayer` (object): Player object (stObject)

**Returns:** None

**Description:** Destroys viewport for player, hides surrounding objects.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Viewport.Destroy(oPlayer)
end
```

---

## Move Namespace

Movement and teleportation functions.

### Move.Gate

```lua
Move.Gate(iPlayerIndex, iGateIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iGateIndex` (int): Gate index from gate configuration

**Returns:** `bool` - `true` if successful, `false` otherwise

**Description:** Teleports player through specified gate index.

**Usage:**
```lua
if Move.Gate(iPlayerIndex, 17) then
    Log.Add("Player moved through gate")
else
    Message.Send(0, iPlayerIndex, 0, "Cannot use gate")
end
```

---

### Move.ToMap

```lua
Move.ToMap(iTargetObjectIndex, iMapNumber, PosX, PosY)
```


**Parameters:**
- `iTargetObjectIndex` (int): Target object index (player or monster)
- `iMapNumber` (int): Target map number
- `PosX` (BYTE): Target X coordinate
- `PosY` (BYTE): Target Y coordinate

**Returns:** None

**Description:** Teleports player or monster to specified map and coordinates.

**Usage:**
```lua
-- Teleport to Lorencia
Move.ToMap(iPlayerIndex, 0, 130, 130)

-- Teleport to Devias
Move.ToMap(iPlayerIndex, 2, 220, 70)
```

---

### Move.Warp

```lua
Move.Warp(iTargetObjectIndex, PosX, PosY)
```


**Parameters:**
- `iTargetObjectIndex` (int): Target object index (player or monster)
- `PosX` (BYTE): Target X coordinate
- `PosY` (BYTE): Target Y coordinate

**Returns:** None

**Description:** Teleports player or monster within current map.

**Usage:**
```lua
-- Warp within current map
Move.Warp(iPlayerIndex, 150, 150)
```

---

## Party Namespace

Party system functions.

### Party.GetCount

```lua
Party.GetCount(iPartyNumber)
```


**Parameters:**
- `iPartyNumber` (int): Party number

**Returns:** `int` - Number of members in party

**Description:** Returns number of members in specified party.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil and oPlayer.PartyNumber >= 0 then
    local memberCount = Party.GetCount(oPlayer.PartyNumber)
    Log.Add(string.format("Party has %d members", memberCount))
end
```

---

### Party.GetMember

```lua
Party.GetMember(iPartyNumber, iArrayIndex)
```


**Parameters:**
- `iPartyNumber` (int): Party number
- `iArrayIndex` (int): Array index (1=leader, 2-5=members)

**Returns:** `int` - Player index

**Description:** Returns player index from party at specified position. Index 1 is always the party leader.

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil and oPlayer.PartyNumber >= 0 then
    -- Get party leader
    local leaderIndex = Party.GetMember(oPlayer.PartyNumber, 1)
    local oLeader = Player.GetObjByIndex(leaderIndex)
    
    if oLeader ~= nil then
        Log.Add(string.format("Party leader: %s", oLeader.Name))
    end
    
    -- Get all party members
    local memberCount = Party.GetCount(oPlayer.PartyNumber)
    for i = 1, memberCount do
        local memberIndex = Party.GetMember(oPlayer.PartyNumber, i)
        local oMember = Player.GetObjByIndex(memberIndex)
        if oMember ~= nil then
            Log.Add(string.format("Member %d: %s", i, oMember.Name))
        end
    end
end
```

---

## DB Namespace

Database query functions.

### DB.QueryDS

```lua
DB.QueryDS(iPlayerIndex, iQueryNumber, szQuery, ...)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iQueryNumber` (int): Query identifier (use to match responses)
- `szQuery` (string): SQL query string (supports format strings)
- `...` (variadic): Optional format string arguments

**Returns:** None

**Description:** Executes SQL query on DataServer database. Results received in `DSDBQueryReceive` callback.

**Usage:**
```lua
-- Simple query
DB.QueryDS(iPlayerIndex, 1, "SELECT * FROM Character WHERE Name = 'Player1'")

-- Query with parameters
local playerName = "TestPlayer"
DB.QueryDS(iPlayerIndex, 1001, string.format("SELECT Name, cLevel FROM Character WHERE Name = '%s'", playerName))

-- Handle results in callback
function DSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
    if iQueryNumber == 1001 and oRow ~= nil then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        Log.Add(string.format("%s = %s", columnName, value))
    end
end
```

---

### DB.QueryJS

```lua
DB.QueryJS(iPlayerIndex, iQueryNumber, szQuery, ...)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iQueryNumber` (int): Query identifier (use to match responses)
- `szQuery` (string): SQL query string (supports format strings)
- `...` (variadic): Optional format string arguments

**Returns:** None

**Description:** Executes SQL query on JoinServer database. Results received in `JSDBQueryReceive` callback.

**Usage:**
```lua
-- Query account info
local accountId = "admin"
DB.QueryJS(iPlayerIndex, 2001, string.format("SELECT memb_guid FROM MEMB_INFO WHERE memb___id = '%s'", accountId))

-- Handle results in callback
function JSDBQueryReceive(iUserIndex, iQueryNumber, btIsLastPacket, iCurrentRow, btColumnCount, btCurrentPacket, oRow)
    if iQueryNumber == 2001 and oRow ~= nil then
        local columnName = oRow:GetColumnName()
        local value = oRow:GetValue()
        Log.Add(string.format("%s = %s", columnName, value))
    end
end
```

**See:** [../Structures/DATABASE.md](../Structures/DATABASE.md) for detailed query examples

---

## Message Namespace

Message and notification functions.

### Message.Send

```lua
Message.Send(iPlayerIndex, aTargetIndex, btType, szMessage)
```


**Parameters:**
- `iPlayerIndex` (int): Player index (use 0 for system messages)
- `aTargetIndex` (int): Target index (`-1` for all players, specific index for single player)
- `btType` (BYTE): Message type:
  - `0` = Golden text center screen
  - `1` = Blue text left side
  - `2` = Green text, guild notice
  - `3` = Red text left side
- `szMessage` (string): Message text

**Returns:** None

**Description:** Sends notice message to player(s).

**Usage:**
```lua
-- Send to single player (normal)
Message.Send(0, iPlayerIndex, 0, "Hello player!")

-- Send to all players (golden)
Message.Send(0, -1, 1, "Server restart in 5 minutes!")

-- Send to single player (blue)
Message.Send(0, iPlayerIndex, 2, "Quest completed!")
```

---

## Timer Namespace

Timer and tick functions.

### Timer.GetTick

```lua
Timer.GetTick()
```


**Returns:** `ULONGLONG` - Milliseconds since system boot

**Description:** Returns milliseconds since system boot. Used for cooldown calculations.

**Usage:**
```lua
local currentTick = Timer.GetTick()

-- Check if 30 seconds passed
if (currentTick - lastActionTick) >= 30000 then
    Log.Add("30 seconds passed")
end
```

---

## ActionTick Namespace

Player action timer/cooldown management.

### ActionTick.Get

```lua
ActionTick.Get(iPlayerIndex, iTimerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iTimerIndex` (int): Timer index (0-2)

**Returns:** `ULONGLONG` - Tick count value, or `0` if invalid

**Description:** Gets tick count value from player's action timer by index.

**Usage:**
```lua
local lastTeleportTick = ActionTick.Get(iPlayerIndex, 0)

if (Timer.GetTick() - lastTeleportTick) >= 30000 then
    Log.Add("Ready to teleport")
end
```

---

### ActionTick.Set

```lua
ActionTick.Set(iPlayerIndex, iTimerIndex, tickValue, [timerName])
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iTimerIndex` (int): Timer index (0-2)
- `tickValue` (ULONGLONG): Tick count value to set
- `timerName` (string, optional): Timer name for debugging

**Returns:** `bool` - `true` if successful, `false` otherwise

**Description:** Sets tick count value for player's action timer by index.

**Usage:**
```lua
-- Without name
ActionTick.Set(iPlayerIndex, 0, Timer.GetTick())

-- With name (for debugging)
ActionTick.Set(iPlayerIndex, 0, Timer.GetTick(), "Teleport")
ActionTick.Set(iPlayerIndex, 1, Timer.GetTick(), "Potion")
ActionTick.Set(iPlayerIndex, 2, Timer.GetTick(), "Buff")
```

---

### ActionTick.GetName

```lua
ActionTick.GetName(iPlayerIndex, iTimerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iTimerIndex` (int): Timer index (0-2)

**Returns:** `string` - Timer name, or empty string if not set

**Description:** Gets name of player's action timer by index for debugging.

**Usage:**
```lua
local tickName = ActionTick.GetName(iPlayerIndex, 0)
Log.Add(string.format("Timer 0: %s", tickName))
```

---

### ActionTick.Clear

```lua
ActionTick.Clear(iPlayerIndex, iTimerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index
- `iTimerIndex` (int): Timer index (0-2)

**Returns:** `bool` - `true` if successful, `false` otherwise

**Description:** Clears player's action timer, resets name and tick value to 0.

**Usage:**
```lua
-- Clear all timers on player disconnect
for i = 0, 2 do
    ActionTick.Clear(iPlayerIndex, i)
end
```

---

## Scheduler Namespace

Event scheduler system functions.

### Scheduler.LoadFromXML

```lua
Scheduler.LoadFromXML(szXmlEventFileName)
```


**Parameters:**
- `szXmlEventFileName` (string): XML event file name (without path/extension)

**Returns:** `bool` - `true` if successful, `false` otherwise

**Description:** Loads event configuration from XML file.

**Usage:**
```lua
Scheduler.LoadFromXML("Events")
```

---

### Scheduler.GetEventCount

```lua
Scheduler.GetEventCount()
```


**Returns:** `int` - Number of loaded events

**Description:** Returns number of loaded events in scheduler.

**Usage:**
```lua
local eventCount = Scheduler.GetEventCount()
Log.Add(string.format("Loaded %d events", eventCount))
```

---

### Scheduler.CheckEventNotices

```lua
Scheduler.CheckEventNotices(currentTick)
```


**Parameters:**
- `currentTick` (ULONGLONG): Current tick count

**Returns:** None

**Description:** Checks and triggers event notices based on current time.

**Usage:**
```lua
Scheduler.CheckEventNotices(Timer.GetTick())
```

---

### Scheduler.CheckEventStarts

```lua
Scheduler.CheckEventStarts(currentTick)
```


**Parameters:**
- `currentTick` (ULONGLONG): Current tick count

**Returns:** None

**Description:** Checks and triggers event starts based on current time.

**Usage:**
```lua
Scheduler.CheckEventStarts(Timer.GetTick())
```

---

### Scheduler.CheckEventEnds

```lua
Scheduler.CheckEventEnds(currentTick)
```


**Parameters:**
- `currentTick` (ULONGLONG): Current tick count

**Returns:** None

**Description:** Checks and triggers event ends based on current time.

**Usage:**
```lua
Scheduler.CheckEventEnds(Timer.GetTick())
```

---

### Scheduler.GetEventName

```lua
Scheduler.GetEventName(iEventId)
```


**Parameters:**
- `iEventId` (int): Event ID

**Returns:** `string` - Event name

**Description:** Returns event name by event ID.

**Usage:**
```lua
local eventName = Scheduler.GetEventName(1)
Log.Add(string.format("Event: %s", eventName))
```

---

### Scheduler.HasSecondPrecisionEvents

```lua
Scheduler.HasSecondPrecisionEvents()
```


**Returns:** `bool` - `true` if any events use second precision, `false` otherwise

**Description:** Returns whether any loaded events use second-precision timing.

**Usage:**
```lua
if Scheduler.HasSecondPrecisionEvents() then
    Log.Add("Scheduler requires second-precision checks")
end
```

---

## Utility Namespace

Utility and helper functions.

### Utility.GetRandomRangedInt

```lua
Utility.GetRandomRangedInt(min, max)
```


**Parameters:**
- `min` (int): Minimum value (inclusive)
- `max` (int): Maximum value (inclusive)

**Returns:** `int` - Random value between min and max (inclusive)

**Description:** Returns random integer value between min and max (inclusive).

**Usage:**
```lua
local randomNum = Utility.GetRandomRangedInt(0, 100)  -- 0-100
Log.Add(string.format("Random: %d", randomNum))

-- Random item level
local itemLevel = Utility.GetRandomRangedInt(0, 15)  -- 0-15
```

---

### Utility.GetLargeRand

```lua
Utility.GetLargeRand()
```


**Returns:** `int` - Large random number

**Description:** Returns large random number.

**Usage:**
```lua
local largeRand = Utility.GetLargeRand()
```

---

### Utility.FireCracker

```lua
Utility.FireCracker(iPlayerIndex)
```


**Parameters:**
- `iPlayerIndex` (int): Player object index

**Returns:** None

**Description:** Generates firecracker visual effect for specified player.

**Usage:**
```lua
Utility.FireCracker(iPlayerIndex)
```

---

## Log Namespace

Server logging functions.

### Log.Add

```lua
Log.Add(szLog)
```


**Parameters:**
- `szLog` (string): Log message

**Returns:** None

**Description:** Adds log message to game server console with default color (white).

**Usage:**
```lua
Log.Add("Server started successfully")
Log.Add(string.format("Player %s connected", playerName))
```

---

### Log.AddC

```lua
Log.AddC(dwLogColor, szLog)
```


**Parameters:**
- `dwLogColor` (DWORD): Log color (use `Enums.LogColor` or `Helpers.RGB()`)
- `szLog` (string): Log message

**Returns:** None

**Description:** Adds colored log message to game server console.

**Usage:**
```lua
-- Using predefined colors
Log.AddC(Enums.LogColor.Red, "Critical error!")
Log.AddC(Enums.LogColor.Green, "Event started")
Log.AddC(Enums.LogColor.Yellow, "Warning: Low memory")

-- Using custom RGB color
Log.AddC(Helpers.RGB(255, 0, 255), "Custom magenta message")
```

---

## See Also

- [CALLBACKS.md](CALLBACKS.md) - Event callback reference
- [../Structures/PLAYER.md](../Structures/PLAYER.md) - Player object structure
- [../Structures/ITEM.md](../Structures/ITEM.md) - Item structures
- [../Structures/DATABASE.md](../Structures/DATABASE.md) - Database query structures
- [../../Defines/GlobalFunctions.lua](../../Defines/GlobalFunctions.lua) - Type hints for IDE
