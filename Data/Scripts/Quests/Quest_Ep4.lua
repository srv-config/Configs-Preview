--[[
--[[
Quest_Ep4.lua
[ Start  ]  2009.12.
[ Latest ]  2009-12-14 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]
QuestInclude("Quest_Define.lua")

function Ep4_Progress(SelectSyntactic, objIndex)


	local QS = LuaQuestClass.GetQuestSwitch(Ep4, objIndex)
	--Print('1', 'qs = ', QS, 'SelectSyntactic = ' , SelectSyntactic)
-- Devil Square Zone 1: 1st Chain Quest
	if QS == 0 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 2, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 1, objIndex)-- 
			return
		end
	end
-- Devil Square description 
	if QS == 2 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 3, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	
	if QS == 3 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 4, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end

	if QS == 4 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 5, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end

	if QS == 5 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 6, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 6 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 7, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 7 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 8, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Devil Square Zone 1: 2nd Chain Quest
	if QS == 9 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 11, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 10, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 1: 3rd Chain Quest
	if QS == 12 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 14, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 13, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 1: 4th Chain Quest
	if QS == 15 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 17, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 16, objIndex)-- 
			return
		end
	end

-- Devil Square Zone 2: 1st Chain Quest
	if QS == 18 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 20, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 19, objIndex)-- 
			return
		end
	end
-- Devil Square description 

	if QS == 20 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 21, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end

	if QS == 21 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 22, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 22 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 23, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 23 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 24, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 24 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 25, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 25 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep4, 26, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Devil Square Zone 2: 2nd Chain Quest
	if QS == 27 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 29, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 28, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 2: 3rd Chain Quest
	if QS == 30 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 32, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 31, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 2: 4th Chain Quest
	if QS == 33 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 35, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 34, objIndex)-- 
			return
		end
	end

-- Devil Square Zone 3: 1st Chain Quest
	if QS == 36 then
		if SelectSyntactic == 1 then-- Got it.
			LuaQuestClass.SendQuestProgress(Ep4, 37, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end

	end
	if QS == 37 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 39, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 38, objIndex)-- 
			return
		end

	end
-- Devil Square Zone 3: 2nd Chain Quest
	if QS == 40 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 42, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 41, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 3: 3rd Chain Quest
	if QS == 43 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 45, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 44, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 4: 1st Chain Quest
	if QS == 46 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 48, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 47, objIndex)-- 
			return
		end

	end
-- Devil Square Zone 4: 2nd Chain Quest
	if QS == 49 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 51, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 50, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 4: 3rd Chain Quest
	if QS == 52 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 54, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 53, objIndex)-- 
			return
		end
	end

-- Devil Square Zone 5: 1st Chain Quest
	if QS == 55 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 57, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 56, objIndex)-- 
			return
		end

	end
-- Devil Square Zone 5: 2nd Chain Quest
	if QS == 58 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 60, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 59, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 5: 3rd Chain Quest
	if QS == 61 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 63, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 62, objIndex)-- 
			return
		end
	end

-- Devil Square Zone 6: 1st Chain Quest
	if QS == 64 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 66, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 65, objIndex)-- 
			return
		end

	end
-- Devil Square Zone 6: 2nd Chain Quest
	if QS == 67 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 69, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 68, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 6: 3rd Chain Quest
	if QS == 70 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 72, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 71, objIndex)-- 
			return
		end
	end
	
-- Devil Square Zone 7: 1st Chain Quest
	if QS == 73 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 75, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 74, objIndex)-- 
			return
		end

	end
-- Devil Square Zone 7: 2nd Chain Quest
	if QS == 76 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 78, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 77, objIndex)-- 
			return
		end
	end
-- Devil Square Zone 7: 3rd Chain Quest
	if QS == 79 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep4, 81, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep4, 80, objIndex)-- 
			return
		end
	end
end

function Ep4_ChkCompleteQS(QS)

	if QS == 11 or QS == 14 or QS == 17 
	or QS == 29 or QS == 32 or QS == 35 
	or QS == 39 or QS == 42 or QS == 45
	or QS == 48 or QS == 51 or QS == 54
	or QS == 57 or QS == 60 or QS == 63
	or QS == 66 or QS == 69 or QS == 72
	or QS == 75 or QS == 78 or QS == 81 then
		return 1
	end
	
	return 0
end

function Ep4_SendCompleteQS(QS, objIndex)



	if QS == 11 then
		LuaQuestClass.SetQuestSwitch(Ep4, 12, objIndex)
	elseif QS == 14 then 
		LuaQuestClass.SetQuestSwitch(Ep4, 15, objIndex)
	elseif QS == 17 then
		LuaQuestClass.SetQuestSwitch(Ep4, 18, objIndex)
	elseif QS == 29 then
		LuaQuestClass.SetQuestSwitch(Ep4, 30, objIndex)
	elseif QS == 32 then
		LuaQuestClass.SetQuestSwitch(Ep4, 33, objIndex)
	elseif QS == 35 then
		LuaQuestClass.SetQuestSwitch(Ep4, 36, objIndex)
	elseif QS == 39 then
		LuaQuestClass.SetQuestSwitch(Ep4, 40, objIndex)
	elseif QS == 42 then
		LuaQuestClass.SetQuestSwitch(Ep4, 43, objIndex)
	elseif QS == 45 then
		LuaQuestClass.SetQuestSwitch(Ep4, 46, objIndex)
	elseif QS == 48 then
		LuaQuestClass.SetQuestSwitch(Ep4, 49, objIndex)
	elseif QS == 51 then
		LuaQuestClass.SetQuestSwitch(Ep4, 52, objIndex)
	elseif QS == 54 then
		LuaQuestClass.SetQuestSwitch(Ep4, 55, objIndex)
	elseif QS == 57 then
		LuaQuestClass.SetQuestSwitch(Ep4, 58, objIndex)
	elseif QS == 60 then
		LuaQuestClass.SetQuestSwitch(Ep4, 61, objIndex)
	elseif QS == 63 then
		LuaQuestClass.SetQuestSwitch(Ep4, 64, objIndex)
	elseif QS == 66 then
		LuaQuestClass.SetQuestSwitch(Ep4, 67, objIndex)
	elseif QS == 69 then
		LuaQuestClass.SetQuestSwitch(Ep4, 70, objIndex)
	elseif QS == 72 then
		LuaQuestClass.SetQuestSwitch(Ep4, 73, objIndex)
	elseif QS == 75 then
		LuaQuestClass.SetQuestSwitch(Ep4, 76, objIndex)
	elseif QS == 78 then
		LuaQuestClass.SetQuestSwitch(Ep4, 79, objIndex)
	elseif QS == 81 then
		LuaQuestClass.SetQuestSwitch(Ep4, 82, objIndex)
	end

	return
end



function Ep4_Complete(objIndex)

	local LimitLv = 400
	
	
	local QS = LuaQuestClass.GetQuestSwitch(Ep4, objIndex)
	
	if QS == 1 then
		LuaQuestClass.SetQuestSwitch(Ep4, 9, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif QS == 10 then
		LuaQuestClass.SetQuestSwitch(Ep4, 9, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 13 then
		LuaQuestClass.SetQuestSwitch(Ep4, 12, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 16 then
		LuaQuestClass.SetQuestSwitch(Ep4, 15, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 19 then
		LuaQuestClass.SetQuestSwitch(Ep4, 27, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 28 then
		LuaQuestClass.SetQuestSwitch(Ep4, 27, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 31 then
		LuaQuestClass.SetQuestSwitch(Ep4, 30, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 34 then
		LuaQuestClass.SetQuestSwitch(Ep4, 33, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 38 then
		LuaQuestClass.SetQuestSwitch(Ep4, 37, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 41 then
		LuaQuestClass.SetQuestSwitch(Ep4, 40, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 44 then
		LuaQuestClass.SetQuestSwitch(Ep4, 43, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 47 then
		LuaQuestClass.SetQuestSwitch(Ep4, 46, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 50 then
		LuaQuestClass.SetQuestSwitch(Ep4, 49, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 53 then
		LuaQuestClass.SetQuestSwitch(Ep4, 52, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 56 then
		LuaQuestClass.SetQuestSwitch(Ep4, 55, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 59 then
		LuaQuestClass.SetQuestSwitch(Ep4, 58, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 62 then
		LuaQuestClass.SetQuestSwitch(Ep4, 61, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 65 then
		LuaQuestClass.SetQuestSwitch(Ep4, 64, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 68 then
		LuaQuestClass.SetQuestSwitch(Ep4, 67, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 71 then
		LuaQuestClass.SetQuestSwitch(Ep4, 70, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 74 then
		LuaQuestClass.SetQuestSwitch(Ep4, 73, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 77 then
		LuaQuestClass.SetQuestSwitch(Ep4, 76, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 80 then
		LuaQuestClass.SetQuestSwitch(Ep4, 79, objIndex)
		LuaQuestClass.SendQuestComplete(Ep4, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	end 

	if QS == 8 then
		local Result = LuaQuestClass.SendQuestReward(Ep4, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep4, 9, objIndex)
		end
		return
	elseif QS == 26 then
		local Result = LuaQuestClass.SendQuestReward(Ep4, objIndex)
		if Result == 1 then
			LuaQuestClass.SetQuestSwitch(Ep4, 27, objIndex)
		end
		return
	end 
	
	local bComplete = LuaQuestClass.IsQuestComplete(Ep4, objIndex)--Completion check
	
	if bComplete == false then
		return
	end
	
	local ChkCompleteQS = Ep4_ChkCompleteQS(QS)
	
	if ChkCompleteQS == 1 then
	
		local UserLv = LuaQuestClass.GetUserLv(objIndex)
		
		if UserLv <= LimitLv then
			local Result = LuaQuestClass.SendQuestReward(Ep4, objIndex)
			if Result == 1 then
				Ep4_SendCompleteQS(QS, objIndex)
			end
			return
		elseif UserLv > LimitLv then
			local Result = LuaQuestClass.SendQuestReward(Ep4, objIndex)
			if Result == 1 then
				Ep4_SendCompleteQS(QS, objIndex)
				LuaQuestClass.SetQuestSwitch(Ep4, 82, objIndex)
			end

			return
		end
		
		return
	end

end