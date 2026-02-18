# Lua Scripting Reference

Complete documentation for MU Online server Lua scripting system.

---

## ⚠️ Documentation Notice

**This documentation and examples are under active development.** While we strive for accuracy, some examples or documentation may contain errors. These will be fixed on a regular basis as they are reported.

If you encounter any issues or inaccuracies:
- Double-check against the actual API behavior
- Report issues to the development team
- Check for updates regularly

---

## Quick Start

1. **New to Lua scripting?** Start with the [GUIDE](https://www.lua.org/pil/1.html)
2. **Need a function?** Check [Functions/GLOBAL_FUNCTIONS.md](Functions/GLOBAL_FUNCTIONS.md)
3. **Working with player?** Start with [Structures/PLAYER.md](Structures/PLAYER.md)
4. **Working with items?** See [Structures/ITEM.md](Structures/ITEM.md)
5. **Need examples?** Browse the Examples section below

---

## Documentation Structure

### Structures

C++ objects exposed to Lua - these cannot be instantiated, only accessed through functions:

- **[Player Object](Structures/PLAYER.md)** - Main player/character object (stObject)
  - Player fields (Index, Level, Life, Mana, etc.)
  - userData substructure (Stats, Currency, VIP, Resets)
  - ActionTickCount timers (Cooldown system)
  - Methods: `GetInventoryItem()`, `GetWarehouseItem()`

- **[Item Structures](Structures/ITEM.md)** - Item system structures
  - ItemAttr (Read-only template from ItemList.txt)
  - CreateItemInfo (Create new items)
  - ItemInfo (Actual item instances)
  - BagItem (Item bag drop templates)

- **[Database Query Structures](Structures/DATABASE.md)** - Database query results
  - QueryResultDS (DataServer query results)
  - QueryResultJS (JoinServer query results)
  - Callback handlers for query responses

### Functions

- **[Global Functions](Functions/GLOBAL_FUNCTIONS.md)** - Complete API reference
  - 85+ functions organized in 20 namespaces
  - Server, Player, Item, Inventory, Combat, etc.

- **[Callbacks](Functions/CALLBACKS.md)** - Event callbacks
  - GameServer events (Initialize, Destroy, Join, Leave)
  - Player events (Login, Logout, LevelUp, Die, Respawn)
  - Item events (Use, Drop, Get, Equip, Repair)
  - Combat events (Attack, Kill, Die)
  - Database events (Query results)
  - Map & movement events
  - Shop & trading events

### Code Organization

- **[Defines/Constants.lua](../Defines/Constants.lua)** - Game constants
  - Inventory sizes, equipment slots
  - Map numbers, gate numbers
  - System limits and boundaries

- **[Defines/Enums.lua](../Defines/Enums.lua)** - Enumeration values
  - Character classes, VIP modes
  - Item categories, resistance types
  - Event types, message types

- **[Defines/Helpers.lua](../Defines/Helpers.lua)** - Helper functions
  - `RGB(r, g, b)` - Create DWORD color value (Windows API compatible)
  - `MakeItemId(type, index)` - Create item ID from type and index
  - `GetItemType(id)` - Extract item type from item ID
  - `GetItemIndex(id)` - Extract item index from item ID

- **[Defines/Structs.lua](../Defines/Structs.lua)** - LuaDoc type hints for structures
  - IDE autocomplete support (optional)
  - Type annotations for Player, Item, Database structures
  - Not loaded at runtime

- **[Defines/GlobalFunctions.lua](../Defines/GlobalFunctions.lua)** - LuaDoc type hints for functions
  - IDE autocomplete support (optional)
  - Type annotations for all server functions
  - Not loaded at runtime

---

## Common Tasks

### Working with Players

```lua
-- Get player object
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    -- Access player data
    Log.Add(string.format("Player: Level %d, HP: %.0f", oPlayer.Level, oPlayer.Life))
    
    -- Access user data
    local money = oPlayer.userData.Money
    local resets = oPlayer.userData.Resets
end
```

**See:** [Structures/PLAYER.md](Structures/PLAYER.md)

### Working with Items

```lua
-- Working with Item IDs
local itemId = Helpers.MakeItemId(14, 13)  -- Creates 7181 (Jewel of Bless)
local itemType = Helpers.GetItemType(itemId)  -- Returns 14
local itemIndex = Helpers.GetItemIndex(itemId)  -- Returns 13

Log.Add(string.format("ItemID: %d, Type: %d, Index: %d", itemId, itemType, itemIndex))

-- Get item template
local itemAttr = Item.GetAttr(itemId)
if itemAttr ~= nil then
	local itemName = itemAttr:GetName()
	Log.Add("Item: " .. itemName)
end

-- Create new item
local itemInfo = CreateItemInfo.new()
itemInfo.ItemId = Helpers.MakeItemId(0, 0)  -- Kris (Sword)
itemInfo.ItemLevel = 9
itemInfo.Durability = 255
Item.Create(iPlayerIndex, itemInfo)

-- Check item type from inventory
local invItem = oPlayer:GetInventoryItem(12)  -- Inventory slot 12
if invItem ~= nil then
	local type = Helpers.GetItemType(invItem.ItemId)
	local index = Helpers.GetItemIndex(invItem.ItemId)
	Log.Add(string.format("Inventory slot 12: Type=%d, Index=%d", type, index))
end
```

**See:** [Structures/ITEM.md](Structures/ITEM.md)

### Cooldown System

```lua
-- Check cooldown
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
local lastTick = oPlayer.ActionTickCount[1].tick

if (Timer.GetTick() - lastTick) >= 30000 then
    -- 30 seconds passed
    ActionTick.Set(iPlayerIndex, 0, Timer.GetTick(), "Teleport")
    -- Do action
else
    Message.Send(0, iPlayerIndex, 0, "Cooldown active")
end
```

**See:** [Structures/PLAYER.md#actiontickcount-structure](Structures/PLAYER.md#actiontickcount-structure)

### Database Queries

```lua
-- Execute query
DB.QueryDS(iPlayerIndex, 1, string.format("SELECT Name, cLevel, Money FROM Character WHERE Name = '%s'", playerName))

-- Handle result - IMPORTANT: All values are returned as strings!
function DSDBQueryReceive(iPlayerIndex, iQueryNumber, bIsLastPacket, iCurrentRow, iColumnCount, iCurrentPacket, oRow)
	if iQueryNumber == 1 and oRow ~= nil then
		local columnName = oRow:GetColumnName()
		local valueStr = oRow:GetValue()  -- Always returns string!
		
		-- Convert numeric columns to proper types
		if columnName == "cLevel" or columnName == "Money" then
			local numValue = math.tointeger(valueStr)  -- Convert to integer
			Log.Add(string.format("%s = %d", columnName, numValue))
		else
			Log.Add(string.format("%s = %s", columnName, valueStr))  -- String
		end
		
		if bIsLastPacket == 1 then
			Log.Add("Query complete")
		end
	end
end
```

**See:** [Structures/DATABASE.md](Structures/DATABASE.md) for type conversion details

### Iterating Objects (High Performance)

```lua
-- Iterate ALL objects (players, monsters, items)
Object.ForEach(function(oObject)
    if oObject.Type == Enums.ObjectType.MONSTER then
        Log.Add(string.format("Monster class %d", oObject.Class))
    end
    return true
end)

-- Iterate all players (10-20x faster than Lua loops)
Object.ForEachPlayer(function(oPlayer)
    if oPlayer.Level >= 400 then
        Message.Send(0, oPlayer.Index, 1, "High level bonus!")
    end
    return true  -- continue (return false to break)
end)

-- Iterate players on specific map
Object.ForEachPlayerOnMap(0, function(oPlayer)  -- Lorencia
    Player.SetMoney(oPlayer.Index, 1000000, false)
    return true
end)

-- Iterate monsters on map
Object.ForEachMonsterOnMap(2, function(oMonster)  -- Devias
    oMonster.AddLife = oMonster.AddLife + 5000
    return true
end)

-- Find specific monster type
Object.ForEachMonsterByClass(275, function(oMonster)  -- Golden Goblin
    Log.Add(string.format("Found at map %d", oMonster.MapNumber))
    return false  -- break after first find
end)

-- Party operations
Object.ForEachPartyMember(partyNumber, function(oMember)
    Message.Send(0, oMember.Index, 0, "Party quest complete!")
    return true
end)

-- Guild operations
Object.ForEachGuildMember("TopGuild", function(oMember)
    Player.SetMoney(oMember.Index, 5000000, false)
    return true
end)

-- AOE effects
Object.ForEachNearby(playerIndex, 10, function(oObject, distance)
    if oObject.Type == Enums.ObjectType.USER then
        Buff.Add(oObject, buffIndex, 0, 100, 0, 0, 60, 0, playerIndex)
    end
    return true
end)

-- Utility functions with optional filters
local playerCount = Object.CountPlayersOnMap(0)  -- All players
local elitePlayers = Object.CountPlayersOnMap(0, function(oPlayer)
    return oPlayer.Level >= 400  -- Only high level
end)
local monsterCount = Object.CountMonstersOnMap(2)  -- All monsters
local bossCount = Object.CountMonstersOnMap(2, function(oMonster)
    return oMonster.Class >= 200  -- Only bosses
end)
local oTarget = Object.GetObjByName("PlayerName")  -- Fast find
```

**Performance:** C++ iterators are 10-20x faster than manual Lua loops. Use for timer functions processing many objects.

**See:** [Functions/GLOBAL_FUNCTIONS.md#object-namespace](Functions/GLOBAL_FUNCTIONS.md#object-namespace)

---

## API Organization

Functions are organized in namespaces for clarity:

| Namespace | Functions | Description |
|-----------|-----------|-------------|
| `Server` | 6 | Server info (code, name, VIP levels) |
| `Object` | 20 | Object limits, high-performance iterators, and utilities |
| `Player` | 9 | Player operations (get, recalc, reset) |
| `Combat` | 1 | Combat information |
| `Stats` | 3 | Character stats management |
| `Inventory` | 10 | Inventory operations |
| `Item` | 12 | Item creation and attributes |
| `ItemBag` | 2 | Item bag system |
| `Buff` | 5 | Buff management |
| `Skill` | 2 | Skill usage |
| `Viewport` | 2 | Viewport creation/destruction |
| `Move` | 3 | Teleportation and movement |
| `Party` | 2 | Party information |
| `DB` | 2 | Database queries |
| `Message` | 1 | Send messages to players |
| `Timer` | 1 | Get current tick count |
| `ActionTick` | 4 | Cooldown timer management |
| `Scheduler` | 7 | Event scheduler system |
| `Utility` | 3 | Random numbers, effects |
| `Log` | 2 | Server logging |

**See:** [Functions/GLOBAL_FUNCTIONS.md](Functions/GLOBAL_FUNCTIONS.md)

---

## File Structure

```
Scripts/
├── Defines/
│   ├── Helpers.lua          (Helper functions)
│   ├── Constants.lua        (Game constants)
│   ├── Enums.lua           (Enumerations)
│   ├── Structs.lua         (Type hints for structures - optional)
│   └── GlobalFunctions.lua (Type hints for functions - optional)
├── Reference/
│   ├── README.md           (This file)
│   ├── Structures/
│   │   ├── PLAYER.md       (Player + userData + ActionTickCount)
│   │   ├── ITEM.md         (ItemAttr + CreateItemInfo + ItemInfo + BagItem)
│   │   └── DATABASE.md     (QueryResultDS + QueryResultJS)
│   └── Functions/
│       ├── GLOBAL_FUNCTIONS.md
│       └── CALLBACKS.md
├── Includes/
│   └── EventScheduler.lua  (Event scheduler system)
├── Callbacks.lua           (Event handlers)
├── EventHandler.lua        (Custom event handlers)
└── Main.lua               (Entry point)
```

---

## Best Practices

### 1. Always Check for nil

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    -- Safe to access player fields
end
```

### 2. Use Namespace Functions

```lua
-- ✅ Preferred (organized, clear)
Player.SetMoney(iPlayerIndex, 1000000)
Stats.Set(iPlayerIndex, Enums.StatType.STRENGTH, 1000)

```

### 3. Use Helper Functions

```lua
-- ✅ Correct
local itemId = Helpers.MakeItemId(0, 0)

-- ❌ Wrong
local itemId = 0 * 512 + 0  -- Error-prone
```

### 4. Understand Indexing

```lua
-- Player methods use 0-based indexing (C++ style)
local weapon = oPlayer:GetInventoryItem(0)

-- Array methods use 1-based indexing (Lua style)
local socket = itemInfo:GetSocket(1)

-- ActionTickCount array uses 1-based indexing
local tick = oPlayer.ActionTickCount[1].tick  -- First timer (C++ index 0)
```

### 5. Check Item Existence

```lua
local item = oPlayer:GetInventoryItem(slot)
if item ~= nil and item.IsItemExist then
    -- Safe to use item
end
```

---

## Learning Path

### Beginner

1. Read [Structures/PLAYER.md](Structures/PLAYER.md) to understand player objects
2. Check [Functions/GLOBAL_FUNCTIONS.md](Functions/GLOBAL_FUNCTIONS.md) for basic functions
3. Browse examples in structure documentation
4. Look at [Callbacks.lua](../Callbacks.lua) for event patterns

### Intermediate

1. Study [Structures/ITEM.md](Structures/ITEM.md) for item system
2. Learn database queries in [Functions/CALLBACKS.md](Functions/CALLBACKS.md)
3. Implement cooldown systems with ActionTickCount
4. Create custom event handlers

### Advanced

1. Build complex quest systems
2. Implement custom drop tables
3. Create scheduled events
4. Develop advanced combat mechanics

---

## Performance Tips

### Direct Field Access is Fast

```lua
-- ✅ Very fast - direct memory access
local hp = oPlayer.Life
local level = oPlayer.Level
```

### Cache Frequently Used Values

```lua
-- ✅ Good - cache for loops
local Player.IsConnected = Player.IsConnected
for i = 0, 100 do
    if Player.IsConnected(i) then
        -- Process player
    end
end

-- ❌ Slower - table lookup every iteration
for i = 0, 100 do
    if Player.IsConnected(i) then
        -- Process player
    end
end
```

### Minimize Function Calls in Tight Loops

```lua
-- ✅ Better - cache player object
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    for i = 0, Constants.MAIN_INVENTORY_SIZE - 1 do
        local item = oPlayer:GetInventoryItem(i)
        if item ~= nil and item.IsItemExist then
            -- Process item using cached player object
            Log.Add(string.format("Slot %d: %s", i, item.Type))
        end
    end
end

-- ❌ Slower - repeated function calls
for i = 0, Constants.MAIN_INVENTORY_SIZE - 1 do
    local oPlayer = Player.GetObjByIndex(iPlayerIndex)  -- Called 120 times!
    if oPlayer ~= nil then
        local item = oPlayer:GetInventoryItem(i)
        -- Process item
    end
end
```

---

## Additional Resources

- **Documentation:** Complete API reference in this documentation
- **Examples:** Practical examples in the Examples directory
- **Support:** Contact development team for assistance

---

## Version Information

This documentation covers the current Lua scripting API as of February 2026.

Updates and corrections are made regularly based on reported issues.

---

## Contributing

When adding new features:

1. Update relevant structure documentation in `Reference/Structures/`
2. Update function documentation in `Reference/Functions/`
3. Add examples showing practical usage
4. Update this README if adding major features
5. Keep `Defines/Structs.lua` type hints in sync

---

**Last Updated:** February 2026  
**Maintained by:** IGCN Development Team
