--═══════════════════════════════════════════════════════════════
-- Admin & GM Command Examples
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Player Management Commands
------------------------------------------------------------------

function GM_TeleportPlayer(adminIndex, targetName, map, x, y)
	local oTarget = Player.GetObjByName(targetName)

	if not oTarget then
		Message.Send(0, adminIndex, 0,
			string.format("Player '%s' not found or offline", targetName))
		return false
	end

	Move.ToMap(oTarget.Index, map, x, y)
	Message.Send(0, oTarget.Index, 0, "GM teleported you!")
	Message.Send(0, adminIndex, 0,
		string.format("Teleported %s to map %d (%d, %d)", targetName, map, x, y))

	Log.Add(string.format("[GM] Admin teleported %s to map %d", targetName, map))
	return true
end

function GM_SummonPlayer(adminIndex, targetName)
	local oAdmin = Player.GetObjByIndex(adminIndex)
	local oTarget = Player.GetObjByName(targetName)

	if not oAdmin or not oTarget then
		return false
	end

	Move.ToMap(oTarget.Index, oAdmin.MapNumber, oAdmin.X, oAdmin.Y)
	Message.Send(0, oTarget.Index, 0, "GM summoned you!")
	Message.Send(0, adminIndex, 0, string.format("Summoned %s", targetName))

	Log.Add(string.format("[GM] Admin summoned %s", targetName))
	return true
end

function GM_GotoPlayer(adminIndex, targetName)
	local oTarget = Player.GetObjByName(targetName)

	if not oTarget then
		return false
	end

	Move.ToMap(adminIndex, oTarget.MapNumber, oTarget.X, oTarget.Y)
	Message.Send(0, adminIndex, 0,
		string.format("Teleported to %s (Map %d)", targetName, oTarget.MapNumber))

	Log.Add(string.format("[GM] Admin went to %s", targetName))
	return true
end

-- NOTE: Item.Create requires a CreateItemInfo struct, not a raw item ID
function GM_GiveItem(adminIndex, targetName, itemId, itemLevel)
	local oTarget = Player.GetObjByName(targetName)

	if not oTarget then
		Message.Send(0, adminIndex, 0, "Player not found")
		return false
	end

	local stItem = CreateItemInfo()
	stItem.ItemId = itemId
	stItem.ItemLevel = itemLevel or 0
	stItem.LootIndex = oTarget.Index
	stItem.TargetInvenPos = 255

	Item.Create(oTarget.Index, stItem)

	Message.Send(0, oTarget.Index, 1, "GM gave you an item!")
	Message.Send(0, adminIndex, 0,
		string.format("Gave %s item %d (lv%d)", targetName, itemId, itemLevel or 0))

	Log.Add(string.format("[GM] Gave %s item %d", targetName, itemId))
	return true
end

function GM_SetLevel(adminIndex, targetName, newLevel)
	local oTarget = Player.GetObjByName(targetName)

	if not oTarget then
		Message.Send(0, adminIndex, 0, "Player not found")
		return false
	end

	oTarget.Level = newLevel
	Player.ReCalc(oTarget.Index)

	Message.Send(0, oTarget.Index, 1,
		string.format("GM set your level to %d!", newLevel))
	Message.Send(0, adminIndex, 0,
		string.format("Set %s level to %d", targetName, newLevel))

	Log.Add(string.format("[GM] Set %s level to %d", targetName, newLevel))
	return true
end

------------------------------------------------------------------
-- Broadcast Commands
------------------------------------------------------------------

function GM_GlobalAnnounce(message, messageType)
	local sent = 0

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, messageType or 2, message)
		sent = sent + 1
		return true
	end)

	Log.Add(string.format("[GM] Global announcement to %d players: %s", sent, message))
	return sent
end

function GM_MapAnnounce(mapNumber, message, messageType)
	local sent = 0

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		Message.Send(0, oPlayer.Index, messageType or 0, message)
		sent = sent + 1
		return true
	end)

	Log.Add(string.format("[GM] Map %d announcement to %d players", mapNumber, sent))
	return sent
end

function GM_GuildAnnounce(guildName, message, messageType)
	local sent = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		Message.Send(0, oMember.Index, messageType or 0, message)
		sent = sent + 1
		return true
	end)

	Log.Add(string.format("[GM] Guild '%s' announcement to %d members", guildName, sent))
	return sent
end

------------------------------------------------------------------
-- Mass Operations
------------------------------------------------------------------

function GM_TeleportAllFromMap(adminIndex, sourceMap, targetMap, x, y)
	local teleported = 0

	Object.ForEachPlayerOnMap(sourceMap, function(oPlayer)
		Move.ToMap(oPlayer.Index, targetMap, x, y)
		Message.Send(0, oPlayer.Index, 0, "GM mass teleport!")
		teleported = teleported + 1
		return true
	end)

	Message.Send(0, adminIndex, 0,
		string.format("Teleported %d players from map %d to map %d",
			teleported, sourceMap, targetMap))

	Log.Add(string.format("[GM] Mass teleport: %d players from map %d to %d",
		teleported, sourceMap, targetMap))

	return teleported
end

function GM_AwardZenToAll(adminIndex, zenAmount, minLevel)
	local awarded = 0

	Object.ForEachPlayer(function(oPlayer)
		if not minLevel or oPlayer.Level >= minLevel then
			Player.SetMoney(oPlayer.Index, zenAmount, false)
			Message.Send(0, oPlayer.Index, 1,
				string.format("GM bonus: %d zen!", zenAmount))
			awarded = awarded + 1
		end
		return true
	end)

	Message.Send(0, adminIndex, 0,
		string.format("Awarded %d zen to %d players", zenAmount, awarded))

	Log.Add(string.format("[GM] Mass zen award: %d zen to %d players", zenAmount, awarded))

	return awarded
end

function GM_HealAllPlayers(adminIndex, mapNumber)
	local healed = 0

	local function healPlayer(oPlayer)
		oPlayer.Life = oPlayer.MaxLife
		oPlayer.Mana = oPlayer.MaxMana
		Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
		Player.SendMana(oPlayer.Index, oPlayer.Mana, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.BP)
		healed = healed + 1
		return true
	end

	if mapNumber then
		Object.ForEachPlayerOnMap(mapNumber, healPlayer)
	else
		Object.ForEachPlayer(healPlayer)
	end

	Message.Send(0, adminIndex, 0, string.format("Healed %d players", healed))
	Log.Add(string.format("[GM] Mass heal: %d players", healed))

	return healed
end

------------------------------------------------------------------
-- Server Monitoring
------------------------------------------------------------------

function GM_ServerStats(adminIndex)
	local stats = {
		totalPlayers = 0,
		totalMonsters = 0,
		vipPlayers = 0,
		elitePlayers = 0,
		avgLevel = 0,
		totalLevel = 0,
		mapDistribution = {}
	}

	Object.ForEachPlayer(function(oPlayer)
		stats.totalPlayers = stats.totalPlayers + 1
		stats.totalLevel = stats.totalLevel + oPlayer.Level

		if oPlayer.userData.VIPType >= 0 then
			stats.vipPlayers = stats.vipPlayers + 1
		end

		if oPlayer.Level >= 400 then
			stats.elitePlayers = stats.elitePlayers + 1
		end

		local map = oPlayer.MapNumber
		stats.mapDistribution[map] = (stats.mapDistribution[map] or 0) + 1

		return true
	end)

	Object.ForEachMonster(function(oMonster)
		stats.totalMonsters = stats.totalMonsters + 1
		return true
	end)

	if stats.totalPlayers > 0 then
		stats.avgLevel = math.floor(stats.totalLevel / stats.totalPlayers)
	end

	Message.Send(0, adminIndex, 0, "=== Server Statistics ===")
	Message.Send(0, adminIndex, 0,
		string.format("Players: %d (VIP: %d, Elite: %d)",
			stats.totalPlayers, stats.vipPlayers, stats.elitePlayers))
	Message.Send(0, adminIndex, 0,
		string.format("Avg Level: %d | Monsters: %d",
			stats.avgLevel, stats.totalMonsters))

	for map, count in pairs(stats.mapDistribution) do
		if count > 0 then
			Message.Send(0, adminIndex, 0,
				string.format("Map %d: %d players", map, count))
		end
	end

	return stats
end

function GM_FindPlayers(adminIndex, criteria)
	local found = {}

	Object.ForEachPlayer(function(oPlayer)
		local match = true

		if criteria.minLevel and oPlayer.Level < criteria.minLevel then
			match = false
		end

		if criteria.maxLevel and oPlayer.Level > criteria.maxLevel then
			match = false
		end

		if criteria.mapNumber and oPlayer.MapNumber ~= criteria.mapNumber then
			match = false
		end

		if criteria.class and oPlayer.Class ~= criteria.class then
			match = false
		end

		if match then
			table.insert(found, {
				Name = oPlayer.Name,
				Level = oPlayer.Level,
				Map = oPlayer.MapNumber,
				Class = oPlayer.Class
			})
		end

		return true
	end)

	Message.Send(0, adminIndex, 0,
		string.format("Found %d players matching criteria", #found))

	for i, player in ipairs(found) do
		Message.Send(0, adminIndex, 0,
			string.format("%d. %s (L%d, Map%d, Class%d)",
				i, player.Name, player.Level, player.Map, player.Class))

		if i >= 10 then
			Message.Send(0, adminIndex, 0, "... (showing first 10)")
			break
		end
	end

	return found
end

function GM_FindSuspicious(adminIndex)
	local suspicious = {}

	Object.ForEachPlayer(function(oPlayer)
		local flags = {}

		if oPlayer.userData.Strength > 65000 then
			table.insert(flags, "High STR")
		end

		if oPlayer.userData.Money > 2000000000 then
			table.insert(flags, "High Zen")
		end

		if oPlayer.Level == 400 and oPlayer.userData.Resets == 0 then
			table.insert(flags, "No Resets at max level")
		end

		if #flags > 0 then
			table.insert(suspicious, {
				Name = oPlayer.Name,
				Flags = flags,
				Map = oPlayer.MapNumber
			})
		end

		return true
	end)

	Message.Send(0, adminIndex, 0,
		string.format("Found %d suspicious players", #suspicious))

	for i, player in ipairs(suspicious) do
		Message.Send(0, adminIndex, 0,
			string.format("%s - %s (Map %d)",
				player.Name, table.concat(player.Flags, ", "), player.Map))
	end

	return suspicious
end

--═══════════════════════════════════════════════════════════════
-- END OF ADMIN EXAMPLES
--═══════════════════════════════════════════════════════════════
