--═══════════════════════════════════════════════════════════════
--== INTERNATIONAL GAMING CENTER NETWORK
--== www.igcn.mu
--== (C) 2010-2026 IGC-Network (R)
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--== File is a part of IGCN Group MuOnline Server files.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- GlobalFunctions.lua - Type Definitions for Global Functions
------------------------------------------------------------------
-- LuaDoc type hints for all server functions exposed to Lua.
-- These are function declarations for IDE autocomplete - not implementations.
--
-- Usage: Call functions using namespace syntax:
--   Player.GetObjByIndex(index)
--   Object.ForEachPlayer(callback)
--   Timer.Create(interval, name, callback)
--
-- For full documentation see: Reference/Functions/GLOBAL_FUNCTIONS.md
------------------------------------------------------------------

------------------------------------------------------------------
-- Server Namespace
------------------------------------------------------------------

Server = {}

---@return integer Server code identifier
function Server.GetCode() end

---@return string Server display name
function Server.GetName() end

---@return integer VIP level (-1 if not set)
function Server.GetVIPLevel() end

---@return boolean True if PvP disabled
function Server.IsNonPvP() end

---@return boolean True if +28 option enabled
function Server.Is28Option() end

---@param iPlayerClassType integer Character class type
---@return integer Stat points per level for class
function Server.GetClassPointsPerLevel(iPlayerClassType) end

------------------------------------------------------------------
-- Object Namespace
------------------------------------------------------------------

Object = {}

---@return integer Maximum total objects
function Object.GetMax() end

---@return integer Maximum monster count
function Object.GetMaxMonster() end

---@return integer Maximum user count
function Object.GetMaxUser() end

---@return integer Maximum online users
function Object.GetMaxOnlineUser() end

---@return integer Maximum queue users
function Object.GetMaxQueueUser() end

---@return integer Maximum ground items
function Object.GetMaxItem() end

---@return integer Maximum summon monsters
function Object.GetMaxSummonMonster() end

---@return integer Starting user index
function Object.GetStartUserIndex() end

---Iterate through ALL objects (players, monsters, items)
---@param callback function Callback function(oObject) - return false to break
function Object.ForEach(callback) end

---Iterate through all connected players
---@param callback function Callback function(oPlayer) - return false to break
function Object.ForEachPlayer(callback) end

---Iterate through players on specific map
---@param mapNumber integer Map number
---@param callback function Callback function(oPlayer) - return false to break
function Object.ForEachPlayerOnMap(mapNumber, callback) end

---Iterate through all alive monsters
---@param callback function Callback function(oMonster) - return false to break
function Object.ForEachMonster(callback) end

---Iterate through monsters on specific map
---@param mapNumber integer Map number
---@param callback function Callback function(oMonster) - return false to break
function Object.ForEachMonsterOnMap(mapNumber, callback) end

---Iterate through monsters of specific class
---@param monsterClass integer Monster class ID
---@param callback function Callback function(oMonster) - return false to break
function Object.ForEachMonsterByClass(monsterClass, callback) end

---Iterate through party members
---@param partyNumber integer Party number
---@param callback function Callback function(oPlayer) - return false to break
function Object.ForEachPartyMember(partyNumber, callback) end

---Iterate through guild members
---@param guildName string Guild name
---@param callback function Callback function(oPlayer) - return false to break
function Object.ForEachGuildMember(guildName, callback) end

---Iterate through nearby objects within range
---@param centerIndex integer Center object index
---@param range integer Range in map units
---@param callback function Callback function(oObject, distance) - return false to break
function Object.ForEachNearby(centerIndex, range, callback) end

---Count players on specific map with optional filter
---@param mapNumber integer Map number
---@param filter? function Optional filter function(oPlayer) -> boolean
---@return integer Number of players matching criteria
function Object.CountPlayersOnMap(mapNumber, filter) end

---Count monsters on specific map with optional filter
---@param mapNumber integer Map number
---@param filter? function Optional filter function(oMonster) -> boolean
---@return integer Number of monsters matching criteria
function Object.CountMonstersOnMap(mapNumber, filter) end

---Find player by name (optimized early exit)
---@param playerName string Player name to find
---@return object|nil Player object or nil if not found
function Object.GetObjByName(playerName) end

---Spawn a monster on the given map within a bounding box
---@param iMonIndex integer Monster class ID
---@param iMapNumber integer Map number
---@param iBeginX integer Spawn area start X
---@param iBeginY integer Spawn area start Y
---@param iEndX integer Spawn area end X
---@param iEndY integer Spawn area end Y
---@param iMonAttr integer Elemental attribute (Enums.ElementType), 0 for none
---@return integer Object index of spawned monster, or -1 on failure
function Object.AddMonster(iMonIndex, iMapNumber, iBeginX, iBeginY, iEndX, iEndY, iMonAttr) end

---Remove a monster from the world immediately
---@param aIndex integer Object index of the monster
---@return integer Result of gObjDel
function Object.DelMonster(aIndex) end

---Add an NPC to the game at specified location
---@param iNPCIndex integer NPC class ID
---@param iMapNumber integer Map number
---@param iX integer X coordinate
---@param iY integer Y coordinate
---@param iNpcType integer NPC type (Enums.NPCType)
---@return integer Object index of spawned NPC, or -1 on failure
function Object.AddNPC(iNPCIndex, iMapNumber, iX, iY, iNpcType) end

------------------------------------------------------------------
-- Player Namespace
------------------------------------------------------------------

Player = {}

---@param iPlayerIndex integer Player index
---@return boolean True if connected
function Player.IsConnected(iPlayerIndex) end

---@param iPlayerIndex integer Player index
---@return object|nil Player object (stObject) or nil
function Player.GetObjByIndex(iPlayerIndex) end

---@param szPlayerName string Player name
---@return object|nil Player object (stObject) or nil
function Player.GetObjByName(szPlayerName) end

---@param szPlayerName string Player name
---@return integer Player index (-1 if not found)
function Player.GetIndexByName(szPlayerName) end

---@param iPlayerIndex integer Player index
---@param iAmount integer Zen amount (can be negative)
---@param bResetMoney boolean Reset to 0 first
function Player.SetMoney(iPlayerIndex, iAmount, bResetMoney) end

---@param iPlayerIndex integer Player index
---@param iRuud integer Base Ruud value
---@param iObtainedRuud integer Ruud to add/subtract
---@param bIsObtainedRuud boolean Show notification
function Player.SetRuud(iPlayerIndex, iRuud, iObtainedRuud, bIsObtainedRuud) end

---@param iPlayerIndex integer Player index
function Player.Reset(iPlayerIndex) end

---@param iPlayerIndex integer Player index
---@return integer Evolution level (1-5, -1 if invalid)
function Player.GetEvo(iPlayerIndex) end

---@param iPlayerIndex integer Player index
function Player.ReCalc(iPlayerIndex) end

---Send life/shield update packet to client after modifying HP or shield values
---@param iPlayerIndex integer Player index
---@param iLife integer Life value to send
---@param flag integer Update flag (see Enums.HPManaUpdateFlag)
---@param iShield integer Shield value to send
function Player.SendLife(iPlayerIndex, iLife, flag, iShield) end

---Send mana/AG update packet to client after modifying mana or AG values
---@param iPlayerIndex integer Player index
---@param iMana integer Mana value to send
---@param flag integer Update flag (see Enums.HPManaUpdateFlag)
---@param iBP integer AG/stamina value to send
function Player.SendMana(iPlayerIndex, iMana, flag, iBP) end


---Save character to database
---@param iPlayerIndex integer Player index
function Player.SaveCharacter(iPlayerIndex) end

---Send experience packet to client (REQUIRED after modifying oPlayer.Experience)
---@param iPlayerIndex integer Player receiving exp
---@param iTargetIndex integer Source of exp (-1 for non-combat)
---@param i64Exp integer Experience amount
---@param iAttackDamage integer Damage dealt (0 for custom exp)
---@param bMSBFlag boolean Master Skill Book flag
---@param iMonsterType integer Monster type ID (0 for custom exp)
function Player.SetExp(iPlayerIndex, iTargetIndex, i64Exp, iAttackDamage, bMSBFlag, iMonsterType) end

---Send trade OK button packet to client
---@param iPlayerIndex integer Player index
---@param btFlag integer Button flag: 0=no consent (no border), 1=consent (green border), 2=item removed from trade
function Player.SendTradeOkButton(iPlayerIndex, btFlag) end

---Send trade cancel/result packet to client
---@param iPlayerIndex integer Player index
---@param btResult integer Result code: 0=canceled, 2=inventory full, 3=request canceled, 4=reinforced item, 5=request canceled, 6=pentagram limit exceeded, 7=255+ Errtels equipped
function Player.SendTradeCancel(iPlayerIndex, btResult) end

---Send trade response packet to client
---@param bResponse boolean Response (true=accept, false=decline)
---@param iPlayerIndex integer Player index
---@param szName string Trade partner name
---@param iLevel integer Trade partner level (Level + MasterLevel)
---@param iGuildNumber integer Trade partner guild number
function Player.SendTradeResponse(bResponse, iPlayerIndex, szName, iLevel, iGuildNumber) end

---Process trade OK button click
---@param iPlayerIndex integer Player index
function Player.TradeOkButton(iPlayerIndex) end

---Cancel trade for player
---@param iPlayerIndex integer Player index
function Player.TradeCancel(iPlayerIndex) end

------------------------------------------------------------------
-- Combat Namespace
------------------------------------------------------------------

Combat = {}

---@param aTargetMonsterIndex integer Monster index
---@return integer Player index with most damage
function Combat.GetTopDamageDealer(aTargetMonsterIndex) end

------------------------------------------------------------------
-- Stats Namespace
------------------------------------------------------------------

Stats = {}

---@param iPlayerIndex integer Player index
---@param iStatType integer Stat type (0=STR, 1=DEX, 2=VIT, 3=ENE, 4=CMD)
---@param iStatValue integer Stat value to add
---@param iStatAddType integer Add type (0=base, 1=additional)
---@param iLevelUpPoint integer Level up points to use
function Stats.Set(iPlayerIndex, iStatType, iStatValue, iStatAddType, iLevelUpPoint) end

---@param iPlayerIndex integer Player index
---@param iStatType integer Stat type
---@param iStatValue integer New stat value
---@param iLevelUpPoint integer Remaining level up points
function Stats.SendUpdate(iPlayerIndex, iStatType, iStatValue, iLevelUpPoint) end

---@param oPlayer object Player object (stObject)
---@param i64AddExp integer Experience points to add
---@param iMonsterType integer Monster type (0 if not from monster)
---@param szEventType string Event type name
---@return boolean True if level up occurred
function Stats.LevelUp(oPlayer, i64AddExp, iMonsterType, szEventType) end

------------------------------------------------------------------
-- Inventory Namespace
------------------------------------------------------------------

Inventory = {}

---@param iPlayerIndex integer Player index
---@param iInventoryPos integer Inventory slot
function Inventory.SendUpdate(iPlayerIndex, iInventoryPos) end

---@param iPlayerIndex integer Player index
---@param iInventoryPos integer Inventory slot
function Inventory.SendDelete(iPlayerIndex, iInventoryPos) end

---@param iPlayerIndex integer Player index
function Inventory.SendList(iPlayerIndex) end

---@param oPlayer object Player object (stObject)
---@param iItemHeight integer Item height
---@param iItemWidth integer Item width
---@return boolean True if has space
function Inventory.HasSpace(oPlayer, iItemHeight, iItemWidth) end

---@param iPlayerIndex integer Player index
---@param oItem object Item object (ItemInfo)
function Inventory.Insert(iPlayerIndex, oItem) end

---@param iPlayerIndex integer Player index
---@param oItem object Item object (ItemInfo)
---@param btInventoryPos integer Inventory position
---@return integer Result code
function Inventory.InsertAt(iPlayerIndex, oItem, btInventoryPos) end

---@param iPlayerIndex integer Player index
---@param iInventoryItemPos integer Inventory slot
function Inventory.Delete(iPlayerIndex, iInventoryItemPos) end

---@param iPlayerIndex integer Player index
---@param iInventoryItemStartPos integer Starting position
---@param btItemType integer Item type (0xFF to clear)
function Inventory.SetSlot(iPlayerIndex, iInventoryItemStartPos, btItemType) end

---@param oPlayer object Player object (stObject)
---@param iInventoryItemPos integer Inventory slot
---@param iDurabilityMinus integer Durability to subtract
---@return integer Remaining durability
function Inventory.ReduceDur(oPlayer, iInventoryItemPos, iDurabilityMinus) end

---@return boolean Space check result
function Inventory.RectCheck() end

------------------------------------------------------------------
-- Item Namespace
------------------------------------------------------------------

Item = {}

---@param iItemId integer Item ID
---@return integer 1 if valid, 0 otherwise
function Item.IsValid(iItemId) end

---@param iItemId integer Item ID
---@return integer KindA category
function Item.GetKindA(iItemId) end

---@param iItemId integer Item ID
---@return integer KindB subcategory
function Item.GetKindB(iItemId) end

---@param iItemId integer Item ID
---@return object Item attributes struct (ItemAttr)
function Item.GetAttr(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if socket item
function Item.IsSocket(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if excellent socket accessory
function Item.IsExcSocketAccessory(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if elemental item
function Item.IsElemental(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if pentagram
function Item.IsPentagram(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if master pentagram item
function Item.IsMasterPentagram(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if pentagram jewel
function Item.IsPentagramJewel(iItemId) end

---@param iItemId integer Item ID
---@return boolean True if master pentagram jewel
function Item.IsMasterPentagramJewel(iItemId) end

---@param iItemId integer Item ID
---@return integer Set option index
function Item.GetSetOption(iItemId) end

---@param iMinLevel integer Minimum level
---@param iMaxLevel integer Maximum level
---@return integer Random item level
function Item.GetRandomLevel(iMinLevel, iMaxLevel) end

---@param iPlayerIndex integer Player index
---@param stItemCreate object CreateItemInfo struct Item creation info
function Item.Create(iPlayerIndex, stItemCreate) end

---@param iPlayerIndex integer Player index
---@param bGremoryCase integer Gremory case flag
---@param bDropMasterySet boolean Drop mastery set
function Item.MakeRandomSet(iPlayerIndex, bGremoryCase, bDropMasterySet) end

------------------------------------------------------------------
-- Monster Namespace
------------------------------------------------------------------

Monster = {}

---Returns monster attribute table for given class
---@param iClass integer Monster class ID
---@return MonsterAttr|nil Monster attribute object, or nil if not found
function Monster.GetAttr(iClass) end

------------------------------------------------------------------
-- ItemBag Namespace
------------------------------------------------------------------

ItemBag = {}

---@param iBagType integer Bag type (0=DROP, 1=INVENTORY, 2=MONSTER, 3=EVENT)
---@param iParam1 integer Parameter 1 (depends on type)
---@param iParam2 integer Parameter 2 (depends on type)
---@param strFileName string Bag file name
function ItemBag.Add(iBagType, iParam1, iParam2, strFileName) end

---@param iPlayerIndex integer Player index
---@param stBagItem object Bag item struct (BagItem)
function ItemBag.CreateItem(iPlayerIndex, stBagItem) end

------------------------------------------------------------------
-- Buff Namespace
------------------------------------------------------------------

Buff = {}

---@param oPlayer object Player object (stObject)
---@param iBuffIndex integer Buff index
---@param EffectType1 integer Effect type 1
---@param EffectValue1 integer Effect value 1
---@param EffectType2 integer Effect type 2
---@param EffectValue2 integer Effect value 2
---@param iBuffDuration integer Duration in seconds
---@param BuffSendValue integer Send value
---@param nAttackerIndex integer Attacker index
function Buff.Add(oPlayer, iBuffIndex, EffectType1, EffectValue1, EffectType2, EffectValue2, iBuffDuration, BuffSendValue, nAttackerIndex) end

---@param oPlayer object Player object (stObject)
---@param wItemID integer Item ID
---@param iBuffDuration integer Duration in seconds
function Buff.AddCashShop(oPlayer, wItemID, iBuffDuration) end

---@param oPlayer object Player object (stObject)
---@param iBuffIndex integer Buff index
function Buff.AddItem(oPlayer, iBuffIndex) end

---@param oPlayer object Player object (stObject)
---@param iBuffIndex integer Buff index
function Buff.Remove(oPlayer, iBuffIndex) end

---@param oPlayer object Player object (stObject)
---@param iBuffIndex integer Buff index
---@return boolean True if buff is active
function Buff.CheckUsed(oPlayer, iBuffIndex) end

------------------------------------------------------------------
-- Skill Namespace
------------------------------------------------------------------

Skill = {}

---@param oPlayer object Player object (stObject)
---@param oTarget Player Target object
---@param TargetXPos integer Target X position
---@param TargetYPos integer Target Y position
---@param iPlayerDirection integer Player direction
---@param iMagicNumber integer Magic/skill number
function Skill.UseDuration(oPlayer, oTarget, TargetXPos, TargetYPos, iPlayerDirection, iMagicNumber) end

---@param oPlayer object Player object (stObject)
---@param oTarget Player Target object
---@param iMagicNumber integer Magic/skill number
function Skill.UseNormal(oPlayer, oTarget, iMagicNumber) end

------------------------------------------------------------------
-- Viewport Namespace
------------------------------------------------------------------

Viewport = {}

---@param oPlayer object Player object (stObject)
function Viewport.Create(oPlayer) end

---@param oPlayer object Player object (stObject)
function Viewport.Destroy(oPlayer) end

------------------------------------------------------------------
-- Move Namespace
------------------------------------------------------------------

Move = {}

---@param iPlayerIndex integer Player index
---@param iGateIndex integer Gate index
---@return boolean True if successful
function Move.Gate(iPlayerIndex, iGateIndex) end

---@param iTargetObjectIndex integer Target index
---@param iMapNumber integer Map number
---@param PosX integer X coordinate
---@param PosY integer Y coordinate
function Move.ToMap(iTargetObjectIndex, iMapNumber, PosX, PosY) end

---@param iTargetObjectIndex integer Target index
---@param PosX integer X coordinate
---@param PosY integer Y coordinate
function Move.Warp(iTargetObjectIndex, PosX, PosY) end

------------------------------------------------------------------
-- Party Namespace
------------------------------------------------------------------

Party = {}

---@param iPartyNumber integer Party number
---@return integer Member count
function Party.GetCount(iPartyNumber) end

---@param iPartyNumber integer Party number
---@param iArrayIndex integer Array index (1=leader, 2-5=members)
---@return integer Player index
function Party.GetMember(iPartyNumber, iArrayIndex) end

------------------------------------------------------------------
-- DB Namespace
------------------------------------------------------------------

DB = {}

---@param iPlayerIndex integer Player index
---@param iQueryNumber integer Query identifier
---@param szQuery string SQL query string
function DB.QueryDS(iPlayerIndex, iQueryNumber, szQuery) end

---@param iPlayerIndex integer Player index
---@param iQueryNumber integer Query identifier
---@param szQuery string SQL query string
function DB.QueryJS(iPlayerIndex, iQueryNumber, szQuery) end

------------------------------------------------------------------
-- Message Namespace
------------------------------------------------------------------

Message = {}

---@param iPlayerIndex integer Player index (0 for system)
---@param aTargetIndex integer Target index (-1 for all players)
---@param btType integer Message type (0=gold center, 1=blue left, 2=green guild, 3=red left)
---@param szMessage string Message text
function Message.Send(iPlayerIndex, aTargetIndex, btType, szMessage) end

------------------------------------------------------------------
-- Timer Namespace
------------------------------------------------------------------

Timer = {}

---@return integer Tick count (milliseconds since boot)

---Create one-shot timer (fires once)
---@param interval integer Delay in milliseconds
---@param name string Unique timer name (REQUIRED)
---@param callback function Function to execute
---@param aliveTime? integer Optional auto-remove after this many ms (-1 = no limit)
---@return integer Timer ID (-1 on error)
function Timer.Create(interval, name, callback, aliveTime) end

---Create repeating timer (fires at regular intervals)
---@param interval integer Interval in milliseconds
---@param name string Unique timer name (REQUIRED)
---@param callback function Function to execute
---@param aliveTime? integer Optional auto-remove after this many ms (-1 = no limit)
---@return integer Timer ID (-1 on error)
function Timer.CreateRepeating(interval, name, callback, aliveTime) end

---Create timer that fires N times then auto-removes
---@param interval integer Interval in milliseconds
---@param name string Unique timer name (REQUIRED)
---@param count integer Number of times to fire (must be > 0)
---@param callback function Function receiving (currentCount, maxCount)
---@return integer Timer ID (-1 on error)
function Timer.RepeatNTimes(interval, name, count, callback) end

---Remove timer by ID
---@param timerId integer Timer ID
---@return boolean True if successful
function Timer.Remove(timerId) end

---Remove timer by name
---@param name string Timer name
---@return boolean True if successful
function Timer.RemoveByName(name) end

---Check if timer exists by ID
---@param timerId integer Timer ID
---@return boolean True if exists
function Timer.Exists(timerId) end

---Check if timer exists by name
---@param name string Timer name
---@return boolean True if exists
function Timer.ExistsByName(name) end

---Start or restart a stopped timer
---@param timerId integer Timer ID
---@return boolean True if successful
function Timer.Start(timerId) end

---Stop a running timer (can be restarted)
---@param timerId integer Timer ID
---@return boolean True if successful
function Timer.Stop(timerId) end

---Check if timer is currently running
---@param timerId integer Timer ID
---@return boolean True if running
function Timer.IsActive(timerId) end

---Get remaining time until next fire
---@param timerId integer Timer ID
---@return integer Milliseconds remaining (-1 if invalid)
function Timer.GetRemaining(timerId) end

function Timer.GetTick() end

------------------------------------------------------------------
-- ActionTick Namespace
------------------------------------------------------------------

ActionTick = {}

---@param iPlayerIndex integer Player index
---@param iTimerIndex integer Timer index (0-2)
---@return integer Tick count value
function ActionTick.Get(iPlayerIndex, iTimerIndex) end

---@param iPlayerIndex integer Player index
---@param iTimerIndex integer Timer index (0-2)
---@param tickValue integer Tick value to set
---@param timerName string|nil Optional timer name
---@return boolean True if successful
function ActionTick.Set(iPlayerIndex, iTimerIndex, tickValue, timerName) end

---@param iPlayerIndex integer Player index
---@param iTimerIndex integer Timer index (0-2)
---@return string Timer name
function ActionTick.GetName(iPlayerIndex, iTimerIndex) end

---@param iPlayerIndex integer Player index
---@param iTimerIndex integer Timer index (0-2)
---@return boolean True if successful
function ActionTick.Clear(iPlayerIndex, iTimerIndex) end

------------------------------------------------------------------
-- Scheduler Namespace
------------------------------------------------------------------

Scheduler = {}

---@param szXmlEventFileName string XML event file name
---@return boolean True if successful
function Scheduler.LoadFromXML(szXmlEventFileName) end

---@return integer Number of loaded events
function Scheduler.GetEventCount() end

---@param currentTick integer Current tick count
function Scheduler.CheckEventNotices(currentTick) end

---@param currentTick integer Current tick count
function Scheduler.CheckEventStarts(currentTick) end

---@param currentTick integer Current tick count
function Scheduler.CheckEventEnds(currentTick) end

---@param iEventId integer Event ID
---@return string Event name
function Scheduler.GetEventName(iEventId) end

---@return boolean True if any events use second precision
function Scheduler.HasSecondPrecisionEvents() end

------------------------------------------------------------------

---Check if event is currently running
---@param eventType integer Event type ID
---@return boolean True if event is active
function Scheduler.IsEventActive(eventType) end

---Get elapsed time since event started (in seconds)
---@param eventType integer Event type ID
---@return integer Elapsed time in seconds (-1 if not active)
function Scheduler.GetElapsedTime(eventType) end

---Get remaining time until event ends (in seconds)
---@param eventType integer Event type ID
---@return integer Remaining time in seconds (-1 if not active or no duration)
function Scheduler.GetRemainingTime(eventType) end

---Get event progress as percentage (0-100)
---@param eventType integer Event type ID
---@return integer Progress percentage (-1 if not active or no duration)
function Scheduler.GetProgress(eventType) end

-- Utility Namespace
------------------------------------------------------------------

Utility = {}

---@param iValue integer Maximum value (inclusive)
---@return integer Random value 0 to iValue
function Utility.GetRandomRangedInt(min, max) end

---@return integer Large random number
function Utility.GetLargeRand() end

---@param iPlayerIndex integer Player index
function Utility.FireCracker(iPlayerIndex) end

---Send visual timer to player
---@param playerIndex integer Player index
---@param milliseconds integer Timer duration in milliseconds
---@param countUp integer 0 = count down, 1 = count up
---@param displayType integer Text type (0=none, 1=time limit, 2=remaining, 3=hunting, 5=survival)
---@param deleteTimer integer 0 = show timer, 1 = remove timer
function Utility.SendEventTimer(playerIndex, milliseconds, countUp, displayType, deleteTimer) end

------------------------------------------------------------------
-- ItemBag Namespace
------------------------------------------------------------------

ItemBag = {}

---Use item bag to give items to player
---@param playerIndex integer Player index
---@param bagType integer Bag type (use Enums.ItemBagType)
---@param param1 integer Depends on bag type
---@param param2 integer Depends on bag type
function ItemBag.Use(playerIndex, bagType, param1, param2) end

------------------------------------------------------------------
-- Log Namespace
------------------------------------------------------------------

Log = {}

---@param szLog string Log message
function Log.Add(szLog) end

---@param dwLogColor integer Log color (DWORD)
---@param szLog string Log message
function Log.AddC(dwLogColor, szLog) end

------------------------------------------------------------------
-- Helpers Namespace
------------------------------------------------------------------

Helpers = {}

---@param r integer Red component (0-255)
---@param g integer Green component (0-255)
---@param b integer Blue component (0-255)
---@return integer DWORD color value (Windows COLORREF)
function Helpers.RGB(r, g, b) end

---@param ItemType integer Item type/group (0-15)
---@param ItemIndex integer Item index within group (0-511)
---@return integer ItemId
function Helpers.MakeItemId(ItemType, ItemIndex) end

---@param ItemId integer Item ID
---@return integer ItemType (0-15)
function Helpers.GetItemType(ItemId) end

---@param ItemId integer Item ID
---@return integer ItemIndex (0-511)
function Helpers.GetItemIndex(ItemId) end
------------------------------------------------------------------
-- Language Namespace
------------------------------------------------------------------

Language = {}

---Get localized text from language files
---@param iLangID integer Language code (oPlayer.LangCode)
---@param iTextType integer Text type (Enums.eLANGUAGE_TEXT_TYPE)
---@param iTextID integer Text ID in language file
---@return string Localized text or empty string if not found
function Language.GetText(iLangID, iTextType, iTextID) end

------------------------------------------------------------------
-- EventMonsterTracker Namespace
------------------------------------------------------------------

EventMonsterTracker = {}

---Register object to event tracking
---@param iEventType integer Event type ID
---@param iObjectIndex integer Object index
---@param iObjectClass integer Monster/NPC class ID
---@param iObjectType integer Object type (Enums.ObjectType: 2=MONSTER, 3=NPC)
function EventMonsterTracker.Register(iEventType, iObjectIndex, iObjectClass, iObjectType) end

---Unregister object from event tracking
---@param iEventType integer Event type ID
---@param iObjectIndex integer Object index
---@return boolean True if unregistered, false if not found
function EventMonsterTracker.Unregister(iEventType, iObjectIndex) end

---Check if object is tracked for event
---@param iEventType integer Event type ID
---@param iObjectIndex integer Object index
---@return boolean True if tracked
function EventMonsterTracker.IsTracked(iEventType, iObjectIndex) end

---Get stored object info
---@param iEventType integer Event type ID
---@param iObjectIndex integer Object index
---@return TrackedObjectData Object data (class=-1, type=-1 if not found)
function EventMonsterTracker.GetObjectInfo(iEventType, iObjectIndex) end

---Get stored object class
---@param iEventType integer Event type ID
---@param iObjectIndex integer Object index
---@return integer Monster/NPC class ID or -1 if not found
function EventMonsterTracker.GetMonsterClass(iEventType, iObjectIndex) end

---Get all tracked object indices for event
---@param iEventType integer Event type ID
---@param iFilterType? integer Optional filter: -1=all (default), 2=MONSTER, 3=NPC
---@return table Array of object indices
function EventMonsterTracker.GetMonsters(iEventType, iFilterType) end

---Get count of tracked objects
---@param iEventType integer Event type ID
---@param iFilterType? integer Optional filter: -1=all (default), 2=MONSTER, 3=NPC
---@return integer Number of tracked objects
function EventMonsterTracker.GetCount(iEventType, iFilterType) end

---Cleanup objects for event (delete and untrack)
---@param iEventType integer Event type ID
---@param iFilterType? integer Optional filter: -1=all (default), 2=MONSTER, 3=NPC
---@return integer Number of objects removed
function EventMonsterTracker.CleanupEvent(iEventType, iFilterType) end

---Cleanup only monsters for event
---@param iEventType integer Event type ID
---@return integer Number of monsters removed
function EventMonsterTracker.CleanupMonsters(iEventType) end

---Cleanup only NPCs for event
---@param iEventType integer Event type ID
---@return integer Number of NPCs removed
function EventMonsterTracker.CleanupNPCs(iEventType) end

---Cleanup dead objects from tracking (without deleting them)
---@param iEventType integer Event type ID
---@param iFilterType? integer Optional filter: -1=all (default), 2=MONSTER, 3=NPC
---@return integer Number of objects removed from tracking
function EventMonsterTracker.CleanupDead(iEventType, iFilterType) end

---Get active event types
---@return table Array of event type IDs
function EventMonsterTracker.GetActiveEvents() end

---Clear all tracking data
---@return integer Number of events cleared
function EventMonsterTracker.ClearAll() end

---Spawn single monster and register to tracking
---@param iEventType integer Event type ID
---@param iMonsterClass integer Monster class ID
---@param iMapNumber integer Map number
---@param iX1 integer Spawn area start X
---@param iY1 integer Spawn area start Y
---@param iX2 integer Spawn area end X
---@param iY2 integer Spawn area end Y
---@param iElement integer Elemental attribute (0=none)
---@return integer Monster object index or -1 if failed
function EventMonsterTracker.SpawnAndRegister(iEventType, iMonsterClass, iMapNumber, iX1, iY1, iX2, iY2, iElement) end

---Spawn wave of monsters and register all to tracking
---@param iEventType integer Event type ID
---@param iMonsterClass integer Monster class ID
---@param iCount integer Number of monsters to spawn
---@param iMapNumber integer Map number
---@param iX1 integer Spawn area start X
---@param iY1 integer Spawn area start Y
---@param iX2 integer Spawn area end X
---@param iY2 integer Spawn area end Y
---@param iElement integer Elemental attribute (0=none)
---@return table Array of spawned monster indices
function EventMonsterTracker.SpawnWaveAndRegister(iEventType, iMonsterClass, iCount, iMapNumber, iX1, iY1, iX2, iY2, iElement) end

---Register existing NPC to tracking
---@param iEventType integer Event type ID
---@param iNpcIndex integer NPC object index
---@param iNpcClass integer NPC class ID
function EventMonsterTracker.RegisterNPC(iEventType, iNpcIndex, iNpcClass) end

