--[[
--[[
Quest_Reward_Ep5.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-14 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep5(iObjIndex)

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
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 1)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestRewardExp(Ep5, 8, 10000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 10)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 11, 60, 50, PartyPlay)--Bloody Wolf
	ItemType = 13 ItemIndex = 51 ItemLevel = 1 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +1

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 13)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 14, EVENT_MAP_CLEAR_ILLUSION, 1)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 14, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 16)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestRewardExp(Ep5, 23, 20000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 25)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 26, 57, 70, PartyPlay)--Iron Wheel
	ItemType = 13 ItemIndex = 51 ItemLevel = 2 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +2

	
	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 28)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 29, EVENT_MAP_CLEAR_ILLUSION, 2)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 32)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 33, 73, 90, PartyPlay)--Drakan
	ItemType = 13 ItemIndex = 51 ItemLevel = 3 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +3

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 35)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 36, EVENT_MAP_CLEAR_ILLUSION, 3)
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 38)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 39, 63, 30, PartyPlay)--Death Beam Knight
	ItemType = 13 ItemIndex = 51 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +4

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 41)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 42, EVENT_MAP_CLEAR_ILLUSION, 4)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 42, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 42, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 44)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 45, 75, 130, PartyPlay)--GiantDrakan
	ItemType = 13 ItemIndex = 51 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 45, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +5

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 47)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 48, EVENT_MAP_CLEAR_ILLUSION, 5)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 48, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 48, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 50)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep5, 51, 446, 150, PartyPlay)--Shadow Rook
	ItemType = 13 ItemIndex = 51 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 51, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blood Scroll +6

	LuaQuestClass.SetQuestProgress(ASK1, Ep5, 53)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep5, 54, EVENT_MAP_CLEAR_ILLUSION, 6)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep5, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life   

end


	
	