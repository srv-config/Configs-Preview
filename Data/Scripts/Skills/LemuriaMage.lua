-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- LemuriaMage Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 1, Poison
function Poison_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2, Meteorite
function Meteorite_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 3, Lightning
function Lightning_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 5, Flame
function Flame_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 10, Hellfire
function Hellfire_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 14, Inferno
function Inferno_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_LemuriaMage(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_LemuriaMage(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_LemuriaMage(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_LemuriaMage(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 38, Decay
function Decay_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 39, Ice Storm
function IceStorm_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_LemuriaMage(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_LemuriaMage(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 233, Expansion of Wizardry
function ExpansionOfWizardry_LemuriaMage(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 240, Magical Shot
function MagicalShot_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 245, Marvel Burst
function MarvelBurst(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 246, Unleash Marvel
function UnleashMarvel(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 247, Ultimate Force
function UltimateForce(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2007, Beginner Healing
function BeginnerHealing(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = Energy / 10 + 5
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = Energy / 10 + 5
	end

	return SkillEffect
end

-- SkillID: 2008, Beginner Recovery
function BeginnerRecovery(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 8 + oPlayer.Level

	return SkillEffect
end

-- SkillID: 2009, Beginner Basic Defense Improvement
function BeginnerBasicDefenseImprovement(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 16
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 16
	end

	return SkillEffect, SkillTime
end

-- SkillID: 2010, Beginner Attack Power Improvement
function BeginnerAttackPowerImprovement(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 15
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 15
	end

	return SkillEffect, SkillTime
end

-- SkillID: 2011, Beginner Bless
function BeginnerBless(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 150

	return SkillEffect
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 378, Flame Strengthener
function FlameStrengthener_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 380, Expansion of Wizardry Power Up
function ExpansionOfWizardryPowerUp_LemuriaMage(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 381, Inferno Strengthener
function InfernoStrengthener_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 383, Expansion of Wizardry Mastery
function ExpansionOfWizardryMastery_LemuriaMage(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 389, Ice Strengthener
function IceStrengthener_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 391, Ice Storm Strengthener
function IceStormStrengthener_LemuriaMage(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 495, Earth Prison
function EarthPrison_LemuriaMage(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_LemuriaMage(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 848, Marvel Burst Strengthener
function MarvelBurstStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 849, Marvel Burst Mastery
function MarvelBurstMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 851, Beginner Defense Improvement Strengthener
function BeginnerDefenseImprovementStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 16
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 16
	end

	return SkillEffect, SkillTime
end

-- SkillID: 852, Beginner Defense Improvement Mastery
function BeginnerDefenseImprovementMastery(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 16
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 16
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 16
	end

	return SkillEffect, SkillTime
end

-- SkillID: 853, Beginner Attack Power Improvement Strengthener
function BeginnerAttackPowerImprovementStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 15
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 15
	end

	return SkillEffect, SkillTime
end

-- SkillID: 854, Beginner Attack Improvement Mastery
function BeginnerAttackImprovementMastery(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 15
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 15
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 15
	end

	return SkillEffect, SkillTime
end

-- SkillID: 855, Unleash Marvel Strengthener
function UnleashMarvelStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 856, Unleash Marvel Mastery
function UnleashMarvelMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 857, Beginner Bless Strengthener
function BeginnerBlessStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 150

	return SkillEffect
end

-- SkillID: 858, Intensive Care Strengthener
function IntensiveCareStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = Energy / 10 + 5
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = Energy / 10 + 5
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = Energy / 10 + 5
	end

	return SkillEffect
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1217, Marvel Burst Enhancement Skill
function MarvelBurstEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1218, Unleash Marvel Enhancement Skill
function UnleashMarvelEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1219, Ultimate Force Enhancement Skill
function UltimateForceEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	end

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2076, Ultimate Storm of Saturation
function UltimateStormOfSaturation(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 28, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * MagicAttackPower / 100
	end

	return OutDamage
end
