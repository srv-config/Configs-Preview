--═══════════════════════════════════════════════════════════════
-- Timer Function Examples
--═══════════════════════════════════════════════════════════════
-- Timer.Create creates a one-shot timer:
--   Timer.Create(durationMs, uniqueName, callback)
-- Timer.GetTick returns current server tick in milliseconds.
-- Per-second/per-minute logic is done inside callback loops
-- scheduled via Timer.Create with recurring re-scheduling.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Per-Second Tasks
------------------------------------------------------------------

-- VIP regeneration - called each second
function TimerProcSecond()
	local currentTick = Timer.GetTick()

	Object.ForEachPlayer(function(oPlayer)
		if oPlayer.userData.VIPType >= 0 then
			oPlayer.Life = math.min(oPlayer.Life + 50, oPlayer.MaxLife)
			oPlayer.Mana = math.min(oPlayer.Mana + 50, oPlayer.MaxMana)
			Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
			Player.SendMana(oPlayer.Index, oPlayer.Mana, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.BP)
		end
		return true
	end)
end

-- PvP zone DOT outside safe zone (Arena map 6)
function PvPZoneDOT()
	Object.ForEachPlayerOnMap(6, function(oPlayer)
		-- Coordinates 50-60, 50-60 are safe zone
		if not (oPlayer.X >= 50 and oPlayer.X <= 60 and oPlayer.Y >= 50 and oPlayer.Y <= 60) then
			oPlayer.Life = math.max(oPlayer.Life - 100, 1)
			Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
		end
		return true
	end)
end

------------------------------------------------------------------
-- Per-Minute Tasks
------------------------------------------------------------------

-- Online time bonus with VIP scaling (state tracked in Lua table)
local lastBonusTick = {}

function TimerProcMinute()
	local currentTick = Timer.GetTick()
	local bonusInterval = 1800000  -- 30 minutes

	Object.ForEachPlayer(function(oPlayer)
		local idx = oPlayer.Index

		if not lastBonusTick[idx] then
			lastBonusTick[idx] = currentTick
			return true
		end

		if (currentTick - lastBonusTick[idx]) >= bonusInterval then
			local bonus = 1000000

			if oPlayer.userData.VIPType >= 0 then
				bonus = bonus * (oPlayer.userData.VIPType + 2)
			end

			Player.SetMoney(idx, bonus, false)
			Message.Send(0, idx, 1,
				string.format("Online Bonus: %d zen!", bonus))

			lastBonusTick[idx] = currentTick
		end

		return true
	end)
end

-- Map population announcement (only maps with 10+ players)
function AnnounceMapPopulation()
	local popularMaps = {}

	for mapNum = 0, 10 do
		local count = Object.CountPlayersOnMap(mapNum)
		if count >= 10 then
			table.insert(popularMaps, { map = mapNum, count = count })
		end
	end

	if #popularMaps == 0 then return end

	table.sort(popularMaps, function(a, b) return a.count > b.count end)

	local message = "Popular Maps: "
	for i = 1, math.min(3, #popularMaps) do
		message = message .. string.format("Map%d(%d) ",
			popularMaps[i].map, popularMaps[i].count)
	end

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, 0, message)
		return true
	end)
end

-- Guild activity log
function TrackGuildActivity()
	local guilds = {}

	Object.ForEachPlayer(function(oPlayer)
		-- GuildName is a real field on stObject
		local guildName = oPlayer.GuildName
		if guildName and guildName ~= "" then
			if not guilds[guildName] then
				guilds[guildName] = { count = 0, totalLevel = 0 }
			end
			guilds[guildName].count = guilds[guildName].count + 1
			guilds[guildName].totalLevel = guilds[guildName].totalLevel + oPlayer.Level
		end
		return true
	end)

	for guildName, data in pairs(guilds) do
		local avg = math.floor(data.totalLevel / data.count)
		Log.Add(string.format("[Guild] %s: %d online (avg lvl %d)",
			guildName, data.count, avg))
	end
end

------------------------------------------------------------------
-- Per-5-Minutes Tasks
------------------------------------------------------------------

-- Spawn control: 3 monsters target per online player
function AutoSpawnControl()
	local spawnMaps = { 0, 2, 3, 7, 8 }

	for _, mapNum in ipairs(spawnMaps) do
		local playerCount = Object.CountPlayersOnMap(mapNum)
		local monsterCount = Object.CountMonstersOnMap(mapNum)
		local targetCount = playerCount * 3

		if monsterCount < targetCount then
			local needed = targetCount - monsterCount
			Log.Add(string.format("[Spawn] Map %d needs %d monsters (players: %d, current: %d)",
				mapNum, needed, playerCount, monsterCount))

			for i = 1, needed do
				Object.AddMonster(20, mapNum, 0, 0, 255, 255, Enums.ElementType.NONE)
			end
		end
	end
end

-- Server statistics log
function CollectServerStatistics()
	local stats = {
		totalPlayers = 0,
		totalMonsters = 0,
		vipPlayers = 0,
		avgLevel = 0,
		totalLevel = 0
	}

	Object.ForEachPlayer(function(oPlayer)
		stats.totalPlayers = stats.totalPlayers + 1
		stats.totalLevel = stats.totalLevel + oPlayer.Level

		if oPlayer.userData.VIPType >= 0 then
			stats.vipPlayers = stats.vipPlayers + 1
		end

		return true
	end)

	Object.ForEachMonster(function(oMonster)
		stats.totalMonsters = stats.totalMonsters + 1
		return true
	end)

	if stats.totalPlayers > 0 then
		stats.avgLevel = math.floor(stats.totalLevel / stats.totalPlayers)
	end

	Log.Add(string.format("[Stats] Players: %d (VIP: %d, Avg Lvl: %d) | Monsters: %d",
		stats.totalPlayers, stats.vipPlayers, stats.avgLevel, stats.totalMonsters))
end

------------------------------------------------------------------
-- Per-Hour Tasks
------------------------------------------------------------------

-- Hourly rewards with VIP scaling (state in Lua table)
local lastHourlyTick = {}

function HourlyRewards()
	local currentTick = Timer.GetTick()
	local hourlyInterval = 3600000

	Object.ForEachPlayer(function(oPlayer)
		local idx = oPlayer.Index

		if not lastHourlyTick[idx] then
			lastHourlyTick[idx] = currentTick
			return true
		end

		if (currentTick - lastHourlyTick[idx]) >= hourlyInterval then
			local reward = 5000000

			if oPlayer.userData.VIPType >= 0 then
				reward = reward * (oPlayer.userData.VIPType + 2)
			end

			Player.SetMoney(idx, reward, false)
			Message.Send(0, idx, 1,
				string.format("Hourly Reward: %d zen!", reward))

			lastHourlyTick[idx] = currentTick
		end

		return true
	end)
end

-- Daily rankings announcement (top 3 by resets then level)
function UpdateDailyRankings()
	local players = {}

	Object.ForEachPlayer(function(oPlayer)
		table.insert(players, {
			Name = oPlayer.Name,
			Level = oPlayer.Level,
			Resets = oPlayer.userData.Resets
		})
		return true
	end)

	table.sort(players, function(a, b)
		if a.Resets ~= b.Resets then
			return a.Resets > b.Resets
		end
		return a.Level > b.Level
	end)

	local announcement = "Top Players: "
	for i = 1, math.min(3, #players) do
		announcement = announcement .. string.format("%d.%s(R%d/L%d) ",
			i, players[i].Name, players[i].Resets, players[i].Level)
	end

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, 2, announcement)
		return true
	end)

	Log.Add(string.format("[Rankings] %s", announcement))
end

-- Hourly cleanup: clear monsters from empty maps
function HourlyMapCleanup()
	for mapNum = 0, 10 do
		local playerCount = Object.CountPlayersOnMap(mapNum)

		if playerCount == 0 then
			local monsterCount = Object.CountMonstersOnMap(mapNum)

			if monsterCount > 0 then
				Object.ForEachMonsterOnMap(mapNum, function(oMonster)
					Object.DelMonster(oMonster.Index)
					return true
				end)

				Log.Add(string.format("[Cleanup] Map %d: Cleared %d monsters",
					mapNum, monsterCount))
			end
		end
	end
end

------------------------------------------------------------------
-- Event-Based One-Shot Timers
------------------------------------------------------------------

-- Boss event: clear map, verify 5+ eligible players, then spawn
function BossEventTimer(eventMap, bossClass)
	Object.ForEachMonsterOnMap(eventMap, function(oMonster)
		Object.DelMonster(oMonster.Index)
		return true
	end)

	local participants = Object.CountPlayersOnMap(eventMap, function(oPlayer)
		return oPlayer.Level >= 400
	end)

	if participants >= 5 then
		Log.Add(string.format("[Boss Event] Starting with %d participants", participants))

		Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
			Message.Send(0, oPlayer.Index, 2, "Boss Event Starting!")
			return true
		end)

		-- Spawn boss with fire element at center of map
		local monIndex = Object.AddMonster(bossClass, eventMap, 120, 120, 120, 120, Enums.ElementType.FIRE)
		if monIndex >= 0 then
			Log.Add(string.format("[Boss Event] Boss spawned at index %d", monIndex))
		end
	else
		Log.Add(string.format("[Boss Event] Cancelled - need 5 players (have %d)", participants))
	end
end

-- Tournament: start phase marks participants, end phase finds last standing
local tournamentParticipants = {}  -- [playerIndex] = true

function PvPTournamentStart(arenaMap)
	tournamentParticipants = {}

	Object.ForEachMonsterOnMap(arenaMap, function(oMonster)
		Object.DelMonster(oMonster.Index)
		return true
	end)

	local participants = 0

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		tournamentParticipants[oPlayer.Index] = true
		Message.Send(0, oPlayer.Index, 2, "Tournament Starting!")
		participants = participants + 1
		return true
	end)

	Log.Add(string.format("[Tournament] Starting with %d participants", participants))
end

function PvPTournamentEnd(arenaMap)
	local winner = nil

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		if tournamentParticipants[oPlayer.Index] then
			winner = oPlayer
			return false  -- first found
		end
		return true
	end)

	if winner then
		Player.SetMoney(winner.Index, 50000000, false)

		Object.ForEachPlayer(function(oPlayer)
			Message.Send(0, oPlayer.Index, 2,
				string.format("Tournament Winner: %s!", winner.Name))
			return true
		end)

		Log.Add(string.format("[Tournament] Winner: %s", winner.Name))
	end

	tournamentParticipants = {}
end

--═══════════════════════════════════════════════════════════════
-- END OF TIMER EXAMPLES
--═══════════════════════════════════════════════════════════════
