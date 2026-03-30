--[[
--[[
Quest_Ep1.lua
[ Start  ]  2009.08.
[ Latest ]  2009-08-26 04:31 PM
[ Version ] 0.0.0.0
[ Text ]                                    
[ Desc ]                                    
--]]

QuestInclude("Quest_Define.lua")

function Ep1_Tutorial(SelectSyntactic, objIndex)


	

	local QS = LuaQuestClass.GetQuestSwitch(Ep1, objIndex)
	local NpcIndex = LuaQuestClass.GetNpcIndex(objIndex)
	
	--[[
	--If 5 or more, it is a quest received from an NPC.
	if QS > 4 then
		if NpcIndex ~= NPC_SHADOW_PHANTOM then
			return
		end
	end
	--]]
	--DebugPrint('Ep1', 'qs = ', QS, 'SelectSyntactic = ' , SelectSyntactic)
	
	if QS == 0 then
		--Accept 
		if SelectSyntactic == 1 then
			--Print('2', 'qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			LuaQuestClass.SendQuestProgress(Ep1, 1, objIndex)--Send QS to the client.
			return
		end
	end
	
	if QS == 1 then
		if SelectSyntactic == 1 then-- Keep listening.
			LuaQuestClass.SendQuestProgress(Ep1, 2, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- Decline.
			LuaQuestClass.SendQuestProgress(Ep1, 3, objIndex)-- 
			return
		end
	end
		
	if QS == 3 then-- Tutorial re-confirmation
		if SelectSyntactic == 1 then-- Decline.
			LuaQuestClass.SendQuestProgress(Ep1, 4, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Participate.
			LuaQuestClass.SendQuestProgress(Ep1, 2, objIndex)-- 
			return
		end
	end
	
	if QS == 5 or QS == 91 or QS == 92 then
		if SelectSyntactic == 1 then-- Who are you?
			LuaQuestClass.SendQuestProgress(Ep1, 6, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Let's start.
			LuaQuestClass.SendQuestProgress(Ep1, 9, objIndex)-- 
			return
		end
	end
	
	if QS == 6 then
		if SelectSyntactic == 1 then-- Why here?
			LuaQuestClass.SendQuestProgress(Ep1, 7, objIndex)-- 
			return
		end
	end
	
	if QS == 7 then
		if SelectSyntactic == 1 then-- What is training?
			LuaQuestClass.SendQuestProgress(Ep1, 8, objIndex)-- 
			return
		end
	end
	
	if QS == 8 then
		if SelectSyntactic == 1 then-- Let's start.
			LuaQuestClass.SendQuestProgress(Ep1, 9, objIndex)-- 
			return
		end
	end
	
	if QS == 10 then
		if SelectSyntactic == 1 then-- Explain more.
			LuaQuestClass.SendQuestProgress(Ep1, 11, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Understood.
			LuaQuestClass.SendQuestProgress(Ep1, 15, objIndex)-- 
			return
		end
	end
	
	if QS == 11 then
		if SelectSyntactic == 1 then-- EXP
			LuaQuestClass.SendQuestProgress(Ep1, 12, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Server
			LuaQuestClass.SendQuestProgress(Ep1, 13, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Points
			LuaQuestClass.SendQuestProgress(Ep1, 14, objIndex)-- 
			return
		end
	end
	
	if QS == 12 then
		if SelectSyntactic == 1 then-- Server
			LuaQuestClass.SendQuestProgress(Ep1, 13, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Status
			LuaQuestClass.SendQuestProgress(Ep1, 14, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Understood.
			LuaQuestClass.SendQuestProgress(Ep1, 15, objIndex)-- 
			return
		end
	end
	
	if QS == 13 then
		if SelectSyntactic == 1 then-- EXP
			LuaQuestClass.SendQuestProgress(Ep1, 12, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Status
			LuaQuestClass.SendQuestProgress(Ep1, 14, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Understood.
			LuaQuestClass.SendQuestProgress(Ep1, 15, objIndex)-- 
			return
		end
	end
	
	if QS == 14 then
		if SelectSyntactic == 1 then-- EXP
			LuaQuestClass.SendQuestProgress(Ep1, 12, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Server
			LuaQuestClass.SendQuestProgress(Ep1, 13, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Understood.
			LuaQuestClass.SendQuestProgress(Ep1, 15, objIndex)-- 
			return
		end
	end
	
	if QS == 16 then
		if SelectSyntactic == 1 then-- Next.
			LuaQuestClass.SendQuestProgress(Ep1, 17, objIndex)-- 
			return
		end
	end
	
	if QS == 17 then
		if SelectSyntactic == 1 then-- Accept
			LuaQuestClass.SendQuestProgress(Ep1, 20, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Where is the merchant?
			LuaQuestClass.SendQuestProgress(Ep1, 18, objIndex)-- 
			return
		end
	end
	
	if QS == 18 then
		if SelectSyntactic == 1 then-- How to check coordinates?
			LuaQuestClass.SendQuestProgress(Ep1, 19, objIndex)-- 
			return
		end
	end
	
	if QS == 19 then
		if SelectSyntactic == 1 then-- Repeat mission.
			LuaQuestClass.SendQuestProgress(Ep1, 17, objIndex)-- 
			return
		end
	end
	
	if QS == 21 then
		if SelectSyntactic == 1 then-- Continue.
			LuaQuestClass.SendQuestProgress(Ep1, 22, objIndex)-- 
			return
		end
	end
	
	if QS == 22 then
		if SelectSyntactic == 1 then-- I'll go hunting.
			local CharClass = LuaQuestClass.GetCharClass(objIndex)
		
			if CharClass == CLASS_ELF then
				LuaQuestClass.SendQuestProgress(Ep1, 23, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_KNIGHT or CharClass == CLASS_WIZARD then
				LuaQuestClass.SendQuestProgress(Ep1, 24, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_SUMMONER then
				LuaQuestClass.SendQuestProgress(Ep1, 25, objIndex)-- 
				return
			end
		end
		if SelectSyntactic == 2 then-- Potion explanation.
			LuaQuestClass.SendQuestProgress(Ep1, 21, objIndex)-- 
			return
		end
	end
	
	if QS == 26 then
		if SelectSyntactic == 1 then-- That sounds good.
			LuaQuestClass.SendQuestProgress(Ep1, 27, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 32, objIndex)-- 
			return
		end
	end
	
	if QS == 27 then
		if SelectSyntactic == 1 then-- What is that?
			LuaQuestClass.SendQuestProgress(Ep1, 28, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 32, objIndex)-- 
			return
		end
	end
	
	if QS == 28 then-- Will you get a Town Return Scroll?
		if SelectSyntactic == 1 then-- Okay.
			LuaQuestClass.SendQuestProgress(Ep1, 29, objIndex)-- 
			return
		end
	end
	
	if QS == 30 then -- 
		if SelectSyntactic == 1 then-- How do I get it?
			LuaQuestClass.SendQuestProgress(Ep1, 31, objIndex)-- 
			return
		end
	end
	
	if QS == 32 then -- 
		if SelectSyntactic == 1 then-- I'll go hunting.
		
		local CharClass = LuaQuestClass.GetCharClass(objIndex)
		
			if CharClass == CLASS_ELF then
				LuaQuestClass.SendQuestProgress(Ep1, 33, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_KNIGHT or CharClass == CLASS_WIZARD then
				LuaQuestClass.SendQuestProgress(Ep1, 34, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_SUMMONER then
				LuaQuestClass.SendQuestProgress(Ep1, 35, objIndex)-- 
				return
			end
			return
		end
	end
	
	if QS == 36 then -- 
		if SelectSyntactic == 1 then-- Skill?
		
		local CharClass = LuaQuestClass.GetCharClass(objIndex)
		
			if CharClass == CLASS_ELF then
				LuaQuestClass.SendQuestProgress(Ep1, 39, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_KNIGHT  then
				LuaQuestClass.SendQuestProgress(Ep1, 49, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_WIZARD then
				LuaQuestClass.SendQuestProgress(Ep1, 54, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_SUMMONER then
				LuaQuestClass.SendQuestProgress(Ep1, 69, objIndex)-- 
				return
			end
			return
		end
		
		if SelectSyntactic == 2 then-- That's basic!
			LuaQuestClass.SendQuestProgress(Ep1, 60, objIndex)-- 
		end
		
	end
	
	if QS == 39 then
		if SelectSyntactic == 1 then-- Miyo.
			LuaQuestClass.SendQuestProgress(Ep1, 40, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Enyo.
			LuaQuestClass.SendQuestProgress(Ep1, 41, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Can't decide.
			LuaQuestClass.SendQuestProgress(Ep1, 48, objIndex)-- 
			return
		end
	end
	
	if QS == 44 then-- Skill registration (weapon)
		if SelectSyntactic == 1 then--Registration complete.
			LuaQuestClass.SendQuestProgress(Ep1, 46, objIndex)-- 
			return
		end
	end
	
	if QS == 45 then-- Skill registration (orb)
		if SelectSyntactic == 1 then--Registration complete.
			LuaQuestClass.SendQuestProgress(Ep1, 47, objIndex)-- 
			return
		end
	end
	
	if QS == 51 then-- Skill registration (weapon)
		if SelectSyntactic == 1 then--Registration complete.
			LuaQuestClass.SendQuestProgress(Ep1, 52, objIndex)-- 
			return
		end
	end
	
	if QS == 56 then-- Skill registration (book)
		if SelectSyntactic == 1 then--Registration complete.
			LuaQuestClass.SendQuestProgress(Ep1, 57, objIndex)-- 
			return
		end
	end
	
	if QS == 46 then
		if SelectSyntactic == 1 then-- Want to learn more.
			LuaQuestClass.SendQuestProgress(Ep1, 48, objIndex)-- 
			return
		end
	end
	
	if QS == 47 then
		if SelectSyntactic == 1 then-- Want to learn more.
			LuaQuestClass.SendQuestProgress(Ep1, 48, objIndex)-- 
			return
		end
	end
	
	if QS == 52 then
		if SelectSyntactic == 1 then-- Want to learn more.
			LuaQuestClass.SendQuestProgress(Ep1, 53, objIndex)-- 
			return
		end
	end
	
	if QS == 57 then
		if SelectSyntactic == 1 then-- Want to learn more.
		
		local CharClass = LuaQuestClass.GetCharClass(objIndex)
		
			if CharClass == CLASS_WIZARD then
				LuaQuestClass.SendQuestProgress(Ep1, 58, objIndex)-- 
				return
			end
			
			if CharClass == CLASS_SUMMONER then
				LuaQuestClass.SendQuestProgress(Ep1, 59, objIndex)-- 
				return
			end
		end
	end
	
	if QS == 48 then
		if SelectSyntactic == 1 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 60, objIndex)-- 
			return
		end
	end
	
	if QS == 53 then
		if SelectSyntactic == 1 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 60, objIndex)-- 
			return
		end
	end
	
	if QS == 58 then
		if SelectSyntactic == 1 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 60, objIndex)-- 
			return
		end
	end
	
	if QS == 59 then
		if SelectSyntactic == 1 then-- What's the next mission?
			LuaQuestClass.SendQuestProgress(Ep1, 60, objIndex)-- 
			return
		end
	end
	
	if QS == 60 then
		if SelectSyntactic == 1 then-- What is that?
			LuaQuestClass.SendQuestProgress(Ep1, 61, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Up to what level?
			LuaQuestClass.SendQuestProgress(Ep1, 62, objIndex)-- 
			return
		end
	end
	
	if QS == 61 then
		if SelectSyntactic == 1 then-- Up to what level?
			LuaQuestClass.SendQuestProgress(Ep1, 62, objIndex)-- 
			return
		end
	end
	
	if QS == 63 then
		if SelectSyntactic == 1 then-- Keep listening.
			LuaQuestClass.SendQuestProgress(Ep1, 64, objIndex)-- 
			return
		end
	end
	
	if QS == 64 then
		if SelectSyntactic == 1 then-- Join test.
			LuaQuestClass.SendQuestProgress(Ep1, 66, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Pass test.
			LuaQuestClass.SendQuestProgress(Ep1, 65, objIndex)-- 
			return
		end
	end
	
	if QS == 65 then
		if SelectSyntactic == 1 then-- Join test.
			LuaQuestClass.SendQuestProgress(Ep1, 66, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Pass test.
			LuaQuestClass.SendQuestProgress(Ep1, 84, objIndex)-- 
			return
		end
	end
	
	if QS == 66 then
		if SelectSyntactic == 1 then-- /trade
			LuaQuestClass.SendQuestProgress(Ep1, 67, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- /exchange
			LuaQuestClass.SendQuestProgress(Ep1, 68, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- /invite
			LuaQuestClass.SendQuestProgress(Ep1, 68, objIndex)-- 
			return
		end
	end
	
	if QS == 70 then
		if SelectSyntactic == 1 then-- /trade
			LuaQuestClass.SendQuestProgress(Ep1, 72, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- /exchange
			LuaQuestClass.SendQuestProgress(Ep1, 71, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- /invite
			LuaQuestClass.SendQuestProgress(Ep1, 72, objIndex)-- 
			return
		end
	end
	
	if QS == 73 then
		if SelectSyntactic == 1 then -- Shift
			LuaQuestClass.SendQuestProgress(Ep1, 75, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then -- Ctrl
			LuaQuestClass.SendQuestProgress(Ep1, 75, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then -- Tab
			LuaQuestClass.SendQuestProgress(Ep1, 74, objIndex)-- 
			return
		end
	end
	
	if QS == 76 then
		if SelectSyntactic == 1 then -- 30
			LuaQuestClass.SendQuestProgress(Ep1, 78, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then -- 50
			LuaQuestClass.SendQuestProgress(Ep1, 77, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then -- 75
			LuaQuestClass.SendQuestProgress(Ep1, 78, objIndex)-- 
			return
		end
	end
	
	if QS == 79 then
		if SelectSyntactic == 1 then -- 10/2000
			LuaQuestClass.SendQuestProgress(Ep1, 81, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then -- 30/3000
			LuaQuestClass.SendQuestProgress(Ep1, 80, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then -- 50/4000
			LuaQuestClass.SendQuestProgress(Ep1, 81, objIndex)-- 
			return
		end
	end
	
	if QS == 82 then
		if SelectSyntactic == 1 then-- Goblin.
			LuaQuestClass.SendQuestProgress(Ep1, 83, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Seed Master.
			LuaQuestClass.SendQuestProgress(Ep1, 84, objIndex)-- 
			return
		end
		if SelectSyntactic == 3 then-- Tamer.
			LuaQuestClass.SendQuestProgress(Ep1, 84, objIndex)-- 
			return
		end
	end
	
	if QS == 85 then
		if SelectSyntactic == 1 then-- What is that?
			LuaQuestClass.SendQuestProgress(Ep1, 86, objIndex)-- 
			return
		end
		if SelectSyntactic == 2 then-- Alright!
			LuaQuestClass.SendQuestProgress(Ep1, 90, objIndex)-- 
			return
		end
	end
	
	if QS == 86 then
		if SelectSyntactic == 1 then-- Keep listening.
			LuaQuestClass.SendQuestProgress(Ep1, 87, objIndex)-- 
			return
		end
	end
	
	if QS == 87 then
		if SelectSyntactic == 1 then-- Keep listening.
			LuaQuestClass.SendQuestProgress(Ep1, 88, objIndex)-- 
			return
		end
	end
	
	if QS == 88 then
		if SelectSyntactic == 1 then-- Keep listening.
			LuaQuestClass.SendQuestProgress(Ep1, 89, objIndex)-- 
			return
		end
	end
	
	if QS == 89 then
		if SelectSyntactic == 1 then-- Receive the ring.
			LuaQuestClass.SendQuestProgress(Ep1, 90, objIndex)-- 
			return
		end
	end
end


function Ep1_TutorialComplete(objIndex)


	
	local QS = LuaQuestClass.GetQuestSwitch(Ep1, objIndex)
	--Print('Ep1_TutorialComplete QS = ', QS ,'objIndex = ', objIndex)
	if QS == 2 then
	
		local CharClass = LuaQuestClass.GetCharClass(objIndex)
		
		if CharClass == CLASS_ELF then
			LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
			LuaQuestClass.SetQuestSwitch(Ep1, 5, objIndex)
			return
		end
		if CharClass == CLASS_KNIGHT or CharClass == CLASS_WIZARD then
			LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
			LuaQuestClass.SetQuestSwitch(Ep1, 91, objIndex)
			return
		end
		if CharClass == CLASS_SUMMONER then
			LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
			LuaQuestClass.SetQuestSwitch(Ep1, 92, objIndex)
			return
		end
		return
	end
	
	if QS == 4 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 255, objIndex)
		end
		return
	end
	
	if QS == 40 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 42, objIndex)
		end
		return
	end
	
	if QS == 41 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 43, objIndex)
		end
		return
	end
	
	if QS == 49 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 50, objIndex)
		end
		return
	end
	
	if QS == 54 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 55, objIndex)
		end
		return
	end
	
	if QS == 69 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 55, objIndex)
		end
		return
	end

	if QS == 68 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 70, objIndex)
		return
	end
	
	if QS == 67 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 70, objIndex)
		end
		return
	end
	
	if QS == 71 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 73, objIndex)
		end
		return
	end
	
	if QS == 72 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 73, objIndex)
		return
	end
	
	if QS == 74 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 76, objIndex)
		end
		return
	end
	
	if QS == 75 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 76, objIndex)
		return
	end
	
	if QS == 77 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 79, objIndex)
		end
		return
	end
	
	if QS == 78 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 79, objIndex)
		return
	end
	
	if QS == 80 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 82, objIndex)
		end
		return
	end
	
	if QS == 81 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 82, objIndex)
		return
	end
	
	if QS == 83 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 85, objIndex)
		end
		return
	end
	
	if QS == 84 then
		LuaQuestClass.SendQuestComplete(Ep1, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		LuaQuestClass.SetQuestSwitch(Ep1, 85, objIndex)
		return
	end
	
	if QS == 90 then
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SendQuestProgress(Ep1, 255, objIndex)
		end
		return
	end
	
	
	
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if QS == 20 then-- Bring 5 apples~~
		ItemType = 14 ItemIndex = 0 ItemLevel = 0 ItemSkill = 0 Opt = 0 ExOpt = 0
		local ItemCnt = LuaQuestClass.GetInvenItemFind(ItemType, ItemIndex, ItemLevel, ItemSkill, Opt, ExOpt, objIndex)

		if ItemCnt >= 5 then
			local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
			if Result == 1 then
				LuaQuestClass.SetQuestSwitch(Ep1, 21, objIndex)
			end
			
		end
		return
	end
	
	if QS == 29 then-- 1 Return Scroll
		ItemType = 14 ItemIndex = 10 ItemLevel = 0 ItemSkill = 0 Opt = 0 ExOpt = 0
		local ItemCnt = LuaQuestClass.GetInvenItemFind(ItemType, ItemIndex, ItemLevel, ItemSkill, Opt, ExOpt, objIndex)
		if ItemCnt >= 1 then
			local Result =  LuaQuestClass.SendQuestReward(Ep1, objIndex)--Check if return value is needed and item was given
			if Result == 1 then
				LuaQuestClass.SetQuestSwitch(Ep1, 32, objIndex)
				
			end
			--[[
			local NewServer = GetServerType();
			if NewServer = 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 30, objIndex)
			else
			LuaQuestClass.SetQuestSwitch(Ep1, 31, objIndex)
			end
			--]]
		end
		return
	end
	
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--From here, quest conditions are checked.
--//////////////////////////////////////////////////////////////////////////////////////////////////////

	local bComplete = LuaQuestClass.IsQuestComplete(Ep1, objIndex)
	
	if bComplete == false then
		return
	end
	
	
	if QS == 9 then
		--Print('SendQuestReward QS = ', QS)
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 10, objIndex)
		end
		return
	end
	
	if QS == 15 then-- Please press the i button
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 16, objIndex)
		end
		return      
	end
		
	if QS == 23 then--Kill 3 Hook Scorpions
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 26, objIndex)
		end
		return
	end
	
	if QS == 24 then--Kill 3 Budge Dragons
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 26, objIndex)
		end
		return
	end
	
	if QS == 25 then--Kill 3 Mutant Rabbits
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 26, objIndex)
		end
		return
	end
	
	if QS == 31 then--Receive attack/defense buff
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 32, objIndex)
		end
		return
	end
	
	if QS == 33 then--Kill 3 Beetles
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 36, objIndex)
		end
		return
	end
	
	if QS == 34 then--Kill 30 Hounds
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 36, objIndex)
		end
		return
	end
	
	if QS == 35 then--Kill 30 Corrupted Butterflies
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 36, objIndex)
		end
		return
	end
	
	if QS == 42 then--Learn Burst skill
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 44, objIndex)
		end
		return
	end
	
	if QS == 43 then--Goblin Summon skill
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 45, objIndex)
		end
		return
	end
	
	if QS == 50 then--Smash skill 
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 51, objIndex)
		end
		return
	end
	
	if QS == 55 then--Fireball
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 56, objIndex)
		end
		return
	end
	
	if QS == 62 then--Reach level 24.
		local Result = LuaQuestClass.SendQuestReward(Ep1, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep1, 63, objIndex)
		end
		return
	end
end
