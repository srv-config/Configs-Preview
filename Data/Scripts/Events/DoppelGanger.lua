
--//////////////////////////////////////////////////////////////////////////////
-- Doppelganger map information initializations
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaDopplegangerInit()
	-- Preparation time (minutes)
	classDoppelgangerLua.LuaSetReadyTime(1)
	-- processing time (minutes)
	classDoppelgangerLua.LuaSetPlayTime(10)
	-- Time to receive award (minutes)
	classDoppelgangerLua.LuaSetEndTime(1)
end


--//////////////////////////////////////////////////////////////////////////////
-- Callback - invoked periodically
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaDoppelgangerCallback(nCurTime)
	-- Current time
	--local nCurTime            = classDoppelgangerLua:LuaGetLocalTime()

	-- Event Start time
	local nStateTime        = classDoppelgangerLua.LuaGetStateTime()
	-- Time after last cycle (milliseconds)
	local nPlayTime         = (nCurTime - nStateTime) / 1000
	-- Monster Appearance time
	local nAddHerdMonsterTime = nCurTime
	--local nAddBossMonsterTime = nCurTime
	-- Ice Walker appearance
	local bIceWorkerRegen   = 0

	nAddHerdMonsterTime     = classDoppelgangerLua.LuaGetAddHerdMonsterTime()
	--nAddBossMonsterTime   = classDoppelgangerLua:LuaGetAddBossMonsterTime()
	local nBossRegenOrder   = classDoppelgangerLua.LuaGetBossRegenOrder()

	-- Map Number
	local nMapNumber = classDoppelgangerLua.LuaGetMapNumber()

	local nHerdIndex = -1

	-- Generate bunch of monsters
	if (nCurTime - nAddHerdMonsterTime) >= 3 * 1000 then

		-- Obtain Monster indexes
		nHerdIndex = classDoppelgangerLua.LuaGetMonsterHerdIndex()
		if nHerdIndex == -1 then
			return
		end

		-- Monster bunch Set Start Position
		classDoppelgangerLua.LuaSetHerdStartPosInfo(nHerdIndex, 0, 1)
		-- Monster bunch Set Exit Position
		classDoppelgangerLua.LuaSetHerdEndPosInfo(nHerdIndex, 0)

		-- Add bunch of monsters
		FN_LuaAddHerdMonster(nCurTime, nStateTime, nHerdIndex)

		-- Slaughterer that entered the destination without dying is respawned
		local nKillerBossState = classDoppelgangerLua.LuaGetBossMonsterState()
		if nKillerBossState == 3 then
			FN_LuaAddMiddleBossMonster(nCurTime, nStateTime, nHerdIndex, 0)
		end

		-- Enraged Slaughterer that entered the destination without dying is respawned
		local nAngerKillerBossState = classDoppelgangerLua.LuaGetLastBossMonsterState()
		if nAngerKillerBossState == 3 then
			FN_LuaAddLastBossMonster(nCurTime, nStateTime, nHerdIndex, 0)
		end

		-- Horde monster spawn time saved
		classDoppelgangerLua.LuaSetAddHerdMonsterTime(nCurTime)

	end

	-- Return if horde number was not received
	if nHerdIndex == -1 then
		return
	end

	--DebugPrint('nBossRegenOrder', nBossRegenOrder)

	-- Boss-level monster spawn
	if nBossRegenOrder == 0 and nPlayTime >= 1 * 60 then
		-- After 1 minute
		classDoppelgangerLua.LuaSetBossMonsterState(1)
		FN_LuaAddMiddleBossMonster(nCurTime, nStateTime, nHerdIndex, 1)
		classDoppelgangerLua.LuaSetBossRegenOrder(nBossRegenOrder+1)
	elseif nBossRegenOrder == 1 and nPlayTime >= 4 * 60 then
		-- After 4 minutes
		classDoppelgangerLua.LuaSetBossMonsterState(1)
		FN_LuaAddMiddleBossMonster(nCurTime, nStateTime, nHerdIndex, 1)
		classDoppelgangerLua.LuaSetBossRegenOrder(nBossRegenOrder+1)
	elseif nBossRegenOrder == 2 and nPlayTime >= 6 * 60 - 5 then
		-- After 6 minutes, spawn Ice Walker
		bIceWorkerRegen = 1
		classDoppelgangerLua.LuaSetBossRegenOrder(nBossRegenOrder+1)
	elseif nBossRegenOrder == 3 and nPlayTime >= 7 * 60 then
		-- After 7 minutes
		classDoppelgangerLua.LuaSetLastBossMonsterState(1)
		FN_LuaAddLastBossMonster(nCurTime, nStateTime, nHerdIndex, 1)
		classDoppelgangerLua.LuaSetBossRegenOrder(nBossRegenOrder+1)
	end


	-- Actually move the horde monsters
	classDoppelgangerLua.LuaMonsterHerdStart(nHerdIndex)

	-- Ice Walker spawn is here
	if bIceWorkerRegen == 1 then
		-- Get horde monster index
		local nHerdIndex = classDoppelgangerLua.LuaGetMonsterHerdIndex()
		if nHerdIndex == -1 then
			return
		end

		-- Set position
		local nPosInfo = classDoppelgangerLua.LuaGetRandomValue(16) + 3
		-- Set horde monster start position
		classDoppelgangerLua.LuaSetHerdStartPosInfo(nHerdIndex, nPosInfo, 0)
		-- Set horde monster end position
		classDoppelgangerLua.LuaSetHerdEndPosInfo(nHerdIndex, nPosInfo)

		-- Ice Walker Regen Notification
		classDoppelgangerLua.LuaIceworkerRegen(nPosInfo)

		-- Ice Walker Regen
		FN_LuaAddIceWorkerMonster(nCurTime, nStateTime, nHerdIndex)

		-- Actually move the horde monsters
		classDoppelgangerLua.LuaMonsterHerdStart(nHerdIndex)

		bIceWorkerRegen = 0
	end

end

--//////////////////////////////////////////////////////////////////////////////
-- Add Regular Monsters
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaAddHerdMonster(nCurTime, nStateTime, nHerdIndex)
	-- bring the highest level
	--local nMaxUserLevel   = classDoppelgangerLua:LuaGetMaxUserLevel()
	-- Calculate Monster HP basing on Player Level
	--local nMonsterHp = nMaxUserLevel --* 10
	-- Time after last cycle (milliseconds)
	local nPlayTime = nCurTime - nStateTime
	-- Map Number
	local nMapNumber = classDoppelgangerLua.LuaGetMapNumber()

	--Monster Attack (Minimum Damage) = nMonsterAtt * 0.8)
	--local nMonsterAtt     = nMaxUserLevel + 100
	-- Monster Defense
	--local nMonsterDef     = nMaxUserLevel + 100

	-- Set number of monsters
	local nMonsterCount = 1

	if nPlayTime < 3 * 60 * 1000 then
		nMonsterCount = 1
	elseif nPlayTime < 6 * 60 * 1000  then
		nMonsterCount = 2
	else
		nMonsterCount = 3
	end

	nMonsterCount = nMonsterCount + classDoppelgangerLua.LuaGetUserCount() - 1

	-- nMonsterCount Added by Monster
	for cnt = 0, nMonsterCount-1 do
		local nMonsterIndex = 533 + classDoppelgangerLua.LuaGetRandomValue(6)
		--local nMonsterIndex = 531 + classDoppelgangerLua:LuaGetRandomValue(9)
		--local nMonsterIndex = 530
		local nAttackFirst  = 0

		if classDoppelgangerLua.LuaGetRandomValue(1000) < 700 then
		--if classDoppelgangerLua:LuaGetRandomValue(10000) < 1000 then
			nAttackFirst = 1
		end

		-- Set Monster to attack first (suicide)
		if nMonsterIndex == 533 then
			nAttackFirst = 1
		end

		-- If Dark Lord then change to Magic Gladiator
		if nMonsterIndex == 538 then
			nMonsterIndex = 539
		end

		classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)
	end
end

--//////////////////////////////////////////////////////////////////////////////
-- Add Middle Boss Monster
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaAddMiddleBossMonster(nCurTime, nStateTime, nHerdIndex, nFlag)
	-- bring the highest level
	--local nMaxUserLevel   = classDoppelgangerLua:LuaGetMaxUserLevel()
	-- Calculate Monster HP basing on Player Level
	--local nMonsterHp = nMaxUserLevel --* 10
	-- Time after last cycle (milliseconds)
	local nPlayTime = nCurTime - nStateTime
	-- Map Number
	local nMapNumber = classDoppelgangerLua.LuaGetMapNumber()

	-- Monster Attack (Minimum Damage) = nMonsterAtt * 0.8)
	--local nMonsterAtt     = nMaxUserLevel + 100
	-- Monster Defense
	--local nMonsterDef     = nMaxUserLevel + 100

	local nMonsterIndex = 530   -- Butcher
	local nAttackFirst  = 0
	classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)

	if nFlag == 1 then
		nMonsterIndex   = 538   -- Dark Lord
		nAttackFirst    = 1
		classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)
	end
end

--//////////////////////////////////////////////////////////////////////////////
-- Add Final Boss Monster
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaAddLastBossMonster(nCurTime, nStateTime, nHerdIndex, nFlag)
	-- bring the highest level
	--local nMaxUserLevel   = classDoppelgangerLua:LuaGetMaxUserLevel()
	-- Calculate Monster HP basing on Player Level
	--local nMonsterHp = nMaxUserLevel --* 10
	-- Time after last cycle (milliseconds)
	local nPlayTime = nCurTime - nStateTime
	-- Map Number
	local nMapNumber = classDoppelgangerLua.LuaGetMapNumber()

	-- Monster Attack (Minimum Damage) = nMonsterAtt * 0.8)
	--local nMonsterAtt     = nMaxUserLevel + 100
	-- Monster Defense
	--local nMonsterDef     = nMaxUserLevel + 100

	local nMonsterIndex = 529   -- Butcher
	local nAttackFirst  = 0
	classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)

	if nFlag == 1 then
		nMonsterIndex   = 538   -- Dark Lord
		nAttackFirst    = 1
		classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)
	end
end

--//////////////////////////////////////////////////////////////////////////////
-- Ice Walker Add rule
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaAddIceWorkerMonster(ncurTime, nStateTime, nHerdIndex)
	-- bring the highest level
	--local nMaxUserLevel   = classDoppelgangerLua:LuaGetMaxUserLevel()
	-- Calculate Monster HP basing on Player Level
	--local nMonsterHp = nMaxUserLevel * 10

	-- Monster Attack (Minimum Damage) = nMonsterAtt * 0.8)
	--local nMonsterAtt     = nMaxUserLevel + 100
	-- Monster Defense
	--local nMonsterDef     = nMaxUserLevel + 100

	local nMonsterIndex = 531   -- Ice Walker
	local nAttackFirst  = 1

	local nMonsterCount = classDoppelgangerLua.LuaGetUserCount()
	for cnt = 0, nMonsterCount-1 do
		classDoppelgangerLua.LuaAddMonsterHerd(nHerdIndex, nMonsterIndex, nAttackFirst)
	end
end

--//////////////////////////////////////////////////////////////////////////////
-- Get Start position of the monsters
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaGetStartPosition(nMapNumber)
	local StartPosX = nil
	local StartPosY = nil

	if nMapNumber == 65 then
		StartPosX = 225
		StartPosY = 101
	elseif nMapNumber == 66 then
		StartPosX = 114
		StartPosY = 181
	elseif nMapNumber ==67 then
		StartPosX = 110
		StartPosY = 151
	elseif nMapNumber == 68 then
		StartPosX = 43
		StartPosY = 109
	end

	return StartPosX, StartPosY
end

--//////////////////////////////////////////////////////////////////////////////
-- Get End position of the monsters
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaGetEndPosition(nMapNumber)
	local EndPosX = nil
	local EndPosY = nil

	if nMapNumber == 65 then
		EndPosX = 210
		EndPosY = 64
	elseif nMapNumber == 66 then
		EndPosX = 125
		EndPosY = 124
	elseif nMapNumber == 67 then
		EndPosX = 108
		EndPosY = 104
	elseif nMapNumber == 68 then
		EndPosX = 74
		EndPosY = 53
	end

	return EndPosX, EndPosY
end

--//////////////////////////////////////////////////////////////////////////////
-- Get the start position of the Ice Walker
--//////////////////////////////////////////////////////////////////////////////
function FN_LuaGetIceWorkerStartPos(nMapNumber)
	local StartPosX = nil
	local StartPosY = nil

	if nMapNumber == 65 then
		StartPosX = 210
		StartPosY = 64
	elseif nMapNumber == 66 then
		StartPosX = 125
		StartPosY = 124
	elseif nMapNumber ==67 then
		StartPosX = 108
		StartPosY = 104
	elseif nMapNumber == 68 then
		StartPosX = 74
		StartPosY = 53
	end

	return StartPosX, StartPosY
end
