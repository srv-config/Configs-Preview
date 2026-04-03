--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Structs.lua - C++ Type Definitions
------------------------------------------------------------------
-- LuaDoc type hints for C++ objects exposed to Lua.
-- These structures CANNOT be created in Lua - they are C++ objects
-- accessible only through functions like Player.GetObjByIndex().
--
-- For full documentation see: Reference/STRUCTS.md
------------------------------------------------------------------

------------------------------------------------------------------
-- userData Structure
------------------------------------------------------------------

---@class userData
---@field Strength integer Base strength stat
---@field Dexterity integer Base dexterity stat
---@field Vitality integer Base vitality stat
---@field Energy integer Base energy stat
---@field Command integer Base command stat
---@field AddStrength integer Additional strength (blue stat)
---@field AddDexterity integer Additional dexterity (blue stat)
---@field AddVitality integer Additional vitality (blue stat)
---@field AddEnergy integer Additional energy (blue stat)
---@field AddCommand integer Additional command (blue stat)
---@field LevelUpPoint integer Available level up points
---@field DBClass integer Character class ID from database
---@field MasterLevel integer Current master level
---@field MasterExp integer Current master level experience
---@field MasterNextExp integer Experience required for next master level
---@field ThirdTreePoint integer Available master points in 3rd skill tree
---@field UsedThirdTreePoint integer Used master points in 3rd skill tree
---@field FourthTreePoint integer Available master points in 4th skill tree
---@field UsedFourthTreePoint integer Used master points in 4th skill tree
---@field Money integer Zen currency
---@field Ruud integer Ruud currency
---@field Resets integer Total resets performed today
---@field VIPType integer VIP tier (-1 = none)
---@field VIPMode integer Active VIP mode

------------------------------------------------------------------
-- ActionTickCount Structure
------------------------------------------------------------------

---@class ActionTickCount
---@field name string Timer name (max 15 chars, read-only)
---@field tick integer Tick count value (read-only, use ActionTick.Set to modify)

------------------------------------------------------------------
-- TrackedObjectData Structure
------------------------------------------------------------------

---@class TrackedObjectData
---@field class integer Monster/NPC class ID
---@field type integer Object type (Enums.ObjectType: 2=MONSTER, 3=NPC)

------------------------------------------------------------------
-- Player Object (stObject)
------------------------------------------------------------------
-- Note: This structure is used for ALL objects (players, monsters, NPCs)
-- in the game, not just players. It represents the unified object structure.
--
-- IMPORTANT: Not all fields are valid for all object types:
-- - userData: Only available for players and player-like NPCs
-- - Some fields may be unused or have different meanings for monsters/NPCs
-- - Always check object Type field to determine what fields are valid
------------------------------------------------------------------

---@class Object
---@field userData userData UserData substructure (read-only pointer; only for players and player-like NPCs)
---@field Index integer Player object index in server array (read-only)
---@field Type integer Object type (read-only; Enums.ObjectType.USER | MONSTER | NPC)
---@field NPCType, BYTE (read-only; Enums.NPCType,NONE | SHOP | WAREHOUSE | CHAOS_MIX | GOLDEN_ARCHER | PENTAGRAM_MIX | MAP_MOVE | LAST_MAN_STANDING)
---@field Connected integer Connection state (1=connected, 0=disconnected)
---@field UserNumber integer Unique user session number (read-only)
---@field DBNumber integer Database character ID (memb_guid; read-only)
---@field LangCode integer Client language code
---@field Class integer Character class code
---@field Level integer Character level
---@field AccountId string Account login name (read-only)
-- @field Name string Object name of Player, Monster or NPC (read-only)
---@field Life number Current HP
---@field MaxLife number Maximum HP
---@field AddLife integer Additional HP from items/buffs
---@field Shield integer Current shield points
---@field AddShield integer Additional shield from items/buffs
---@field MaxShield integer Maximum shield
---@field Mana number Current MP
---@field MaxMana number Maximum MP
---@field AddMana integer Additional mana from items/buffs
---@field BP integer Current AG/stamina points
---@field AddBP integer Additional AG from items/buffs
---@field MaxBP integer Maximum AG
---@field PKCount integer Current PK count
---@field PKLevel integer PK level/status (0-6)
---@field PKTime integer Time remaining in PK status
---@field PKTotalCount integer Lifetime total PK count
---@field X integer Current X coordinate
---@field Y integer Current Y coordinate
---@field Dir integer Facing direction (0-7)
---@field MapNumber integer Current map ID
---@field Authority integer Authority level
---@field AuthorityCode integer Authority verification code
---@field Penalty integer Penalty flags/type
---@field GameMaster integer Game master status flag
---@field PenaltyMask integer Penalty restrictions bitmask
---@field AttackDamageMin integer Minimum attack damage (total)
---@field AttackDamageMax integer Maximum attack damage (total)
---@field AttackDamageMinLeft integer Minimum damage (left hand)
---@field AttackDamageMinRight integer Minimum damage (right hand)
---@field AttackDamageMaxLeft integer Maximum damage (left hand)
---@field AttackDamageMaxRight integer Maximum damage (right hand)
---@field MagicDamageMin integer Minimum magic damage
---@field MagicDamageMax integer Maximum magic damage
---@field CurseDamageMin integer Minimum curse damage
---@field CurseDamageMax integer Maximum curse damage
---@field CurseSpell integer Active curse spell effect
---@field CombatPower integer Total combat power rating
---@field CombatPowerAttackDamage integer Combat power from attack damage
---@field Defense integer Total defense value
---@field AttackRating integer Attack success rating
---@field DefenseRating integer Defense/block success rating
---@field AttackSpeed integer Attack speed value
---@field MagicSpeed integer Magic/skill cast speed
---@field PentagramMainAttribute integer Main pentagram attribute type
---@field PentagramAttributePattern integer Pentagram attribute pattern ID
---@field PentagramDefense integer Base pentagram defense (PvM)
---@field PentagramDefensePvP integer Pentagram defense (PvP)
---@field PentagramDefenseRating integer Pentagram defense rating (PvM)
---@field PentagramDefenseRatingPvP integer Pentagram defense rating (PvP)
---@field PentagramAttackMin integer Minimum pentagram attack (PvM)
---@field PentagramAttackMax integer Maximum pentagram attack (PvM)
---@field PentagramAttackMinPvP integer Minimum pentagram attack (PvP)
---@field PentagramAttackMaxPvP integer Maximum pentagram attack (PvP)
---@field PentagramAttackRating integer Pentagram attack rating (PvM)
---@field PentagramAttackRatingPvP integer Pentagram attack rating (PvP)
---@field PentagramDamageMin integer Minimum pentagram damage modifier
---@field PentagramDamageMax integer Maximum pentagram damage modifier
---@field PentagramDamageOrigin integer Base pentagram damage
---@field PentagramCriticalDamageRate integer Critical damage rate
---@field PentagramExcellentDamageRate integer Excellent damage rate
---@field PartyNumber integer Party ID (-1 if not in party)
---@field WinDuels integer Total duel wins
---@field LoseDuels integer Total duel losses
---@field Live integer Alive state (1=alive, 0=dead)
---@field ActionTickCount ActionTickCount[] Array of 3 timers (Lua index 1-3)
---@field TradeMoney integer Zen amount offered in trade window
---@field TradeOk integer Trade confirmation status (0=not confirmed, 1=confirmed)
-- @field TargetNumber short Target object Index (monster/player being attacked)
-- @field TargetNpcNumber short NPC object Index (NPC player is interacting with)

-- Player methods
---@param iInventoryPos integer Inventory slot (0 to INVENTORY_SIZE-1)
---@return ItemInfo|nil Item pointer if valid, nil otherwise
function Object:GetInventoryItem(iInventoryPos) end

---@param iWarehousePos integer Warehouse slot (0 to WAREHOUSE_SIZE-1)
---@return ItemInfo|nil Item pointer if valid, nil otherwise
function Object:GetWarehouseItem(iWarehousePos) end

---@param iTradeBoxPos integer Trade box slot (0 to TRADE_BOX_SIZE-1)
---@return ItemInfo|nil Item pointer if valid, nil otherwise
function Object:GetTradeItem(iTradeBoxPos) end

------------------------------------------------------------------
-- ItemAttr Structure (Read-Only)
------------------------------------------------------------------

---@class ItemAttr
---@field HasItemInfo integer Item has valid info (0-1)
---@field Level integer Item level (0-15)
---@field Serial integer Serial number enabled (0-1)
---@field Width integer Inventory width (1-2)
---@field Height integer Inventory height (1-4)
---@field TwoHands integer Two-hand item (0-1)
---@field Option integer Item option flags
---@field QuestItem boolean Quest item flag
---@field SetAttribute integer Set item attribute/ID
---@field DamageMin integer Minimum physical damage
---@field DamageMax integer Maximum physical damage
---@field AttackRate integer Attack success rating bonus
---@field DefenseRate integer Defense/block rating bonus
---@field Defense integer Defense value
---@field CombatPower integer Combat power rating
---@field MagicPower integer Magic power rating
---@field AttackSpeed integer Attack speed bonus
---@field WalkSpeed integer Walk speed bonus
---@field Durability integer Maximum durability
---@field MagicDurability integer Max magic durability
---@field ReqLevel integer Required level
---@field ReqStrength integer Required strength
---@field ReqAgility integer Required dexterity
---@field ReqEnergy integer Required energy
---@field ReqVitality integer Required vitality
---@field ReqCommand integer Required command
---@field Value integer Base item value
---@field BuyMoney integer Purchase price from NPC
---@field ItemKindA integer Primary item category
---@field ItemKindB integer Secondary item category
---@field ItemCategory integer Item category classification
---@field ItemSlot integer Equipment slot (0-11)
---@field ResistanceType integer Primary resistance type
---@field SkillType integer Associated skill type
---@field MasteryGrade integer Mastery system grade
---@field LegendaryGrade integer Legendary item grade
---@field PentagramType integer Pentagram element type
---@field MasteryPentagram boolean Pentagram mastery enabled
---@field ElementalDamage integer Elemental damage value
---@field ElementalDefense integer Elemental defense value
---@field Dump integer Can be dropped (0-1)
---@field Transaction integer Can be traded (0-1)
---@field PersonalStore integer Can be sold in shop (0-1)
---@field StoreWarehouse integer Can be warehoused (0-1)
---@field SellToNPC integer Can be sold to NPC (0-1)
---@field ExpensiveItem integer Expensive item flag (0-1)
---@field Repair integer Can be repaired (0-1)
---@field ItemOverlap integer Can stack (0-255)
---@field NonValue integer Has no value (0-1)

-- ItemAttr methods
---@return string Item name (max 96 chars)
function ItemAttr:GetName() end

---@param iClass integer Class index (0-15)
---@return integer Class evolution required (0-5, -1 if invalid)
function ItemAttr:GetRequireClass(iClass) end

---@param iType integer Resistance type index
---@return integer Resistance value (0-255, -1 if invalid)
function ItemAttr:GetResistance(iType) end

------------------------------------------------------------------
-- CreateItemInfo Structure
------------------------------------------------------------------

---@class CreateItemInfo
---@field MapNumber integer Map number where item spawns
---@field X integer X coordinate
---@field Y integer Y coordinate
---@field ItemId integer Item type/ID
---@field ItemLevel integer Item level (0-15)
---@field Durability integer Item durability
---@field Option1 integer Luck option (0-1)
---@field Option2 integer Skill option (0-1)
---@field Option3 integer Additional option (0-7)
---@field LootIndex integer Player index owner (-1 = anyone)
---@field NewOption integer Excellent options bitmask
---@field SetOption integer Set/Ancient option
---@field ItemOptionEx integer Item option ex (380)
---@field Duration integer Item duration timestamp
---@field MainAttribute integer Main pentagram attribute
---@field TargetInvenPos integer Target inventory pos (255=auto)
---@field PetCreate boolean Create as pet item

-- CreateItemInfo methods (1-based indexing)
---@param index integer Socket slot (1-based)
---@return integer Socket value (-1 if invalid)
function CreateItemInfo:GetSocket(index) end

---@param index integer Socket slot (1-based)
---@param value integer Socket value (0-255)
function CreateItemInfo:SetSocket(index, value) end

---@param index integer Harmony option index (1-based)
---@return integer Harmony type (-1 if invalid)
function CreateItemInfo:GetHarmonyOptionType(index) end

---@param index integer Harmony option index (1-based)
---@param value integer Harmony type (0-255)
function CreateItemInfo:SetHarmonyOptionType(index, value) end

---@param index integer Harmony option index (1-based)
---@return integer Harmony value (-1 if invalid)
function CreateItemInfo:GetHarmonyOptionValue(index) end

---@param index integer Harmony option index (1-based)
---@param value integer Harmony value
function CreateItemInfo:SetHarmonyOptionValue(index, value) end

---@param index integer Option slot index (1-based)
---@return integer Option value (-1 if invalid)
function CreateItemInfo:GetOptSlot(index) end

---@param index integer Option slot index (1-based)
---@param value integer Option value (0-255)
function CreateItemInfo:SetOptSlot(index, value) end

------------------------------------------------------------------
-- ItemInfo Structure
------------------------------------------------------------------

---@class ItemInfo
---@field SerialNumber integer Item unique serial
---@field HasSerial integer Serial check flag (0-1)
---@field Type integer Item type/ID
---@field Level integer Item level (0-15)
---@field Slot integer Item equipment slot
---@field TwoHands integer Two-hand item (0-1)
---@field AttackSpeed integer Attack speed
---@field WalkSpeed integer Walk speed
---@field DamageMin integer Minimum damage
---@field DamageMax integer Maximum damage
---@field Defense integer Defense value
---@field DefenseRate integer Defense rate
---@field AttackRate integer Attack rating
---@field MagicPower integer Magic power
---@field CurseSpell integer Curse spell
---@field CombatPower integer Combat power
---@field Durability number Current durability
---@field DurabilitySmall integer Durability small value
---@field BaseDurability number Base durability
---@field ReqLevel integer Required level
---@field ReqStrength integer Required strength
---@field ReqAgility integer Required agility
---@field ReqEnergy integer Required energy
---@field ReqVitality integer Required vitality
---@field ReqCommand integer Required command
---@field Value integer Item value
---@field SellMoney integer Sell price
---@field BuyMoney integer Buy price
---@field IsItemExist boolean Item exists
---@field IsValidItem boolean Is valid item
---@field SkillChange boolean Skill change flag
---@field QuestItem boolean Quest item flag
---@field Option1 integer Luck (0-1)
---@field Option2 integer Skill (0-1)
---@field Option3 integer Additional option (0-7)
---@field NewOption integer Excellent options bitmask
---@field SetOption integer Set option
---@field SetAddStat integer Set additional stat
---@field ItemOptionEx integer Item option ex (380)
---@field BonusSocketOption integer Bonus socket option
---@field IsLoadPetItemInfo boolean Pet info loaded
---@field PetItemLevel integer Pet item level
---@field PetItemExp integer Pet item experience
---@field ImproveDurabilityRate integer Improve durability rate
---@field PeriodItemOption integer Period item flags
---@field ElementalDefense integer Elemental defense
---@field LegendaryAddOptionType integer Legendary option type
---@field LegendaryAddOptionValue integer Legendary option value

-- ItemInfo methods
---@param index integer Class index (0-based)
---@return integer Class requirement (-1 if invalid)
function ItemInfo:GetRequireClass(index) end

---@param index integer Class index (0-based)
---@param value integer Class requirement (0-5)
function ItemInfo:SetRequireClass(index, value) end

---@param index integer Resistance type (0-based)
---@return integer Resistance value (-1 if invalid)
function ItemInfo:GetResistance(index) end

---@param index integer Resistance type (0-based)
---@param value integer Resistance value
function ItemInfo:SetResistance(index, value) end

---@param index integer Socket slot (1-based)
---@return integer Socket value (-1 if invalid)
function ItemInfo:GetSocket(index) end

---@param index integer Socket slot (1-based)
---@param value integer Socket value (0-255)
function ItemInfo:SetSocket(index, value) end

---@param index integer Harmony option (1-based)
---@return integer Harmony type (-1 if invalid)
function ItemInfo:GetHarmonyOptionType(index) end

---@param index integer Harmony option (1-based)
---@param value integer Harmony type (0-255)
function ItemInfo:SetHarmonyOptionType(index, value) end

---@param index integer Harmony option (1-based)
---@return integer Harmony value (-1 if invalid)
function ItemInfo:GetHarmonyOptionValue(index) end

---@param index integer Harmony option (1-based)
---@param value integer Harmony value (0-65535)
function ItemInfo:SetHarmonyOptionValue(index, value) end

---@param index integer Option slot (1-based)
---@return integer Option value (-1 if invalid)
function ItemInfo:GetOptSlot(index) end

---@param index integer Option slot (1-based)
---@param value integer Option value (0-255)
function ItemInfo:SetOptSlot(index, value) end

-- Recalculate item properties
function ItemInfo:Convert() end

-- Clear item at position
function ItemInfo:Clear() end

------------------------------------------------------------------
-- BagItem Structure
------------------------------------------------------------------

---@class BagItem
---@field ItemType BYTE Item type (0-21)
---@field ItemIndex WORD Item index (0-511)
---@field ItemMinLevel BYTE Minimum item level (0-15)
---@field ItemMaxLevel BYTE Maximum item level (0-15)
---@field Skill short Has skill (-1, 0, 1) 
---@field Luck short Has luck (-1, 0, 1) 
---@field Option short Has additional option (-1, 0, 1-7)
---@field Anc short Is ancient/set (0-1)
---@field Socket short Is socket item (-2, 0-5)
---@field Elemental short Is elemental (-1, 0-5)
---@field ErrtelRank short Errtel rank (1-5)
---@field MuunEvolutionItemType BYTE Muun evolution type
---@field MuunEvolutionItemIndex WORD Muun evolution index
---@field Durability WORD Item durability
---@field Duration DWORD Item duration

-- BagItem methods (1-based indexing)
---@param index integer Socket slot (1-based)
---@return integer Socket value (-1 if invalid)
function BagItem:GetSocket(index) end

---@param index integer Socket slot (1-based)
---@param value integer Socket value
function BagItem:SetSocket(index, value) end

---@param index integer Excellent option slot (1-based)
---@return integer Excellent option (-1 if invalid)
function BagItem:GetExc(index) end

---@param index integer Excellent option slot (1-based)
---@param value integer Excellent option value
function BagItem:SetExc(index, value) end

---@param index integer Option slot (1-based)
---@return integer Option value (-1 if invalid)
function BagItem:GetOptSlot(index) end

---@param index integer Option slot (1-based)
---@param value integer Option value
function BagItem:SetOptSlot(index, value) end

------------------------------------------------------------------
-- QueryResultDS Structure (Read-Only)
------------------------------------------------------------------

---@class QueryResultDS
---@field ColumnType integer Column data type (0-255)

-- QueryResultDS methods
---@return string Column name (max 30 chars)
function QueryResultDS:GetColumnName() end

---@return string Column value (max 64 chars)
function QueryResultDS:GetValue() end

------------------------------------------------------------------
-- QueryResultJS Structure (Read-Only)
------------------------------------------------------------------

---@class QueryResultJS
---@field ColumnType integer Column data type (0-255)

-- QueryResultJS methods
---@return string Column name (max 30 chars)
function QueryResultJS:GetColumnName() end

---@return string Column value (max 64 chars)
function QueryResultJS:GetValue() end

------------------------------------------------------------------
-- stLuaRow (Alias for QueryResultJS)
------------------------------------------------------------------

---@alias stLuaRow QueryResultJS

------------------------------------------------------------------
-- MonsterAttr Structure
------------------------------------------------------------------

---@class MonsterAttr
---@field Index integer Monster class index (readonly)
---@field Level integer Monster level
---@field ScriptHP integer Script-defined HP override
---@field HP integer Maximum HP
---@field MP integer Maximum MP
---@field DamageMin integer Minimum attack damage
---@field DamageMax integer Maximum attack damage
---@field Defense integer Defense rating
---@field MagicDefense integer Magic defense rating
---@field AttackRating integer Attack success rating
---@field DefenseRating integer Defense success rate
---@field MoveRange integer Movement range (tiles)
---@field AttackRange integer Attack range (tiles)
---@field AttackType integer Attack type (readonly)
---@field ViewRange integer View/detection range (tiles)
---@field MoveSpeed integer Movement speed
---@field AttackSpeed integer Attack speed
---@field RegenTime integer Respawn time (ms)
---@field Attribute integer Monster attribute flags (readonly)
---@field PentagramMainAttribute integer Pentagram main attribute
---@field PentagramAttributePattern integer Pentagram attribute pattern
---@field PentagramDefense integer Pentagram defense
---@field PentagramAttackMin integer Pentagram minimum attack
---@field PentagramAttackMax integer Pentagram maximum attack
---@field PentagramAttackRate integer Pentagram attack rating
---@field PentagramDefenseRate integer Pentagram defense rating
---@field MonsterExpLevel integer Monster exp level modifier
---@field CriticalDamageResistance integer Critical damage resistance
---@field ExcellentDamageResistance integer Excellent damage resistance
---@field DebuffApplyResistance integer Debuff apply resistance
---@field DamageAbsorb integer Damage absorption
---@field IsEliteMonster boolean Is an elite monster
---@field IsRadiancePunishImmune boolean Immune to radiance punishment
---@field ExtraDefense integer Extra defense
---@field ExtraDamageMin integer Extra minimum damage
---@field ExtraDamageMax integer Extra maximum damage
---@field DamageCorrection integer Damage correction factor
---@field IsTrap boolean Is a trap object (readonly)

---Returns monster name
---@return string
function MonsterAttr:GetName() end

---Returns resistance value for given type
---@param iType integer Resistance type index (0 to MAX_RESISTENCE_TYPE-1)
---@return integer Resistance value, or -1 if out of range
function MonsterAttr:GetResistance(iType) end

