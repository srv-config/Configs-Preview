--[[
--[[
Quest_Reward_Ep20.lua
[ Start  ]  2009.08.
[ Latest ]  2011-09-27 3:24 PM
[ Version ] 0.0.0.2
[ Text ]    Fix: requirements not displaying 1 or more items
[ Line ]    408 - 426                               
--]]
--================================================================================================================
function Quest_Reward_Window_Ep20(iObjIndex)

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

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 3)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestGetZen(ASK1, Ep20, 4, 1000000)    
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 6)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestGetZen(ASK1, Ep20, 7, 500000) 
	ItemType = 14 ItemIndex = 151 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 7, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission    

	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 9, 567)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestRewardExp(Ep20, 9, 5000)  
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 11)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 14)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 12, 271, 30, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 12, 272, 20, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 12, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 12, 500000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 12, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 12, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 15, 270, 30, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 15, 268, 20, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 15, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 15, 500000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 158 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Reddish Box
	
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 16, 568)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestRewardExp(Ep20, 16, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 18)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 21)--Used when a completion window is needed during dialogue progress
	
	ItemType = 14 ItemIndex = 153 ItemLevel = 0 ItemCnt = 1--Stardust
	LuaQuestClass.SetQuestDropItem(Ep20, 19, ASK1, 70, 3000, ItemType, ItemIndex, ItemLevel, ItemCnt)--Queen Rainer
	
	ItemType = 14 ItemIndex = 153 ItemLevel = 0 ItemSkill = 0 ItemCnt = 20 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 19, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Stardust

	LuaQuestClass.SetQuestRewardRandom(Ep20, 19, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardZen(Ep20, 19, 1000000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	
	ItemType = 14 ItemIndex = 154 ItemLevel = 0 ItemCnt = 1--Stardust
	LuaQuestClass.SetQuestDropItem(Ep20, 22, ASK1, 304, 3000, ItemType, ItemIndex, ItemLevel, ItemCnt)--Witch Queen
	
	ItemType = 14 ItemIndex = 154 ItemLevel = 0 ItemSkill = 0 ItemCnt = 10 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 22, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Calttstone

	LuaQuestClass.SetQuestRewardRandom(Ep20, 22, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardZen(Ep20, 22, 1000000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Soul
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 157 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 22, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Greenish Box

	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 23, 0)--Gens NPC dialogue: NPC ID 543 if user is Duprian, NPC ID 544 if Vanert
	LuaQuestClass.SetQuestRewardExp(Ep20, 23, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 25)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 28)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 26, 486, 20)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 26, 487, 10)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 26, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardContribute(Ep20, 26, 500)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos


	
	LuaQuestClass.SetQuestPVP_Point(ASK1, Ep20, 29, 63, 5)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 29, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardContribute(Ep20, 29, 500)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 29, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Purplish Box


	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 30, 567)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestRewardExp(Ep20, 30, 5000) 
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 32)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 35)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 33, 273, 30, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 33, 269, 20, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 33, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 33, 500000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 36, 274, 10, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 36, 338, 1, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 36, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 36, 500000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 158 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Reddish Box
	
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 37, 568)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestRewardExp(Ep20, 37, 5000)
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 39)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 42)--Used when a completion window is needed during dialogue progress
	
	ItemType = 14 ItemIndex = 155 ItemLevel = 0 ItemCnt = 1--Tantalos Armor
	LuaQuestClass.SetQuestDropItem(Ep20, 40, ASK1, 58, 3000, ItemType, ItemIndex, ItemLevel, ItemCnt)--Tantalos
	
	ItemType = 14 ItemIndex = 155 ItemLevel = 0 ItemSkill = 0 ItemCnt = 20 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 40, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Tantalos Armor

	LuaQuestClass.SetQuestRewardRandom(Ep20, 40, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardZen(Ep20, 40, 1000000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 40, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life


	
	ItemType = 14 ItemIndex = 156 ItemLevel = 0 ItemCnt = 1--Slaughterer's Club
	LuaQuestClass.SetQuestDropItem(Ep20, 43, ASK1, 484, 3000, ItemType, ItemIndex, ItemLevel, ItemCnt)--Ashen Slaughterer
	
	ItemType = 14 ItemIndex = 156 ItemLevel = 0 ItemSkill = 0 ItemCnt = 10 Opt = 0 ExOpt = 0
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 43, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--Slaughterer's Club

	LuaQuestClass.SetQuestRewardRandom(Ep20, 43, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardZen(Ep20, 43, 1000000)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 16 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Life

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 157 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Greenish Box


	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 44, 0)--Gens NPC dialogue: NPC ID 543 if user is Duprian, NPC ID 544 if Vanert
	LuaQuestClass.SetQuestRewardExp(Ep20, 44, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 46)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 49)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 47, 481, 1)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 47, 483, 1)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 47, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardContribute(Ep20, 47, 500)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 47, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 47, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless


	
	LuaQuestClass.SetQuestPVP_Point(ASK1, Ep20, 50, 63, 5)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 50, 1, 1, 7000, 2, 2000, 3, 1000)
	LuaQuestClass.SetQuestRewardContribute(Ep20, 50, 500)
	ItemType = 14 ItemIndex = 22 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Creation
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Bless

	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--1st-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Purplish Box   

	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 51, 566)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestRewardExp(Ep20, 51, 5000)
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 53)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 57)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 55, 506, 1, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 55, 507, 1, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 55, 1, 1, 5000, 2, 5000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 55, 1000000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 55, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos



	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 58, 505, 1, PartyPlay)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 58, 504, 1, PartyPlay)

	LuaQuestClass.SetQuestRewardRandom(Ep20, 58, 1, 1, 5000, 2, 5000)
	LuaQuestClass.SetQuestRewardExp(Ep20, 58, 1000000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 58, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Jewel of Chaos

	LuaQuestClass.SetQuestRewardZen(Ep20, 58, 500000)
	ItemType = 14 ItemIndex = 158 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 58, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Reddish Box
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 58, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Purplish Box       

-- Quest complete   
--  LuaQuestClass:SetQuestProgress(ASK1, Ep20, 60)--Used when a completion window is needed during dialogue progress
--  LuaQuestClass:SetQuestProgress(ASK1, Ep20, 61)--Used when a completion window is needed during dialogue progress

	
	ItemType = 14 ItemIndex = 152 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 60, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--1st-level Commission Completion Certificate


	LuaQuestClass.SetQuestRewardZen(Ep20, 60, 500000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 62)--Used when a completion window is needed during dialogue progress
	ItemType = 14 ItemIndex = 151 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 64, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)--1st-level Commission


	LuaQuestClass.SetQuestRewardZen(Ep20, 64, 500000)

	
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
	

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 71)--Used when a completion window is needed during dialogue progress
	LuaQuestClass.SetQuestGetZen(ASK1, Ep20, 72, 500000)    
	ItemType = 14 ItemIndex = 170 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1 
	LuaQuestClass.SetQuestRewardItem(Ep20, 72, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--2nd-level Commission
	
-- Monday Daily Quest
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 74, 581)      
	LuaQuestClass.SetQuestRewardExp(Ep20, 74, 5000) 
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 76)          
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 77, 593, 30)-- Boss monster Salamander, 30
	
	LuaQuestClass.SetQuestRewardExp(Ep20, 77, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 77, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 77, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box
	
-- Tuesday Daily Quest
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 78, 581)      
	LuaQuestClass.SetQuestRewardExp(Ep20, 78, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 80)          
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 81, 592, 30)-- Boss monster Undine, 30
	
	LuaQuestClass.SetQuestRewardExp(Ep20, 81, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box

-- Wednesday Daily Quest
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 82, 581)
	LuaQuestClass.SetQuestRewardExp(Ep20, 82, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 84)          
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 85, 594, 30)-- Boss monster Sylphid, 30
	
	LuaQuestClass.SetQuestRewardExp(Ep20, 85, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 85, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 85, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box


-- Thursday Daily Quest
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 86, 581)
	LuaQuestClass.SetQuestRewardExp(Ep20, 86, 5000) 
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 88)          
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 89, 595, 30)-- Boss monster Gnome, 30
	
	LuaQuestClass.SetQuestRewardExp(Ep20, 89, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 89, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 89, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box

	
-- Friday Daily Quest
	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 90, 581)
	LuaQuestClass.SetQuestRewardExp(Ep20, 90, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 92)
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 93, 596, 30)-- Boss monster Hilasa, 30
	
	LuaQuestClass.SetQuestRewardExp(Ep20, 93, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 93, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 93, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box



-- Saturday Daily Quest

	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 94, 581)
	LuaQuestClass.SetQuestRewardExp(Ep20, 94, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 96)
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 97, 593, 10)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 97, 594, 10)
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep20, 97, 596, 10)

	LuaQuestClass.SetQuestRewardExp(Ep20, 97, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 97, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 97, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box

-- Sunday Daily Quest

	LuaQuestClass.SetQuestNPCTalk(ASK1, Ep20, 98, 581)
	LuaQuestClass.SetQuestRewardExp(Ep20, 98, 5000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 100)                             
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep20, 101, 592, 10)
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep20, 101, 595, 10)
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep20, 101, 596, 10)

	LuaQuestClass.SetQuestRewardExp(Ep20, 101, 500000)-- EXP 500000
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 101, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- 2nd-level Commission Completion Certificate
	ItemType = 14 ItemIndex = 159 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep20, 101, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)-- Purplish Box

-- Quest complete   
	
	ItemType = 14 ItemIndex = 171 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 103, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- 2nd-level Commission Completion Certificate

	LuaQuestClass.SetQuestRewardZen(Ep20, 103, 500000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep20, 105)--Used when a completion window is needed during dialogue progress
	ItemType = 14 ItemIndex = 170 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestGetItem(ASK1, Ep20, 107, ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt)-- 1st-level Commission

	LuaQuestClass.SetQuestRewardZen(Ep20, 107, 500000)
end
--================================================================================================================  
	