--[[
--[[
Quest_Ep7.lua
[ Start  ]  2009.12.
[ Latest ]  2009-12-14 16:45 PM
[ Version ] 0.0.0.1
[ Text ]                                    
[ Desc ]                                    
--]]
QuestInclude("Quest_Define.lua")

function Ep7_Progress(SelectSyntactic, objIndex)


	local QS = LuaQuestClass.GetQuestSwitch(Ep7, objIndex)
	--Print('1', 'qs = ', QS, 'SelectSyntactic = ' , SelectSyntactic)
-- Inventory Expansion Quest (Warehouse Expansion Description)
	if QS == 0 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 1, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 1 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep7, 2, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Inventory Expansion Quest (Warehouse Expansion)
	if QS == 2 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 4, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep7, 3, objIndex)-- 
			return
		end
	end
-- Inventory Expansion Quest (1st Inventory Expansion Description)
	if QS == 5 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 6, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 6 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep7, 7, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Inventory Expansion Quest (1st Inventory Expansion)
	if QS == 7 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 9, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep7, 8, objIndex)-- 
			return
		end
	end
-- Inventory Expansion Quest (2nd Inventory Expansion Description)
	if QS == 10 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 11, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 11 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep7, 12, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Inventory Expansion Quest (2nd Inventory Expansion)
	if QS == 12 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 14, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep7, 13, objIndex)-- 
			return
		end
	end
-- Inventory Expansion Quest (Warehouse Expansion Description)
	if QS == 15 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 16, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
	if QS == 16 then
		if SelectSyntactic == 1 then-- I see.
			LuaQuestClass.SendQuestProgress(Ep7, 17, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
	end
-- Inventory Expansion Quest (Warehouse Expansion)
	if QS == 17 then
		if SelectSyntactic == 1 then-- What is it?
			LuaQuestClass.SendQuestProgress(Ep7, 19, objIndex)-- 
			--Print('qs = ', QS , 'SelectSyntactic = ', SelectSyntactic)
			return
		end
		if SelectSyntactic == 2 then-- I'm busy now.
			LuaQuestClass.SendQuestProgress(Ep7, 18, objIndex)-- 
			return
		end
	end

end

function Ep7_ChkCompleteQS(QS)

	if QS == 4 or QS == 9 or QS == 14 or QS == 19 then
		return 1
	end
	
	return 0
end

function Ep7_SendCompleteQS(QS, objIndex)

	local UserLv = LuaQuestClass.GetUserLv(objIndex)
	local CharClass = LuaQuestClass.GetCharClass(objIndex)

	if QS == 4 then
		ItemType = 14 ItemIndex = 164 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1  Opt = 0 ExOpt = 0--Ancient Statue
		LuaQuestClass.DeleteInvenItem(ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt, objIndex)--Ancient Statue
		LuaQuestClass.SetQuestSwitch(Ep7, 5, objIndex)
	elseif QS == 9 then
		ItemType = 14 ItemIndex = 165 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1  Opt = 0 ExOpt = 0--Magical Fabric
		LuaQuestClass.DeleteInvenItem(ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt, objIndex)--Magical Fabric
		LuaQuestClass.SetQuestSwitch(Ep7, 10, objIndex)
	elseif QS == 14 then
		ItemType = 14 ItemIndex = 166 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1  Opt = 0 ExOpt = 0--Spatial Fabric
		LuaQuestClass.DeleteInvenItem(ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt, objIndex)--Spatial Fabric
		LuaQuestClass.SetQuestSwitch(Ep7, 15, objIndex)
	elseif QS == 19 then
		ItemType = 14 ItemIndex = 164 ItemLevel = 0 ItemSkill = 0 ItemCnt = 1  Opt = 0 ExOpt = 0--Ancient Statue
		LuaQuestClass.DeleteInvenItem(ItemType, ItemIndex, ItemLevel, ItemSkill, ItemCnt, Opt, ExOpt, objIndex)--Ancient Statue
		LuaQuestClass.SetQuestSwitch(Ep7, 20, objIndex)
	end

	return
end



function Ep7_Complete(objIndex)

	local LimitLv = 400
	
	
	local QS = LuaQuestClass.GetQuestSwitch(Ep7, objIndex)
	
	if QS == 3 then
		LuaQuestClass.SetQuestSwitch(Ep7, 0, objIndex)
		LuaQuestClass.SendQuestComplete(Ep7, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif QS == 8 then
		LuaQuestClass.SetQuestSwitch(Ep7, 5, objIndex)
		LuaQuestClass.SendQuestComplete(Ep7, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 13 then
		LuaQuestClass.SetQuestSwitch(Ep7, 10, objIndex)
		LuaQuestClass.SendQuestComplete(Ep7, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	elseif  QS == 18 then
		LuaQuestClass.SetQuestSwitch(Ep7, 15, objIndex)
		LuaQuestClass.SendQuestComplete(Ep7, QS, objIndex)--When the confirm button is pressed without in-progress reward.
		return
	end 

	
	local bComplete = LuaQuestClass.IsQuestComplete(Ep7, objIndex)--Completion check
	
	if bComplete == false then
		return
	end
	
	local ChkCompleteQS = Ep7_ChkCompleteQS(QS)
	
	if ChkCompleteQS == 1 then
	
		local UserLv = LuaQuestClass.GetUserLv(objIndex)
		
		local Result = LuaQuestClass.SendQuestReward(Ep7, objIndex)
		if Result == 1 then
			Ep7_SendCompleteQS(QS, objIndex)
		end
	
		return
	end

end