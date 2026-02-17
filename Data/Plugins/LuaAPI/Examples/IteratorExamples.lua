--═══════════════════════════════════════════════════════════════
-- Iterator Functions - Complete Examples
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Object.ForEachPlayer - all connected players
------------------------------------------------------------------

function SendGlobalAnnouncement(message, messageType)
	local count = 0

	Object.ForEachPlayer(function(oPlayer)
		Message.Send(0, oPlayer.Index, messageType or 0, message)
		count = count + 1
		return true
	end)

	Log.Add(string.format("Sent announcement to %d players", count))
end

function CollectPlayerStats()
	local stats = {
		totalPlayers = 0,
		totalLevel = 0,
		maxLevel = 0,
		minLevel = 999,
		avgLevel = 0,
		vipCount = 0,
		totalResets = 0
	}

	Object.ForEachPlayer(function(oPlayer)
		stats.totalPlayers = stats.totalPlayers + 1
		stats.totalLevel = stats.totalLevel + oPlayer.Level

		if oPlayer.Level > stats.maxLevel then stats.maxLevel = oPlayer.Level end
		if oPlayer.Level < stats.minLevel then stats.minLevel = oPlayer.Level end

		if oPlayer.userData.VIPType >= 0 then
			stats.vipCount = stats.vipCount + 1
		end

		stats.totalResets = stats.totalResets + oPlayer.userData.Resets

		return true
	end)

	if stats.totalPlayers > 0 then
		stats.avgLevel = math.floor(stats.totalLevel / stats.totalPlayers)
	end

	return stats
end

function FindRichestPlayer()
	local richest = nil
	local maxMoney = 0

	Object.ForEachPlayer(function(oPlayer)
		if oPlayer.userData.Money > maxMoney then
			maxMoney = oPlayer.userData.Money
			richest = oPlayer
		end
		return true
	end)

	if richest then
		Log.Add(string.format("Richest player: %s with %d zen", richest.Name, maxMoney))
	end

	return richest
end

------------------------------------------------------------------
-- Object.ForEachPlayerOnMap - players on specific map
------------------------------------------------------------------

function TeleportAllFromMap(sourceMap, targetMap, x, y)
	local teleported = 0

	Object.ForEachPlayerOnMap(sourceMap, function(oPlayer)
		Move.ToMap(oPlayer.Index, targetMap, x, y)
		Message.Send(0, oPlayer.Index, 0, "You have been teleported!")
		teleported = teleported + 1
		return true
	end)

	Log.Add(string.format("Teleported %d players from map %d", teleported, sourceMap))
end

function IsMapEmpty(mapNumber)
	local isEmpty = true

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		isEmpty = false
		return false  -- stop on first found
	end)

	return isEmpty
end

function AwardZoneBonus(mapNumber, bonusZen)
	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		Player.SetMoney(oPlayer.Index, bonusZen, false)
		Message.Send(0, oPlayer.Index, 1,
			string.format("Zone Bonus: %d zen!", bonusZen))
		return true
	end)
end

------------------------------------------------------------------
-- Object.ForEachMonster - all alive monsters
------------------------------------------------------------------

function HealAllMonsters()
	local healed = 0

	Object.ForEachMonster(function(oMonster)
		oMonster.Life = oMonster.MaxLife
		oMonster.Mana = oMonster.MaxMana
		healed = healed + 1
		return true
	end)

	Log.Add(string.format("Healed %d monsters", healed))
end

function KillAllMonsters()
	local killed = 0

	Object.ForEachMonster(function(oMonster)
		Object.DelMonster(oMonster.Index)
		killed = killed + 1
		return true
	end)

	Log.Add(string.format("Killed %d monsters", killed))
end

function FindWoundedMonsters(hpThreshold)
	local wounded = {}

	Object.ForEachMonster(function(oMonster)
		local hpPercent = (oMonster.Life / oMonster.MaxLife) * 100
		if hpPercent < hpThreshold then
			table.insert(wounded, {
				Class = oMonster.Class,
				Index = oMonster.Index,
				HP = hpPercent,
				Map = oMonster.MapNumber,
				X = oMonster.X,
				Y = oMonster.Y
			})
		end
		return true
	end)

	return wounded
end

------------------------------------------------------------------
-- Object.ForEachMonsterOnMap - monsters on specific map
------------------------------------------------------------------

function ClearMapMonsters(mapNumber)
	local cleared = 0

	Object.ForEachMonsterOnMap(mapNumber, function(oMonster)
		Object.DelMonster(oMonster.Index)
		cleared = cleared + 1
		return true
	end)

	Log.Add(string.format("Cleared %d monsters from map %d", cleared, mapNumber))
end

function CheckMonsterDensity(mapNumber, expectedCount)
	local count = 0

	Object.ForEachMonsterOnMap(mapNumber, function(oMonster)
		count = count + 1
		return true
	end)

	if count < expectedCount then
		Log.Add(string.format("Map %d: Low monster count (%d/%d)",
			mapNumber, count, expectedCount))
		return true  -- needs respawn
	end

	return false
end

function FindBossOnMap(mapNumber)
	local bosses = {}

	Object.ForEachMonsterOnMap(mapNumber, function(oMonster)
		if oMonster.Class >= 200 and oMonster.Class <= 250 then
			table.insert(bosses, {
				Class = oMonster.Class,
				Index = oMonster.Index,
				HP = (oMonster.Life / oMonster.MaxLife) * 100,
				X = oMonster.X,
				Y = oMonster.Y
			})
		end
		return true
	end)

	return bosses
end

------------------------------------------------------------------
-- Object.ForEachMonsterByClass - specific monster type
------------------------------------------------------------------

function FindGoldenGoblins()
	local goblins = {}

	Object.ForEachMonsterByClass(275, function(oMonster)
		table.insert(goblins, {
			Index = oMonster.Index,
			Map = oMonster.MapNumber,
			X = oMonster.X,
			Y = oMonster.Y,
			HP = (oMonster.Life / oMonster.MaxLife) * 100
		})
		return true
	end)

	if #goblins > 0 then
		Log.Add(string.format("Found %d Golden Goblins", #goblins))
	end

	return goblins
end

function KillMonsterType(monsterClass)
	local killed = 0

	Object.ForEachMonsterByClass(monsterClass, function(oMonster)
		Object.DelMonster(oMonster.Index)
		killed = killed + 1
		return true
	end)

	Log.Add(string.format("Killed %d monsters of class %d", killed, monsterClass))
end

-- Announce boss spawn location to all players
function AnnounceBossSpawn(bossClass)
	Object.ForEachMonsterByClass(bossClass, function(oMonster)
		local msg = string.format("Boss spawned on map %d at (%d, %d)!",
			oMonster.MapNumber, oMonster.X, oMonster.Y)

		Object.ForEachPlayer(function(oPlayer)
			Message.Send(0, oPlayer.Index, 2, msg)
			return true
		end)

		return false  -- announce first only
	end)
end

------------------------------------------------------------------
-- Object.ForEachPartyMember - party iteration
------------------------------------------------------------------

function AwardPartyBonus(partyNumber, bonusZen)
	local awarded = 0

	Object.ForEachPartyMember(partyNumber, function(oMember)
		Player.SetMoney(oMember.Index, bonusZen, false)
		Message.Send(0, oMember.Index, 1,
			string.format("Party Bonus: %d zen!", bonusZen))
		awarded = awarded + 1
		return true
	end)

	Log.Add(string.format("Awarded party bonus to %d members", awarded))
end

function GetPartyAverageLevel(partyNumber)
	local totalLevel = 0
	local count = 0

	Object.ForEachPartyMember(partyNumber, function(oMember)
		totalLevel = totalLevel + oMember.Level
		count = count + 1
		return true
	end)

	if count > 0 then
		return math.floor(totalLevel / count)
	end

	return 0
end

function TeleportParty(partyNumber, targetMap, x, y)
	local teleported = 0

	Object.ForEachPartyMember(partyNumber, function(oMember)
		Move.ToMap(oMember.Index, targetMap, x, y)
		teleported = teleported + 1
		return true
	end)

	Log.Add(string.format("Teleported %d party members", teleported))
end

------------------------------------------------------------------
-- Object.ForEachGuildMember - guild iteration
------------------------------------------------------------------

function GuildBroadcast(guildName, message, messageType)
	local sent = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		Message.Send(0, oMember.Index, messageType or 0, message)
		sent = sent + 1
		return true
	end)

	Log.Add(string.format("Sent guild message to %d members", sent))
end

function AwardGuildAchievement(guildName, bonusZen, bonusItemId)
	local awarded = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		Player.SetMoney(oMember.Index, bonusZen, false)

		if bonusItemId then
			local stItem = CreateItemInfo()
			stItem.ItemId = bonusItemId
			stItem.LootIndex = oMember.Index
			stItem.TargetInvenPos = 255
			Item.Create(oMember.Index, stItem)
		end

		Message.Send(0, oMember.Index, 1,
			string.format("Guild Achievement: %d zen!", bonusZen))
		awarded = awarded + 1
		return true
	end)

	Log.Add(string.format("Awarded guild achievement to %d members", awarded))
end

function TeleportGuildToWar(guildName, targetMap, x, y)
	local teleported = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		Move.ToMap(oMember.Index, targetMap, x, y)
		Message.Send(0, oMember.Index, 2, "Guild War! Prepare for battle!")
		teleported = teleported + 1
		return true
	end)

	Log.Add(string.format("Teleported %d guild members to war", teleported))
end

------------------------------------------------------------------
-- Area iteration (no ForEachNearby needed, use map + distance)
------------------------------------------------------------------

function AOEHeal(centerIndex, range, healAmount)
	local oCenter = Player.GetObjByIndex(centerIndex)
	if not oCenter then return 0 end

	local healed = 0

	Object.ForEachPlayerOnMap(oCenter.MapNumber, function(oPlayer)
		local dx = oPlayer.X - oCenter.X
		local dy = oPlayer.Y - oCenter.Y

		if math.sqrt(dx * dx + dy * dy) <= range then
			oPlayer.Life = math.min(oPlayer.Life + healAmount, oPlayer.MaxLife)
			Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
			healed = healed + 1
		end
		return true
	end)

	return healed
end

function AOEDamage(centerIndex, range, damage)
	local oCenter = Player.GetObjByIndex(centerIndex)
	if not oCenter then return 0 end

	local damaged = 0

	Object.ForEachMonsterOnMap(oCenter.MapNumber, function(oMonster)
		local dx = oMonster.X - oCenter.X
		local dy = oMonster.Y - oCenter.Y

		if math.sqrt(dx * dx + dy * dy) <= range then
			oMonster.Life = math.max(oMonster.Life - damage, 0)
			damaged = damaged + 1
		end
		return true
	end)

	return damaged
end

function FindNearestMonster(centerIndex, maxRange)
	local oCenter = Player.GetObjByIndex(centerIndex)
	if not oCenter then return nil, 0 end

	local nearest = nil
	local nearestDist = maxRange + 1

	Object.ForEachMonsterOnMap(oCenter.MapNumber, function(oMonster)
		local dx = oMonster.X - oCenter.X
		local dy = oMonster.Y - oCenter.Y
		local dist = math.sqrt(dx * dx + dy * dy)

		if dist < nearestDist then
			nearest = oMonster
			nearestDist = dist
		end
		return true
	end)

	return nearest, nearestDist
end

--═══════════════════════════════════════════════════════════════
-- END OF ITERATOR EXAMPLES
--═══════════════════════════════════════════════════════════════
