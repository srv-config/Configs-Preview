-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2016 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- ItemBag Control Script, Lua v5.2
-- Can be modified to adjust ItemBags behaviour for own needs

-- Any Custom chances to the script are out of support scope
-- It is fully reloadable without need to shut down server

-- ItemID formula: Group * 512 + Index

-- Define Bag Types
	BAG_COMMON = 0 -- Mostly Boxes and other items which dropped on ground throws item
	BAG_MONSTER = 1 -- Basically all Monsters, apart of those which have their dedicated drop system
	BAG_EVENT = 2 -- Hard-coded, no new items can be added to this section

-- BAG_EVENT::EventID
	EVENTBAG_ARCA = 0
	EVENTBAG_NEWPVP = 1
	EVENTBAG_ITLOW = 2 -- Illusion Temple Classic (Season 6 Episode 3 only)
	EVENTBAG_ITMED = 3 -- Illusion Temple Classic (Season 6 Episode 3 only)
	EVENTBAG_ITHIGH = 4 -- Illusion Temple Classic (Season 6 Episode 3 only)
	EVENTBAG_IT = 5
	EVENTBAG_BC1 = 6
	EVENTBAG_BC2 = 7
	EVENTBAG_BC3 = 8
	EVENTBAG_BC4 = 9
	EVENTBAG_BC5 = 10
	EVENTBAG_BC6 = 11
	EVENTBAG_BC7 = 12
	EVENTBAG_BC8 = 13
	EVENTBAG_CC1 = 14
	EVENTBAG_LMS = 15
	EVENTBAG_SANTAFIRST = 16
	EVENTBAG_SANTASECOND = 17
	EVENTBAG_SANTATHIRD = 18
	EVENTBAG_WARRIORRING_1 = 19
	EVENTBAG_WARRIORRING_2 = 20
	EVENTBAG_CHERRYBLOSSOM_GOLD = 21
	EVENTBAG_LUCKYCOIN10 = 22
	EVENTBAG_LUCKYCOIN20 = 23
	EVENTBAG_LUCKYCOIN30 = 24
	EVENTBAG_LORDMIX = 25
	EVENTBAG_KUNDUN = 26
	EVENTBAG_CHERRYBLOSSOM_WHITE = 46
	EVENTBAG_CHERRYBLOSSOM_RED = 47
	EVENTBAG_CC2 = 48
	EVENTBAG_CC3 = 49
	EVENTBAG_CC4 = 50
	EVENTBAG_CC5 = 51
	EVENTBAG_CC6 = 52
	EVENTBAG_CC7 = 53


-- Calculate ItemID Mask
function MakeItemID(ItemType, ItemIndex)
	return ItemType * 512 + ItemIndex;
end

function LoadItemBag() -- Bags Load

-- ====================================================================
-- ItemBags -- BagType, MakeItemID(Type,Index), ItemLevel, 'FileName'
-- ====================================================================

	ItemBag.Add(BAG_COMMON, MakeItemID(12,32), 0, 'Item_(12,32,0)_Red_Ribbon_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(12,33), 0, 'Item_(12,33,0)_Green_Ribbon_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(12,34), 0, 'Item_(12,34,0)_Blue_Ribbon_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 0, 'Item_(14,11,0)_Luck_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 1, 'Item_(14,11,1)_Sacred_Birth_Star') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 2, 'Item_(14,11,2)_Firecracker') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 3, 'Item_(14,11,3)_Love_Heart') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 5, 'Item_(14,11,5)_Silver_Medal') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 6, 'Item_(14,11,6)_Gold_Medal') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 7, 'Item_(14,11,7)_Heaven_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 8, 'Item_(14,11,8)_Kundun_Box+1') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 9, 'Item_(14,11,9)_Kundun_Box+2') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 10,'Item_(14,11,10)_Kundun_Box+3') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 11,'Item_(14,11,11)_Kundun_Box+4') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,11), 12,'Item_(14,11,12)_Kundun_Box+5') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,32), 0, 'Item_(14,32,0)_Pink_Chocolate_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,32), 1, 'Item_(14,32,1)_Light_Purple_Candy_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,33), 0, 'Item_(14,33,0)_Red_Chocolate_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,33), 1, 'Item_(14,33,1)_Orange_Candy_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,34), 0, 'Item_(14,34,0)_Blue_Chocolate_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,34), 1, 'Item_(14,34,1)_Dark_Blue_Candy_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,45), 0, 'Item_(14,45,0)_Pumpkin_of_Luck') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,52), 0, 'Item_(14,52,0)_GM_Gift_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,55), 0, 'Item_(14,55,0)_Green_Chaos_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,56), 0, 'Item_(14,56,0)_Red_Chaos_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,57), 0, 'Item_(14,57,0)_Purple_Chaos_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,84), 0, 'Item_(14,84,0)_Cherry_Blossom_Play_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,123),0, 'Item_(14,123,0)_Golden_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,124),0, 'Item_(14,124,0)_Silver_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,157),0, 'Item_(14,157,0)_Green_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,158),0, 'Item_(14,158,0)_Red_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,159),0, 'Item_(14,159,0)_Purple_Box') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,141),0, 'Item_(14,141,0)_Shining_Jewelry_Case') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,142),0, 'Item_(14,142,0)_Elegant_Jewelry_Case') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,143),0, 'Item_(14,143,0)_Steel_Jewelry_Case') -- DropFunction /1/
	ItemBag.Add(BAG_COMMON, MakeItemID(14,144),0, 'Item_(14,144,0)_Old_Jewelry_Case') -- DropFunction /1/

-- ====================================================================
-- MonsterBags -- BagType, 0, MonsterID, 'FileName'
-- ====================================================================
	ItemBag.Add(BAG_MONSTER, 0, 44, 'Monster_(44)_Dragon_Red') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 55, 'Monster_(55)_Death_King') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 295,'Monster_(295)_Erohim') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 340,'Monster_(340)_Dark_Elf') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 349,'Monster_(349)_Balgass') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 361,'Monster_(361)_Nightmare') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 362,'Monster_(362)_Mayas_Left_Hand') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 363,'Monster_(363)_Mayas_Right_Hand') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 365,'Monster_(365)_Pouch_of_Blessing') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 413,'Monster_(413)_Lunar_Rabbit') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 414,'Monster_(414)_Helper_Ellen') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0, 459,'Monster_(459)_Selupan') -- DropFunction /2/
	ItemBag.Add(BAG_MONSTER, 0,561,'Monster_(561)_Medusa') -- DropFunction /2/ used when OverriteDefaultSettings from IGC_MonsterGroupRegen.xml is set to 0

-- ====================================================================
-- EventBags -- BagType, EventID, 0, 'FileName'
-- ====================================================================
	ItemBag.Add(BAG_EVENT, 1, 0, 'Buff_Gladiators_Drop') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 2, 0, 'Event_IllusionTemple_(1-2)_Monsters') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 3, 0, 'Event_IllusionTemple_(3-4)_Monsters') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 4, 0, 'Event_IllusionTemple_(5-6)_Monsters') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 5, 0, 'Event_IllusionTemple_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 6, 0, 'Event_BloodCastle(1)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 7, 0, 'Event_BloodCastle(2)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 8, 0, 'Event_BloodCastle(3)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 9, 0, 'Event_BloodCastle(4)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 10,0, 'Event_BloodCastle(5)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 11,0, 'Event_BloodCastle(6)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 12,0, 'Event_BloodCastle(7)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 13,0, 'Event_BloodCastle(8)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 14,0, 'Event_ChaosCastle(1)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 15,0, 'Event_LastManStanding_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 16,0, 'NPC_SantaClause(1)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 17,0, 'NPC_SantaClause(2)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 18,0, 'NPC_SantaClause(3)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 19,0, 'Item_WarriorRing(40)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 20,0, 'Item_WarriorRing(80)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 21,0, 'Mix_Cherry_Blossom_Gold_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 22,0, 'Mix_LuckyCoin(10)_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 23,0, 'Mix_LuckyCoin(20)_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 24,0, 'Mix_LuckyCoin(30)_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 25,0, 'Mix_Senior_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 26,0, 'Monster_(275)_Kundun') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 46,0, 'Mix_Cherry_Blossom_White_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 47,0, 'Mix_Cherry_Blossom_Red_Reward') -- DropFunction /4/
	ItemBag.Add(BAG_EVENT, 48,0, 'Event_ChaosCastle(2)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 49,0, 'Event_ChaosCastle(3)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 50,0, 'Event_ChaosCastle(4)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 51,0, 'Event_ChaosCastle(5)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 52,0, 'Event_ChaosCastle(6)_Reward') -- DropFunction /3/
	ItemBag.Add(BAG_EVENT, 53,0, 'Event_ChaosCastle(7)_Reward') -- DropFunction /3/
	
-- Bags for purpose of Monster Group Regen System
	ItemBag.Add(BAG_EVENT, 150,0, 'Event_Monster_(561)_Medusa') -- DropFunction /3/ used when OverriteDefaultSettings from IGC_MonsterGroupRegen.xml is set to 1
	ItemBag.Add(BAG_EVENT, 151,0, 'Event_Monster_(560)_Sapi_Queen') -- DropFunction /3/ used when OverriteDefaultSettings from IGC_MonsterGroupRegen.xml is set to 1
end

function MakeExcOptForLordMix()
	local OptionLoop = Utility.GetRandomRangedInt(2, 4)
	local ExcOpt = 0

	while OptionLoop > 0 do
		local RandOp = Utility.GetRandomRangedInt(0, 5)
		local Option = bit32.lshift(1, RandOp)
		
		if bit32.band(ExcOpt, Option) ~= Option then
			ExcOpt = bit32.bor(ExcOpt, Option)
			OptionLoop = OptionLoop - 1
		end
	end

	return ExcOpt
end

-- ### /1/ Drop Item (using Item Bag Structure) ### --
function CommonBagItemDrop(aIndex, MapNumber, X, Y, BagItem)
	local ItemID = MakeItemID(BagItem.ItemType, BagItem.ItemIndex)
	local ItemCheck = Item.IsValid(ItemID);

	if ItemCheck == false then
		Log.Add(string.format('Wrong Item In Bag (ItemID: %d)', ItemID))
		return 0
	end

	local ItemResult = BagItemResult.new()
	ItemResult.MapNumber = MapNumber
	ItemResult.X = X
	ItemResult.Y = Y
	ItemResult.ItemNum = ItemID
	ItemResult.ItemLevel = Utility.GetRandomRangedInt(BagItem.ItemMinLevel, BagItem.ItemMaxLevel)
	ItemResult.ItemDurability = BagItem.Durability
	ItemResult.LootIndex = aIndex
	ItemResult.Duration = BagItem.Duration

	if (BagItem.Skill == 1) then -- Skill Always
		ItemResult.Option1 = 1
	elseif (BagItem.Skill == -1) then -- Random, 50% chance for Skill
		ItemResult.Option1 = Utility.GetRandomRangedInt(0, 1)
	else -- No Skill (protection against unsupported values)
		ItemResult.Option1 = 0
	end
	
	if (BagItem.Luck == 1) then -- Luck Always
		ItemResult.Option2 = 1
	elseif (BagItem.Luck == -1) then -- Random, 50% chance for Luck
		ItemResult.Option2 = Utility.GetRandomRangedInt(0, 1)
	else -- no Luck (protection against unsupported values)
		ItemResult.Option2 = 0
	end

	if (BagItem.Option == -1) then -- Random Option
		if (Utility.GetRandomRangedInt(0, 2) >= 1) then -- 66% chance to get option, if greater than or equal 1 then
			if (Server.Is28Option() == 0) then
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- +0 up to +16
			else
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 7) -- +0 up to +28
			end
		end
	elseif (BagItem.Option > 0 and BagItem.Option <= 7) then -- options +4 (1) to +28 (7)
		ItemResult.Option3 = BagItem.Option
	else -- no option
		ItemResult.Option3 = 0
	end

	if (BagItem.Exc > 0) then -- sets item with options of configured exc mask
		ItemResult.ExcOption = BagItem.Exc
	elseif (BagItem.Exc == -1) then -- random exc option(s)
		ItemResult.ExcOption = Item.GetExcellentOption()
	end

	if (BagItem.Anc == 1) then -- Says item must be ancient (have to be configured as possible ancient)
		ItemResult.SetOption = Item.GetSetOption(ItemID)
	end

	-- Item must be of Type 2 in item list settings
	if (Item.IsSocket(ItemID) == true) then
		if (BagItem.Socket > 0 and BagItem.Socket <= 5) then -- if slots value is supported (0-5)
			ItemResult.SocketCount = Utility.GetRandomRangedInt(1, BagItem.Socket) -- set up to configured value of sockets
		end
	else
		ItemResult.SocketCount = 0 -- no socket, applies for items of no item type 2 only
	end

	-- Protection against specified items which should not come with extra options
	if ItemID == MakeItemID(12,15) -- Jewel of Chaos
	or ItemID == MakeItemID(14,13) -- Jewel of Bless
	or ItemID == MakeItemID(14,14) -- Jewel of Soul
	or ItemID == MakeItemID(14,16) -- Jewel of Life
	or ItemID == MakeItemID(14,22) -- Jewel of Creation
	then
		ItemResult.ItemLevel = 0
		ItemResult.Option1 = 0
		ItemResult.Option2 = 0
		ItemResult.Option3 = 0
		ItemResult.ExcOption = 0
		ItemResult.SetOption = 0
		ItemResult.SocketCount = 0
	end

	-- New draw of option if server is configured to support option up to +16 only
	if (Server.Is28Option() == 0 and ItemResult.Option3 > 4) then
		ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- option draw 0-4
	end

	-- Protection against socket items configured with no sockets
	if (Item.IsSocket(ItemID) == true and ItemResult.SocketCount == 0) then
		ItemResult.SocketCount = 1 -- set to one socket only
	end
	
	ItemBag.CreateItem(aIndex, ItemResult)
	return 1
end


-- ### /2/ Drop Item (using Monster Bag Structure) ### --
function MonsterBagItemDrop(MonsterIndex, MapNumber, MonsterX, MonsterY, PlayerIndex, BagItem)
	local ItemID = MakeItemID(BagItem.ItemType, BagItem.ItemIndex)
	local ItemCheck = Item.IsValid(ItemID);

	if ItemCheck == false then
		Log.Add(string.format('Wrong Item In Bag (ItemID: %d)', ItemID))
		return 0
	end

	local ItemResult = BagItemResult.new()
	ItemResult.MapNumber = MapNumber
	ItemResult.X = MonsterX
	ItemResult.Y = MonsterY
	ItemResult.ItemNum = ItemID
	ItemResult.ItemLevel = Utility.GetRandomRangedInt(BagItem.ItemMinLevel, BagItem.ItemMaxLevel)
	ItemResult.ItemDurability = BagItem.Durability
	ItemResult.LootIndex = PlayerIndex
	ItemResult.Duration = BagItem.Duration

	if (BagItem.Skill == 1) then -- Skill Always
		ItemResult.Option1 = 1
	elseif (BagItem.Skill == -1) then -- Random, 50% chance for Skill
		ItemResult.Option1 = Utility.GetRandomRangedInt(0, 1)
	else -- No Skill (protection against unsupported values)
		ItemResult.Option1 = 0
	end
	
	if (BagItem.Luck == 1) then -- Luck Always
		ItemResult.Option2 = 1
	elseif (BagItem.Luck == -1) then -- Random, 50% chance for Luck
		ItemResult.Option2 = Utility.GetRandomRangedInt(0, 1)
	else -- no Luck (protection against unsupported values)
		ItemResult.Option2 = 0
	end

	if (BagItem.Option == -1) then -- Random Option
		if (Utility.GetRandomRangedInt(0, 2) >= 1) then -- 66% chance to get option, if greater than or equal 1 then
			if (Server.Is28Option() == 0) then
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- +0 up to +16
			else
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 7) -- +0 up to +28
			end
		end
	elseif (BagItem.Option > 0 and BagItem.Option <= 7) then -- options +4 (1) to +28 (7)
		ItemResult.Option3 = BagItem.Option
	else -- no option
		ItemResult.Option3 = 0
	end

	if (BagItem.Exc > 0) then -- sets item with options of configured exc mask
		ItemResult.ExcOption = BagItem.Exc
	elseif (BagItem.Exc == -1) then -- random exc option(s)
		ItemResult.ExcOption = Item.GetExcellentOption()
	end

	if (BagItem.Anc == 1) then -- Says item must be ancient (have to be configured as possible ancient)
		ItemResult.SetOption = Item.GetSetOption(ItemID)
	end

	-- Item must be of Type 2 in item list settings
	if (Item.IsSocket(ItemID) == true) then
		if (BagItem.Socket > 0 and BagItem.Socket <= 5) then -- if slots value is supported (0-5)
			ItemResult.SocketCount = Utility.GetRandomRangedInt(1, BagItem.Socket) -- set up to configured value of sockets
		end
	else
		ItemResult.SocketCount = 0 -- no socket, applies for items of no item type 2 only
	end

	-- Protection against specified items which should not come with extra options
	if ItemID == MakeItemID(12,15) -- Jewel of Chaos
	or ItemID == MakeItemID(14,13) -- Jewel of Bless
	or ItemID == MakeItemID(14,14) -- Jewel of Soul
	or ItemID == MakeItemID(14,16) -- Jewel of Life
	or ItemID == MakeItemID(14,22) -- Jewel of Creation
	then
		ItemResult.ItemLevel = 0
		ItemResult.Option1 = 0
		ItemResult.Option2 = 0
		ItemResult.Option3 = 0
		ItemResult.ExcOption = 0
		ItemResult.SetOption = 0
		ItemResult.SocketCount = 0
	end

	-- New draw of option if server is configured to support option up to +16 only
	if (Server.Is28Option() == 0 and ItemResult.Option3 > 4) then
		ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- option draw 0-4
	end

	-- Protection against socket items configured with no sockets
	if (Item.IsSocket(ItemID) == true and ItemResult.SocketCount == 0) then
		ItemResult.SocketCount = 1 -- set to one socket only
	end
	
	ItemBag.CreateItem(MonsterIndex, ItemResult)
	return 1
end

-- ### /3/ Create Item (using Event Bag Structure) - Item Drop on Ground ### --
function EventBagItemDrop(MonsterIndex, MapNumber, MonsterX, MonsterY, PlayerIndex, BagItem)
	local ItemID = MakeItemID(BagItem.ItemType, BagItem.ItemIndex)
	local ItemCheck = Item.IsValid(ItemID);

	if ItemCheck == false then
		Log.Add(string.format('Wrong Item In Bag (ItemID: %d)', ItemID))
		return 0
	end

	local ItemResult = BagItemResult.new()
	ItemResult.MapNumber = MapNumber
	ItemResult.X = MonsterX
	ItemResult.Y = MonsterY
	ItemResult.ItemNum = ItemID
	ItemResult.ItemLevel = Utility.GetRandomRangedInt(BagItem.ItemMinLevel, BagItem.ItemMaxLevel)
	ItemResult.ItemDurability = BagItem.Durability
	ItemResult.LootIndex = PlayerIndex
	ItemResult.Duration = BagItem.Duration

	if (BagItem.Skill == 1) then -- Skill Always
		ItemResult.Option1 = 1
	elseif (BagItem.Skill == -1) then -- Random, 50% chance for Skill
		ItemResult.Option1 = Utility.GetRandomRangedInt(0, 1)
	else -- No Skill (protection against unsupported values)
		ItemResult.Option1 = 0
	end
	
	if (BagItem.Luck == 1) then -- Luck Always
		ItemResult.Option2 = 1
	elseif (BagItem.Luck == -1) then -- Random, 50% chance for Luck
		ItemResult.Option2 = Utility.GetRandomRangedInt(0, 1)
	else -- no Luck (protection against unsupported values)
		ItemResult.Option2 = 0
	end

	if (BagItem.Option == -1) then -- Random Option
		if (Utility.GetRandomRangedInt(0, 2) >= 1) then -- 66% chance to get option, if greater than or equal 1 then
			if (Server.Is28Option() == 0) then
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- +0 up to +16
			else
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 7) -- +0 up to +28
			end
		end
	elseif (BagItem.Option > 0 and BagItem.Option <= 7) then -- options +4 (1) to +28 (7)
		ItemResult.Option3 = BagItem.Option
	else -- no option
		ItemResult.Option3 = 0
	end

	if (BagItem.Exc > 0) then -- sets item with options of configured exc mask
		ItemResult.ExcOption = BagItem.Exc
	elseif (BagItem.Exc == -1) then -- random exc option(s)
		ItemResult.ExcOption = Item.GetExcellentOption()
	end

	if (BagItem.Anc == 1) then -- Says item must be ancient (have to be configured as possible ancient)
		ItemResult.SetOption = Item.GetSetOption(ItemID)
	end

	-- Item must be of Type 2 in item list settings
	if (Item.IsSocket(ItemID) == true) then
		if (BagItem.Socket > 0 and BagItem.Socket <= 5) then -- if slots value is supported (0-5)
			ItemResult.SocketCount = Utility.GetRandomRangedInt(1, BagItem.Socket) -- set up to configured value of sockets
		end
	else
		ItemResult.SocketCount = 0 -- no socket, applies for items of no item type 2 only
	end

	-- Protection against specified items which should not come with extra options
	if ItemID == MakeItemID(12,15) -- Jewel of Chaos
	or ItemID == MakeItemID(14,13) -- Jewel of Bless
	or ItemID == MakeItemID(14,14) -- Jewel of Soul
	or ItemID == MakeItemID(14,16) -- Jewel of Life
	or ItemID == MakeItemID(14,22) -- Jewel of Creation
	then
		ItemResult.ItemLevel = 0
		ItemResult.Option1 = 0
		ItemResult.Option2 = 0
		ItemResult.Option3 = 0
		ItemResult.ExcOption = 0
		ItemResult.SetOption = 0
		ItemResult.SocketCount = 0
	end

	-- New draw of option if server is configured to support option up to +16 only
	if (Server.Is28Option() == 0 and ItemResult.Option3 > 4) then
		ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- option draw 0-4
	end

	-- Protection against socket items configured with no sockets
	if (Item.IsSocket(ItemID) == true and ItemResult.SocketCount == 0) then
		ItemResult.SocketCount = 1 -- set to one socket only
	end
	
	ItemBag.CreateItem(MonsterIndex, ItemResult)
	return 1
end

-- ### /4/ Create Item (using Event Bag Structure) - Mix/Inventory - LuckyCoin, CherryBlossom, LordMix ### --
function EventBagMakeItem(BagItem)
	local ItemID = MakeItemID(BagItem.ItemType, BagItem.ItemIndex)
	local ItemCheck = Item.IsValid(ItemID);

	if ItemCheck == false then
		Log.Add(string.format('Wrong Item In Bag (ItemID: %d)', ItemID))
		return 0
	end

	local ItemResult = BagItemResult.new()
	ItemResult.ItemNum = ItemID
	ItemResult.ItemLevel = Utility.GetRandomRangedInt(BagItem.ItemMinLevel, BagItem.ItemMaxLevel)
	ItemResult.ItemDurability = BagItem.Durability
	ItemResult.Duration = BagItem.Duration

	if (BagItem.Skill == 1) then -- Skill Always
		ItemResult.Option1 = 1
	elseif (BagItem.Skill == -1) then -- Random, 50% chance for Skill
		ItemResult.Option1 = Utility.GetRandomRangedInt(0, 1)
	else -- No Skill (protection against unsupported values)
		ItemResult.Option1 = 0
	end
	
	if (BagItem.Luck == 1) then -- Luck Always
		ItemResult.Option2 = 1
	elseif (BagItem.Luck == -1) then -- Random, 50% chance for Luck
		ItemResult.Option2 = Utility.GetRandomRangedInt(0, 1)
	else -- no Luck (protection against unsupported values)
		ItemResult.Option2 = 0
	end

	if (BagItem.Option == -1) then -- Random Option
		if (Utility.GetRandomRangedInt(0, 2) >= 1) then -- 66% chance to get option, if greater than or equal 1 then
			if (Server.Is28Option() == 0) then
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- +0 up to +16
			else
				ItemResult.Option3 = Utility.GetRandomRangedInt(0, 7) -- +0 up to +28
			end
		end
	elseif (BagItem.Option > 0 and BagItem.Option <= 7) then -- options +4 (1) to +28 (7)
		ItemResult.Option3 = BagItem.Option
	else -- no option
		ItemResult.Option3 = 0
	end

	if (BagItem.Exc > 0) then -- sets item with options of configured exc mask
		ItemResult.ExcOption = BagItem.Exc
	elseif (BagItem.Exc == -1) then -- random exc option(s)
		ItemResult.ExcOption = Item.GetExcellentOption()
	end

	if (BagItem.Anc == 1) then -- Says item must be ancient (have to be configured as possible ancient)
		ItemResult.SetOption = Item.GetSetOption(ItemID)
	end

	-- Item must be of Type 2 in item list settings
	if (Item.IsSocket(ItemID) == true) then
		if (BagItem.Socket > 0 and BagItem.Socket <= 5) then -- if slots value is supported (0-5)
			ItemResult.SocketCount = Utility.GetRandomRangedInt(1, BagItem.Socket) -- set up to configured value of sockets
		end
	else
		ItemResult.SocketCount = 0 -- no socket, applies for items of no item type 2 only
	end

	-- Protection against specified items which should not come with extra options
	if ItemID == MakeItemID(12,15) -- Jewel of Chaos
	or ItemID == MakeItemID(14,13) -- Jewel of Bless
	or ItemID == MakeItemID(14,14) -- Jewel of Soul
	or ItemID == MakeItemID(14,16) -- Jewel of Life
	or ItemID == MakeItemID(14,22) -- Jewel of Creation
	then
		ItemResult.ItemLevel = 0
		ItemResult.Option1 = 0
		ItemResult.Option2 = 0
		ItemResult.Option3 = 0
		ItemResult.ExcOption = 0
		ItemResult.SetOption = 0
		ItemResult.SocketCount = 0
	end

	-- New draw of option if server is configured to support option up to +16 only
	if (Server.Is28Option() == 0 and ItemResult.Option3 > 4) then
		ItemResult.Option3 = Utility.GetRandomRangedInt(0, 4) -- option draw 0-4
	end

	-- Protection against socket items configured with no sockets
	if (Item.IsSocket(ItemID) == true and ItemResult.SocketCount == 0) then
		ItemResult.SocketCount = 1 -- set to one socket only
	end
	
	return ItemResult
end