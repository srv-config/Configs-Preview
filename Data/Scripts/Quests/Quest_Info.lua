-- // ============================================================
-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2016 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

QuestInclude("Quest_Define.lua")
QuestInclude("Quest_Reward_Ep1.lua")
QuestInclude("Quest_Reward_Ep2.lua")
QuestInclude("Quest_Reward_Ep3.lua")
QuestInclude("Quest_Reward_Ep4.lua")
QuestInclude("Quest_Reward_Ep5.lua")
QuestInclude("Quest_Reward_Ep6.lua")
QuestInclude("Quest_Reward_Ep7.lua")
QuestInclude("Quest_Reward_Ep8.lua")
QuestInclude("Quest_Reward_Ep9.lua")
QuestInclude("Quest_Reward_Ep10.lua")
QuestInclude("Quest_Reward_Ep11.lua")
QuestInclude("Quest_Reward_Ep12.lua")
QuestInclude("Quest_Reward_Ep15.lua")
QuestInclude("Quest_Reward_Ep16.lua")
QuestInclude("Quest_Reward_Ep17.lua")
QuestInclude("Quest_Reward_Ep18.lua")
QuestInclude("Quest_Reward_Ep19.lua")
QuestInclude("Quest_Reward_Ep20.lua")
--================================================================================================================
function SetQuestItemInfo()
--[[
EN_OVERLAP      =   0x0001-- Overlap
EN_DROP         =   0x0002-- Drop item on ground
EN_WAREHOUSE        =   0x0004-- Warehouse transfer
EN_SELL_SHOP        =   0x0008-- Shop sale
EN_PERSONAL_SHOP    =   0x0010-- Personal shop
EN_PERSONAL_TRADE   =   0x0020-- Personal trade
EN_QUEST_PROG       =   0x0040-- Use item to progress quest 
]]
	-- LuaQuestClass:SetQuestUseItemList(ItemType, ItemIndex, QuestItemAttribute, Ep)
	
	local QuestItemAtt = 0
	
	ItemType = 13 ItemIndex = 148 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Green Ink
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep9)
	
	ItemType = 13 ItemIndex = 149 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Blue Ink
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep10)
	
	ItemType = 13 ItemIndex = 150 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Red Ink
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep11)
	
	ItemType = 13 ItemIndex = 151 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Mental Parchment
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep11)
	
	ItemType = 14 ItemIndex = 151 QuestItemAtt = EN_QUEST_PROG-- 1st-level Commission
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep20)
	
	ItemType = 14 ItemIndex = 152 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- 1st-level Commission Completion Certificate
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)

	ItemType = 14 ItemIndex = 170 QuestItemAtt = EN_QUEST_PROG-- 2nd-level Commission
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt, Ep20)
	
	ItemType = 14 ItemIndex = 171 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- 2nd-level Commission Completion Certificate
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)
	
	ItemType = 14 ItemIndex = 153 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Stardust
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)
	
	ItemType = 14 ItemIndex = 154 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Calttstone
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)
	
	ItemType = 14 ItemIndex = 155 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Tantalos Armor
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)
	
	ItemType = 14 ItemIndex = 156 QuestItemAtt = EN_SELL_SHOP + EN_OVERLAP-- Ashen Slaughterer's Club
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)

	ItemType = 14 ItemIndex = 164 QuestItemAtt = EN_SELL_SHOP-- Ancient Statue
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)   

	ItemType = 14 ItemIndex = 165 QuestItemAtt = EN_SELL_SHOP-- Magical Fabric
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)   

	ItemType = 14 ItemIndex = 166 QuestItemAtt = EN_SELL_SHOP-- Spatial Fabric
	LuaQuestClass.SetQuestItemInfo(ItemType, ItemIndex, QuestItemAtt)   
end
--================================================================================================================
function SetQuestNPCTeleportPos()

	local iDir  =   0
	local iPosX =   0
	local iPosY =   0
	local iIndex    =   0
	local iMapNum   =   0
	
	iIndex = 0 iMapNum = 51 iPosX = 55 iPosY = 199 iDir = 2
	LuaQuestClass.SetQuestNPCTeleportPosInfo(iIndex, iMapNum, iPosX, iPosY, iDir)
	
	iIndex = 1 iMapNum = 0 iPosX = 131 iPosY = 138 iDir = 2
	LuaQuestClass.SetQuestNPCTeleportPosInfo(iIndex, iMapNum, iPosX, iPosY, iDir)
	
	iIndex = 2 iMapNum = 3 iPosX = 186 iPosY = 109 iDir = 2
	LuaQuestClass.SetQuestNPCTeleportPosInfo(iIndex, iMapNum, iPosX, iPosY, iDir)
	
	iIndex = 3 iMapNum = 2 iPosX = 226 iPosY = 52 iDir = 2
	LuaQuestClass.SetQuestNPCTeleportPosInfo(iIndex, iMapNum, iPosX, iPosY, iDir)
end
--================================================================================================================
function SetQuestInfo()

	--********************************************--
	--Ask_Index requirement is saved to DB using bitwise operation. (leave some room...)
	-- DB: Name,EP,QS,Ask_index-Value-Complete Ask_index-Complete .....
	--0x00 0 00000000
	--g_LuaBind:SetQuestMonsterKill(EP,QS,Ask_Index ,monsterIndex,KillCnt)
	--g_LuaBind:SetQuestMonsterKill(1, 2, 0x1, 27, 3)--Kill 3 Hook Scorpions
	
	--Is the item stackable?
	--ItemType = 14 ItemIndex = 3 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 5 Overlap = 1
	--LuaQuestClass:SetQuestRewardItem(Ep1, 67, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--15 Large Health Potions
	
	--Used as variable argument when giving Excellent option.
	--ItemType = 4 ItemIndex = 8 ItemLevel = 3 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 ExOpt = ExOpt1 + ExOpt2 + ExOpt3 + ExOpt4 + ExOpt5 + ExOpt6
	--LuaQuestClass:SetQuestRewardItem(Ep1, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, ExOpt)--Crossbow+3

	--Option additional variable argument
	--ItemType = 4 ItemIndex = 8 ItemLevel = 3 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt4 / Opt8 / Opt12 / Opt16
	--LuaQuestClass:SetQuestRewardItem(Ep1, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Option addition

	--LuaQuestClass:SetQuestRewardRandom(Ep1, QS, random reward count, RewardIndex1,Rate1 RewardIndex2,Rate2, RewardIndex3,Rate3)
	--LuaQuestClass:SetQuestRewardRandom(Ep1, 20, 2, 1, 1000, 2, 2000, 3, 3000)
	--LuaQuestClass:SetQuestRewardExp(Ep1, 20, 1)
	--LuaQuestClass:SetQuestRewardZen(Ep1, 20, 2)
	--LuaQuestClass:SetQuestRewardZen(Ep1, 20, 300)
	--LuaQuestClass:SetQuestRewardZen(Ep1, 20, 4)

	--LuaQuestClass:SetQuestEventMapClear(ASK1, Ep1, 20, QUEST_REQUEST_EVENT_MAP_CLEAR_BLOOD, BloodCastleLevel) -- Blood Castle clear
	--LuaQuestClass:SetQuestEventMapClear(ASK1, Ep1, 20, QUEST_REQUEST_EVENT_MAP_CLEAR_BLOOD, 1)

	-- Acquire points in Devil Square
	--LuaQuestClass:SetQuestEventMapDevilPoint(ASK1, Ep1, 20, event map level, points to acquire)
	--LuaQuestClass:SetQuestEventMapDevilPoint(ASK1, Ep1, 20, 1, 10)

	-- Monster kill points, user kill points, gate destruction
	--LuaQuestClass:SetQuestEventMapKillPoint(ASK1, Ep1, 20, quest type, event map level, kill count)
	--LuaQuestClass:SetQuestEventMapKillPoint(ASK1, Ep2, 10, QUEST_REQUEST_EVENT_MAP_USER_KILL, 1, 1)   
	
	-- LuaQuestClass:SetQuestMonsterKill(ASK1, Ep2, 11, 12, 40, variable argument)--larvae
	-- 0: individual, 1: party
	--LuaQuestClass:SetQuestMonsterKill(ASK1, Ep2, 11, 12, 40, 1 for party)--larvae

	--********************************************--
	SetQuestItemInfo()
	SetQuestNPCTeleportPos()

-- Ep1 reward list organization function
	Quest_Reward_Window_Ep1(iObjIndex)

-- Ep2 reward list organization function
	Quest_Reward_Window_Ep2(iObjIndex)

-- Ep3 reward list organization function
	Quest_Reward_Window_Ep3(iObjIndex)

-- Ep4 reward list organization function
	Quest_Reward_Window_Ep4(iObjIndex)

-- Ep5 reward list organization function
	Quest_Reward_Window_Ep5(iObjIndex)
	
-- Ep6 reward list organization function
	Quest_Reward_Window_Ep6(iObjIndex)

-- Ep7 reward list organization function
	Quest_Reward_Window_Ep7(iObjIndex)

-- Ep8 reward list organization function
	Quest_Reward_Window_Ep8(iObjIndex)
	
-- Ep9 reward list organization function
	Quest_Reward_Window_Ep9(iObjIndex)
	
-- Ep10 reward list organization function
	Quest_Reward_Window_Ep10(iObjIndex)
	
-- Ep11 reward list organization function
	Quest_Reward_Window_Ep11(iObjIndex)
	
-- Ep12 reward list organization function
	Quest_Reward_Window_Ep12(iObjIndex)
	
-- Ep15 reward list organization function
	Quest_Reward_Window_Ep15(iObjIndex) 

-- Ep16 reward list organization function
	Quest_Reward_Window_Ep16(iObjIndex)

-- Ep17 reward list organization function
	Quest_Reward_Window_Ep17(iObjIndex)
	
-- Ep18 reward list organization function
	Quest_Reward_Window_Ep18(iObjIndex)

-- Ep19 reward list organization function
	Quest_Reward_Window_Ep19(iObjIndex)
	
-- Ep20 reward list organization function
	Quest_Reward_Window_Ep20(iObjIndex)
	-- temp()  -- removed: function does not exist in new wrapper
end
--================================================================================================================