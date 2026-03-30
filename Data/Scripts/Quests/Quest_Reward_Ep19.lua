--[[
--[[
Quest_Reward_Ep19.lua
[ Start  ]  2009.08.
[ Latest ]  2010-02-17 11:15 AM
[ Version ] 0.0.0.2
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep19(iObjIndex)

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
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 1)--Used when a completion window is needed during dialogue progress
	ItemType = 14 ItemIndex = 28 ItemLevel = 3 ItemSkill = 0 ItemCnt = 3 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 2, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Get a map
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 4)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 5, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 5, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 5, 70000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 5, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 4 ItemIndex = 16 ItemLevel = 4 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 5, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Saint Cross Crossbow


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 6, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 6, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 6, 80000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 6, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 2 ItemIndex = 10 ItemLevel = 4 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 6, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Great Scepter





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 7, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 7, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 7, 90000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 7, 200000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 7, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 8, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 8, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 8, 100000)
	ItemType = 13 ItemIndex = 3 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 8, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dinorant
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 8, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 9, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 9, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 9, 110000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 9, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 9, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 10, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 10, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 10, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 10, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 10, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 11, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 11, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 11, 60000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 5 ItemIndex = 17 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 11, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Ancient Stick


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 12, 57, 30)--Iron Wheel

	LuaQuestClass.SetQuestRewardRandom(Ep19, 12, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 12, 50000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 12, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 12, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 13, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 13, 58, 20)--Tantalos
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 13, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 13, 50000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 13, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 19 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 13, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 14, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 14, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 14, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 14, 60000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 14, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 14, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 15, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 15, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 15, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 15, 70000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 16, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 16, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 16, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 16, 80000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 16, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 16, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 17, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 17, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 17, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 17, 90000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 17, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 17, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 18, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 18, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 18, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 18, 100000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 18, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 18, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 19, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 19, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 19, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 19, 110000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 20, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 20, 58, 20)--Tantalos

	LuaQuestClass.SetQuestRewardRandom(Ep19, 20, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 20, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 20, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 20, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 21, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 21, 61, 10)--Beam Knight
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 21, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 21, 90000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 3 
	LuaQuestClass.SetQuestRewardItem(Ep19, 21, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 19 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 21, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 22, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 22, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 22, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 22, 100000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 23, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 23, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 23, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 23, 110000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 23, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 23, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 24, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 24, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 24, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 24, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 24, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 24, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 25, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 25, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 25, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 25, 50000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 25, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 31 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 25, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul*10

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 26, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 26, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 26, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 26, 60000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 27, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 27, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 27, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 27, 70000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 27, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 5 ItemIndex = 9 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 27, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Dragon Soul Staff


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 28, 62, 20)--Mutant
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 28, 61, 10)--Beam Knight

	LuaQuestClass.SetQuestRewardRandom(Ep19, 28, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 28, 80000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 28, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 28, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 29, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 29, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 29, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 29, 120000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 29, 100000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 30, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 30, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 30, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 30, 110000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 30, 200000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 30, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 31, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 31, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 31, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 31, 100000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 31, 200000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 31, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 32, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 32, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 32, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 32, 90000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 32, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 32, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 33, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 33, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 33, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 33, 80000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 34, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 34, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 34, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 34, 70000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 34, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 34, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 35, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 35, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 35, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 35, 60000)
	ItemType = 3 ItemIndex = 10 ItemLevel = 4 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 35, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Dragon Spear
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 35, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 36, 62, 20)--Mutant
	ItemType = 5 ItemIndex = 6 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 36, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Staff of Resurrection

	LuaQuestClass.SetQuestRewardRandom(Ep19, 36, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 36, 50000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 37, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 37, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 37, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 37, 110000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 37, 100000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 37, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 38, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 38, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 38, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 38, 120000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 38, 200000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 38, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 39, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 39, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 39, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 39, 50000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 39, 200000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 40, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 40, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 40, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 40, 60000)
	ItemType = 13 ItemIndex = 3 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dinorant
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 41, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 41, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 41, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 41, 70000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 41, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 41, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 42, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 42, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 42, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 42, 80000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 42, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 42, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 43, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 43, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 43, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 43, 90000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 2 ItemIndex = 6 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 0 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Axe


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 44, 62, 20)--Mutant
	ItemType = 13 ItemIndex = 2 ItemLevel = 0 ItemSkill = 0 ItemCnt = 5 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 44, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Uniria

	LuaQuestClass.SetQuestRewardRandom(Ep19, 44, 1, 1, 9200, 2, 600, 3, 200)
	LuaQuestClass.SetQuestRewardExp(Ep19, 44, 100000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 44, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 44, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
		
---------------------------------------------------------------------------------------------------------------------   

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 46)--Used when a completion window is needed during dialogue progress
	ItemType = 14 ItemIndex = 28 ItemLevel = 4 ItemSkill = 0 ItemCnt = 2 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 47, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Get a map
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 49)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 50, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 50, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 50, 70000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 50, 200000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 51, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 51, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 51, 80000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 51, 100000)
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 51, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 52, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 52, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 52, 90000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 52, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 52, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 53, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 53, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 53, 100000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 53, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 53, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 54, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 54, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 54, 110000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 55, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 55, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 55, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 55, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 55, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 56, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 56, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 56, 130000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 56, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 3 ItemIndex = 10 ItemLevel = 6 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 56, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Dragon Spear


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 57, 70, 30)--Queen Rainer

	LuaQuestClass.SetQuestRewardRandom(Ep19, 57, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 57, 140000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 58, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 58, 73, 20)--Drakan
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 58, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 58, 110000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 58, 200000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 58, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 59, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 59, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 59, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 59, 120000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 59, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 2 ItemIndex = 10 ItemLevel = 6 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 59, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Great Scepter





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 60, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 60, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 60, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 60, 130000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 60, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 60, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 61, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 61, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 61, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 61, 140000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 61, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 61, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 62, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 62, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 62, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 62, 70000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 62, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 62, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 63, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 63, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 63, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 63, 80000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 63, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 63, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 64, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 64, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 64, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 64, 90000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 64, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 64, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 65, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 65, 73, 20)--Drakan

	LuaQuestClass.SetQuestRewardRandom(Ep19, 65, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 65, 100000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 65, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 4 ItemIndex = 16 ItemLevel = 6 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 65, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Saint Cross Crossbow




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 66, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 66, 74, 10)--Alpha Crust
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 66, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 66, 140000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 66, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 5 ItemIndex = 9 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 66, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Dragon Soul Staff


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 67, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 67, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 67, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 67, 130000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 67, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 5 ItemIndex = 17 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 67, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Ancient Stick





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 68, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 68, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 68, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 68, 120000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 68, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Ticket
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 68, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation


	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 69, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 69, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 69, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 69, 110000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 69, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 69, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 70, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 70, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 70, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 70, 100000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 70, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 12 ItemIndex = 30 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 70, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless*10

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 71, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 71, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 71, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 71, 90000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 71, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 71, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 72, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 72, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 72, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 72, 80000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 72, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 19 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 72, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 73, 69, 20)--Alkamost
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 73, 74, 10)--Alpha Crust

	LuaQuestClass.SetQuestRewardRandom(Ep19, 73, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 73, 70000)
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 73, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 73, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 74, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 74, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 74, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 74, 90000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 74, 200000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 3
	LuaQuestClass.SetQuestRewardItem(Ep19, 74, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 75, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 75, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 75, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 75, 100000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep19, 75, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 13 ItemIndex = 18 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 75, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 76, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 76, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 76, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 76, 110000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 76, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 76, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 77, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 77, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 77, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 77, 120000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 77, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 77, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 78, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 78, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 78, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 78, 130000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 78, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 78, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 79, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 79, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 79, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 79, 140000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 79, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 79, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 80, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 80, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 80, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 80, 70000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 80, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 80, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 81, 69, 20)--Alkamost
	ItemType = 0 ItemIndex = 16 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 81, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Sword of Destruction

	LuaQuestClass.SetQuestRewardRandom(Ep19, 81, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 81, 80000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 82, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 82, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 82, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 82, 130000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 82, 100000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 82, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 83, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 83, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 83, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 83, 140000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 83, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 83, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 84, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 84, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 84, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 84, 70000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 84, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 84, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 85, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 85, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 85, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 85, 80000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 85, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 85, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 86, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 86, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 86, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 86, 90000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 86, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 86, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 87, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 87, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 87, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 87, 100000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 87, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 87, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 88, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 88, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 88, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 88, 110000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 88, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 88, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 89, 69, 20)--Alkamost
	ItemType = 2 ItemIndex = 5 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 89, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Crystal Sword

	LuaQuestClass.SetQuestRewardRandom(Ep19, 89, 1, 1, 9000, 2, 700, 3, 300)
	LuaQuestClass.SetQuestRewardExp(Ep19, 89, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 89, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 89, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life
		
---------------------------------------------------------------------------------------------------------------------   

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 91)--Used when a completion window is needed during dialogue progress
	ItemType = 14 ItemIndex = 28 ItemLevel = 5 ItemSkill = 0 ItemCnt = 2 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 92, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Get a map
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep19, 94)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 95, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 95, 353, 20)--Satyr
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 95, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 95, 90000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 95, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 95, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 96, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 96, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 96, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 96, 100000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 96, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 96, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 97, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 97, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 97, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 97, 110000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 97, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 19 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 97, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 98, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 98, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 98, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 98, 120000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 98, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 98, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 99, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 99, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 99, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 99, 130000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 99, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 99, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 100, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 100, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 100, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 100, 140000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 100, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 0 ItemIndex = 20 ItemLevel = 0 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 100, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Night Blade


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 101, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 101, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 101, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 101, 150000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 101, 200000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 101, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 102, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 102, 353, 20)--Satyr

	LuaQuestClass.SetQuestRewardRandom(Ep19, 102, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 102, 160000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 102, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 102, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless






	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 103, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 103, 354, 10)--Blade Hunter
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 103, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 103, 110000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 103, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 103, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 104, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 104, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 104, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 104, 120000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 104, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 104, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 105, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 105, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 105, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 105, 130000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 105, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 105, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 106, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 106, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 106, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 106, 140000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 106, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 106, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 107, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 107, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 107, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 107, 150000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep19, 107, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 2 ItemIndex = 11 ItemLevel = 0 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 107, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Rod Scepter

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 108, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 108, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 108, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 108, 160000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 108, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 2 ItemIndex = 6 ItemLevel = 5 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19,108, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Axe


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 109, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 109, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 109, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 109, 90000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 109, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 109, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 110, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 110, 354, 10)--Blade Hunter

	LuaQuestClass.SetQuestRewardRandom(Ep19, 110, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 110, 100000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 110, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 110, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 111, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 111, 355, 5)--Centaurus
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 111, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 111, 160000)
	ItemType = 4 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 1 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 111, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Albatross Bow
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 111, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 112, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 112, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 112, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 112, 150000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 112, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 112, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 113, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 113, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 113, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 113, 140000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 113, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 113, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 114, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 114, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 114, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 114, 130000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 114, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 114, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 115, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 115, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 115, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 115, 120000)
	ItemType = 5 ItemIndex = 11 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 115, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Kundun's Staff
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 115, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 116, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 116, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 116, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 116, 110000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 116, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 116, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 117, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 117, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 117, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 117, 100000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 117, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 117, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 118, 351, 20)--Splinter Wolf
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep19, 118, 355, 5)--Centaurus

	LuaQuestClass.SetQuestRewardRandom(Ep19, 118, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 118, 90000)
	ItemType = 14 ItemIndex = 19 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 118, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation
	ItemType = 12 ItemIndex = 30 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 118, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless*10




	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 119, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 119, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 119, 100000)
	ItemType = 5 ItemIndex = 18 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 119, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Demonic Stick
	ItemType = 14 ItemIndex = 19 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 119, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Devil Square Invitation
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 120, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 120, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 120, 110000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 120, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 120, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless





	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 121, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 121, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 121, 120000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep19, 121, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 121, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 122, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 122, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 122, 130000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 122, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 122, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 123, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 123, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 123, 140000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep19, 123, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 123, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 124, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 124, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 124, 150000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 124, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 124, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 125, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 125, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 125, 160000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 125, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 125, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 126, 352, 30)--Iron Rider

	LuaQuestClass.SetQuestRewardRandom(Ep19, 126, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 126, 90000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 126, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 126, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 127, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 127, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick
	
	LuaQuestClass.SetQuestRewardRandom(Ep19, 127, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 127, 140000)
	LuaQuestClass.SetQuestRewardZen(Ep19, 127, 200000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 127, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 128, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 128, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 128, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 128, 150000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 128, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 128, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 129, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 129, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 129, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 129, 160000)
	ItemType = 13 ItemIndex = 0 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 2 
	LuaQuestClass.SetQuestRewardItem(Ep19, 129, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Angel
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 129, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 130, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 130, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 130, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 130, 90000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 130, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 130, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless



	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 131, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 131, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 131, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 131, 100000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 131, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 13 ItemIndex = 18 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 131, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Cloak of Invisibility

	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 132, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 132, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 132, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 132, 110000)
	ItemType = 14 ItemIndex = 43 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 132, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Lower Refining Stone
	ItemType = 2 ItemIndex = 6 ItemLevel = 6 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt12
	LuaQuestClass.SetQuestRewardItem(Ep19, 132, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Axe


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 133, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 133, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 133, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 133, 120000)
	ItemType = 13 ItemIndex = 1 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 133, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Satan
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 133, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep19, 134, 351, 20)--Splinter Wolf
	ItemType = 5 ItemIndex = 17 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK2, Ep19, 134, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Ancient Stick

	LuaQuestClass.SetQuestRewardRandom(Ep19, 134, 1, 1, 8800, 2, 800, 3, 400)
	LuaQuestClass.SetQuestRewardExp(Ep19, 134, 130000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 134, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep19, 134, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos
	
---------------------------------------------------------------------------------------------------------------------   
end
	
	