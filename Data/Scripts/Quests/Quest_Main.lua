-- // ============================================================
-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2016 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

QuestInclude("Quest_Define.lua")
QuestInclude("Quest_Ep1.lua")-- Tutorial quest progress
QuestInclude("Quest_Ep2.lua")-- Chaos Castle entry quest progress
QuestInclude("Quest_Ep3.lua")-- Blood Castle entry quest progress
QuestInclude("Quest_Ep4.lua")-- Devil Square entry quest progress
QuestInclude("Quest_Ep5.lua")-- Illusion Temple entry quest progress
QuestInclude("Quest_Ep6.lua")-- World Tour quest progress
QuestInclude("Quest_Ep7.lua")-- Inventory Expansion quest progress
QuestInclude("Quest_Ep8.lua")-- Acheron quest progress
QuestInclude("Quest_Ep9.lua")-- Master Skill Tree Reset Quest (First)
QuestInclude("Quest_Ep10.lua")-- Master Skill Tree Reset Quest (Second)
QuestInclude("Quest_Ep11.lua")-- Master Skill Tree Reset Quest (Third)
QuestInclude("Quest_Ep12.lua")-- Master Skill Tree Reset Quest (All Trees)
QuestInclude("Quest_Ep15.lua")-- Item grant quest progress
QuestInclude("Quest_Ep16.lua")-- Gens Quest (1) progress
QuestInclude("Quest_Ep17.lua")-- Gens Quest (2) progress
QuestInclude("Quest_Ep18.lua")-- Repeatable Quest (1) level 1~259 progress
QuestInclude("Quest_Ep19.lua")-- Repeatable Quest (2) level 260~349 progress
QuestInclude("Quest_Ep20.lua")-- Daily Quest level 350~400, 400+ (modified to level 200)
QuestInclude("Quest_Main_NPC_List.lua")
QuestInclude("Quest_Main_NPC_QuestList.lua")
QuestInclude("Quest_Main_NPC_TalkList.lua")
QuestInclude("Quest_Main_Quest_GiveUp.lua")
--================================================================================================================
-- Is there a quest in progress?
function ChkProgQuest(Ep, iObjIndex)

	local ProgEp = LuaQuestClass.ChkProgQuest(Ep, iObjIndex)
	
	if ProgEp > 0 then
		return 1
	end

	return 0
end
--================================================================================================================
function Make_QuestIndexIDToEP(QuestIndexID)

	--local LuaQuestClass = QuestExpLuaBind()   
	local Ep = LuaQuestClass.Make_QuestIndexIDToEP(QuestIndexID)
	
	return Ep
end
--================================================================================================================
function ItemAndEvent(iObjIndex)

	--DebugPrint('ItemAndEvent')
	local UserLv = LuaQuestClass.GetUserLv(iObjIndex)
	local UserQS = LuaQuestClass.GetQuestSwitch(Ep1, iObjIndex)
	local CharClass = LuaQuestClass.GetCharClass(iObjIndex)
	
	ItemType = 13 ItemIndex = 20 ItemLevel = 1 ItemSkill = 0 Opt = 0 ExOpt = 0
	local Ring1 = LuaQuestClass.GetInvenItemFind(ItemType, ItemIndex, ItemLevel, ItemSkill, Opt, ExOpt, iObjIndex)
	ItemType = 13 ItemIndex = 20 ItemLevel = 2 ItemSkill = 0 Opt = 0 ExOpt = 0
	local Ring2 = LuaQuestClass.GetInvenItemFind(ItemType, ItemIndex, ItemLevel, ItemSkill, Opt, ExOpt, iObjIndex)
	
	if CharClass == CLASS_DARKLORD or CharClass == CLASS_MAGUMSA or CharClass == CLASS_MONK then
		return
	end
	
	if  UserLv > 80 then
		return
	end
	
	if Ring1 ~= 0 or Ring2 ~= 0 then
		return
	end

	if UserQS <= 3 then
		LuaQuestClass.AddItemAndEtcQuestList(Ep1, 0)
		LuaQuestClass.SendQuestItemAndEventList(iObjIndex)--Event quest
		return
	end
end
--================================================================================================================
-- season6 item use quest 
-- Function name cannot be changed (contact the server team).
-- If return 1, delete item.
function ItemUseQuest(iObjIndex, Ep)

	local UserLv = LuaQuestClass.GetUserLv(iObjIndex)
	local UserQS = LuaQuestClass.GetQuestSwitch(Ep, iObjIndex)
	local CharMaster = LuaQuestClass.IsMasterLevel(iObjIndex)   
	--local CheatChangeDay = LuaQuestClass:GetCheatChangeDay()
	local CheatChangeDay = -1
	
	if Ep == Ep20 and UserQS == 8 then
		local DayOfWeek = -1
		
		if CheatChangeDay == -1 then
			DayOfWeek = tonumber(os.date("%w"))
		elseif CheatChangeDay > -1 then
			DayOfWeek = CheatChangeDay
		end
	
			if DayOfWeek == Mon then
				LuaQuestClass.SetQuestSwitch(Ep20, 9, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 9)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Tue then
				LuaQuestClass.SetQuestSwitch(Ep20, 16, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 16)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Wed then
				LuaQuestClass.SetQuestSwitch(Ep20, 23, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 23)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Thu then
				LuaQuestClass.SetQuestSwitch(Ep20, 30, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 30)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Fri then
				LuaQuestClass.SetQuestSwitch(Ep20, 37, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 37)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Sat then
				LuaQuestClass.SetQuestSwitch(Ep20, 44, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 44)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Sun then
				LuaQuestClass.SetQuestSwitch(Ep20, 51, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 51)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			end
		
	
	elseif Ep == Ep20 and UserQS == 73 then
		local DayOfWeek = -1

		if CheatChangeDay == -1 then
			DayOfWeek = tonumber( os.date("%w") )
		elseif CheatChangeDay > -1 then
			DayOfWeek = CheatChangeDay
		end
	
			if DayOfWeek == Mon then
				LuaQuestClass.SetQuestSwitch(Ep20, 74, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 74)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Tue then
				LuaQuestClass.SetQuestSwitch(Ep20, 78, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 78)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Wed then
				LuaQuestClass.SetQuestSwitch(Ep20, 82, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 82)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Thu then
				LuaQuestClass.SetQuestSwitch(Ep20, 86, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 86)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Fri then
				LuaQuestClass.SetQuestSwitch(Ep20, 90, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 90)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Sat then
				LuaQuestClass.SetQuestSwitch(Ep20, 94, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 94)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			elseif DayOfWeek == Sun then
				LuaQuestClass.SetQuestSwitch(Ep20, 98, iObjIndex)
				LuaQuestClass.AddItemAndEtcQuestList(Ep20, 98)
				LuaQuestClass.SendQuestItemUseList(iObjIndex)
				return 1
			end
	end
	return 0
end
--================================================================================================================
function ChkProgress(Ep, QS, iObjIndex)

	--local LuaQuestClass = QuestExpLuaBind()   
	local NpcIndex = LuaQuestClass.GetNpcIndex(iObjIndex)
		
	if Ep == 1 and QS > 4 then
		if NpcIndex ~= NPC_SHADOW_PHANTOM then
			return 0
		end
	end
	
	return 1
end
--================================================================================================================
-- When selecting one from the quest list. 0x0A
function CGReqQuestSwitch(RecvQuestIndexID, SelectSyntactic, iObjIndex)

	local Ep = Make_QuestIndexIDToEP(RecvQuestIndexID)
	local QuestSwitch = LuaQuestClass.GetQuestSwitch(Ep, iObjIndex)
	
	if ChkProgress(Ep, QuestSwitch, iObjIndex) == 0 then
		return
	end
	
	if Ep == 0 then
		--LuaQuestClass:NpcShadowPhantomBuff(iObjIndex)
	end
	
	if Ep ~= 0 then
		LuaQuestClass.SetQuestProg(Ep, iObjIndex, 1)
		-- Search and clean up once a month
		Ep19_NPCQuestList(iObjIndex)
--      Ep20_NPCQuestList(iObjIndex)
		QuestSwitch = LuaQuestClass.GetQuestSwitch(Ep, iObjIndex)
		LuaQuestClass.SendQuestProgress(Ep, QuestSwitch, iObjIndex)
	end
	
	return
	
end
--================================================================================================================
-- Dialogue in progress 0x0B
function CGReqQuestProgress(RecvQuestIndexID, SelectSyntactic, iObjIndex)
	
	--local LuaQuestClass = QuestExpLuaBind()   
	--local CurrentQuestIndexID = LuaQuestClass:GetCurrentQuestIndexID_NpcTalk(iObjIndex)
	local Ep = Make_QuestIndexIDToEP(RecvQuestIndexID)
	
	--DebugPrint('CGReqQuestProgress', 'Ep: ', Ep, 'RecvQuestIndexID: ', RecvQuestIndexID)

	if Ep == Ep1 then
		return Ep1_Tutorial(SelectSyntactic, iObjIndex)
	elseif Ep == Ep2 then
		return Ep2_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep3 then
		return Ep3_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep4 then
		return Ep4_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep5 then
		return Ep5_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep6 then
		return Ep6_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep7 then
		return Ep7_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep8 then
		return Ep8_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep9 then
		return Ep9_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep10 then
		return Ep10_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep11 then
		return Ep11_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep12 then
		return Ep12_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep13 then
		return Ep13_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep13 then
		return Ep13_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep14 then
		return Ep14_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep15 then
		return Ep15_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep16 then
		return Ep16_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep17 then
		return Ep17_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep18 then
		return Ep18_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep19 then
		return Ep19_Progress(SelectSyntactic, iObjIndex)
	elseif Ep == Ep20 then
		return Ep20_Progress(SelectSyntactic, iObjIndex)
	end
end
--================================================================================================================
--[0xF6][0x0D] Quest completion request
function CGReqQuestComplete(RecvQuestIndexID, iObjIndex)

	local Ep = Make_QuestIndexIDToEP(RecvQuestIndexID)

	if Ep == Ep1 then
		Ep1_TutorialComplete(iObjIndex)
	elseif Ep == Ep2 then
		Ep2_Complete(iObjIndex)
	elseif Ep == Ep3 then
		Ep3_Complete(iObjIndex)
	elseif Ep == Ep4 then
		Ep4_Complete(iObjIndex)
	elseif Ep == Ep5 then
		Ep5_Complete(iObjIndex)
	elseif Ep == Ep6 then
		Ep6_Complete(iObjIndex)
	elseif Ep == Ep7 then
		Ep7_Complete(iObjIndex)
	elseif Ep == Ep8 then
		Ep8_Complete(iObjIndex)
	elseif Ep == Ep9 then
		Ep9_Complete(iObjIndex)
	elseif Ep == Ep10 then
		Ep10_Complete(iObjIndex)
	elseif Ep == Ep11 then
		Ep11_Complete(iObjIndex)
	elseif Ep == Ep12 then
		Ep12_Complete(iObjIndex)
	elseif Ep == Ep13 then
		Ep13_Complete(iObjIndex)
	elseif Ep == Ep14 then
		Ep14_Complete(iObjIndex)
	elseif Ep == Ep15 then
		Ep15_Complete(iObjIndex)
	elseif Ep == Ep16 then
		Ep16_Complete(iObjIndex)
	elseif Ep == Ep17 then
		Ep17_Complete(iObjIndex)
	elseif Ep == Ep18 then
		Ep18_Complete(iObjIndex)
	elseif Ep == Ep19 then
		Ep19_Complete(iObjIndex)
	elseif Ep == Ep20 then
		Ep20_Complete(iObjIndex)
	end
end
--================================================================================================================
--When abandoning quest (name change prohibited)
function QuestGiveUp(iObjIndex, Ep, QS)
	local UserLv = LuaQuestClass.GetUserLv(iObjIndex)
	if Ep == Ep1 then
		EP1_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep2 then
			EP2_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep3 then
			EP3_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep4 then
			EP4_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep5 then
			EP5_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep6 then
			EP6_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep7 then
			EP7_GiveUp_Level_check(iObjIndex, Ep, QS)
	end 

	if Ep == Ep8 then
			EP8_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep9 then
			EP9_GiveUp_Level_check(iObjIndex, Ep, QS)
	end 
	
	if Ep == Ep10 then
			EP10_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	
	if Ep == Ep11 then
			EP11_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	
	if Ep == Ep12 then
			EP12_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	
	if Ep == Ep15 then
			EP15_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	
	if Ep == Ep16 then
			EP16_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	if Ep == Ep17 then
			EP17_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
	
	if Ep == Ep18 then
			EP18_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep19 then
			EP19_GiveUp_Level_check(iObjIndex, Ep, QS)
	end

	if Ep == Ep20 then
			EP20_GiveUp_Level_check(iObjIndex, Ep, QS)
	end
end
--================================================================================================================