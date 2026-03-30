--[[
--[[
Quest_Reward_Ep17.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-09 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep17(iObjIndex)

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
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep17, 1)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep17, 2, 52, 50)--Silver Valkyrie
	LuaQuestClass.SetQuestRewardExp(Ep17, 2, 150000)
	ItemType = 14 ItemIndex = 38 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 1 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep17, 2, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--Small SD Potion
	LuaQuestClass.SetQuestRewardContribute(Ep17, 2, 5)  

	LuaQuestClass.SetQuestProgress(ASK1, Ep17, 4)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep17, 5, 306, 50)--Death Rider
	LuaQuestClass.SetQuestRewardExp(Ep17, 5, 250000)
	ItemType = 14 ItemIndex = 38 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 1 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep17, 5, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--Small SD Potion    
	LuaQuestClass.SetQuestRewardContribute(Ep17, 5, 5)
	LuaQuestClass.SetQuestProgress(ASK1, Ep17, 7)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep17, 8, 352, 50)--Iron Rider
	LuaQuestClass.SetQuestRewardExp(Ep17, 8, 350000)
	ItemType = 14 ItemIndex = 39 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 1 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep17, 8, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--Medium SD Potion   
	LuaQuestClass.SetQuestRewardContribute(Ep17, 8, 5)
	LuaQuestClass.SetQuestProgress(ASK1, Ep17, 10)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep17, 11, 489, 50)--Burning Lava Giant
	LuaQuestClass.SetQuestRewardExp(Ep17, 11, 450000)
	ItemType = 14 ItemIndex = 40 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 1 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep17, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--Large SD Potion   
	LuaQuestClass.SetQuestRewardContribute(Ep17, 11, 5)
	LuaQuestClass.SetQuestProgress(ASK1, Ep17, 13)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep17, 14, 448, 50)--Ghost Napin
	LuaQuestClass.SetQuestRewardExp(Ep17, 14, 500000)
	ItemType = 14 ItemIndex = 40 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 1 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep17, 14, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--Large SD Potion       
	LuaQuestClass.SetQuestRewardContribute(Ep17, 14, 5)

end
	
	