--[[
--[[
Quest_Main.lua
[ Start  ]  2010.06.
[ Latest ]  2011-09-14 3:07 PM
[ Author ]  Kim Jeongmin
[ Version ] 0.0.0.2
[ Text ]    Added Master Skill Tree Reset Quest
[ Desc ]                                    
--]]
--Called from source. Function name must not be changed.
--================================================================================================================
function NpcTalkClick(NpcIndex, iObjIndex)
	local GensInfluence = LuaQuestClass.GetGensInfluence(iObjIndex)--Gens faction   
	--local LuaQuestClass = QuestExpLuaBind()   
	--local NpcIndex = g_QuestExpLuaBind:GetNpcIndex()
	--g_QuestExpLuaBind:SetiObjIndex(iObjIndex)
	-------------
	---- Test code
	--g_QuestExpLuaBind:AddQuestExpNpcTalk(Episode_1, 1)-- Quest to send to NPC
	--g_QuestExpLuaBind:SendQuestExpNpcTalk()
	--local iObjIndex = g_QuestExpLuaBind:GetiObjIndex()
	--g_QuestExpLuaBind:SendQuestToNPC(Episode_1, 1, iObjIndex)-- Quest to send to NPC
	--------------
	
	--If clicked NPC is a quest NPC 
	if NpcIndex == NPC_SHADOW_PHANTOM then
		return NpcTalk_ShadowPhantom(iObjIndex)
		
		--return AcceptQuestEp1(QuestSwitch)
	elseif NpcIndex == NPC_GENS_DUPRIAN then
		if GensInfluence == GENS_DUPRIAN then   
			return NpcTalk_GENS(iObjIndex)
		end
		return NpcTalk_GENS_Null(iObjIndex)
		
	elseif NpcIndex == NPC_GENS_VANERT then
		if GensInfluence == GENS_VANERT then    
			return NpcTalk_GENS(iObjIndex)
		end
		return NpcTalk_GENS_Null(iObjIndex)
		
	elseif NpcIndex == NPC_TERSIA then
		return NpcTalk_Tersia(iObjIndex)
		
	elseif NpcIndex == NPC_VAINA then
		return NpcTalk_Vaina(iObjIndex)
		
	elseif NpcIndex == NPC_ZAIRO then
		return NpcTalk_Zairo(iObjIndex)
		
	elseif NpcIndex == NPC_DERUBISH then
		return NpcTalk_Derubish(iObjIndex)
	end 
end
--================================================================================================================
function NpcTalk_ShadowPhantom(iObjIndex)-- First dialogue window handling 0x0A

	-- local LuaQuestClass = QuestExpLuaBind()
	-- LuaQuestClass:AddQuestExpNpcTalk(0, 1)-- Buff

	local ProgEp = 0

	local QS = LuaQuestClass.GetQuestSwitch(Ep1, iObjIndex)
	local CharClass = LuaQuestClass.GetCharClass(iObjIndex)

	if QS > 4 then
		LuaQuestClass.AddQuestExpNpcTalk(Ep1, QS)-- Quest to send to NPC
	end
	
	local UserLv = LuaQuestClass.GetUserLv(iObjIndex)


	Ep2_NPCTalkList(iObjIndex)-- Chaos Castle   quest
	Ep3_NPCTalkList(iObjIndex)-- Blood Castle   quest
	Ep4_NPCTalkList(iObjIndex)-- Devil Square   quest
	Ep5_NPCTalkList(iObjIndex)-- Illusion Temple entry quest
	Ep6_NPCTalkList(iObjIndex)-- World Tour     quest
	
	if QuestResetMasterSkill == 1 then
		Ep9_NPCTalkList(iObjIndex)-- Master Skill Tree Reset Quest (First)
		Ep10_NPCTalkList(iObjIndex)-- Master Skill Tree Reset Quest (Second)
		Ep11_NPCTalkList(iObjIndex)-- Master Skill Tree Reset Quest (Third)
		Ep12_NPCTalkList(iObjIndex)-- Master Skill Tree Reset Quest (Last)
	end
	
	if CharClass == CLASS_KNIGHT or CharClass == CLASS_WIZARD or CharClass == CLASS_ELF or CharClass == CLASS_SUMMONER then
		Ep15_NPCTalkList(iObjIndex)-- Item grant quest for 1st-level characters only
	end
	
	Ep18_NPCTalkList(iObjIndex)-- Repeatable Quest (1) level 1 ~ 259
	Ep19_NPCTalkList(iObjIndex)-- Repeatable Quest (2) level 260 ~ 349
	
	LuaQuestClass.SendQuestSwitchList(iObjIndex)-- Send to NPC.
end
--================================================================================================================
function NpcTalk_GENS(iObjIndex)

	Ep16_NPCTalkList(iObjIndex)
	Ep17_NPCTalkList(iObjIndex)
	Ep20_NPC_Gen_TalkList(iObjIndex)-- 1st daily quest (Mon?, Mon?) information transfer
	
	LuaQuestClass.SendQuestSwitchList(iObjIndex)-- Send to NPC.
	
end
--================================================================================================================
-- When giving a quest with nothing
-- NPC Talk must be given.
function NpcTalk_GENS_Null(iObjIndex)

	LuaQuestClass.SendQuestSwitchList(iObjIndex)--Send to NPC.
	
end
--================================================================================================================
function NpcTalk_Tersia(iObjIndex)

	Ep20_NPC_Tersia_TalkList(iObjIndex)-- 1st daily quest (mission acceptance) information transfer
	
	LuaQuestClass.SendQuestSwitchList(iObjIndex)--Send to NPC.
	
end
--================================================================================================================
function NpcTalk_Vaina(iObjIndex)

	Ep20_NPC_Vaina_TalkList(iObjIndex)
	
	LuaQuestClass.SendQuestSwitchList(iObjIndex)--Send to NPC.
	
end
--================================================================================================================
function NpcTalk_Zairo(iObjIndex)

	Ep7_NPCTalkList(iObjIndex)
	Ep20_NPC_Zairo_TalkList(iObjIndex)
	
	LuaQuestClass.SendQuestSwitchList(iObjIndex)--Send to NPC.
	
end
--================================================================================================================
function NpcTalk_Derubish(iObjIndex)

	Ep8_NPC_Derubish_TalkList(iObjIndex)-- Acheron quest information transfer
	Ep20_NPC_Derubish_TalkList(iObjIndex)-- 2nd daily quest (Thu, Mon?) information transfer
	LuaQuestClass.SendQuestSwitchList(iObjIndex)--Send to NPC.
	
end
--================================================================================================================