--═══════════════════════════════════════════════════════════════
-- Guild System Examples
--═══════════════════════════════════════════════════════════════

-- List all online guild members
function ListGuildMembers(guildName)
	local count = 0
	Log.Add(string.format("=== Guild Members: %s ===", guildName))

	Object.ForEachGuildMember(guildName, function(oPlayer)
		count = count + 1
		Log.Add(string.format("%d. %s (Level %d)", count, oPlayer.Name, oPlayer.Level))
		return true
	end)

	Log.Add(string.format("Total online members: %d", count))
end

-- Get average level of online guild members
function GetGuildAverageLevel(guildName)
	local totalLevel = 0
	local count = 0

	Object.ForEachGuildMember(guildName, function(oPlayer)
		totalLevel = totalLevel + oPlayer.Level
		count = count + 1
		return true
	end)

	if count > 0 then
		local average = totalLevel / count
		Log.Add(string.format("Guild %s average level: %.2f (%d online)", guildName, average, count))
		return average
	end

	return 0
end

-- Count online guild members
function GetOnlineGuildCount(guildName)
	local count = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		count = count + 1
		return true
	end)

	return count
end

-- Send announcement to all online guild members
function GuildBroadcast(guildName, message, messageType)
	local sent = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		Message.Send(0, oMember.Index, messageType or 0, message)
		sent = sent + 1
		return true
	end)

	Log.Add(string.format("[Guild] %s: sent message to %d members", guildName, sent))
	return sent
end

-- Buff all online guild members
function BuffGuild(guildName, oBuffPlayer, buffId, duration)
	-- oBuffPlayer is used as the buff source object for Buff.Add
	local buffedCount = 0

	Object.ForEachGuildMember(guildName, function(oPlayer)
		Buff.Add(oPlayer, buffId, 0, 100, 0, 0, duration, 0, -1)
		buffedCount = buffedCount + 1
		Message.Send(0, oPlayer.Index, 1,
			string.format("Guild buff activated: %d seconds!", duration))
		return true
	end)

	Log.Add(string.format("Buffed %d members of guild %s", buffedCount, guildName))
end

-- Reward all online guild members
function GiveGuildReward(guildName, zenAmount, reason)
	local rewardedCount = 0

	Object.ForEachGuildMember(guildName, function(oPlayer)
		Player.SetMoney(oPlayer.Index, zenAmount, false)
		rewardedCount = rewardedCount + 1

		Message.Send(0, oPlayer.Index, 0,
			string.format("Guild Reward: +%d Zen! Reason: %s", zenAmount, reason))
		return true
	end)

	Log.Add(string.format("Rewarded %d guild members with %d Zen",
		rewardedCount, zenAmount))
end

-- Teleport all online guild members to a map
function SummonGuild(guildName, targetMap, targetX, targetY)
	local summonedCount = 0

	Object.ForEachGuildMember(guildName, function(oPlayer)
		Move.ToMap(oPlayer.Index, targetMap, targetX, targetY)
		summonedCount = summonedCount + 1
		Message.Send(0, oPlayer.Index, 1, "Guild summon activated!")
		return true
	end)

	Log.Add(string.format("Summoned %d guild members to map %d",
		summonedCount, targetMap))
end

-- Get guild members on a specific map
function GetGuildMembersOnMap(guildName, mapNumber)
	local members = {}

	Object.ForEachGuildMember(guildName, function(oPlayer)
		if oPlayer.MapNumber == mapNumber then
			table.insert(members, oPlayer.Name)
		end
		return true
	end)

	return members
end

-- Get guild PvP stats
function GetGuildPvPStats(guildName)
	local stats = {
		totalMembers = 0,
		pkPlayers = 0,
		totalPKCount = 0,
		averagePK = 0
	}

	Object.ForEachGuildMember(guildName, function(oPlayer)
		stats.totalMembers = stats.totalMembers + 1
		stats.totalPKCount = stats.totalPKCount + oPlayer.PKCount

		if oPlayer.PKLevel > 0 then
			stats.pkPlayers = stats.pkPlayers + 1
		end
		return true
	end)

	if stats.totalMembers > 0 then
		stats.averagePK = stats.totalPKCount / stats.totalMembers
	end

	Log.Add(string.format("Guild %s: %d online, %d PK players, avg PK %.2f",
		guildName, stats.totalMembers, stats.pkPlayers, stats.averagePK))

	return stats
end

-- Get guild overall stats
function GetGuildStats(guildName)
	local stats = {
		onlineCount = 0,
		totalLevel = 0,
		avgLevel = 0,
		maxLevel = 0,
		totalResets = 0
	}

	Object.ForEachGuildMember(guildName, function(oMember)
		stats.onlineCount = stats.onlineCount + 1
		stats.totalLevel = stats.totalLevel + oMember.Level
		stats.totalResets = stats.totalResets + oMember.userData.Resets

		if oMember.Level > stats.maxLevel then
			stats.maxLevel = oMember.Level
		end

		return true
	end)

	if stats.onlineCount > 0 then
		stats.avgLevel = math.floor(stats.totalLevel / stats.onlineCount)
	end

	return stats
end

--═══════════════════════════════════════════════════════════════
-- END OF GUILD EXAMPLES
--═══════════════════════════════════════════════════════════════
