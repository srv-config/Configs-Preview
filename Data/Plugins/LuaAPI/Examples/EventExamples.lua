--═══════════════════════════════════════════════════════════════
-- Event System Examples
--═══════════════════════════════════════════════════════════════
-- State is tracked in Lua-side tables, not as custom fields on C++ objects.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Boss Event
------------------------------------------------------------------

-- Check map is clear and enough eligible players, then mark event start
function PrepareBossEvent(eventMap, minPlayers, minLevel)
	local monsterCount = Object.CountMonstersOnMap(eventMap)
	if monsterCount > 0 then
		Log.Add(string.format("[Boss Event] Map %d not clear (%d monsters)", eventMap, monsterCount))
		return false
	end

	local eligible = Object.CountPlayersOnMap(eventMap, function(oPlayer)
		return oPlayer.Level >= minLevel
	end)

	if eligible < minPlayers then
		Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
			Message.Send(0, oPlayer.Index, 0,
				string.format("Need %d players level %d+ (have %d)", minPlayers, minLevel, eligible))
			return true
		end)
		return false
	end

	Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
		Message.Send(0, oPlayer.Index, 2, "Boss Event Starting in 10 seconds!")
		return true
	end)

	Log.Add(string.format("[Boss Event] Starting on map %d with %d eligible players",
		eventMap, eligible))
	return true
end

-- Reward players after boss kill, proportional to damage via Combat.GetTopDamageDealer
function BossDeathReward(eventMap, monsterIndex, totalReward)
	local topIndex = Combat.GetTopDamageDealer(monsterIndex)
	local participants = Object.CountPlayersOnMap(eventMap)

	if participants == 0 then return end

	local share = math.floor(totalReward / participants)

	Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
		local reward = share
		if oPlayer.Index == topIndex then
			reward = share * 2  -- double for top dealer
		end

		Player.SetMoney(oPlayer.Index, reward, false)
		Message.Send(0, oPlayer.Index, 1,
			string.format("Boss Reward: %d zen!", reward))
		return true
	end)

	Log.Add(string.format("[Boss Event] Rewards sent to %d players", participants))
end

------------------------------------------------------------------
-- Invasion Event
------------------------------------------------------------------

function StartInvasionEvent(targetMap, duration)
	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, 2,
			string.format("Monster Invasion on Map %d! Defend for %d minutes!",
				targetMap, math.floor(duration / 60000)))
		return true
	end)

	Timer.Create(duration, "invasion_end_" .. targetMap, function()
		InvasionEnd(targetMap)
	end)

	Log.Add(string.format("[Invasion] Started on map %d for %d ms", targetMap, duration))
end

function InvasionEnd(targetMap)
	local remaining = Object.CountMonstersOnMap(targetMap)

	if remaining == 0 then
		-- Victory
		Object.ForEachPlayerOnMap(targetMap, function(oPlayer)
			Player.SetMoney(oPlayer.Index, 10000000, false)
			Message.Send(0, oPlayer.Index, 1, "Invasion Victory! Reward: 10kk zen!")
			return true
		end)
		Log.Add("[Invasion] Victory!")
	else
		-- Defeat
		Object.ForEachPlayerOnMap(targetMap, function(oPlayer)
			Message.Send(0, oPlayer.Index, 2, "Invasion Failed! The monsters won!")
			return true
		end)
		Log.Add("[Invasion] Defeat - time ran out")
	end
end

------------------------------------------------------------------
-- Blood Castle
------------------------------------------------------------------

function BloodCastleEntry(playerIndex, bcLevel)
	local oPlayer = Player.GetObjByIndex(playerIndex)
	if not oPlayer then return false end

	local bcMap = 11 + bcLevel
	local currentParticipants = Object.CountPlayersOnMap(bcMap)

	if currentParticipants >= 10 then
		Message.Send(0, playerIndex, 0, "Blood Castle is full!")
		return false
	end

	if oPlayer.PartyNumber >= 0 then
		local partyReady = true

		Object.ForEachPartyMember(oPlayer.PartyNumber, function(oMember)
			if oMember.Level < (bcLevel * 50) then
				partyReady = false
				return false
			end
			return true
		end)

		if not partyReady then
			Message.Send(0, playerIndex, 0, "Party members don't meet level requirement!")
			return false
		end
	end

	return true
end

function BloodCastleComplete(bcMap, success)
	local participants = {}

	Object.ForEachPlayerOnMap(bcMap, function(oPlayer)
		table.insert(participants, oPlayer.Index)
		return true
	end)

	if success then
		local reward = 50000000
		for _, pIndex in ipairs(participants) do
			Player.SetMoney(pIndex, reward, false)
			Message.Send(0, pIndex, 1,
				string.format("Blood Castle Complete! Reward: %d zen", reward))
		end
		Log.Add(string.format("[BC] Success! %d players rewarded", #participants))
	else
		for _, pIndex in ipairs(participants) do
			Message.Send(0, pIndex, 0, "Blood Castle Failed!")
		end
		Log.Add(string.format("[BC] Failed with %d participants", #participants))
	end

	for _, pIndex in ipairs(participants) do
		Move.ToMap(pIndex, 0, 130, 130)
	end
end

------------------------------------------------------------------
-- Devil Square
------------------------------------------------------------------

function DevilSquareWave(dsMap, waveNumber)
	local participants = Object.CountPlayersOnMap(dsMap)

	if participants == 0 then
		Log.Add("[DS] No participants - ending event")
		return false
	end

	-- Clear previous wave
	Object.ForEachMonsterOnMap(dsMap, function(oMonster)
		Object.DelMonster(oMonster.Index)
		return true
	end)

	Object.ForEachPlayerOnMap(dsMap, function(oPlayer)
		Message.Send(0, oPlayer.Index, 2,
			string.format("Devil Square Wave %d!", waveNumber))
		return true
	end)

	Log.Add(string.format("[DS] Wave %d started with %d participants",
		waveNumber, participants))
	return true
end

function DevilSquareRewards(dsMap, wavesCompleted)
	local baseReward = 5000000
	local totalReward = baseReward * wavesCompleted

	Object.ForEachPlayerOnMap(dsMap, function(oPlayer)
		Player.SetMoney(oPlayer.Index, totalReward, false)
		Message.Send(0, oPlayer.Index, 1,
			string.format("Devil Square Complete! %d waves = %d zen",
				wavesCompleted, totalReward))
		return true
	end)

	Object.ForEachPlayerOnMap(dsMap, function(oPlayer)
		Move.ToMap(oPlayer.Index, 0, 130, 130)
		return true
	end)

	Log.Add(string.format("[DS] Completed %d waves, rewarded %d zen each",
		wavesCompleted, totalReward))
end

------------------------------------------------------------------
-- Survival Event - state tracked in Lua table
------------------------------------------------------------------

local survivalData = {}

function StartSurvivalEvent(eventMap, duration)
	survivalData[eventMap] = {}

	Object.ForEachMonsterOnMap(eventMap, function(oMonster)
		Object.DelMonster(oMonster.Index)
		return true
	end)

	local participants = 0

	Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
		survivalData[eventMap][oPlayer.Index] = { score = 0, alive = true }
		Message.Send(0, oPlayer.Index, 2,
			string.format("Survival Event! Last %d minutes!",
				math.floor(duration / 60000)))
		participants = participants + 1
		return true
	end)

	Log.Add(string.format("[Survival] Started with %d participants", participants))

	Timer.Create(duration, "survival_end_" .. eventMap, function()
		CompleteSurvivalEvent(eventMap)
	end)
end

function CompleteSurvivalEvent(eventMap)
	if not survivalData[eventMap] then return end

	local survivors = {}

	for pIndex, data in pairs(survivalData[eventMap]) do
		local oPlayer = Player.GetObjByIndex(pIndex)
		if oPlayer then
			table.insert(survivors, {
				Index = pIndex,
				Name = oPlayer.Name,
				Score = data.score
			})
		end
	end

	table.sort(survivors, function(a, b) return a.Score > b.Score end)

	for i, survivor in ipairs(survivors) do
		local reward = math.max(50000000 - ((i - 1) * 5000000), 10000000)

		Player.SetMoney(survivor.Index, reward, false)
		Message.Send(0, survivor.Index, 1,
			string.format("Survival Rank #%d! Reward: %d zen (Score: %d)",
				i, reward, survivor.Score))
	end

	Log.Add(string.format("[Survival] Completed with %d survivors", #survivors))
	survivalData[eventMap] = nil
end

--═══════════════════════════════════════════════════════════════
-- Monster Spawn / Despawn - Object.AddMonster + Object.DelMonster
--═══════════════════════════════════════════════════════════════

-- Spawn a boss monster on a map with optional element
-- iMonAttr: use Enums.ElementType, 0 for none
function SpawnBoss(mapNumber, bossClass, x, y, iMonAttr)
	local monIndex = Object.AddMonster(bossClass, mapNumber, x, y, x, y, iMonAttr or Enums.ElementType.NONE)

	if monIndex < 0 then
		Log.Add(string.format("[SpawnBoss] Failed to spawn class %d on map %d", bossClass, mapNumber))
		return -1
	end

	local elementName = "Normal"
	for name, val in pairs(Enums.ElementType) do
		if val == iMonAttr then elementName = name end
	end

	Log.Add(string.format("[SpawnBoss] Spawned class %d at (%d,%d) map %d element %s index %d",
		bossClass, x, y, mapNumber, elementName, monIndex))

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, 2,
			string.format("A %s boss has appeared on map %d!", elementName, mapNumber))
		return true
	end)

	return monIndex
end

-- Spawn a wave of monsters in a bounding box, returns list of spawned indices
function SpawnMonsterWave(mapNumber, monClass, count, x1, y1, x2, y2, iMonAttr)
	local spawned = {}

	for i = 1, count do
		local idx = Object.AddMonster(monClass, mapNumber, x1, y1, x2, y2, iMonAttr or Enums.ElementType.NONE)
		if idx >= 0 then
			table.insert(spawned, idx)
		end
	end

	Log.Add(string.format("[Wave] Spawned %d/%d monsters (class %d) on map %d",
		#spawned, count, monClass, mapNumber))

	return spawned
end

-- Remove a list of previously spawned monsters
function DespawnMonsterWave(spawnedIndices)
	local removed = 0
	for _, idx in ipairs(spawnedIndices) do
		Object.DelMonster(idx)
		removed = removed + 1
	end
	Log.Add(string.format("[Wave] Despawned %d monsters", removed))
end

-- Elemental boss event: spawn one boss per element, schedule despawn after duration
function SpawnElementalBossEvent(mapNumber, bossClass, duration)
	local bosses = {}
	local spawnPositions = {
		{ x = 50,  y = 50,  element = Enums.ElementType.FIRE },
		{ x = 150, y = 50,  element = Enums.ElementType.WATER },
		{ x = 50,  y = 150, element = Enums.ElementType.EARTH },
		{ x = 150, y = 150, element = Enums.ElementType.WIND },
		{ x = 100, y = 100, element = Enums.ElementType.DARKNESS },
	}

	for _, pos in ipairs(spawnPositions) do
		local idx = Object.AddMonster(bossClass, mapNumber, pos.x, pos.y, pos.x, pos.y, pos.element)
		if idx >= 0 then
			table.insert(bosses, idx)
		end
	end

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		Message.Send(0, oPlayer.Index, 2,
			string.format("Elemental Boss Event! Kill all 5 bosses in %d minutes!",
				math.floor(duration / 60000)))
		return true
	end)

	Log.Add(string.format("[Elemental Event] %d bosses spawned on map %d", #bosses, mapNumber))

	-- Despawn any survivors after duration
	Timer.Create(duration, "elemental_event_end_" .. mapNumber, function()
		local remaining = 0
		for _, idx in ipairs(bosses) do
			local oMonster = Player.GetObjByIndex(idx)
			if oMonster and oMonster.Live == 1 then
				Object.DelMonster(idx)
				remaining = remaining + 1
			end
		end

		if remaining > 0 then
			Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
				Message.Send(0, oPlayer.Index, 0,
					string.format("Event ended. %d bosses escaped.", remaining))
				return true
			end)
		end
	end)
end

--═══════════════════════════════════════════════════════════════
-- END OF EVENT EXAMPLES
--═══════════════════════════════════════════════════════════════
