# Item Structures

Complete reference for item-related C++ structures exposed to Lua.

---

## Table of Contents

- [ItemAttr Structure](#itemattr-structure)
- [CreateItemInfo Structure](#createiteminfo-structure)
- [ItemInfo Structure](#iteminfo-structure)
- [BagItem Structure](#bagitem-structure)
- [Usage Examples](#usage-examples)

---

## ItemAttr Structure

**Access:** Via `Item.GetAttr(itemId)` or `GetItemAttr(itemId)`

**C++ Type:** `ITEM_ATTRIBUTE`

**Description:** Read-only item template data from ItemList.txt. Contains base item statistics, requirements, and properties.

**Note:** All fields are READ-ONLY. This structure cannot be instantiated.

### Basic Item Info

| Field | Type | Description |
|-------|------|-------------|
| `HasItemInfo` | BYTE | Item has valid info loaded (0-1) |
| `Level` | WORD | Item level (0-15) |
| `Serial` | char | Item serial number enabled (0-1) |

### Item Dimensions

| Field | Type | Description |
|-------|------|-------------|
| `Width` | BYTE | Inventory width (1-2) |
| `Height` | BYTE | Inventory height (1-4) |

### Item Flags

| Field | Type | Description |
|-------|------|-------------|
| `TwoHands` | BYTE | Is two-hand item (0-1) |
| `Option` | BYTE | Item option flags (0-1) |
| `QuestItem` | bool | Is a quest item (0-1) |
| `SetAttribute` | BYTE | Set item attribute/ID (0-255) |

### Combat Stats

| Field | Type | Description |
|-------|------|-------------|
| `DamageMin` | WORD | Minimum physical damage (0-65535) |
| `DamageMax` | WORD | Maximum physical damage (0-65535) |
| `AttackRate` | WORD | Attack success rating bonus (0-65535) |
| `DefenseRate` | WORD | Defense/block success rating bonus (0-65535) |
| `Defense` | WORD | Defense value (0-65535) |
| `CombatPower` | int | Combat power rating |
| `MagicPower` | int | Magic power rating |

### Speed

| Field | Type | Description |
|-------|------|-------------|
| `AttackSpeed` | BYTE | Attack speed bonus (0-255) |
| `WalkSpeed` | BYTE | Walk speed bonus (0-255) |

### Durability

| Field | Type | Description |
|-------|------|-------------|
| `Durability` | BYTE | Maximum durability (0-255) |
| `MagicDurability` | BYTE | Maximum magic durability for wizardry items (0-255) |

### Requirements

| Field | Type | Description |
|-------|------|-------------|
| `ReqLevel` | WORD | Required character level (0-15) |
| `ReqStrength` | WORD | Required strength stat (0-65535) |
| `ReqAgility` | WORD | Required dexterity stat (0-65535) |
| `ReqEnergy` | WORD | Required energy stat (0-65535) |
| `ReqVitality` | WORD | Required vitality stat (0-65535) |
| `ReqCommand` | WORD | Required command stat (0-65535) |

### Economic Values

| Field | Type | Description |
|-------|------|-------------|
| `Value` | WORD | Base item value (0-65535) |
| `BuyMoney` | int | Purchase price from NPC |

### Item Classification

| Field | Type | Description |
|-------|------|-------------|
| `ItemKindA` | BYTE | Primary item category (0-255) |
| `ItemKindB` | BYTE | Secondary item category/subtype (0-255) |
| `ItemCategory` | int | Item category classification |
| `ItemSlot` | int | Equipment slot (0-11 for wearable items) |

### Resistance

| Field | Type | Description |
|-------|------|-------------|
| `ResistanceType` | char | Primary resistance type (0-6) |

### Skill/Mastery

| Field | Type | Description |
|-------|------|-------------|
| `SkillType` | int | Associated skill type |
| `MasteryGrade` | BYTE | Mastery system grade |
| `LegendaryGrade` | BYTE | Legendary item grade |

### Pentagram

| Field | Type | Description |
|-------|------|-------------|
| `PentagramType` | BYTE | Pentagram element type (1-2) |
| `MasteryPentagram` | bool | Pentagram mastery enabled |
| `ElementalDamage` | int | Elemental damage value |
| `ElementalDefense` | int | Elemental defense value |

### Item Behavior Flags

| Field | Type | Description |
|-------|------|-------------|
| `Dump` | BYTE | Can be dropped/dumped (0-1) |
| `Transaction` | BYTE | Can be traded to other players (0-1) |
| `PersonalStore` | BYTE | Can be sold in personal shop (0-1) |
| `StoreWarehouse` | BYTE | Can be stored in warehouse (0-1) |
| `SellToNPC` | BYTE | Can be sold to NPC vendors (0-1) |
| `ExpensiveItem` | BYTE | Is marked as expensive item (0-1) |
| `Repair` | BYTE | Can be repaired (0-1) |
| `ItemOverlap` | BYTE | Can stack for stackable items (0-255) |
| `NonValue` | BYTE | Has no monetary value (0-1) |

### Methods

#### GetName

```lua
itemAttr:GetName()
```

**Returns:** `string` - Item name (max 96 characters)

**Usage:**
```lua
local itemAttr = Item.GetAttr(itemId)
if itemAttr ~= nil then
    local itemName = itemAttr:GetName()
    Log.Add("Item: " .. itemName)
end
```

---

#### GetRequireClass

```lua
itemAttr:GetRequireClass(iClass)
```

**Parameters:**
- `iClass` (int): Class index (0 to 15)

**Returns:** `int` - Minimum class evolution required:
- `0` = Cannot use at all
- `1` = Can use from base class (1st evolution)
- `2` = Can use from 2nd class evolution onward
- `3` = Can use from 3rd class evolution onward
- `4` = Can use from 4th class evolution onward
- `5` = Can use only at 5th class evolution
- `-1` = Invalid class index

**Usage:**
```lua
local itemAttr = Item.GetAttr(itemId)
local reqEvo = itemAttr:GetRequireClass(Enums.CharacterClassType.WIZARD)

if reqEvo == 0 then
    Log.Add("Wizard cannot use this item")
elseif reqEvo > 0 then
    Log.Add(string.format("Requires class evolution: %d", reqEvo))
end
```

---

#### GetResistance

```lua
itemAttr:GetResistance(iType)
```

**Parameters:**
- `iType` (int): Resistance type index (0 to MAX_RESISTANCE_TYPE-1)

**Returns:** `int` - Resistance value (0-255, -1 if invalid type)

**Usage:**
```lua
local itemAttr = Item.GetAttr(itemId)
local fireRes = itemAttr:GetResistance(Enums.ResistanceType.FIRE)

if fireRes > 0 then
    Log.Add(string.format("Fire resistance: %d", fireRes))
end
```

---

## CreateItemInfo Structure

**Access:** Via instantiation: `CreateItemInfo.new()`

**C++ Type:** `ITEM_CREATE_INFO`

**Description:** Structure for creating new items. Used with `Item.Create()` or `ItemCreateSend()`.

### Location

| Field | Type | Description |
|-------|------|-------------|
| `MapNumber` | WORD | Map number where item spawns |
| `X` | BYTE | X coordinate |
| `Y` | BYTE | Y coordinate |

### Item Identification

| Field | Type | Description |
|-------|------|-------------|
| `ItemId` | int | Item type/ID (use `Helpers.MakeItemId()`) |
| `ItemLevel` | BYTE | Item level (0-15) |

### Durability

| Field | Type | Description |
|-------|------|-------------|
| `Durability` | BYTE | Item durability value |

### Basic Options

| Field | Type | Description |
|-------|------|-------------|
| `Option1` | BYTE | Luck option (0 = no luck, 1 = luck) |
| `Option2` | BYTE | Skill option (0 = no skill, 1 = +skill) |
| `Option3` | BYTE | Additional option level (0-7, adds +4/+8/+12/+16/+20/+24/+28 per level) |

### Loot System

| Field | Type | Description |
|-------|------|-------------|
| `LootIndex` | int | Player index the item belongs to (-1 = anyone can pick up) |

### Advanced Options

| Field | Type | Description |
|-------|------|-------------|
| `NewOption` | BYTE | Excellent options bitmask |
| `SetOption` | BYTE | Set/Ancient option |
| `ItemOptionEx` | BYTE | Item option ex (380 option) |

### Time-Based

| Field | Type | Description |
|-------|------|-------------|
| `Duration` | time_t | Item duration timestamp |

### Pentagram System

| Field | Type | Description |
|-------|------|-------------|
| `MainAttribute` | BYTE | Main pentagram attribute |

### Inventory

| Field | Type | Description |
|-------|------|-------------|
| `TargetInvenPos` | BYTE | Target inventory position (255 = auto-find slot) |

### Pet System

| Field | Type | Description |
|-------|------|-------------|
| `PetCreate` | bool | Create as pet item |

### Methods

**Note:** All array methods use 1-based indexing (Lua standard)

#### GetSocket / SetSocket

```lua
itemInfo:GetSocket(index)
itemInfo:SetSocket(index, value)
```

**Parameters:**
- `index` (int): Socket slot (1 to MAX_SOCKET_OPTION)
- `value` (int): Socket option value (0-255)

**Returns:** `int` - Socket value (-1 if invalid index)

---

#### GetHarmonyOptionType / SetHarmonyOptionType

```lua
itemInfo:GetHarmonyOptionType(index)
itemInfo:SetHarmonyOptionType(index, value)
```

**Parameters:**
- `index` (int): Harmony option (1 to MAX_HARMONY_OPTION)
- `value` (int): Harmony type (0-255)

**Returns:** `int` - Harmony type (-1 if invalid index)

---

#### GetHarmonyOptionValue / SetHarmonyOptionValue

```lua
itemInfo:GetHarmonyOptionValue(index)
itemInfo:SetHarmonyOptionValue(index, value)
```

**Parameters:**
- `index` (int): Harmony option (1 to MAX_HARMONY_OPTION)
- `value` (int): Harmony value (-32768 to 32767)

**Returns:** `int` - Harmony value (-1 if invalid index)

---

#### GetOptSlot / SetOptSlot

```lua
itemInfo:GetOptSlot(index)
itemInfo:SetOptSlot(index, value)
```

**Parameters:**
- `index` (int): Option slot (1 to MAX_OPT_SLOT)
- `value` (int): Option value (0-255)

**Returns:** `int` - Option value (-1 if invalid index)

---

## ItemInfo Structure

**Access:** Via `ItemInfo.new()` or `oPlayer:GetInventoryItem(index)`

**C++ Type:** `stItemInfo`

**Description:** Represents an actual item instance with all its properties and options.

### Item Identification

| Field | Type | Description |
|-------|------|-------------|
| `SerialNumber` | UINT64 | Item unique serial number |
| `HasSerial` | char | Should serial be checked (0-1) |
| `Type` | short | Item type/ID |
| `Level` | short | Item level (0-15) |
| `Slot` | BYTE | Item equipment slot |

### Item Properties

| Field | Type | Description |
|-------|------|-------------|
| `TwoHands` | BYTE | Is two-hand item (0-1) |
| `AttackSpeed` | BYTE | Attack speed |
| `WalkSpeed` | BYTE | Walk speed |

### Damage

| Field | Type | Description |
|-------|------|-------------|
| `DamageMin` | WORD | Minimum damage |
| `DamageMax` | WORD | Maximum damage |

### Defense

| Field | Type | Description |
|-------|------|-------------|
| `Defense` | WORD | Defense value |
| `DefenseRate` | WORD | Defense rate (successful blocking) |

### Ratings

| Field | Type | Description |
|-------|------|-------------|
| `AttackRate` | WORD | Attack rating |
| `MagicPower` | WORD | Magic power |
| `CurseSpell` | WORD | Curse spell |
| `CombatPower` | WORD | Combat power |

### Durability

| Field | Type | Description |
|-------|------|-------------|
| `Durability` | float | Current durability |
| `DurabilitySmall` | WORD | Durability small value |
| `BaseDurability` | float | Base durability |

### Requirements

| Field | Type | Description |
|-------|------|-------------|
| `ReqLevel` | WORD | Required level |
| `ReqStrength` | WORD | Required strength |
| `ReqAgility` | WORD | Required agility |
| `ReqEnergy` | WORD | Required energy |
| `ReqVitality` | WORD | Required vitality |
| `ReqCommand` | WORD | Required leadership |

### Economic

| Field | Type | Description |
|-------|------|-------------|
| `Value` | int | Item value |
| `SellMoney` | UINT64 | Sell price |
| `BuyMoney` | UINT64 | Buy price |

### State Flags

| Field | Type | Description |
|-------|------|-------------|
| `IsItemExist` | bool | Item exists |
| `IsValidItem` | bool | Is valid item |
| `SkillChange` | bool | Skill change flag |
| `QuestItem` | bool | Is quest item |

### Basic Options

| Field | Type | Description |
|-------|------|-------------|
| `Option1` | BYTE | Luck (0-1) |
| `Option2` | BYTE | Skill (0-1) |
| `Option3` | BYTE | Additional option (0-7) |
| `NewOption` | BYTE | Excellent options (bitmask) |

### Advanced Options

| Field | Type | Description |
|-------|------|-------------|
| `SetOption` | BYTE | Set option |
| `SetAddStat` | BYTE | Set additional stat |
| `ItemOptionEx` | BYTE | Item option ex (380 option) |
| `BonusSocketOption` | BYTE | Bonus socket option |

### Pet Item

| Field | Type | Description |
|-------|------|-------------|
| `IsLoadPetItemInfo` | BOOL | Pet item info loaded |
| `PetItemLevel` | int | Pet item level |
| `PetItemExp` | UINT64 | Pet item experience |

### Additional Options

| Field | Type | Description |
|-------|------|-------------|
| `ImproveDurabilityRate` | BYTE | Improve durability rate |
| `PeriodItemOption` | BYTE | Period item option flags |
| `ElementalDefense` | WORD | Elemental defense |

### Legendary Options

| Field | Type | Description |
|-------|------|-------------|
| `LegendaryAddOptionType` | BYTE | Legendary additional option type |
| `LegendaryAddOptionValue` | WORD | Legendary additional option value |

### Methods

**Note:** 
- `GetRequireClass` and `GetResistance` use 0-based indexing
- `GetSocket`, `GetHarmonyOption`, and `GetOptSlot` use 1-based indexing

#### GetRequireClass / SetRequireClass

```lua
item:GetRequireClass(index)
item:SetRequireClass(index, value)
```

**Parameters:**
- `index` (int): Class index (0-15, 0-based)
- `value` (int): Class requirement (0-5)

**Returns:** `int` - Class requirement (-1 if invalid)

---

#### GetResistance / SetResistance

```lua
item:GetResistance(index)
item:SetResistance(index, value)
```

**Parameters:**
- `index` (int): Resistance type (0-based)
- `value` (int): Resistance value

**Returns:** `int` - Resistance value (-1 if invalid)

---

#### GetSocket / SetSocket

```lua
item:GetSocket(index)
item:SetSocket(index, value)
```

**Parameters:**
- `index` (int): Socket slot (1-based)
- `value` (int): Socket value (0-255)

**Returns:** `int` - Socket value (-1 if invalid)

---

#### GetHarmonyOptionType / SetHarmonyOptionType

```lua
item:GetHarmonyOptionType(index)
item:SetHarmonyOptionType(index, value)
```

**Parameters:**
- `index` (int): Harmony option (1-based)
- `value` (int): Harmony type (0-255)

**Returns:** `int` - Harmony type (-1 if invalid)

---

#### GetHarmonyOptionValue / SetHarmonyOptionValue

```lua
item:GetHarmonyOptionValue(index)
item:SetHarmonyOptionValue(index, value)
```

**Parameters:**
- `index` (int): Harmony option (1-based)
- `value` (int): Harmony value (0-65535)

**Returns:** `int` - Harmony value (-1 if invalid)

---

#### GetOptSlot / SetOptSlot

```lua
item:GetOptSlot(index)
item:SetOptSlot(index, value)
```

**Parameters:**
- `index` (int): Option slot (1-based)
- `value` (int): Option value (0-255)

**Returns:** `int` - Option value (-1 if invalid)

---

#### Convert

```lua
item:Convert()
```

**Description:** Recalculates item properties based on current options

**Usage:**
```lua
local item = ItemInfo.new()
item.Type = Helpers.MakeItemId(0, 0)
item.Level = 9
item.Option1 = 1
item.Option2 = 1
item:Convert()  -- Apply all options
```

---

#### Clear

```lua
item:Clear()
```

**Description:** Clears the item at the current position (removes all item data)

**Usage:**
```lua
local item = player.Inventory[12]
if item ~= nil and item.Type > 0 then
    item:Clear()  -- Remove item from inventory slot 12
end

-- Clear all items in event inventory
for i = 0, Constants.EVENT_INVENTORY_SIZE - 1 do
    local item = player.EventInventory[i]
    if item ~= nil and item.Type > 0 then
        item:Clear()
    end
end
```

---


## BagItem Structure

**Access:** Via item bag system callbacks

**C++ Type:** `BAG_SECTION_ITEM`

**Description:** Item template used in item bag files for random drop generation.

### Fields

| Field | Type | Description |
|-------|------|-------------|
| `ItemType` | BYTE | Item type (0-15) |
| `ItemIndex` | WORD | Item index (0-511) |
| `ItemMinLevel` | BYTE | Minimum item level |
| `ItemMaxLevel` | BYTE | Maximum item level |
| `Skill` | BYTE | Has skill option (0-1) |
| `Luck` | BYTE | Has luck option (0-1) |
| `Option` | BYTE | Has additional option (0-1) |
| `Anc` | BYTE | Is ancient/set item (0-1) |
| `Socket` | BYTE | Is socket item (0-1) |
| `Elemental` | BYTE | Is elemental item (0-1) |
| `ErrtelRank` | BYTE | Errtel rank enabled (0-1) |
| `MuunEvolutionItemType` | BYTE | Muun evolution item type |
| `MuunEvolutionItemIndex` | WORD | Muun evolution item index |
| `Durability` | WORD | Item durability |
| `Duration` | DWORD | Item duration |

### Methods

**Note:** All array methods use 1-based indexing

#### GetSocket / SetSocket

```lua
bagItem:GetSocket(index)
bagItem:SetSocket(index, value)
```

**Parameters:**
- `index` (int): Socket slot (1-based)
- `value` (int): Socket value

**Returns:** `int` - Socket value (-1 if invalid)

---

#### GetExc / SetExc

```lua
bagItem:GetExc(index)
bagItem:SetExc(index, value)
```

**Parameters:**
- `index` (int): Excellent option slot (1-based)
- `value` (int): Excellent option value

**Returns:** `int` - Excellent option (-1 if invalid)

---

#### GetOptSlot / SetOptSlot

```lua
bagItem:GetOptSlot(index)
bagItem:SetOptSlot(index, value)
```

**Parameters:**
- `index` (int): Option slot (1-based)
- `value` (int): Option value

**Returns:** `int` - Option value (-1 if invalid)

---

## Usage Examples

### Example 1: Get Item Attributes

```lua
local itemId = Helpers.MakeItemId(0, 0)  -- Kris
local itemAttr = Item.GetAttr(itemId)

if itemAttr ~= nil then
    local itemName = itemAttr:GetName()
    Log.Add(string.format("Item: %s", itemName))
    Log.Add(string.format("Damage: %d-%d", itemAttr.DamageMin, itemAttr.DamageMax))
    Log.Add(string.format("Required STR: %d", itemAttr.ReqStrength))
    Log.Add(string.format("Size: %dx%d", itemAttr.Width, itemAttr.Height))
end
```

### Example 2: Create Basic Item

```lua
local itemInfo = CreateItemInfo.new()
itemInfo.ItemId = Helpers.MakeItemId(14, 13)  -- Jewel of Bless
itemInfo.ItemLevel = 0
itemInfo.Durability = 1
itemInfo.LootIndex = iPlayerIndex
itemInfo.TargetInvenPos = 255  -- Auto-find slot

Item.Create(iPlayerIndex, itemInfo)
```

### Example 3: Create Excellent Item

```lua
local itemInfo = CreateItemInfo.new()
itemInfo.MapNumber = oPlayer.MapNumber
itemInfo.X = oPlayer.X
itemInfo.Y = oPlayer.Y
itemInfo.ItemId = Helpers.MakeItemId(0, 1)  -- Short Sword
itemInfo.ItemLevel = 9
itemInfo.Durability = 255
itemInfo.Option1 = 1  -- Luck
itemInfo.Option2 = 1  -- Skill
itemInfo.Option3 = 4  -- +16
itemInfo.NewOption = 0x3F  -- All 6 excellent options
itemInfo.LootIndex = iPlayerIndex
itemInfo.TargetInvenPos = 255

Item.Create(iPlayerIndex, itemInfo)
```

### Example 4: Check Inventory Item

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    local weapon = oPlayer:GetInventoryItem(Constants.EQUIPMENT_SLOT_LEFT_HAND)
    
    if weapon ~= nil and weapon.IsItemExist then
        Log.Add(string.format("Weapon: Type %d +%d", weapon.Type, weapon.Level))
        Log.Add(string.format("Damage: %d-%d", weapon.DamageMin, weapon.DamageMax))
        Log.Add(string.format("Durability: %.1f/%.1f", weapon.Durability, weapon.BaseDurability))
        
        if weapon.Option1 == 1 then
            Log.Add("Has Luck")
        end
        
        if weapon.NewOption > 0 then
            Log.Add("Has Excellent Options")
        end
    end
end
```

### Example 5: Loop Through Inventory

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    for i = 0, Constants.MAIN_INVENTORY_SIZE - 1 do
        local item = oPlayer:GetInventoryItem(i)
        
        if item ~= nil and item.IsItemExist then
            local itemAttr = Item.GetAttr(item.Type)
            if itemAttr ~= nil then
                local itemName = itemAttr:GetName()
                Log.Add(string.format("Slot %d: %s +%d", i, itemName, item.Level))
            end
        end
    end
end
```

### Example 6: Check Class Requirements

```lua
local itemAttr = Item.GetAttr(itemId)
if itemAttr ~= nil then
    local reqEvo = itemAttr:GetRequireClass(oPlayer.Class)
    local playerEvo = Player.GetEvo(oPlayer.Index)
    
    if reqEvo == 0 then
        Message.Send(0, oPlayer.Index, 0, "Your class cannot use this item")
    elseif playerEvo < reqEvo then
        Message.Send(0, oPlayer.Index, 0, string.format("Requires class evolution %d", reqEvo))
    else
        Message.Send(0, oPlayer.Index, 0, "You can use this item")
    end
end
```

### Example 7: Create Item with Socket Options

```lua
local itemInfo = CreateItemInfo.new()
itemInfo.ItemId = Helpers.MakeItemId(0, 0)
itemInfo.ItemLevel = 13
itemInfo.Durability = 255
itemInfo.LootIndex = iPlayerIndex
itemInfo.TargetInvenPos = 255

-- Set all 5 sockets
for i = 1, Constants.MAX_SOCKET_OPTION do
    itemInfo:SetSocket(i, 50)  -- Socket value 50
end

Item.Create(iPlayerIndex, itemInfo)
```

### Example 8: Create Item with Harmony Options

```lua
local itemInfo = CreateItemInfo.new()
itemInfo.ItemId = Helpers.MakeItemId(0, 0)
itemInfo.ItemLevel = 15
itemInfo.Durability = 255

-- Set harmony options
itemInfo:SetHarmonyOptionType(1, 5)  -- Harmony type 5
itemInfo:SetHarmonyOptionValue(1, 100)  -- Harmony value 100

itemInfo.LootIndex = iPlayerIndex
itemInfo.TargetInvenPos = 255

Item.Create(iPlayerIndex, itemInfo)
```

### Example 9: Modify Existing Item

```lua
local oPlayer = Player.GetObjByIndex(iPlayerIndex)
if oPlayer ~= nil then
    local item = oPlayer:GetInventoryItem(0)
    
    if item ~= nil and item.IsItemExist then
        -- Add socket option
        item:SetSocket(1, 50)
        
        -- Update item in client
        Inventory.SendUpdate(iPlayerIndex, 0)
    end
end
```

### Example 10: Check Item Resistances

```lua
local itemAttr = Item.GetAttr(itemId)
if itemAttr ~= nil then
    local fireRes = itemAttr:GetResistance(Enums.ResistanceType.FIRE)
    local iceRes = itemAttr:GetResistance(Enums.ResistanceType.ICE)
    local lightRes = itemAttr:GetResistance(Enums.ResistanceType.LIGHTNING)
    
    Log.Add(string.format("Fire: %d, Ice: %d, Light: %d", fireRes, iceRes, lightRes))
end
```

---

## Important Notes

1. **ItemAttr vs ItemInfo:**
   - `ItemAttr` = Read-only template from ItemList.txt (via `Item.GetAttr()`)
   - `ItemInfo` = Actual item instance with durability, options, etc.

2. **Array Indexing:**
   - `GetRequireClass()` and `GetResistance()` use 0-based indexing (C++ style)
   - `GetSocket()`, `GetHarmonyOption()`, `GetOptSlot()` use 1-based indexing (Lua style)

3. **Item ID Creation:**
   - Always use `Helpers.MakeItemId(ItemType, ItemIndex)`
   - Formula: `ItemId = ItemType * 512 + ItemIndex`

4. **Null Checks:**
   - Always check if item objects are not `nil` before accessing
   - Check `IsItemExist` flag for ItemInfo objects

5. **Option3 Values:**
   - 0 = +0, 1 = +4, 2 = +8, 3 = +12, 4 = +16, 5 = +20, 6 = +24, 7 = +28

6. **Excellent Options Bitmask:**
   - `0x01` = 1st option, `0x02` = 2nd option, `0x04` = 3rd option
   - `0x08` = 4th option, `0x10` = 5th option, `0x20` = 6th option
   - `0x3F` = All 6 options

---

## See Also

- [PLAYER.md](PLAYER.md) - Player object reference
- [../Functions/GLOBAL_FUNCTIONS.md](../Functions/GLOBAL_FUNCTIONS.md) - Global functions
- [../../Defines/Constants.lua](../../Defines/Constants.lua) - Item constants
- [../../Defines/Enums.lua](../../Defines/Enums.lua) - Item enumerations
- [../../Defines/Helpers.lua](../../Defines/Helpers.lua) - Helper functions
