--[[
--[[
Quest_Reward_Window_Ep2.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-09 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep2(iObjIndex)

	--local LuaQuestClass = QuestExpLuaBind()


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

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 1)--Used when a completion window is needed during dialogue progress
	

	ItemType = 13 ItemIndex = 29 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 8, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guard Armor Set

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 10)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 11, 12, 40)--larvae
	LuaQuestClass.SetQuestRewardRandom(Ep2, 11, 2, 1, 2000, 2, 2000, 3, 4000)
	ItemType = 14 ItemIndex = 2 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Medium Health Potions
	ItemType = 14 ItemIndex = 5 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Medium Mana Potions
	ItemType = 14 ItemIndex = 35 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 4
	LuaQuestClass.SetQuestRewardItem(Ep2, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--4 SD Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 13)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 14, EVENT_MAP_MON_KILL, 1, 1)
	LuaQuestClass.SetQuestRewardZen(Ep2, 14, 100000)
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 16)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 17, EVENT_MAP_CLEAR_CHAOS, 1)
	LuaQuestClass.SetQuestRewardZen(Ep2, 17, 200000)
	LuaQuestClass.SetQuestRewardExp(Ep2, 17, 100000)

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 19)--Used when a completion window is needed during dialogue progress
	

	ItemType = 13 ItemIndex = 29 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guard Armor Set

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 28)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 29, 13, 60)--Hell Spider
	LuaQuestClass.SetQuestRewardRandom(Ep2, 29, 2, 1, 2000, 2, 2000, 3, 4000)
	ItemType = 14 ItemIndex = 3 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 5 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--15 Large Health Potions
	ItemType = 14 ItemIndex = 6 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 5 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--15 Large Mana Potions
	ItemType = 14 ItemIndex = 35 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 8
	LuaQuestClass.SetQuestRewardItem(Ep2, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--8 SD Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 31)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 32, EVENT_MAP_MON_KILL, 2, 3)
	LuaQuestClass.SetQuestRewardZen(Ep2, 32, 200000)
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 34)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 35, EVENT_MAP_CLEAR_CHAOS, 2)
	LuaQuestClass.SetQuestRewardZen(Ep2, 35, 300000)
	LuaQuestClass.SetQuestRewardExp(Ep2, 35, 400000)
	
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 38)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 39, 10, 80)--Dark Knight
	LuaQuestClass.SetQuestRewardRandom(Ep2, 39, 2, 1, 2000, 2, 2000, 3, 4000)
	ItemType = 14 ItemIndex = 3 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Large Health Potions
	ItemType = 14 ItemIndex = 6 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Large Mana Potions
	ItemType = 14 ItemIndex = 38 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 5 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--15 Small Complex Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 41)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 42, EVENT_MAP_MON_KILL, 3, 5)
	LuaQuestClass.SetQuestRewardZen(Ep2, 42, 500000)
	LuaQuestClass.SetQuestRewardExp(Ep2, 42, 800000)
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 44)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 45, EVENT_MAP_CLEAR_CHAOS, 3)
	LuaQuestClass.SetQuestRewardExp(Ep2, 45, 1000000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 45, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 47)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 48, 37, 100)--Devil
	LuaQuestClass.SetQuestRewardRandom(Ep2, 48, 1, 1, 4000, 2, 4000)
	ItemType = 14 ItemIndex = 36 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 15
	LuaQuestClass.SetQuestRewardItem(Ep2, 48, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--15 SD Potions
	ItemType = 14 ItemIndex = 39 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 5 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 48, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--15 Small Complex Potions


	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 50)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 51, EVENT_MAP_USER_KILL, 4, 1)
	LuaQuestClass.SetQuestRewardZen(Ep2, 51, 300000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 51, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 53)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 54, EVENT_MAP_CLEAR_CHAOS, 4)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Soul Stone

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 56)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 57, 70, 100, PartyPlay)--Queen Rainer
	LuaQuestClass.SetQuestRewardRandom(Ep2, 57, 1, 1, 4000, 2, 4000)
	ItemType = 14 ItemIndex = 37 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 10
	LuaQuestClass.SetQuestRewardItem(Ep2, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--10 Large SD Potions
	ItemType = 14 ItemIndex = 39 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Medium Complex Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 59)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 60, EVENT_MAP_USER_KILL, 5, 3)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 60, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Soul Stone
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 62)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 63, EVENT_MAP_CLEAR_CHAOS, 5)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 63, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone 

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 65)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 66, 59, 30, PartyPlay)--Zaikan
	LuaQuestClass.SetQuestRewardRandom(Ep2, 66, 1, 1, 4000, 2, 4000)
	ItemType = 14 ItemIndex = 37 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 20
	LuaQuestClass.SetQuestRewardItem(Ep2, 66, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--20 Large SD Potions
	ItemType = 14 ItemIndex = 40 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 10 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 66, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--30 Large Complex Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 68)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 69, EVENT_MAP_USER_KILL, 6, 5)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 69, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 71)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 72, EVENT_MAP_CLEAR_CHAOS, 6)
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 72, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Life Stone
	
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 74)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep2, 75, 444, 100, PartyPlay)--Shadow Pawn
	LuaQuestClass.SetQuestRewardRandom(Ep2, 75, 1, 1, 4000, 2, 4000)
	ItemType = 14 ItemIndex = 37 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 30
	LuaQuestClass.SetQuestRewardItem(Ep2, 75, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--30 Large SD Potions
	ItemType = 14 ItemIndex = 40 ItemLevel = 0 dur = 3 ItemSkill = 0 ItemCnt = 15 Overlap = 1
	LuaQuestClass.SetQuestRewardItem(Ep2, 75, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap)--45 Large Complex Potions

	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 77)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapKillPoint(ASK1, Ep2, 78, EVENT_MAP_USER_KILL, 7, 10)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep2, 78, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Soul Stone
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep2, 80)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestEventMapClear(ASK1, Ep2, 81, EVENT_MAP_CLEAR_CHAOS, 7)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep2, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone 




	
end


	
	