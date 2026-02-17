--═══════════════════════════════════════════════════════════════
-- PvP & Guild War Examples
--═══════════════════════════════════════════════════════════════
-- State (ArenaTeam, FFA kills, etc.) is tracked in Lua-side tables,
-- NOT as custom fields on C++ stObject.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Arena System - state stored in Lua table
------------------------------------------------------------------

local arenaTeams = {}   -- [playerIndex] = "red" | "blue"
local arenaKills = {}   -- [playerIndex] = kill count

function ArenaMatchmaking(arenaMap, minPlayers, maxPlayers)
	local waiting = Object.CountPlayersOnMap(arenaMap)

	if waiting < minPlayers then
		Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
			Message.Send(0, oPlayer.Index, 0,
				string.format("Waiting for players... (%d/%d)", waiting, minPlayers))
			return true
		end)
		return false
	end

	if waiting > maxPlayers then
		-- Kick excess players (first found)
		local kicked = 0
		local toKick = waiting - maxPlayers

		Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
			if kicked >= toKick then return false end
			Move.ToMap(oPlayer.Index, 0, 130, 130)
			Message.Send(0, oPlayer.Index, 0, "Arena is full!")
			kicked = kicked + 1
			return true
		end)
	end

	return true
end

function AssignArenaTeams(arenaMap)
	arenaTeams = {}
	arenaKills = {}

	local players = {}

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		table.insert(players, {
			Index = oPlayer.Index,
			Power = oPlayer.userData.Strength + oPlayer.userData.Dexterity + oPlayer.userData.Vitality
		})
		return true
	end)

	table.sort(players, function(a, b) return a.Power > b.Power end)

	for i, pData in ipairs(players) do
		local team = (i % 2 == 0) and "blue" or "red"
		arenaTeams[pData.Index] = team
		arenaKills[pData.Index] = 0

		local oPlayer = Player.GetObjByIndex(pData.Index)
		if oPlayer then
			Message.Send(0, pData.Index, 2,
				string.format("You are on the %s TEAM!", string.upper(team)))
		end
	end

	Log.Add(string.format("[Arena] Teams assigned: %d players", #players))
end

function ArenaMatchStatus(arenaMap)
	local counts = { red = 0, blue = 0 }

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		local team = arenaTeams[oPlayer.Index]
		if team then
			counts[team] = counts[team] + 1
		end
		return true
	end)

	local status = string.format("Red Team: %d | Blue Team: %d", counts.red, counts.blue)

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		Message.Send(0, oPlayer.Index, 0, status)
		return true
	end)

	if counts.red == 0 and counts.blue > 0 then return "blue"
	elseif counts.blue == 0 and counts.red > 0 then return "red"
	end

	return nil
end

function ArenaMatchRewards(arenaMap, winningTeam)
	local winReward = 10000000
	local loseReward = 2000000
	local winners = 0
	local losers = 0

	Object.ForEachPlayerOnMap(arenaMap, function(oPlayer)
		local isWinner = (arenaTeams[oPlayer.Index] == winningTeam)
		local reward = isWinner and winReward or loseReward

		Player.SetMoney(oPlayer.Index, reward, false)

		local msg = isWinner
			and string.format("VICTORY! Reward: %d zen", reward)
			or string.format("Defeat. Consolation: %d zen", reward)

		Message.Send(0, oPlayer.Index, 1, msg)

		if isWinner then winners = winners + 1 else losers = losers + 1 end

		arenaTeams[oPlayer.Index] = nil
		arenaKills[oPlayer.Index] = nil
		return true
	end)

	Log.Add(string.format("[Arena] Match ended: %s wins! (Winners: %d, Losers: %d)",
		winningTeam, winners, losers))
end

------------------------------------------------------------------
-- FFA - state stored in Lua table
------------------------------------------------------------------

local ffaData = {}  -- [playerIndex] = { kills, deaths, alive }

function FFAEntry(ffaMap, entryFee)
	ffaData = {}
	local participants = 0
	local toKick = {}

	Object.ForEachPlayerOnMap(ffaMap, function(oPlayer)
		if oPlayer.userData.Money < entryFee then
			table.insert(toKick, oPlayer.Index)
		else
			ffaData[oPlayer.Index] = { kills = 0, deaths = 0, alive = true }
			participants = participants + 1
		end
		return true
	end)

	for _, idx in ipairs(toKick) do
		Message.Send(0, idx, 0, "Not enough zen for entry!")
		Move.ToMap(idx, 0, 130, 130)
	end

	-- Deduct entry fee
	for idx in pairs(ffaData) do
		Player.SetMoney(idx, -entryFee, true)
	end

	Object.ForEachPlayerOnMap(ffaMap, function(oPlayer)
		if ffaData[oPlayer.Index] then
			Message.Send(0, oPlayer.Index, 2,
				string.format("FFA Battle! %d participants! Entry: %d zen each",
					participants, entryFee))
		end
		return true
	end)

	local prizePool = participants * entryFee
	Log.Add(string.format("[FFA] Started with %d participants (prize pool: %d zen)",
		participants, prizePool))

	return prizePool
end

function FFAOnKill(killerIndex, victimIndex, ffaMap)
	if ffaData[killerIndex] then
		ffaData[killerIndex].kills = ffaData[killerIndex].kills + 1
		Message.Send(0, killerIndex, 0,
			string.format("Kill! Total: %d", ffaData[killerIndex].kills))
	end

	if ffaData[victimIndex] then
		ffaData[victimIndex].deaths = ffaData[victimIndex].deaths + 1

		if ffaData[victimIndex].deaths >= 3 then
			Message.Send(0, victimIndex, 0, "Eliminated! 3 deaths")
			Move.ToMap(victimIndex, 0, 130, 130)
			ffaData[victimIndex].alive = false
		end
	end

	-- Count remaining alive players
	local remaining = 0
	for _, data in pairs(ffaData) do
		if data.alive then remaining = remaining + 1 end
	end

	if remaining == 1 then
		FFAVictory(ffaMap)
	end
end

function FFAVictory(ffaMap)
	local prizePool = 0  -- caller should pass this or track globally
	local winner = nil

	for idx, data in pairs(ffaData) do
		if data.alive then
			winner = { index = idx, kills = data.kills }
			break
		end
	end

	if winner then
		local oWinner = Player.GetObjByIndex(winner.index)
		if oWinner then
			Player.SetMoney(winner.index, prizePool, false)

			local announcement = string.format("FFA Winner: %s! (%d kills)",
				oWinner.Name, winner.kills)

			Object.ForEachPlayer(function(oPlayer)
				Message.Send(0, oPlayer.Index, 2, announcement)
				return true
			end)

			Log.Add(string.format("[FFA] Winner: %s", oWinner.Name))
		end
	end

	ffaData = {}
end

------------------------------------------------------------------
-- Guild War - state in Lua table
------------------------------------------------------------------

local guildWarKills = {}  -- [playerIndex] = kill count

function DeclareGuildWar(guild1, guild2)
	local count1 = GetOnlineGuildCount(guild1)
	local count2 = GetOnlineGuildCount(guild2)

	if count1 < 5 or count2 < 5 then
		Log.Add(string.format("[GW] Not enough members: %s=%d, %s=%d",
			guild1, count1, guild2, count2))
		return false
	end

	Object.ForEachGuildMember(guild1, function(oMember)
		Message.Send(0, oMember.Index, 2,
			string.format("Guild War vs %s! Prepare for battle!", guild2))
		return true
	end)

	Object.ForEachGuildMember(guild2, function(oMember)
		Message.Send(0, oMember.Index, 2,
			string.format("Guild War vs %s! Prepare for battle!", guild1))
		return true
	end)

	Log.Add(string.format("[GW] War declared: %s vs %s", guild1, guild2))
	return true
end

function GuildWarTeleport(warMap, guild1, guild2)
	guildWarKills = {}

	Object.ForEachGuildMember(guild1, function(oMember)
		Move.ToMap(oMember.Index, warMap, 50, 50)
		guildWarKills[oMember.Index] = 0
		return true
	end)

	Object.ForEachGuildMember(guild2, function(oMember)
		Move.ToMap(oMember.Index, warMap, 200, 200)
		guildWarKills[oMember.Index] = 0
		return true
	end)
end

function GuildWarRewards(winningGuild, losingGuild)
	local winReward = 50000000
	local winners = 0

	Object.ForEachGuildMember(winningGuild, function(oMember)
		local kills = guildWarKills[oMember.Index] or 0
		local reward = winReward + (kills * 1000000)

		Player.SetMoney(oMember.Index, reward, false)
		Message.Send(0, oMember.Index, 1,
			string.format("Guild War Victory! Reward: %d zen (%d kills)", reward, kills))

		guildWarKills[oMember.Index] = nil
		winners = winners + 1
		return true
	end)

	Object.ForEachGuildMember(losingGuild, function(oMember)
		Message.Send(0, oMember.Index, 0, "Guild War: Defeat")
		guildWarKills[oMember.Index] = nil
		return true
	end)

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, 2,
			string.format("Guild War Winner: %s defeats %s!", winningGuild, losingGuild))
		return true
	end)

	Log.Add(string.format("[GW] Victory: %s (%d members rewarded)", winningGuild, winners))
end

------------------------------------------------------------------
-- Territory Control
------------------------------------------------------------------

function CheckTerritoryControl(territoryMap, x1, y1, x2, y2)
	local guildPresence = {}

	Object.ForEachPlayerOnMap(territoryMap, function(oPlayer)
		if oPlayer.X >= x1 and oPlayer.X <= x2
		   and oPlayer.Y >= y1 and oPlayer.Y <= y2 then
			local guildName = oPlayer.GuildName  -- may be empty string if not in guild
			if guildName and guildName ~= "" then
				guildPresence[guildName] = (guildPresence[guildName] or 0) + 1
			end
		end
		return true
	end)

	local dominant = nil
	local maxCount = 0

	for guild, count in pairs(guildPresence) do
		if count > maxCount then
			maxCount = count
			dominant = guild
		end
	end

	if dominant and maxCount >= 3 then
		return dominant, maxCount
	end

	return nil, 0
end

function TerritoryRewards(controllingGuild, rewardPerMember)
	local rewarded = 0

	Object.ForEachGuildMember(controllingGuild, function(oMember)
		Player.SetMoney(oMember.Index, rewardPerMember, false)
		Message.Send(0, oMember.Index, 1,
			string.format("Territory Bonus: %d zen!", rewardPerMember))
		rewarded = rewarded + 1
		return true
	end)

	Log.Add(string.format("[Territory] %s controls territory (%d members rewarded)",
		controllingGuild, rewarded))
end

------------------------------------------------------------------
-- Duel System - state in Lua tables
------------------------------------------------------------------

local duelData = {}  -- [playerIndex] = { opponent, wager }

function ValidateDuelRequest(challengerIndex, targetIndex)
	local oChallenger = Player.GetObjByIndex(challengerIndex)
	local oTarget = Player.GetObjByIndex(targetIndex)

	if not oChallenger or not oTarget then
		return false, "Player not found"
	end

	if oChallenger.MapNumber ~= oTarget.MapNumber then
		return false, "Players must be on same map"
	end

	local dx = oChallenger.X - oTarget.X
	local dy = oChallenger.Y - oTarget.Y

	if math.sqrt(dx * dx + dy * dy) > 10 then
		return false, "Target too far away"
	end

	if duelData[targetIndex] then
		return false, "Target is already in a duel"
	end

	return true
end

function SetupDuelArena(duelMap, player1Index, player2Index, wager)
	local oPlayer1 = Player.GetObjByIndex(player1Index)
	local oPlayer2 = Player.GetObjByIndex(player2Index)

	if not oPlayer1 or not oPlayer2 then return false end

	if oPlayer1.userData.Money < wager or oPlayer2.userData.Money < wager then
		return false, "Not enough zen for wager"
	end

	Player.SetMoney(player1Index, -wager, true)
	Player.SetMoney(player2Index, -wager, true)

	Move.ToMap(player1Index, duelMap, 50, 50)
	Move.ToMap(player2Index, duelMap, 200, 200)

	duelData[player1Index] = { opponent = player2Index, wager = wager }
	duelData[player2Index] = { opponent = player1Index, wager = wager }

	Log.Add(string.format("[Duel] %s vs %s (Wager: %d zen each)",
		oPlayer1.Name, oPlayer2.Name, wager))

	return true
end

function CompleteDuel(winnerIndex, loserIndex)
	local oWinner = Player.GetObjByIndex(winnerIndex)
	local oLoser = Player.GetObjByIndex(loserIndex)

	if not oWinner or not oLoser then return end

	local wager = duelData[winnerIndex] and duelData[winnerIndex].wager or 0
	local prize = wager * 2

	Player.SetMoney(winnerIndex, prize, false)
	Message.Send(0, winnerIndex, 1,
		string.format("Duel Victory! Prize: %d zen", prize))
	Message.Send(0, loserIndex, 0, "Duel Defeat!")

	duelData[winnerIndex] = nil
	duelData[loserIndex] = nil

	Log.Add(string.format("[Duel] Winner: %s (Prize: %d zen)", oWinner.Name, prize))
end

-- Helper used in DeclareGuildWar
function GetOnlineGuildCount(guildName)
	local count = 0
	Object.ForEachGuildMember(guildName, function(oMember)
		count = count + 1
		return true
	end)
	return count
end

--═══════════════════════════════════════════════════════════════
-- END OF PVP EXAMPLES
--═══════════════════════════════════════════════════════════════
