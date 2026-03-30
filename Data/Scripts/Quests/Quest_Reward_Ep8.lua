--[[
--[[
Quest_Reward_Ep8.lua
[ Start  ]  2011.07.18
[ Latest ]  2012-04-27 4:51 PM
[ Version ] 0.0.0.3
[ Text ]    Fix: fragment bundle not recognized due to overseas bug
[ Desc ]                                    
--]]
--================================================================================================================
function Quest_Reward_Window_Ep8(iObjIndex)

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
	local ItemType  = 0
	local ItemIndex = 0 
	local ItemLevel = 0 
	local dur       = 0 
	local ItemSkill = 0 
	local ItemCnt   = 0
	local Overlap   = 0-- Is the item stackable?
	local Opt   = 0
	local ExOpt = 0
	

LuaQuestClass.SetQuestProgress(ASK1, Ep8, 4)--Used when a completion window is needed during dialogue progress

	ItemType = 12 ItemIndex = 200 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep8, 5, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- Pentagram item check
	
	LuaQuestClass.SetQuestRewardExp(Ep8, 5, 100000)
	ItemType = 12 ItemIndex = 150 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 5, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Gem Combination Frame


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 9)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 10, 586, 20)--Devil Fairy, 20
	LuaQuestClass.SetQuestRewardExp(Ep8, 10, 100000)
	ItemType = 12 ItemIndex = 221 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 10, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Rage Ertel


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 15)--Used when a completion window is needed during dialogue progress

	ItemType = 12 ItemIndex = 148 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep8, 16, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- Mithril Fragment Bundle check
	
	LuaQuestClass.SetQuestRewardExp(Ep8, 16, 100000)
	ItemType = 12 ItemIndex = 151 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 16, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Spirit Dust


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 18)--Used when a completion window is needed during dialogue progress

	ItemType = 12 ItemIndex = 149 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep8, 19, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- Elixir fragment bundle check
	
	LuaQuestClass.SetQuestRewardExp(Ep8, 19, 100000)
	ItemType = 12 ItemIndex = 150 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Gem Combination Frame


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 25)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 26, 587, 20)-- Elemental Beast, 20
	LuaQuestClass.SetQuestRewardExp(Ep8, 26, 100000)
	ItemType = 12 ItemIndex = 231 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Protection Ertel



LuaQuestClass.SetQuestProgress(ASK1, Ep8, 28)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 29, 586, 30)-- Devil Fairy, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 29, 100000)
	ItemType = 12 ItemIndex = 144 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Mithril Fragment


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 31)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 32, 587, 30)-- Elemental Beast, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 32, 100000)
	ItemType = 12 ItemIndex = 144 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 32, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Mithril Fragment


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 34)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 35, 588, 30)-- Elemental Knight, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 35, 100000)
	ItemType = 12 ItemIndex = 146 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 35, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Elixir Fragment



LuaQuestClass.SetQuestProgress(ASK1, Ep8, 37)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 38, 589, 30)-- Ubaid Devil Fairy, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 38, 100000)
	ItemType = 12 ItemIndex = 145 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 38, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Mithril


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 40)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 41, 590, 30)-- Ubaid Elemental Beast, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 41, 100000)
	ItemType = 12 ItemIndex = 147 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 41, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Elixir


LuaQuestClass.SetQuestProgress(ASK1, Ep8, 43)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 44, 591, 30)-- Ubaid Elemental Knight, 30
	LuaQuestClass.SetQuestRewardExp(Ep8, 44, 100000)
	ItemType = 12 ItemIndex = 150 ItemLevel = 0 dur = 1 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep8, 44, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Gem Combination Frame



LuaQuestClass.SetQuestProgress(ASK1, Ep8, 46)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 47, 586, 50)-- Devil Fairy, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 47, 200000)-- EXP 200000
	LuaQuestClass.SetQuestRewardZen(Ep8, 47, 100000)-- Zen 100000


	
LuaQuestClass.SetQuestProgress(ASK1, Ep8, 49)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 50, 587, 50)-- Elemental Beast, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 50, 200000)-- EXP 200000
	LuaQuestClass.SetQuestRewardZen(Ep8, 50, 100000)-- Zen 100000

LuaQuestClass.SetQuestProgress(ASK1, Ep8, 52)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 53, 588, 50)-- Elemental Knight, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 53, 200000)-- EXP 200000
	LuaQuestClass.SetQuestRewardZen(Ep8, 53, 100000)-- Zen 100000



LuaQuestClass.SetQuestProgress(ASK1, Ep8, 55)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 56, 589, 50)-- Ubaid Devil Fairy, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 56, 300000)-- EXP 300000
	LuaQuestClass.SetQuestRewardZen(Ep8, 56, 100000)-- Zen 100000
	
LuaQuestClass.SetQuestProgress(ASK1, Ep8, 58)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 59, 590, 50)-- Ubaid Elemental Beast, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 59, 300000)-- EXP 300000
	LuaQuestClass.SetQuestRewardZen(Ep8, 59, 100000)-- Zen 100000

LuaQuestClass.SetQuestProgress(ASK1, Ep8, 61)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep8, 62, 591, 50)-- Ubaid Elemental Knight, 50
	LuaQuestClass.SetQuestRewardExp(Ep8, 62, 300000)-- EXP 300000
	LuaQuestClass.SetQuestRewardZen(Ep8, 62, 100000)-- Zen 100000
end
--================================================================================================================