--[[
--[[
Quest_Reward_Ep18.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-09 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep18(iObjIndex)

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

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 2)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 1, 3, 10)--Spider
	LuaQuestClass.SetQuestRewardExp(Ep18, 1, 2000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 8)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 4, 7, 15)--Giant
	LuaQuestClass.SetQuestRewardExp(Ep18, 4, 6000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 5, 6, 15)--Lich
	LuaQuestClass.SetQuestRewardExp(Ep18, 5, 6000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 6, 31, 15)--Agon
	LuaQuestClass.SetQuestRewardExp(Ep18, 6, 6000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 7, 421, 15)--Corrupted Butterfly
	LuaQuestClass.SetQuestRewardExp(Ep18, 7, 6000)
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 14)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 10, 14, 20)--Skeleton Warrior
	LuaQuestClass.SetQuestRewardExp(Ep18, 10, 10000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 11, 7, 20)--Giant
	LuaQuestClass.SetQuestRewardExp(Ep18, 11, 10000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 12, 32, 20)--Stone Golem
	LuaQuestClass.SetQuestRewardExp(Ep18, 12, 10000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 13, 419, 20)--Hideous Rabbit
	LuaQuestClass.SetQuestRewardExp(Ep18, 13, 10000)
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 18)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 16, 22, 25)--Ice Golem
	LuaQuestClass.SetQuestRewardExp(Ep18, 16, 14000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 17, 24, 25)--Worm
	LuaQuestClass.SetQuestRewardExp(Ep18, 17, 14000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 22)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 20, 21, 30)--Assassin
	LuaQuestClass.SetQuestRewardExp(Ep18, 20, 21000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 21, 22, 30)--Ice Golem
	LuaQuestClass.SetQuestRewardExp(Ep18, 21, 21000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 26)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 24, 19, 30)--Yeti
	LuaQuestClass.SetQuestRewardExp(Ep18, 24, 28000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 25, 23, 30)--Homard
	LuaQuestClass.SetQuestRewardExp(Ep18, 25, 28000)


	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 30)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 28, 17, 40)--Cyclops
	LuaQuestClass.SetQuestRewardExp(Ep18, 28, 36000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 29, 12, 40)--larvae
	LuaQuestClass.SetQuestRewardExp(Ep18, 29, 36000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 34)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 32, 423, 50)--Totem Golem
	LuaQuestClass.SetQuestRewardExp(Ep18, 32, 38000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 33, 422, 50)--Cursed Lich
	LuaQuestClass.SetQuestRewardExp(Ep18, 33, 38000)

		
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 38)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 36, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestRewardExp(Ep18, 36, 43000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 37, 17, 50)--Cyclops
	LuaQuestClass.SetQuestRewardExp(Ep18, 37, 43000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 42)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 40, 13, 50)--Hell Spider
	LuaQuestClass.SetQuestRewardExp(Ep18, 40, 50000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 41, 15, 50)--Skeleton Archer
	LuaQuestClass.SetQuestRewardExp(Ep18, 41, 50000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 46)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 44, 9, 50)--Thunder Lich
	LuaQuestClass.SetQuestRewardExp(Ep18, 44, 54000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 45, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestRewardExp(Ep18, 45, 54000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 50)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 48, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestRewardExp(Ep18, 48, 60000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 49, 13, 50)--Hell Spider
	LuaQuestClass.SetQuestRewardExp(Ep18, 49, 60000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 54)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 52, 10, 50)--Dark Knight
	LuaQuestClass.SetQuestRewardExp(Ep18, 52, 66000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 53, 9, 50)--Thunder Lich
	LuaQuestClass.SetQuestRewardExp(Ep18, 53, 66000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 58)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 56, 18, 15)--Gorgon
	LuaQuestClass.SetQuestRewardExp(Ep18, 56, 72000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 57, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestRewardExp(Ep18, 57, 72000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 62)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 60, 36, 50)--Shadow
	LuaQuestClass.SetQuestRewardExp(Ep18, 60, 80000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 61, 25, 3)--Ice Queen
	LuaQuestClass.SetQuestRewardExp(Ep18, 61, 80000)

	

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 66)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 64, 39, 50)--Poison Shadow
	LuaQuestClass.SetQuestRewardExp(Ep18, 64, 82000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 65, 424, 50)--Beast Wooshi
	LuaQuestClass.SetQuestRewardExp(Ep18, 65, 82000)
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 70)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 68, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestRewardExp(Ep18, 68, 84000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 69, 425, 50)--Beast Wooshi Captain
	LuaQuestClass.SetQuestRewardExp(Ep18, 69, 84000)


	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 74)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 72, 41, 50)--Death Cow
	LuaQuestClass.SetQuestRewardExp(Ep18, 72, 95000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 73, 36, 50)--Shadow 
	LuaQuestClass.SetQuestRewardExp(Ep18, 73, 95000)


	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 78)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 76, 37, 50)--Devil
	LuaQuestClass.SetQuestRewardExp(Ep18, 76, 110000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 77, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestRewardExp(Ep18, 77, 110000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 82)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 80, 40, 50)--Death Knight
	LuaQuestClass.SetQuestRewardExp(Ep18, 80, 120000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 81, 41, 50)--Death Cow
	LuaQuestClass.SetQuestRewardExp(Ep18, 81, 120000)


	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 86)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 84, 35, 60)--Death Gorgon
	LuaQuestClass.SetQuestRewardExp(Ep18, 84, 130000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 85, 37, 60)--Devil
	LuaQuestClass.SetQuestRewardExp(Ep18, 85, 130000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 90)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 88, 38, 15)--Balrog
	LuaQuestClass.SetQuestRewardExp(Ep18, 88, 160000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 88, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 89, 40, 60)--Death Knight
	LuaQuestClass.SetQuestRewardExp(Ep18, 89, 160000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 89, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone

	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 94)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 92, 38, 15)--Balrog
	LuaQuestClass.SetQuestRewardExp(Ep18, 92, 140000)

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 93, 40, 60)--Death Knight
	LuaQuestClass.SetQuestRewardExp(Ep18, 93, 140000)           
	
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 97)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 96, 62, 60)--Mutant
	LuaQuestClass.SetQuestRewardExp(Ep18, 96, 170000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 96, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 100)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 99, 62, 60)--Mutant
	LuaQuestClass.SetQuestRewardExp(Ep18, 99, 150000)


	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 103)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 102, 60, 60)--Bloody Wolf
	LuaQuestClass.SetQuestRewardExp(Ep18, 102, 180000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 102, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Soul Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 106)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 105, 60, 60)--Bloody Wolf
	LuaQuestClass.SetQuestRewardExp(Ep18, 105, 160000)


	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 109)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 108, 57, 60)--Iron Wheel
	LuaQuestClass.SetQuestRewardExp(Ep18, 108, 190000)
	ItemType = 14 ItemIndex = 14 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 108, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Soul Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 112)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 111, 57, 60)--Iron Wheel
	LuaQuestClass.SetQuestRewardExp(Ep18, 111, 170000)

	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 115)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 114, 69, 80)--Alkamost
	LuaQuestClass.SetQuestRewardExp(Ep18, 114, 200000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 114, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 118)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 117, 69, 80)--Alkamost
	LuaQuestClass.SetQuestRewardExp(Ep18, 117, 180000)


			
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 121)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 120, 71, 80)--Mega Crust
	LuaQuestClass.SetQuestRewardExp(Ep18, 120, 210000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 120, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 124)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 123, 71, 80)--Mega Crust
	LuaQuestClass.SetQuestRewardExp(Ep18, 123, 190000)


			
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 127)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 126, 70, 80)--Queen Rainer
	LuaQuestClass.SetQuestRewardExp(Ep18, 126, 220000)
	ItemType = 14 ItemIndex = 13 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep18, 126, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Bless Stone
	
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep18, 130)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep18, 129, 70, 80)--Queen Rainer
	LuaQuestClass.SetQuestRewardExp(Ep18, 129, 200000)


	
	
---------------------------------------------------------------------------------------------------------------------   

end
	
	