--═══════════════════════════════════════════════════════════════
-- Experience System Examples
--═══════════════════════════════════════════════════════════════
-- Player.SetExp signature:
--   Player.SetExp(iPlayerIndex, iTargetIndex, i64Exp, iAttackDamage, bMSBFlag, iMonsterType)
-- oPlayer.Experience must be modified first, then Player.SetExp called to send packet.
-- Message.Send signature:
--   Message.Send(iPlayerIndex, aTargetIndex, btType, szMessage)
--═══════════════════════════════════════════════════════════════

-- Basic experience grant
function GiveExperience(oPlayer, amount)
	oPlayer.Experience = oPlayer.Experience + amount
	Player.SetExp(oPlayer.Index, -1, amount, 0, false, 0)
	Message.Send(0, oPlayer.Index, 0, string.format("Gained %d experience!", amount))
end

-- Quest reward experience
function CompleteQuest(oPlayer, questName, expReward)
	Log.Add(string.format("%s completed quest: %s", oPlayer.Name, questName))

	oPlayer.Experience = oPlayer.Experience + expReward
	Player.SetExp(oPlayer.Index, -1, expReward, 0, false, 0)

	Message.Send(0, oPlayer.Index, 1,
		string.format("Quest Complete: %s! +%d EXP", questName, expReward))
end

-- Level-based experience scaling
function GiveScaledExperience(oPlayer, baseAmount)
	local multiplier = 1.0

	if oPlayer.Level < 100 then
		multiplier = 2.0
	elseif oPlayer.Level < 200 then
		multiplier = 1.5
	end

	local finalAmount = math.floor(baseAmount * multiplier)

	oPlayer.Experience = oPlayer.Experience + finalAmount
	Player.SetExp(oPlayer.Index, -1, finalAmount, 0, false, 0)

	if multiplier > 1.0 then
		Message.Send(0, oPlayer.Index, 0,
			string.format("Gained %d exp (x%.1f bonus!)", finalAmount, multiplier))
	end
end

-- Party experience distribution
function DistributePartyExp(partyLeaderIndex, totalExp)
	local partyCount = Party.GetCount(partyLeaderIndex)

	if partyCount == 0 then
		return
	end

	local bonusMultiplier = 1.0 + (partyCount * 0.1)
	local totalWithBonus = math.floor(totalExp * bonusMultiplier)
	local expPerMember = math.floor(totalWithBonus / partyCount)

	Log.Add(string.format("Party EXP: %d total, %d per member (x%.1f bonus)",
		totalWithBonus, expPerMember, bonusMultiplier))

	Object.ForEachPartyMember(partyLeaderIndex, function(oMember)
		oMember.Experience = oMember.Experience + expPerMember
		Player.SetExp(oMember.Index, -1, expPerMember, 0, false, 0)

		Message.Send(0, oMember.Index, 0,
			string.format("Party EXP: +%d (x%.1f bonus)", expPerMember, bonusMultiplier))
		return true
	end)
end

-- Boss kill experience
function OnBossKilled(oPlayer, bossIndex, bossClass)
	local bossRewards = {
		[275] = 500000,
		[276] = 750000,
		[277] = 1000000
	}

	local expReward = bossRewards[bossClass] or 100000

	oPlayer.Experience = oPlayer.Experience + expReward
	Player.SetExp(oPlayer.Index, bossIndex, expReward, 0, false, bossClass)

	-- Announce to all players
	Object.ForEachPlayer(function(oP)
		Message.Send(0, oP.Index, 1,
			string.format("%s defeated a boss and gained %d experience!", oPlayer.Name, expReward))
		return true
	end)
end

-- Event experience multiplier (stored in Lua-side variable)
local eventExpMultiplier = 1.0
local eventExpActive = false

function SetEventExpMultiplier(multiplier, duration)
	eventExpMultiplier = multiplier
	eventExpActive = true

	Object.ForEachPlayer(function(oP)
		Message.Send(0, oP.Index, 1,
			string.format("EXP Event: x%.1f for %d minutes!", multiplier, duration / 60))
		return true
	end)

	Timer.Create(duration * 1000, "exp_event_end", function()
		eventExpMultiplier = 1.0
		eventExpActive = false

		Object.ForEachPlayer(function(oP)
			Message.Send(0, oP.Index, 1, "EXP Event ended!")
			return true
		end)
	end)
end

function GiveEventExperience(oPlayer, baseAmount)
	local finalAmount = math.floor(baseAmount * eventExpMultiplier)

	oPlayer.Experience = oPlayer.Experience + finalAmount
	Player.SetExp(oPlayer.Index, -1, finalAmount, 0, false, 0)

	if eventExpActive and eventExpMultiplier > 1.0 then
		Message.Send(0, oPlayer.Index, 0,
			string.format("Gained %d exp (Event x%.1f!)", finalAmount, eventExpMultiplier))
	end
end

-- Daily quest bonus (Lua-side state tracking)
local dailyQuestData = {}

function GiveDailyQuestExp(oPlayer, questId, baseExp)
	local key = oPlayer.Name

	if not dailyQuestData[key] then
		dailyQuestData[key] = { count = 0, lastReset = os.time() }
	end

	-- Reset if new day
	local now = os.time()
	if os.date("%d", now) ~= os.date("%d", dailyQuestData[key].lastReset) then
		dailyQuestData[key].count = 0
		dailyQuestData[key].lastReset = now
	end

	dailyQuestData[key].count = dailyQuestData[key].count + 1
	local bonusMultiplier = 1.0 + (dailyQuestData[key].count * 0.05)
	local finalExp = math.floor(baseExp * bonusMultiplier)

	oPlayer.Experience = oPlayer.Experience + finalExp
	Player.SetExp(oPlayer.Index, -1, finalExp, 0, false, 0)

	Message.Send(0, oPlayer.Index, 0,
		string.format("Daily Quest %d: +%d exp (x%.2f bonus!)",
			dailyQuestData[key].count, finalExp, bonusMultiplier))
end

-- VIP experience bonus
function GiveVIPExperience(oPlayer, baseAmount)
	-- VIPType: -1 = no VIP, 0+ = VIP level
	local vipLevel = oPlayer.userData.VIPType
	local multiplier = 1.0

	if vipLevel >= 0 then
		multiplier = 1.0 + ((vipLevel + 1) * 0.1)
	end

	local finalAmount = math.floor(baseAmount * multiplier)

	oPlayer.Experience = oPlayer.Experience + finalAmount
	Player.SetExp(oPlayer.Index, -1, finalAmount, 0, false, 0)

	if vipLevel >= 0 then
		Message.Send(0, oPlayer.Index, 0,
			string.format("Gained %d exp (VIP %d: x%.1f)", finalAmount, vipLevel, multiplier))
	end
end

-- Guild experience sharing
function ShareGuildExperience(guildName, totalExp)
	local memberCount = 0

	Object.ForEachGuildMember(guildName, function(oMember)
		memberCount = memberCount + 1
		return true
	end)

	if memberCount == 0 then
		return
	end

	local expPerMember = math.floor(totalExp / memberCount)

	Object.ForEachGuildMember(guildName, function(oMember)
		oMember.Experience = oMember.Experience + expPerMember
		Player.SetExp(oMember.Index, -1, expPerMember, 0, false, 0)

		Message.Send(0, oMember.Index, 0,
			string.format("Guild EXP Share: +%d (%d members)", expPerMember, memberCount))
		return true
	end)

	Log.Add(string.format("Guild %s shared %d exp among %d members",
		guildName, totalExp, memberCount))
end

-- Area clear bonus
function GiveAreaClearBonus(mapNumber)
	local monsterCount = Object.CountMonstersOnMap(mapNumber)

	if monsterCount == 0 then
		local mapBonuses = {
			[0] = 10000,
			[1] = 25000,
			[2] = 15000,
			[7] = 100000
		}

		local bonus = mapBonuses[mapNumber] or 5000

		Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
			oPlayer.Experience = oPlayer.Experience + bonus
			Player.SetExp(oPlayer.Index, -1, bonus, 0, false, 0)

			Message.Send(0, oPlayer.Index, 1,
				string.format("Area Cleared! Bonus: +%d EXP", bonus))
			return true
		end)
	end
end

-- Combo kill experience bonus (Lua-side state)
local comboKills = {}

function OnMonsterKilled(oPlayer, monsterIndex, baseExp)
	local key = oPlayer.Name

	if not comboKills[key] then
		comboKills[key] = { count = 0, lastKillTime = 0 }
	end

	local now = Timer.GetTick()

	if (now - comboKills[key].lastKillTime) > 5000 then
		comboKills[key].count = 0
	end

	comboKills[key].count = comboKills[key].count + 1
	comboKills[key].lastKillTime = now

	local comboBonus = math.min(comboKills[key].count * 0.1, 2.0)
	local finalExp = math.floor(baseExp * (1.0 + comboBonus))

	oPlayer.Experience = oPlayer.Experience + finalExp
	Player.SetExp(oPlayer.Index, monsterIndex, finalExp, 0, false, 0)

	if comboKills[key].count > 1 then
		Message.Send(0, oPlayer.Index, 0,
			string.format("Combo x%d! +%d exp (x%.1f)",
				comboKills[key].count, finalExp, 1.0 + comboBonus))
	end
end

--═══════════════════════════════════════════════════════════════
-- END OF EXPERIENCE EXAMPLES
--═══════════════════════════════════════════════════════════════
