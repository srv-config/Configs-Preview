--═══════════════════════════════════════════════════════════════
-- Combat System Examples
--═══════════════════════════════════════════════════════════════

------------------------------------------------------------------
-- AOE Damage - ForEachNearby
------------------------------------------------------------------

-- AOE explosion: damage all monsters within range of a center object
function AOE_DamageMonsters(centerIndex, range, damage)
	local hit = 0

	Object.ForEachNearby(centerIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.MONSTER then
			oTarget.Life = math.max(oTarget.Life - damage, 0)
			hit = hit + 1
		end
		return true
	end)

	return hit
end

-- AOE damage with falloff (50% reduction at max range)
function AOE_DamageFalloff(centerIndex, range, baseDamage)
	local hit = 0

	Object.ForEachNearby(centerIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.MONSTER then
			local falloff = 1.0 - ((distance / range) * 0.5)
			local finalDamage = math.floor(baseDamage * falloff)
			oTarget.Life = math.max(oTarget.Life - finalDamage, 0)
			hit = hit + 1
		end
		return true
	end)

	return hit
end

-- AOE PvP damage (players only, min 1 HP)
function AOE_DamagePlayers(centerIndex, range, damage)
	local hit = 0

	Object.ForEachNearby(centerIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.USER then
			oTarget.Life = math.max(oTarget.Life - damage, 1)
			Player.SendLife(oTarget.Index, oTarget.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oTarget.Shield)
			hit = hit + 1
		end
		return true
	end)

	return hit
end

------------------------------------------------------------------
-- AOE Heal
------------------------------------------------------------------

function AOE_HealPlayers(centerIndex, range, healAmount)
	local healed = 0

	Object.ForEachNearby(centerIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.USER then
			oTarget.Life = math.min(oTarget.Life + healAmount, oTarget.MaxLife)
			Player.SendLife(oTarget.Index, oTarget.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oTarget.Shield)
			Message.Send(0, oTarget.Index, 0, string.format("+%d HP", healAmount))
			healed = healed + 1
		end
		return true
	end)

	return healed
end

------------------------------------------------------------------
-- AOE Buff - ForEachNearby
------------------------------------------------------------------

function AOE_BuffNearbyPlayers(centerIndex, range, buffIndex, duration)
	local buffed = 0

	Object.ForEachNearby(centerIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.USER then
			Buff.Add(oTarget, buffIndex, 0, 100, 0, 0, duration, 0, centerIndex)
			buffed = buffed + 1
		end
		return true
	end)

	return buffed
end

-- Party-wide buff
function Skill_PartyBuff(casterIndex, buffIndex, duration)
	local oCaster = Player.GetObjByIndex(casterIndex)
	if not oCaster or oCaster.PartyNumber < 0 then
		return 0
	end

	local buffed = 0

	Object.ForEachPartyMember(oCaster.PartyNumber, function(oMember)
		Buff.Add(oMember, buffIndex, 0, 100, 0, 0, duration, 0, casterIndex)
		Message.Send(0, oMember.Index, 0, "Party buff applied!")
		buffed = buffed + 1
		return true
	end)

	return buffed
end

------------------------------------------------------------------
-- Lifesteal
------------------------------------------------------------------

function Skill_Lifesteal(casterIndex, range, damagePercent, healPercent)
	local oCaster = Player.GetObjByIndex(casterIndex)
	if not oCaster then return 0 end

	local totalHealed = 0

	Object.ForEachNearby(casterIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.MONSTER then
			local damage = math.floor(oTarget.MaxLife * (damagePercent / 100))
			oTarget.Life = math.max(oTarget.Life - damage, 0)

			local heal = math.floor(damage * (healPercent / 100))
			oCaster.Life = math.min(oCaster.Life + heal, oCaster.MaxLife)
			Player.SendLife(oCaster.Index, oCaster.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oCaster.Shield)
			totalHealed = totalHealed + heal
		end
		return true
	end)

	if totalHealed > 0 then
		Message.Send(0, casterIndex, 0, string.format("+%d HP drained", totalHealed))
	end

	return totalHealed
end

------------------------------------------------------------------
-- Sweep/Cleave - monsters in range
------------------------------------------------------------------

-- 360 degree sweep
function Skill_Sweep(casterIndex, range, damage)
	local hit = 0

	Object.ForEachNearby(casterIndex, range, function(oTarget, distance)
		if oTarget.Type == Enums.ObjectType.MONSTER then
			local distMod = 1.0 - (distance / range * 0.5)
			oTarget.Life = math.max(oTarget.Life - math.floor(damage * distMod), 0)
			hit = hit + 1
		end
		return true
	end)

	return hit
end

------------------------------------------------------------------
-- Environmental Damage / Safe Zone Heal
------------------------------------------------------------------

-- Damage players standing in hazard zone
function Environmental_ZoneDamage(mapNumber, x1, y1, x2, y2, damage)
	local damaged = 0

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		if oPlayer.X >= x1 and oPlayer.X <= x2
		   and oPlayer.Y >= y1 and oPlayer.Y <= y2 then
			oPlayer.Life = math.max(oPlayer.Life - damage, 1)
			Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
			Message.Send(0, oPlayer.Index, 0, "Zone damage!")
			damaged = damaged + 1
		end
		return true
	end)

	return damaged
end

-- Heal players standing in safe zone
function Environmental_SafeZoneHeal(mapNumber, x1, y1, x2, y2, healAmount)
	local healed = 0

	Object.ForEachPlayerOnMap(mapNumber, function(oPlayer)
		if oPlayer.X >= x1 and oPlayer.X <= x2
		   and oPlayer.Y >= y1 and oPlayer.Y <= y2 then
			oPlayer.Life = math.min(oPlayer.Life + healAmount, oPlayer.MaxLife)
			oPlayer.Mana = math.min(oPlayer.Mana + healAmount, oPlayer.MaxMana)
			Player.SendLife(oPlayer.Index, oPlayer.Life, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.Shield)
			Player.SendMana(oPlayer.Index, oPlayer.Mana, Enums.HPManaUpdateFlag.CURRENT_HP_MANA, oPlayer.BP)
			healed = healed + 1
		end
		return true
	end)

	return healed
end

------------------------------------------------------------------
-- Combat Top Damage
------------------------------------------------------------------

-- Get top damage dealer for a monster (server built-in)
function GetBossTopDamage(monsterIndex)
	return Combat.GetTopDamageDealer(monsterIndex)
end

------------------------------------------------------------------
-- Boss kill reward based on top damage
------------------------------------------------------------------

function BossKillReward(monsterIndex, eventMap, totalReward)
	local topDealerIndex = Combat.GetTopDamageDealer(monsterIndex)

	-- Flat reward to everyone on map
	local baseReward = math.floor(totalReward * 0.5)
	local playerCount = Object.CountPlayersOnMap(eventMap)

	if playerCount > 0 then
		local share = math.floor(baseReward / playerCount)

		Object.ForEachPlayerOnMap(eventMap, function(oPlayer)
			Player.SetMoney(oPlayer.Index, share, false)
			Message.Send(0, oPlayer.Index, 1,
				string.format("Boss reward: %d zen!", share))
			return true
		end)
	end

	-- Bonus to top damage dealer
	local oTop = Player.GetObjByIndex(topDealerIndex)
	if oTop then
		local bonus = math.floor(totalReward * 0.5)
		Player.SetMoney(topDealerIndex, bonus, false)
		Message.Send(0, topDealerIndex, 1,
			string.format("Top Damage Bonus: %d zen!", bonus))

		Log.Add(string.format("[Combat] Top damage dealer: %s (bonus: %d zen)",
			oTop.Name, bonus))
	end
end

--═══════════════════════════════════════════════════════════════
-- END OF COMBAT EXAMPLES
--═══════════════════════════════════════════════════════════════
