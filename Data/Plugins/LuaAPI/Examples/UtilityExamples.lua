--═══════════════════════════════════════════════════════════════
-- Utility Functions - Complete Examples
--═══════════════════════════════════════════════════════════════
-- NOTE: Object.CountPlayersOnMap and Object.CountMonstersOnMap
-- both require a mapNumber argument - no global count functions.
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- CountPlayersOnMap - Simple Usage
------------------------------------------------------------------

function CheckMapPopulation()
	local mapNames = {
		[0] = "Lorencia", [1] = "Dungeon", [2] = "Devias",
		[3] = "Noria", [4] = "LostTower", [5] = "Exile",
		[6] = "Arena", [7] = "Atlans", [8] = "Tarkan", [10] = "Icarus"
	}

	Log.Add("=== Map Population ===")

	for mapNum, name in pairs(mapNames) do
		local count = Object.CountPlayersOnMap(mapNum)
		if count > 0 then
			Log.Add(string.format("%s (Map %d): %d players", name, mapNum, count))
		end
	end
end

function MonitorCrowdedMaps(threshold)
	for mapNum = 0, 255 do
		local count = Object.CountPlayersOnMap(mapNum)
		if count > threshold then
			Log.Add(string.format("WARNING: Map %d has %d players (threshold: %d)",
				mapNum, count, threshold))
		end
	end
end

function IsMapBalanced(map1, map2, maxDifference)
	local count1 = Object.CountPlayersOnMap(map1)
	local count2 = Object.CountPlayersOnMap(map2)
	local diff = math.abs(count1 - count2)
	return diff <= maxDifference, diff
end

------------------------------------------------------------------
-- CountPlayersOnMap - With Filters
------------------------------------------------------------------

function CountElitePlayersPerMap()
	local results = {}

	for mapNum = 0, 10 do
		local count = Object.CountPlayersOnMap(mapNum, function(oPlayer)
			return oPlayer.Level >= 400
		end)

		if count > 0 then
			results[mapNum] = count
			Log.Add(string.format("Map %d: %d elite players (400+)", mapNum, count))
		end
	end

	return results
end

function CountVIPPlayersOnMap(mapNumber, minVIPType)
	return Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.userData.VIPType >= (minVIPType or 0)
	end)
end

function CountRichPlayersOnMap(mapNumber, minZen)
	return Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.userData.Money >= minZen
	end)
end

function CountVeteranPlayersOnMap(mapNumber, minResets)
	return Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.userData.Resets >= minResets
	end)
end

function CountSoloPlayersOnMap(mapNumber)
	return Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.PartyNumber < 0
	end)
end

function CountPlayersInArea(mapNumber, x1, y1, x2, y2)
	return Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.X >= x1 and oPlayer.X <= x2
			and oPlayer.Y >= y1 and oPlayer.Y <= y2
	end)
end

------------------------------------------------------------------
-- CountMonstersOnMap
------------------------------------------------------------------

function CheckMapRespawn(mapNumber, minMonsters)
	local count = Object.CountMonstersOnMap(mapNumber)

	if count < minMonsters then
		Log.Add(string.format("Map %d needs respawn: %d/%d monsters",
			mapNumber, count, minMonsters))
		return true
	end

	return false
end

function IsMapClear(mapNumber)
	return Object.CountMonstersOnMap(mapNumber) == 0
end

function CountBossesOnMap(mapNumber)
	return Object.CountMonstersOnMap(mapNumber, function(oMonster)
		return oMonster.Class >= 200 and oMonster.Class <= 250
	end)
end

function CountMonsterTypeOnMap(mapNumber, monsterClass)
	return Object.CountMonstersOnMap(mapNumber, function(oMonster)
		return oMonster.Class == monsterClass
	end)
end

function CountWoundedMonstersOnMap(mapNumber, hpThreshold)
	return Object.CountMonstersOnMap(mapNumber, function(oMonster)
		return (oMonster.Life / oMonster.MaxLife) < (hpThreshold / 100)
	end)
end

function CountMonstersInArea(mapNumber, x1, y1, x2, y2)
	return Object.CountMonstersOnMap(mapNumber, function(oMonster)
		return oMonster.X >= x1 and oMonster.X <= x2
			and oMonster.Y >= y1 and oMonster.Y <= y2
	end)
end

------------------------------------------------------------------
-- GetObjByName
------------------------------------------------------------------

function TeleportPlayerByName(playerName, targetMap, x, y)
	local oPlayer = Player.GetObjByName(playerName)

	if oPlayer then
		Move.ToMap(oPlayer.Index, targetMap, x, y)
		Message.Send(0, oPlayer.Index, 0, "You have been teleported!")
		Log.Add(string.format("Teleported %s to map %d", playerName, targetMap))
		return true
	else
		Log.Add(string.format("Player %s not found or offline", playerName))
		return false
	end
end

function IsPlayerOnline(playerName)
	return Player.GetObjByName(playerName) ~= nil
end

function SendPrivateMessage(playerName, message)
	local oPlayer = Player.GetObjByName(playerName)

	if oPlayer then
		Message.Send(0, oPlayer.Index, 0, message)
		return true
	end

	return false
end

function GetPlayerInfo(playerName)
	local oPlayer = Player.GetObjByName(playerName)

	if not oPlayer then return nil end

	return {
		Name = oPlayer.Name,
		AccountId = oPlayer.AccountId,
		Index = oPlayer.Index,
		Level = oPlayer.Level,
		Class = oPlayer.Class,
		Map = oPlayer.MapNumber,
		X = oPlayer.X,
		Y = oPlayer.Y,
		Money = oPlayer.userData.Money,
		Resets = oPlayer.userData.Resets,
		VIPType = oPlayer.userData.VIPType
	}
end

function AwardPlayerByName(playerName, zenAmount, itemId, itemLevel)
	local oPlayer = Player.GetObjByName(playerName)

	if not oPlayer then
		Log.Add(string.format("Cannot award %s - player offline", playerName))
		return false
	end

	Player.SetMoney(oPlayer.Index, zenAmount, false)

	if itemId then
		local stItem = CreateItemInfo()
		stItem.ItemId = itemId
		stItem.ItemLevel = itemLevel or 0
		stItem.LootIndex = oPlayer.Index
		stItem.TargetInvenPos = 255
		Item.Create(oPlayer.Index, stItem)
	end

	Message.Send(0, oPlayer.Index, 1,
		string.format("You received %d zen!", zenAmount))

	Log.Add(string.format("Awarded %s: %d zen", playerName, zenAmount))
	return true
end

------------------------------------------------------------------
-- Combined Checks
------------------------------------------------------------------

function CheckEventEligibility(mapNumber, minPlayers, minLevel, maxMonsters)
	local monsterCount = Object.CountMonstersOnMap(mapNumber)

	if monsterCount > maxMonsters then
		return false, string.format("Too many monsters: %d (max: %d)",
			monsterCount, maxMonsters)
	end

	local eligible = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.Level >= minLevel
	end)

	if eligible < minPlayers then
		return false, string.format("Not enough eligible players: %d (need %d at level %d+)",
			eligible, minPlayers, minLevel)
	end

	return true, "Event can start!"
end

function CheckPvPBalance(mapNumber, guild1, guild2, maxDifference)
	local count1 = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.GuildName == guild1
	end)

	local count2 = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.GuildName == guild2
	end)

	local diff = math.abs(count1 - count2)

	if diff > maxDifference then
		return false, string.format("Unbalanced: %s=%d, %s=%d (diff: %d)",
			guild1, count1, guild2, count2, diff)
	end

	return true, string.format("Balanced: %s=%d, %s=%d",
		guild1, count1, guild2, count2)
end

function CalculateDynamicDifficulty(mapNumber)
	local totalPlayers = Object.CountPlayersOnMap(mapNumber)

	if totalPlayers == 0 then return "none" end

	local elitePlayers = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.Level >= 400 and oPlayer.userData.Resets >= 5
	end)

	local elitePercent = (elitePlayers / totalPlayers) * 100

	if elitePercent >= 70 then return "insane", 2.5
	elseif elitePercent >= 50 then return "hard", 2.0
	elseif elitePercent >= 30 then return "normal", 1.5
	else return "easy", 1.0
	end
end

function AutoSpawnControl(mapNumber, baseSpawnCount)
	local playerCount = Object.CountPlayersOnMap(mapNumber)
	local monsterCount = Object.CountMonstersOnMap(mapNumber)
	local desired = math.max(baseSpawnCount, playerCount * 2)
	local needed = desired - monsterCount

	if needed > 0 then
		Log.Add(string.format("Map %d: Need to spawn %d monsters (players: %d, monsters: %d)",
			mapNumber, needed, playerCount, monsterCount))
		return needed
	end

	return 0
end

-- Award top N players on map by level
function AwardTopPlayers(mapNumber, topCount, zenPerPlayer)
	local players = {}

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		table.insert(players, {
			Name = oPlayer.Name,
			Index = oPlayer.Index,
			Level = oPlayer.Level
		})
		return true
	end)

	table.sort(players, function(a, b) return a.Level > b.Level end)

	local awarded = 0

	for i = 1, math.min(topCount, #players) do
		Player.SetMoney(players[i].Index, zenPerPlayer, false)
		Message.Send(0, players[i].Index, 1,
			string.format("Top %d Reward: %d zen!", i, zenPerPlayer))
		awarded = awarded + 1
	end

	return awarded
end

------------------------------------------------------------------
-- Item ID Helpers
------------------------------------------------------------------

function CreateItemIdExamples()
	local kris       = Helpers.MakeItemId(0, 0)    -- Kris
	local bless      = Helpers.MakeItemId(14, 13)  -- Jewel of Bless
	local soul       = Helpers.MakeItemId(14, 14)  -- Jewel of Soul
	local chaos      = Helpers.MakeItemId(12, 15)  -- Jewel of Chaos
	local excalibur  = Helpers.MakeItemId(0, 19)   -- Excalibur

	Log.Add(string.format("Kris: %d", kris))
	Log.Add(string.format("Jewel of Bless: %d", bless))
	Log.Add(string.format("Jewel of Soul: %d", soul))
	Log.Add(string.format("Jewel of Chaos: %d", chaos))
	Log.Add(string.format("Excalibur: %d", excalibur))
end

function IsItemJewel(itemId)
	local t = Helpers.GetItemType(itemId)
	return t == 12 or t == 13 or t == 14
end

function IsItemWeapon(itemId)
	local t = Helpers.GetItemType(itemId)
	return t >= 0 and t <= 5
end

function IsItemArmor(itemId)
	local t = Helpers.GetItemType(itemId)
	return t >= 6 and t <= 11
end

function CountItemInInventory(iPlayerIndex, targetType, targetIndex)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return 0 end

	local count = 0

	for slot = 12, 75 do
		local item = oPlayer:GetInventoryItem(slot)
		if item and item.ItemId ~= 0xFFFFFFFF then
			if Helpers.GetItemType(item.ItemId) == targetType
			   and Helpers.GetItemIndex(item.ItemId) == targetIndex then
				count = count + 1
			end
		end
	end

	return count
end

function HasJewelOfBless(iPlayerIndex)
	local count = CountItemInInventory(iPlayerIndex, 14, 13)
	return count > 0, count
end

------------------------------------------------------------------
-- Color Helpers
------------------------------------------------------------------

function LogServerStatus()
	local totalPlayers = 0

	for mapNum = 0, 10 do
		totalPlayers = totalPlayers + Object.CountPlayersOnMap(mapNum)
	end

	if totalPlayers < 50 then
		Log.AddC(Helpers.RGB(0, 255, 0),
			string.format("Server Load: LOW (%d players)", totalPlayers))
	elseif totalPlayers < 200 then
		Log.AddC(Helpers.RGB(255, 165, 0),
			string.format("Server Load: MEDIUM (%d players)", totalPlayers))
	else
		Log.AddC(Helpers.RGB(255, 0, 0),
			string.format("Server Load: HIGH (%d players)", totalPlayers))
	end
end

--═══════════════════════════════════════════════════════════════
-- END OF UTILITY EXAMPLES
--═══════════════════════════════════════════════════════════════
