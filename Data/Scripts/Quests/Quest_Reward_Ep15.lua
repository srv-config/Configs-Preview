--[[
--[[
Quest_Reward_Ep15.lua
[ Start  ]  2009.08.
[ Latest ]  2009-12-09 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]

function Quest_Reward_Window_Ep15(iObjIndex)

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
	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 2)--Used when a completion window is needed during dialogue progress

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 3, 20, 50)--Yeti Captain
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 3, 423, 50)--Totem Golem
	LuaQuestClass.SetQuestRewardExp(Ep15, 3, 60000)
	LuaQuestClass.SetQuestRewardZen(Ep15, 3, 1500000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 3, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 4, 19, 50)--Yeti
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 4, 422, 50)--Cursed Lich
	LuaQuestClass.SetQuestRewardExp(Ep15, 4, 60000)
	LuaQuestClass.SetQuestRewardZen(Ep15, 4, 1500000)
	ItemType = 12 ItemIndex = 15 ItemLevel = 0 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 4, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Spirit Stone

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 10)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 6, 15, 50)--Skeleton Archer
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 6, 5, 30)--Hell Hound
	ItemType = 10 ItemIndex = 1 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 6, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dragon Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 7, 17, 50)--Cyclops
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 7, 11, 30)--Ghost
	ItemType = 10 ItemIndex = 3 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 7, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 8, 15, 50)--Skeleton Archer
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 8, 5, 30)--Hell Hound
	ItemType = 10 ItemIndex = 14 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 8, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 9, 17, 50)--Cyclops
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 9, 11, 30)--Ghost
	ItemType = 10 ItemIndex = 40 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 9, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Gloves
	
	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 16)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 12, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 12, 13, 30)--Hell Spider
	ItemType = 11 ItemIndex = 1 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 12, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dragon Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 13, 15, 50)--Skeleton Archer
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 13, 5, 30)--Hell Hound
	ItemType = 11 ItemIndex = 3 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 13, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 14, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 14, 13, 30)--Hell Spider
	ItemType = 11 ItemIndex = 14 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 14, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 15, 15, 50)--Skeleton Archer
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 15, 5, 30)--Hell Hound
	ItemType = 11 ItemIndex = 40 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 15, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Boots


	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 22)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 18, 16, 50)--Skeleton Warrior Captain
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 18, 9, 30)--Thunder Lich
	ItemType = 7 ItemIndex = 1 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 18, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dragon Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 19, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 19, 13, 30)--Hell Spider
	ItemType = 7 ItemIndex = 3 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 19, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 20, 16, 50)--Skeleton Warrior Captain
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 20, 9, 30)--Thunder Lich
	ItemType = 7 ItemIndex = 14 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 20, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 21, 5, 50)--Hell Hound
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 21, 13, 30)--Hell Spider
	ItemType = 7 ItemIndex = 40 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 21, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Helm

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 28)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 24, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 24, 10, 30)--Dark Knight
	ItemType = 9 ItemIndex = 1 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 24, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dragon Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 25, 13, 50)--Hell Spider
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 25, 16, 30)--Skeleton Warrior Captain
	ItemType = 9 ItemIndex = 3 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 25, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 26, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 26, 10, 30)--Dark Knight
	ItemType = 9 ItemIndex = 14 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 26, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 27, 13, 50)--Hell Spider
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 27, 16, 30)--Skeleton Warrior Captain
	ItemType = 9 ItemIndex = 40 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 27, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Pants

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 34)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 30, 10, 50)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 30, 18, 10)--Gorgon
	ItemType = 8 ItemIndex = 1 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 30, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Dragon Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 31, 16, 50)--Skeleton Warrior Captain
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 31, 9, 30)--Thunder Lich
	ItemType = 8 ItemIndex = 3 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 31, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 32, 10, 50)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 32, 18, 10)--Gorgon
	ItemType = 8 ItemIndex = 14 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 32, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Guardian Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 33, 16, 50)--Skeleton Warrior Captain
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 33, 9, 30)--Thunder Lich
	ItemType = 8 ItemIndex = 40 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 33, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Armor

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 40)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 36, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 36, 10, 50)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 36, 18, 30)--Gorgon
	ItemType = 0 ItemIndex = 13 ItemLevel = 8 dur = 0 ItemSkill = 1 ItemCnt = 2
	LuaQuestClass.SetQuestRewardItem(Ep15, 36, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Double Blade
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 37, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 37, 10, 5)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 37, 18, 1)--Gorgon
	ItemType = 5 ItemIndex = 5 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 37, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Staff
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 38, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 38, 10, 50)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 38, 18, 30)--Gorgon
	ItemType = 4 ItemIndex = 13 ItemLevel = 8 dur = 0 ItemSkill = 1 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 38, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Blue Wing Crossbow
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 39, 8, 50)--Poison Bull Fighter
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 39, 10, 5)--Dark Knight
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 39, 18, 1)--Gorgon
	ItemType = 5 ItemIndex = 16 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 39, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Stick

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 46)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 42, 36, 50)--Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 42, 39, 50)--Poison Shadow
	ItemType = 10 ItemIndex = 34 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 42, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 43, 25, 5)--Ice Queen
	ItemType = 10 ItemIndex = 35 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 43, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 44, 36, 50)--Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 44, 39, 50)--Poison Shadow
	ItemType = 10 ItemIndex = 36 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 44, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Gloves
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 45, 25, 5)--Ice Queen
	ItemType = 10 ItemIndex = 41 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 45, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Gloves

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 52)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 48, 39, 50)--Poison Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 48, 34, 30)--Cursed Wizard
	ItemType = 11 ItemIndex = 34 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 48, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 49, 424, 100)--Beast Wooshi
	ItemType = 11 ItemIndex = 35 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 49, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 50, 39, 50)--Poison Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 50, 34, 30)--Cursed Wizard
	ItemType = 11 ItemIndex = 36 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 50, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 51, 424, 100)--Beast Wooshi
	ItemType = 11 ItemIndex = 41 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 51, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Boots

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 58)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 54, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 54, 41, 50)--Death Cow
	ItemType = 7 ItemIndex = 34 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Helmet
	ItemType = 9 ItemIndex = 34 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 54, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 55, 425, 100)--Beast Wooshi Captain
	ItemType = 7 ItemIndex = 35 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 55, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Helmet
	ItemType = 9 ItemIndex = 35 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 55, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 56, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 56, 41, 50)--Death Cow
	ItemType = 7 ItemIndex = 36 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 56, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Helmet
	ItemType = 9 ItemIndex = 36 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 56, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 57, 425, 100)--Beast Wooshi Captain
	ItemType = 7 ItemIndex = 41 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Helmet
	ItemType = 9 ItemIndex = 41 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 57, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Pants


	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 64)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 60, 41, 100)--Death Cow
	ItemType = 8 ItemIndex = 34 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 60, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Helmet
	ItemType = 2 ItemIndex = 6 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt4
	LuaQuestClass.SetQuestRewardItem(Ep15, 60, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Dragon Axe
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 61, 36, 100)--Shadow
	ItemType = 8 ItemIndex = 35 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 61, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Helmet
	ItemType = 2 ItemIndex = 6 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt4
	LuaQuestClass.SetQuestRewardItem(Ep15, 61, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Dragon Axe
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 62, 41, 100)--Death Cow
	ItemType = 8 ItemIndex = 36 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 62, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Helmet
	ItemType = 2 ItemIndex = 6 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt4
	LuaQuestClass.SetQuestRewardItem(Ep15, 62, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Dragon Axe
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 63, 36, 100)--Shadow
	ItemType = 8 ItemIndex = 41 ItemLevel = 7 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 63, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Helmet
	ItemType = 2 ItemIndex = 6 ItemLevel = 4 dur = 0 ItemSkill = 0 ItemCnt = 1 Overlap = 0 Opt = Opt4
	LuaQuestClass.SetQuestRewardItem(Ep15, 63, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt, Overlap, Opt)--Chaos Dragon Axe


	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 70)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 66, 41, 50)--Death Cow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 66, 37, 30)--Devil
	ItemType = 10 ItemIndex = 34 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 66, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Helmet
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 67, 36, 50)--Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 67, 39, 30)--Poison Shadow
	ItemType = 10 ItemIndex = 35 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 67, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Helmet
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 68, 41, 50)--Death Cow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 68, 37, 30)--Devil
	ItemType = 10 ItemIndex = 36 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 68, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Helmet
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 69, 36, 50)--Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 69, 39, 30)--Poison Shadow
	ItemType = 10 ItemIndex = 41 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 69, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Helmet



	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 76)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 72, 37, 100)--Devil
	ItemType = 11 ItemIndex = 34 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 72, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 73, 39, 50)--Poison Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 73, 34, 30)--Cursed Wizard
	ItemType = 11 ItemIndex = 35 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 73, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 74, 37, 100)--Devil
	ItemType = 11 ItemIndex = 36 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 74, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Boots
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 75, 39, 50)--Poison Shadow
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 75, 34, 30)--Cursed Wizard
	ItemType = 11 ItemIndex = 41 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 75, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Boots


	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 82)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 78, 40, 100)--Death Knight
	ItemType = 7 ItemIndex = 34 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 78, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 79, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 79, 41, 50)--Death Cow
	ItemType = 7 ItemIndex = 35 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 79, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 80, 40, 100)--Death Knight
	ItemType = 7 ItemIndex = 36 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 80, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Helm
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 81, 34, 50)--Cursed Wizard
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 81, 41, 50)--Death Cow
	ItemType = 7 ItemIndex = 41 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 81, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Helm

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 88)--Used when a completion window is needed during dialogue progress
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 84, 40, 50)--Death Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 84, 35, 30)--Death Gorgon
	ItemType = 9 ItemIndex = 34 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 84, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 85, 41, 100)--Death Cow
	ItemType = 9 ItemIndex = 35 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 85, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 86, 40, 50)--Death Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 86, 35, 30)--Death Gorgon
	ItemType = 9 ItemIndex = 36 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 86, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Pants
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 87, 41, 100)--Death Cow
	ItemType = 9 ItemIndex = 41 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 87, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Pants

	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 94)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 90, 35, 50)--Death Gorgon
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 90, 38, 10)--Balrog
	ItemType = 8 ItemIndex = 34 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 90, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ash Crow Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 91, 37, 100)--Devil
	ItemType = 8 ItemIndex = 35 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 91, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Eclipse Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 92, 35, 50)--Death Gorgon
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 92, 38, 10)--Balrog
	ItemType = 8 ItemIndex = 36 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 92, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Iris Armor
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 93, 37, 100)--Devil
	ItemType = 8 ItemIndex = 41 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 93, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Ancient Armor


	LuaQuestClass.SetQuestProgress(ASK1, Ep15, 100)--Used when a completion window is needed during dialogue progress
	

	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 96, 40, 50)--Death Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 96, 35, 30)--Death Gorgon
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 96, 38, 20)--Balrog
	ItemType = 2 ItemIndex = 5 ItemLevel = 7 dur = 0 ItemSkill = 1 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 96, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Crystal Sword
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 97, 40, 100)--Death Knight
	ItemType = 5 ItemIndex = 5 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 97, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Legendary Staff
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 98, 40, 50)--Death Knight
	LuaQuestClass.SetQuestMonsterKill(ASK2, Ep15, 98, 35, 30)--Death Gorgon
	LuaQuestClass.SetQuestMonsterKill(ASK3, Ep15, 98, 38, 20)--Balrog
	ItemType = 4 ItemIndex = 14 ItemLevel = 7 dur = 0 ItemSkill = 1 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 98, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Aqua Gold Crossbow
	
	LuaQuestClass.SetQuestMonsterKill(ASK1, Ep15, 99, 40, 100)--Death Knight
	ItemType = 5 ItemIndex = 16 ItemLevel = 8 dur = 0 ItemSkill = 0 ItemCnt = 1
	LuaQuestClass.SetQuestRewardItem(Ep15, 99, ItemType, ItemIndex, ItemLevel, dur, ItemSkill, ItemCnt)--Red Wing Stick
end
	
	