--[[
--[[
Quest_Reward_Ep11.lua
[ Start  ]  2011.07.18
[ Latest ]  2011-09-28 4:02 PM
[ Version ] 0.0.0.2
[ Text ]    Fix: requirements being displayed when declining
[ Line ]    47 - 57
--]]
--================================================================================================================
function Quest_Reward_Window_Ep11(iObjIndex)

	--local LuaQuestClass = QuestExpLuaBind()

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

	--********************************************--
	local ItemType = 0
	local ItemIndex = 0 
	local ItemLevel = 0 
	local dur = 0 
	local ItemSkill = 0 
	local ItemCnt = 0
	local Overlap = 0-- Is the item stackable?
	local Opt   = 0
	local ExOpt = 0
	
---------------------------------------------------------------------------------------------------------------------

LuaQuestClass.SetQuestProgress(ASK1, Ep11, 2)

	ItemType = 13 ItemIndex = 150 ItemLevel = 0 ItemCnt = 1-- Red Ink
	LuaQuestClass.SetQuestDropItem(Ep11, 1, ASK1, 549, 100, ItemType, ItemIndex, ItemLevel, ItemCnt)-- Bloody Orc
	
	ItemType = 13 ItemIndex = 150 ItemLevel = 0 ItemSkill = 0 ItemCnt = 10 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep11, 1, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- 10 Red Ink
	
	LuaQuestClass.SetQuestRewardZen(Ep11, 1, 1000000)

LuaQuestClass.SetQuestProgress(ASK1, Ep11, 5)   
	
	ItemType = 13 ItemIndex = 151 ItemLevel = 0 ItemCnt = 1-- Mental Parchment
	LuaQuestClass.SetQuestDropItem(Ep11, 4, ASK1, 562, 100, ItemType, ItemIndex, ItemLevel, ItemCnt)-- Dark Mammoth
	
	ItemType = 13 ItemIndex = 151 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep11, 4, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- Mental Parchment
	
	ItemType = 13 ItemIndex = 158 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep11, 4, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Sealed Red Scroll of Oblivion
end
--================================================================================================================  
	