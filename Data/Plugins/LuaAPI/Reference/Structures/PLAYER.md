# C++ STRUCTURES REFERENCE

Complete reference for C++ objects exposed to Lua scripting system.

**IMPORTANT:** These structures cannot be instantiated in Lua. They are C++ objects accessible only through specific functions.

---

## Table of Contents

- [Player Object](#player-object)
- [userData Structure](#userdata-structure)
- [ActionTickCount Structure](#actiontickcount-structure)
- [Usage Examples](#usage-examples)

---

## Player Object

**Access:** Via `Player.GetObjByIndex()`, `Player.GetObjByName()`, or callback parameters

**C++ Type:** `stObject`

**Note:** The same `stObject` structure is used for **all object types** in the game:
- Players
- Monsters
- NPCs

All objects share the same structure with common fields like `Index`, `MapNumber`, `X`, `Y`, `Class`, `Type`, etc.

### Player Identity

| Field | Type | Description |
|-------|------|-------------|
| `Index` | int | *(read-only)* Player object index in server array |
| `Type` | int | *(read-only)* Object type - see `Enums.ObjectType` (USER, MONSTER, NPC) |
| `Connected` | int | Connection state (1 = connected, 0 = disconnected) |
| `UserNumber` | int | *(read-only)* Unique user session number |
| `DBNumber` | int | *(read-only)* Database character ID (memb_guid) |
| `LangCode` | int | Client language code (ID) |

**Type field usage:**
```lua
local oObject = Player.GetObjByIndex(iIndex)
if oObject then
	if oObject.Type == Enums.ObjectType.USER then
		-- Real player - userData is accessible
		local money = oObject.userData.Money
	elseif oObject.Type == Enums.ObjectType.MONSTER then
		-- Monster - no userData
	elseif oObject.Type == Enums.ObjectType.NPC then
		-- NPC - userData accessible only for player-class NPCs
	end
end
```

### Character Information

| Field | Type | Description |
|-------|------|-------------|
| `Class` | WORD | Character class code |
| `Level` | short | Character level |
| `AccountId` | string | *(read-only)* Account login name |

### Health System

| Field | Type | Description |
|-------|------|-------------|
| `Life` | double | Current HP |
| `MaxLife` | double | Maximum HP |
| `AddLife` | int | Additional HP from items/buffs |

### Shield System

| Field | Type | Description |
|-------|------|-------------|
| `Shield` | int | Current shield points |
| `AddShield` | int | Additional shield from items/buffs |
| `MaxShield` | int | Maximum shield capacity |

### Mana System

| Field | Type | Description |
|-------|------|-------------|
| `Mana` | double | Current mana/MP |
| `MaxMana` | double | Maximum mana |
| `AddMana` | int | Additional mana from items/buffs |

### AG/Stamina System

| Field | Type | Description |
|-------|------|-------------|
| `BP` | int | Current AG/stamina points |
| `AddBP` | int | Additional AG from items/buffs |
| `MaxBP` | int | Maximum AG capacity |

### PK System

| Field | Type | Description |
|-------|------|-------------|
| `PKCount` | int | Current PK count |
| `PKLevel` | char | PK level/status (0-6) |
| `PKTime` | int | Time remaining in PK status |
| `PKTotalCount` | int | Lifetime total PK count |

### Position & Map

| Field | Type | Description |
|-------|------|-------------|
| `X` | BYTE | Current X coordinate |
| `Y` | BYTE | Current Y coordinate |
| `Dir` | BYTE | Facing direction (0-7) |
| `MapNumber` | WORD | Current map ID |

### Authority & Permissions

| Field | Type | Description |
|-------|------|-------------|
| `Authority` | DWORD | Authority level |
| `AuthorityCode` | DWORD | Authority verification code |
| `Penalty` | DWORD | Penalty flags/type |
| `GameMaster` | DWORD | Game master status flag |
| `PenaltyMask` | DWORD | Penalty restrictions bitmask |

### Physical Attack Damage

| Field | Type | Description |
|-------|------|-------------|
| `AttackDamageMin` | int | Minimum attack damage (total) |
| `AttackDamageMax` | int | Maximum attack damage (total) |
| `AttackDamageMinLeft` | int | Minimum damage (left hand weapon) |
| `AttackDamageMinRight` | int | Minimum damage (right hand weapon) |
| `AttackDamageMaxLeft` | int | Maximum damage (left hand weapon) |
| `AttackDamageMaxRight` | int | Maximum damage (right hand weapon) |

### Magic Damage

| Field | Type | Description |
|-------|------|-------------|
| `MagicDamageMin` | int | Minimum magic/wizardry damage |
| `MagicDamageMax` | int | Maximum magic/wizardry damage |

### Curse Damage

| Field | Type | Description |
|-------|------|-------------|
| `CurseDamageMin` | int | Minimum curse/dark damage |
| `CurseDamageMax` | int | Maximum curse/dark damage |
| `CurseSpell` | int | Active curse spell effect |

### Combat Statistics

| Field | Type | Description |
|-------|------|-------------|
| `CombatPower` | int | Total combat power rating |
| `CombatPowerAttackDamage` | int | Combat power from attack damage |
| `Defense` | int | Total defense value |
| `AttackRating` | int | Attack success rating |
| `DefenseRating` | int | Defense/block success rating |
| `AttackSpeed` | int | Attack speed value |
| `MagicSpeed` | int | Magic/skill cast speed value |

### Pentagram System - General

| Field | Type | Description |
|-------|------|-------------|
| `PentagramMainAttribute` | int | Main pentagram attribute type |
| `PentagramAttributePattern` | int | Pentagram attribute pattern ID |

### Pentagram System - Defense

| Field | Type | Description |
|-------|------|-------------|
| `PentagramDefense` | int | Base pentagram defense (PvM) |
| `PentagramDefensePvP` | int | Pentagram defense for PvP |
| `PentagramDefenseRating` | int | Pentagram defense rating (PvM) |
| `PentagramDefenseRatingPvP` | int | Pentagram defense rating (PvP) |

### Pentagram System - Attack

| Field | Type | Description |
|-------|------|-------------|
| `PentagramAttackMin` | int | Minimum pentagram attack (PvM) |
| `PentagramAttackMax` | int | Maximum pentagram attack (PvM) |
| `PentagramAttackMinPvP` | int | Minimum pentagram attack (PvP) |
| `PentagramAttackMaxPvP` | int | Maximum pentagram attack (PvP) |
| `PentagramAttackRating` | int | Pentagram attack rating (PvM) |
| `PentagramAttackRatingPvP` | int | Pentagram attack rating (PvP) |

### Pentagram System - Damage Modifiers

| Field | Type | Description |
|-------|------|-------------|
| `PentagramDamageMin` | int | Minimum pentagram damage modifier |
| `PentagramDamageMax` | int | Maximum pentagram damage modifier |
| `PentagramDamageOrigin` | int | Base pentagram damage |
| `PentagramCriticalDamageRate` | int | Critical damage rate |
| `PentagramExcellentDamageRate` | int | Excellent damage rate |

### Party & Duel Systems

| Field | Type | Description |
|-------|------|-------------|
| `PartyNumber` | int | Party ID (-1 if not in party) |
| `WinDuels` | int | Total duel wins |
| `LoseDuels` | int | Total duel losses |

### State

| Field | Type | Description |
|-------|------|-------------|
| `Live` | unsigned char | Alive state (1 = alive, 0 = dead) |

### Action Tick Counters

| Field | Type | Description |
|-------|------|-------------|
| `ActionTickCount` | ActionTickCount[3] | Array of 3 action tick counters (indexed 1-3 in Lua) |

### User Data

| Field | Type | Description |
|-------|------|-------------|
| `userData` | userData* | *(read-only pointer)* User data substructure (see userData section below) |

### Methods

#### GetInventoryItem

```lua
oPlayer:GetInventoryItem(iInventoryPos)
```

**Parameters:**
- `iInventoryPos` (int): Inventory slot index (0 to INVENTORY_SIZE-1)

**Returns:** 
- `CItem` object if valid item exists at position
- `nil` if no item or invalid position

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
local weapon = oPlayer:GetInventoryItem(0)  -- Weapon slot

if weapon ~= nil then
    Log.Add("Player has weapon equipped")
end
```

---

#### GetWarehouseItem

```lua
oPlayer:GetWarehouseItem(iWarehousePos)
```

**Parameters:**
- `iWarehousePos` (int): Warehouse slot index (0 to WAREHOUSE_SIZE-1)

**Returns:** 
- `CItem` object if valid item exists at position
- `nil` if no item or invalid position

**Usage:**
```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
local item = oPlayer:GetWarehouseItem(0)

if item ~= nil then
    Log.Add("Item found in warehouse slot 0")
end
```

---

## userData Structure

**Access:** Via `oPlayer.userData`

**C++ Type:** `LPOBJ_USER_DATA`

**IMPORTANT:** The `userData` field is only available for:
- **Players** (real players connected to the server)
- **Player-like NPCs** (NPCs that have player character classes)

Regular monsters and items do NOT have this structure. Accessing `userData` on non-player objects may result in nil or undefined behavior.

### Base Stats

| Field | Type | Description |
|-------|------|-------------|
| `Strength` | WORD | Current strength value |
| `Dexterity` | WORD | Current dexterity value |
| `Vitality` | WORD | Current vitality value |
| `Energy` | WORD | Current energy value |
| `Command` | WORD | Current command value |

### Additional Stats (Blue Stats)

| Field | Type | Description |
|-------|------|-------------|
| `AddStrength` | int | Additional strength stat (blue) |
| `AddDexterity` | int | Additional dexterity stat (blue) |
| `AddVitality` | int | Additional vitality stat (blue) |
| `AddEnergy` | int | Additional energy stat (blue) |
| `AddCommand` | int | Additional command stat (blue) |

### Stat Points

| Field | Type | Description |
|-------|------|-------------|
| `LevelUpPoint` | int | Available level up points to distribute |

### Class Information

| Field | Type | Description |
|-------|------|-------------|
| `DBClass` | BYTE | Character class ID from database |

### Master Level System

| Field | Type | Description |
|-------|------|-------------|
| `MasterLevel` | short | Current master level |
| `MasterExp` | UINT64 | Current master level experience |
| `MasterNextExp` | UINT64 | Experience required for next master level |
| `ThirdTreePoint` | int | Available master level points in third skill tree |
| `UsedThirdTreePoint` | int | Used master level points in third skill tree |
| `FourthTreePoint` | int | Available master level points in fourth skill tree |
| `UsedFourthTreePoint` | int | Used master level points in fourth skill tree |

### Currency

| Field | Type | Description |
|-------|------|-------------|
| `Money` | int | Zen (gold) amount |
| `Ruud` | int | Ruud currency amount |

### Reset System

| Field | Type | Description |
|-------|------|-------------|
| `Resets` | int | Total resets performed within the day |

### VIP System

| Field | Type | Description |
|-------|------|-------------|
| `VIPType` | short | VIP tier/type (-1 = none, check VIPSystem.xml for levels) |
| `VIPMode` | char | Active VIP mode (see Enums.VipMode) |

---

## ActionTickCount Structure

**Access:** Via `oPlayer.ActionTickCount[index]` (Lua index 1-3)

**C++ Type:** `LuaTickCount`

**Important:** Lua uses 1-based indexing while C++ uses 0-based indexing!

| Field | Type | Description |
|-------|------|-------------|
| `name` | char[16] | Timer name (max 15 characters, read-only) |
| `tick` | ULONGLONG | Tick count value (read-only, use `ActionTick.Set()` to modify) |

### Index Mapping

| Lua Index | C++ Index | Description |
|-----------|-----------|-------------|
| `ActionTickCount[1]` | `m_ActionTickCount[0]` | First timer slot |
| `ActionTickCount[2]` | `m_ActionTickCount[1]` | Second timer slot |
| `ActionTickCount[3]` | `m_ActionTickCount[2]` | Third timer slot |

---

## Usage Examples

### Example 1: Basic Player Information

```lua
function PlayerLogin(oPlayer)
    if oPlayer ~= nil then
        Log.Add(string.format("Player: %s", oPlayer.Name))
        Log.Add(string.format("Level: %d, Class: %d", oPlayer.Level, oPlayer.Class))
        Log.Add(string.format("HP: %.0f/%.0f", oPlayer.Life, oPlayer.MaxLife))
        Log.Add(string.format("Map: %d at (%d, %d)", oPlayer.MapNumber, oPlayer.X, oPlayer.Y))
    end
end
```

### Example 2: Accessing User Data

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    local userData = oPlayer.userData
    
    Log.Add(string.format("STR: %d (+%d)", userData.Strength, userData.AddStrength))
    Log.Add(string.format("Money: %d Zen", userData.Money))
    Log.Add(string.format("Resets: %d", userData.Resets))
    Log.Add(string.format("Master Level: %d", userData.MasterLevel))
end
```

### Example 3: Action Tick Counters - Reading

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    -- Read first timer (Lua index 1 = C++ index 0)
    local teleportTick = oPlayer.ActionTickCount[1].tick
    local teleportName = oPlayer.ActionTickCount[1].name
    
    Log.Add(string.format("Timer: %s = %llu", teleportName, teleportTick))
    
    -- Check cooldown
    if (Timer.GetTick() - teleportTick) >= 30000 then
        Log.Add("Teleport cooldown ready")
    end
end
```

### Example 4: Action Tick Counters - Setting

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    -- Set timers using ActionTick functions (0-based index)
    ActionTick.Set(iPlayerIndex, 0, Timer.GetTick(), "Teleport")  -- Timer slot 0 (Lua index 1)
    ActionTick.Set(iPlayerIndex, 1, Timer.GetTick(), "Potion")    -- Timer slot 1 (Lua index 2)
    ActionTick.Set(iPlayerIndex, 2, Timer.GetTick(), "Buff")      -- Timer slot 2 (Lua index 3)
end
```

### Example 5: Iterating Through All Timers

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    for i = 1, 3 do
        local timer = oPlayer.ActionTickCount[i]
        Log.Add(string.format("Timer[%d]: %s = %llu", i, timer.name, timer.tick))
    end
end
```

### Example 6: Combat Information

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Log.Add(string.format("Attack: %d-%d", oPlayer.AttackDamageMin, oPlayer.AttackDamageMax))
    Log.Add(string.format("Magic: %d-%d", oPlayer.MagicDamageMin, oPlayer.MagicDamageMax))
    Log.Add(string.format("Defense: %d", oPlayer.Defense))
    Log.Add(string.format("Attack Rating: %d", oPlayer.AttackRating))
    Log.Add(string.format("Attack Speed: %d", oPlayer.AttackSpeed))
end
```

### Example 7: Party Information

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    if oPlayer.PartyNumber >= 0 then
        local partyCount = Party.GetCount(oPlayer.PartyNumber)
        Log.Add(string.format("Player is in party %d with %d members", 
            oPlayer.PartyNumber, partyCount))
        
        -- Get party leader
        local leaderIndex = Party.GetMember(oPlayer.PartyNumber, 1)
        local oLeader = Player.GetObjByIndex(leaderIndex)
        if oLeader ~= nil then
            Log.Add("Party leader: " .. oLeader.Name)
        end
    else
        Log.Add("Player is not in a party")
    end
end
```

### Example 8: Inventory Access

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    -- Check weapon slot
    local weapon = oPlayer:GetInventoryItem(0)
    if weapon ~= nil then
        Log.Add("Player has weapon equipped")
    end
    
    -- Check armor slot
    local armor = oPlayer:GetInventoryItem(2)
    if armor ~= nil then
        Log.Add("Player has armor equipped")
    end
end
```

### Example 9: Pentagram System

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    Log.Add(string.format("Pentagram Attack: %d-%d (PvM)", 
        oPlayer.PentagramAttackMin, oPlayer.PentagramAttackMax))
    Log.Add(string.format("Pentagram Attack: %d-%d (PvP)", 
        oPlayer.PentagramAttackMinPvP, oPlayer.PentagramAttackMaxPvP))
    Log.Add(string.format("Pentagram Defense: %d (PvM)", oPlayer.PentagramDefense))
    Log.Add(string.format("Critical Rate: %d%%", oPlayer.PentagramCriticalDamageRate))
end
```

### Example 10: VIP System

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    local userData = oPlayer.userData
    
    if userData.VIPType >= 0 then
        Log.Add(string.format("VIP Type: %d, Mode: %d", userData.VIPType, userData.VIPMode))
    else
        Log.Add("Player is not VIP")
    end
end
```

---

## Important Notes

1. **Read-Only Fields:** Most fields are read-only. Use appropriate namespace functions to modify values:
   - Use `Player.SetMoney()` for money
   - Use `Stats.Set()` for stats
   - Use `ActionTick.Set()` for timers

2. **Null Checks:** Always check if player object is not `nil` before accessing fields:
   ```lua
   local oPlayer = Player.GetObjByIndex(iPlayerIndex)
   if oPlayer ~= nil then
       -- Safe to access fields
   end
   ```

3. **Index Differences:** 
   - Lua arrays use 1-based indexing
   - C++ functions use 0-based indexing
   - `ActionTickCount[1]` in Lua = index 0 in C++

4. **Performance:** Direct field access is very fast. Use it freely for reading values.

5. **Type Safety:** Fields return their native types. No type conversion needed in most cases.

---

## See Also

- [GLOBAL_FUNCTIONS.md](GLOBAL_FUNCTIONS.md) - Complete function reference
- [CALLBACKS.md](CALLBACKS.md) - Event callback reference
- [Constants.lua](../Defines/Constants.lua) - Game constants
- [Enums.lua](../Defines/Enums.lua) - Enumeration values
