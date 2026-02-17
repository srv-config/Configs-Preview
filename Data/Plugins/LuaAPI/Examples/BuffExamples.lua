--═══════════════════════════════════════════════════════════════
-- Buff System Examples
--═══════════════════════════════════════════════════════════════
-- Buff.Add signature:
--   Buff.Add(oPlayer, iBuffIndex, EffectType1, EffectValue1, EffectType2, EffectValue2,
--             iBuffDuration, BuffSendValue, nAttackerIndex)
-- Buff.AddItem signature:
--   Buff.AddItem(oPlayer, iBuffIndex)
-- Buff.Remove signature:
--   Buff.Remove(oPlayer, iBuffIndex)
-- Buff.CheckUsed signature:
--   Buff.CheckUsed(oPlayer, iBuffIndex)
-- All Buff functions take oPlayer object, NOT player index.
--═══════════════════════════════════════════════════════════════

--═══════════════════════════════════════════════════════════════
-- Buff.AddItem - Item buffs (EffectType loaded from item config)
--═══════════════════════════════════════════════════════════════

function UseContractDamagePotion(iPlayerIndex)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.AddItem(oPlayer, Enums.BuffType.CONTRACT_DAMAGE_ITEM)

	Message.Send(0, iPlayerIndex, 0, "Contract Damage activated!")
	Log.Add(string.format("[Buff] %s activated Contract Damage buff", oPlayer.AccountId))
end

function ActivateCombatPotions(iPlayerIndex)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.AddItem(oPlayer, Enums.BuffType.CONTRACT_DAMAGE_ITEM)
	Buff.AddItem(oPlayer, Enums.BuffType.CONTRACT_ATTACKSPEED_PCS)
	Buff.AddItem(oPlayer, Enums.BuffType.CONTRACT_HP_ITEM)

	Message.Send(0, iPlayerIndex, 1, "Combat buffs activated!")
end

function GiveEventRewardBuff(iPlayerIndex, rewardType)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	if rewardType == "damage" then
		Buff.AddItem(oPlayer, Enums.BuffType.PCS_SCROLL_ANGER)
	elseif rewardType == "defense" then
		Buff.AddItem(oPlayer, Enums.BuffType.PCS_SCROLL_DEFENSE)
	elseif rewardType == "speed" then
		Buff.AddItem(oPlayer, Enums.BuffType.PCS_SCROLL_HASTE)
	end
end

--═══════════════════════════════════════════════════════════════
-- Buff.Add - Full manual control
--═══════════════════════════════════════════════════════════════

function ApplyFireDebuff(iTargetIndex, iCasterIndex, iDamagePerTick, iDuration)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.FIREATTACK, Enums.EffectType.GIVE_DMG_TICK,
		iDamagePerTick, 0, 0, iDuration, 0, iCasterIndex)

	Message.Send(0, iTargetIndex, 0, "You're burning!")
end

function ApplyFrostDebuff(iTargetIndex, iCasterIndex)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.ICEATTACK, Enums.EffectType.ICE_DMG_TICK,
		50, 0, 0, 10, 0, iCasterIndex)
end

function ApplyPoisonArrow(iTargetIndex, iCasterIndex, iDotDamage, iDebuffTime)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.POISONARROW, Enums.EffectType.POISON_DMG_TICK,
		iDotDamage, 0, 0, iDebuffTime, 0, iCasterIndex)
end

function ApplyBlessBuffManual(iPlayerIndex, iDamageBonus, iDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Add(oPlayer, Enums.BuffType.BLESS, Enums.EffectType.IMPROVE_DAMAGE,
		iDamageBonus, 0, 0, iDuration, 0, 0)

	Message.Send(0, iPlayerIndex, 1,
		string.format("Bless: +%d damage for %ds", iDamageBonus, iDuration))
end

function ApplyDefenseBuff(iPlayerIndex, iDefenseBonus, iDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Add(oPlayer, Enums.BuffType.DEFENSE_POWER_INC, Enums.EffectType.IMPROVE_DEFENSE,
		iDefenseBonus, 0, 0, iDuration, 0, 0)
end

function ApplyHasteBuff(iPlayerIndex, iSpeedBonus, iDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Add(oPlayer, Enums.BuffType.HASTE, Enums.EffectType.HASTE_INCREASE_ATTACKSPEED,
		iSpeedBonus, 0, 0, iDuration, 0, 0)
end

function ApplyExpBoostBuff(iPlayerIndex, iExpPercent, iDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Add(oPlayer, Enums.BuffType.EXPUP_CHARM1, Enums.EffectType.EXPERIENCE,
		iExpPercent, 0, 0, iDuration, 0, 0)

	Message.Send(0, iPlayerIndex, 1,
		string.format("+%d%% Experience for %d seconds!", iExpPercent, iDuration))
end

function ApplyStun(iTargetIndex, iCasterIndex, iStunDuration)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.STUN, Enums.EffectType.NONE,
		0, 0, 0, iStunDuration, 0, iCasterIndex)

	Message.Send(0, iTargetIndex, 0, "Stunned!")
end

function ApplyParalyze(iTargetIndex, iCasterIndex, iDuration)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.PARALYZE, Enums.EffectType.NONE,
		0, 0, 0, iDuration, 0, iCasterIndex)
end

function ApplyBlind(iTargetIndex, iCasterIndex, iDuration)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.BLIND, Enums.EffectType.BLIND,
		0, 0, 0, iDuration, 0, iCasterIndex)
end

function ApplyDefenseReduction(iTargetIndex, iCasterIndex, iDefenseReduction, iDuration)
	local oTarget = Player.GetObjByIndex(iTargetIndex)
	if not oTarget then return end

	Buff.Add(oTarget, Enums.BuffType.DEFENSE_POWER_DEC, Enums.EffectType.DECREASE_DEFENSE,
		iDefenseReduction, 0, 0, iDuration, 0, iCasterIndex)
end

function ApplyDamageReflect(iPlayerIndex, iReflectPercent, iDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Add(oPlayer, Enums.BuffType.DAMAGE_REFLECT, Enums.EffectType.DAMAGEREFLECT,
		iReflectPercent, 0, 0, iDuration, 0, 0)

	Message.Send(0, iPlayerIndex, 1,
		string.format("Reflecting %d%% damage!", iReflectPercent))
end

--═══════════════════════════════════════════════════════════════
-- Buff.Remove and Buff.CheckUsed
--═══════════════════════════════════════════════════════════════

function RefreshPlayerBuff(iPlayerIndex, buffType, duration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	Buff.Remove(oPlayer, buffType)

	if buffType == Enums.BuffType.ATTACK_POWER_INC then
		Buff.Add(oPlayer, buffType, Enums.EffectType.IMPROVE_DAMAGE,
			100, 0, 0, duration, 0, 0)
	elseif buffType == Enums.BuffType.DEFENSE_POWER_INC then
		Buff.Add(oPlayer, buffType, Enums.EffectType.IMPROVE_DEFENSE,
			80, 0, 0, duration, 0, 0)
	end

	Message.Send(0, iPlayerIndex, 1, "Buff refreshed!")
end

function HasCombatBuff(iPlayerIndex)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return false end

	return Buff.CheckUsed(oPlayer, Enums.BuffType.ATTACK_POWER_INC)
end

--═══════════════════════════════════════════════════════════════
-- Timed Buff with expiry notification
-- Timer.Create is one-shot; use the aliveTime param for auto-cleanup
--═══════════════════════════════════════════════════════════════

function ApplyTimedBuff(iPlayerIndex, buffType, duration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	if buffType == "combat" then
		Buff.Add(oPlayer, Enums.BuffType.ATTACK_POWER_INC, Enums.EffectType.IMPROVE_DAMAGE,
			150, 0, 0, duration, 0, 0)
		Message.Send(0, iPlayerIndex, 1,
			string.format("Combat buff active for %d seconds!", duration))

	elseif buffType == "defense" then
		Buff.Add(oPlayer, Enums.BuffType.DEFENSE_POWER_INC, Enums.EffectType.IMPROVE_DEFENSE,
			100, 0, 0, duration, 0, 0)
		Message.Send(0, iPlayerIndex, 1,
			string.format("Defense buff active for %d seconds!", duration))
	end

	-- Notify when buff expires
	Timer.Create(duration * 1000, "buff_expire_" .. iPlayerIndex, function()
		local oP = Player.GetObjByIndex(iPlayerIndex)
		if oP then
			Message.Send(0, iPlayerIndex, 0, "Your buff has expired!")
		end
	end)
end

--═══════════════════════════════════════════════════════════════
-- Conditional buff based on level
--═══════════════════════════════════════════════════════════════

function ApplyLevelBasedBuff(iPlayerIndex)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	if oPlayer.Level < 100 then
		Buff.Add(oPlayer, Enums.BuffType.BEGINNER_ATTACK_POWER_INC, Enums.EffectType.IMPROVE_DAMAGE,
			50, 0, 0, 3600, 0, 0)
		Message.Send(0, iPlayerIndex, 1, "Beginner bonus: +50 attack for 1 hour!")

	elseif oPlayer.Level < 400 then
		Buff.Add(oPlayer, Enums.BuffType.EXPUP_CHARM1, Enums.EffectType.EXPERIENCE,
			30, 0, 0, 3600, 0, 0)
		Message.Send(0, iPlayerIndex, 1, "Training bonus: +30% EXP for 1 hour!")

	else
		Buff.Add(oPlayer, Enums.BuffType.ATTACK_POWER_INC, Enums.EffectType.IMPROVE_DAMAGE,
			200, 0, 0, 1800, 0, 0)
		Buff.Add(oPlayer, Enums.BuffType.DEFENSE_POWER_INC, Enums.EffectType.IMPROVE_DEFENSE,
			150, 0, 0, 1800, 0, 0)
		Message.Send(0, iPlayerIndex, 1, "Master bonus: +200 ATK, +150 DEF for 30 min!")
	end
end

--═══════════════════════════════════════════════════════════════
-- Party buff using Object.ForEachPartyMember
--═══════════════════════════════════════════════════════════════

function ApplyPartyBuff(iPlayerIndex, buffType, duration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	if oPlayer.PartyNumber < 0 then
		Message.Send(0, iPlayerIndex, 0, "You're not in a party!")
		return
	end

	local buffedCount = 0

	Object.ForEachPartyMember(oPlayer.PartyNumber, function(oMember)
		if buffType == "combat" then
			Buff.Add(oMember, Enums.BuffType.ATTACK_POWER_INC, Enums.EffectType.IMPROVE_DAMAGE,
				100, 0, 0, duration, 0, 0)
		elseif buffType == "defense" then
			Buff.Add(oMember, Enums.BuffType.DEFENSE_POWER_INC, Enums.EffectType.IMPROVE_DEFENSE,
				80, 0, 0, duration, 0, 0)
		elseif buffType == "exp" then
			Buff.Add(oMember, Enums.BuffType.PARTY_EXP_INCREASE_SCROLL, Enums.EffectType.EXPERIENCE,
				50, 0, 0, duration, 0, 0)
		end

		buffedCount = buffedCount + 1
		return true
	end)

	Message.Send(0, iPlayerIndex, 1,
		string.format("Applied %s buff to %d party members!", buffType, buffedCount))
end

--═══════════════════════════════════════════════════════════════
-- Area buff using ForEachPlayerOnMap with distance check
--═══════════════════════════════════════════════════════════════

function ApplyAreaBuff(iPlayerIndex, range, buffDuration)
	local oPlayer = Player.GetObjByIndex(iPlayerIndex)
	if not oPlayer then return end

	local buffedCount = 0

	Object.ForEachPlayerOnMap(oPlayer.MapNumber, function(oTarget)
		local dx = oTarget.X - oPlayer.X
		local dy = oTarget.Y - oPlayer.Y

		if math.sqrt(dx * dx + dy * dy) <= range then
			Buff.Add(oTarget, Enums.BuffType.ATTACK_POWER_INC, Enums.EffectType.IMPROVE_DAMAGE,
				80, 0, 0, buffDuration, 0, 0)
			Buff.Add(oTarget, Enums.BuffType.DEFENSE_POWER_INC, Enums.EffectType.IMPROVE_DEFENSE,
				60, 0, 0, buffDuration, 0, 0)

			Message.Send(0, oTarget.Index, 1, "Received area buff!")
			buffedCount = buffedCount + 1
		end

		return true
	end)

	Log.Add(string.format("[Area Buff] %s buffed %d players in range %d",
		oPlayer.AccountId, buffedCount, range))
end

--═══════════════════════════════════════════════════════════════
-- PvP debuff
--═══════════════════════════════════════════════════════════════

function ApplyPvPDebuff(iAttackerIndex, iTargetIndex, debuffType)
	local oAttacker = Player.GetObjByIndex(iAttackerIndex)
	local oTarget = Player.GetObjByIndex(iTargetIndex)

	if not oAttacker or not oTarget then return end

	if debuffType == "slow" then
		Buff.Add(oTarget, Enums.BuffType.REDUCE_ATTACK_SPEED, Enums.EffectType.REDUCE_ATTACK_SPEED,
			40, 0, 0, 8, 0, iAttackerIndex)
		Message.Send(0, iTargetIndex, 0, "Your attack speed has been reduced!")

	elseif debuffType == "weakness" then
		Buff.Add(oTarget, Enums.BuffType.ATTACK_POWER_DEC, Enums.EffectType.DECREASE_ATTACKPOWER,
			50, 0, 0, 10, 0, iAttackerIndex)
		Message.Send(0, iTargetIndex, 0, "Your attack power has been weakened!")

	elseif debuffType == "poison" then
		Buff.Add(oTarget, Enums.BuffType.POISON, Enums.EffectType.POISON_DMG_TICK,
			30, 0, 0, 12, 0, iAttackerIndex)
		Message.Send(0, iTargetIndex, 0, "You've been poisoned!")
	end
end

--═══════════════════════════════════════════════════════════════
-- END OF BUFF EXAMPLES
--═══════════════════════════════════════════════════════════════
