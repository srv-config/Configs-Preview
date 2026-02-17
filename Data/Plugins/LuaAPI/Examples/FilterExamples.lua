--═══════════════════════════════════════════════════════════════
-- Object Iterator Functions - Filter Examples
--═══════════════════════════════════════════════════════════════
-- Examples for optional filter callbacks with CountPlayersOnMap
-- and CountMonstersOnMap.
--
-- IMPORTANT: VIP Level System
--   userData.VIPType: -1 = no VIP, 0+ = has VIP
--   Use: oPlayer.userData.VIPType >= 0  to check for any VIP
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- Basic counts - no filter
------------------------------------------------------------------

local totalPlayers = Object.CountPlayersOnMap(0)
Log.Add(string.format("Lorencia: %d players", totalPlayers))

local totalMonsters = Object.CountMonstersOnMap(2)
Log.Add(string.format("Devias: %d monsters", totalMonsters))

------------------------------------------------------------------
-- Player filters
------------------------------------------------------------------

local elitePlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.Level >= 400
end)

local vipPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.userData.VIPType >= 0
end)

local veteranPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.userData.Resets >= 10
end)

local richPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.userData.Money >= 100000000
end)

local soloPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.PartyNumber < 0
end)

local strongPlayers = Object.CountPlayersOnMap(0, function(oPlayer)
	return oPlayer.userData.Strength >= 1000
		and oPlayer.userData.Dexterity >= 1000
		and oPlayer.userData.Vitality >= 1000
end)

local playersInArea = Object.CountPlayersOnMap(2, function(oPlayer)
	return oPlayer.X >= 100 and oPlayer.X <= 150
		and oPlayer.Y >= 100 and oPlayer.Y <= 150
end)

------------------------------------------------------------------
-- Monster filters
------------------------------------------------------------------

local bossCount = Object.CountMonstersOnMap(2, function(oMonster)
	return oMonster.Class >= 200 and oMonster.Class <= 250
end)

local goldenGoblins = Object.CountMonstersOnMap(0, function(oMonster)
	return oMonster.Class == 275
end)

local lowHpMonsters = Object.CountMonstersOnMap(2, function(oMonster)
	return (oMonster.Life / oMonster.MaxLife) < 0.2
end)

local monstersInArea = Object.CountMonstersOnMap(3, function(oMonster)
	return oMonster.X >= 50 and oMonster.X <= 100
		and oMonster.Y >= 50 and oMonster.Y <= 100
end)

------------------------------------------------------------------
-- Practical use cases
------------------------------------------------------------------

-- Event eligibility: map clear, enough qualified players
function CanStartBossEvent(mapNumber, minPlayers, minLevel, minResets)
	if Object.CountMonstersOnMap(mapNumber) > 0 then
		return false, "Clear all monsters first"
	end

	local eligible = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.Level >= minLevel and oPlayer.userData.Resets >= minResets
	end)

	if eligible < minPlayers then
		return false, string.format("Need %d eligible players (have %d)", minPlayers, eligible)
	end

	local solo = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.PartyNumber < 0
	end)

	if solo > 0 then
		return false, "All players must be in a party"
	end

	return true, "Event can start!"
end

-- Dynamic difficulty based on average level on map
function GetEventDifficulty(mapNumber)
	local totalLevel = 0
	local playerCount = 0

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		totalLevel = totalLevel + oPlayer.Level
		playerCount = playerCount + 1
		return true
	end)

	if playerCount == 0 then return "easy" end

	local avgLevel = totalLevel / playerCount

	if avgLevel >= 400 then return "hard"
	elseif avgLevel >= 350 then return "normal"
	else return "easy"
	end
end

-- Reward only eligible participants
function AwardEventRewards(mapNumber, minLevel, minResets, rewardBase)
	local eliteCount = Object.CountPlayersOnMap(mapNumber, function(oPlayer)
		return oPlayer.Level >= minLevel and oPlayer.userData.Resets >= minResets
	end)

	local reward = rewardBase * eliteCount

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		if oPlayer.Level >= minLevel and oPlayer.userData.Resets >= minResets then
			Player.SetMoney(oPlayer.Index, reward, false)
			Message.Send(0, oPlayer.Index, 1,
				string.format("Event reward: %d zen!", reward))
		end
		return true
	end)

	Log.Add(string.format("Awarded %d zen to %d players", reward, eliteCount))
end

-- Monster respawn trigger
function NeedsRespawn(mapNumber, monsterClass, minCount)
	local count = Object.CountMonstersOnMap(mapNumber, function(oMonster)
		return oMonster.Class == monsterClass
	end)

	if count < minCount then
		Log.Add(string.format("Map %d needs respawn: %d/%d of class %d",
			mapNumber, count, minCount, monsterClass))
		return true
	end

	return false
end

-- Per-minute low HP alert
function CheckLowHPPlayers()
	for mapNum = 0, 10 do
		local lowHp = Object.CountPlayersOnMap(mapNum, function(oPlayer)
			return (oPlayer.Life / oPlayer.MaxLife) < 0.3
		end)

		if lowHp > 3 then
			Log.Add(string.format("Map %d: %d players low HP!", mapNum, lowHp))
		end
	end
end

--═══════════════════════════════════════════════════════════════
-- END OF FILTER EXAMPLES
--═══════════════════════════════════════════════════════════════
