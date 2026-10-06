-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- LightWizard Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 3, Lightning
function Lightning_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 12, Aqua Beam
function AquaBeam_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 13, Cometfall
function Cometfall_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_LightWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_LightWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_LightWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 40, Nova
function Nova_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_LightWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_LightWizard(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 233, Expansion of Wizardry
function ExpansionOfWizardry_LightWizard(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 240, Magical Shot
function MagicalShot_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = (InDamage * 1.0) * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 241, Shining Bird
function ShiningBird(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = (InDamage * 1.0) * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 242, Dragon Violent
function DragonViolent(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 243, Spear Storm
function SpearStorm(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 244, Reflection Barrier
function ReflectionBarrier(oPlayer)
	local ReflectProbability = 50
	local ReflectShockDmgPercentage = 50
	local Duration = 60
	return ReflectProbability, ReflectShockDmgPercentage, Duration
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 379, Lightning Strengthener
function LightningStrengthener_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 380, Expansion of Wizardry Power Up
function ExpansionOfWizardryPowerUp_LightWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 382, Blast Strengthener
function BlastStrengthener_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 383, Expansion of Wizardry Mastery
function ExpansionOfWizardryMastery_LightWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 389, Ice Strengthener
function IceStrengthener_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 392, Nova Strengthener
function NovaStrengthener_LightWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 495, Earth Prison
function EarthPrison_LightWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_LightWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 843, Shining Bird Strengthener
function ShiningBirdStrengthener(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100

	return OutDamage
end

-- SkillID: 844, Shining Bird Mastery
function ShiningBirdMastery(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100

	return OutDamage
end

-- SkillID: 846, Dragon Violent Strengthener
function DragonViolentStrengthener(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100
	end

	return OutDamage
end

-- SkillID: 847, Dragon Violent Mastery
function DragonViolentMastery(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * (MagicAttackPower + SkillTreeValue)) / 100
	end

	return OutDamage
end

-- SkillID: 861, Reflection Barrier Strengthener
function ReflectionBarrierStrengthener(oPlayer, SkillTreeValue)
	local ReflectProbability = 50
	local ReflectShockDmgPercentage = 50 + SkillTreeValue
	local Duration = 60
	return ReflectProbability, ReflectShockDmgPercentage, Duration
end

-- SkillID: 862, Reflection Barrier Skills
function ReflectionBarrierSkills(oPlayer, SkillTreeValue, SkillTreeValue2)
	local ReflectProbability = 50
	local ReflectShockDmgPercentage = 50 + SkillTreeValue
	local Duration = 60 + SkillTreeValue2
	return ReflectProbability, ReflectShockDmgPercentage, Duration
end

-- SkillID: 863, Reflection Barrier Mastery
function ReflectionBarrierMastery(oPlayer, SkillTreeValue, SkillTreeValue2)
	local ReflectProbability = 50
	local ReflectShockDmgPercentage = 50 + SkillTreeValue
	local Duration = 60 + SkillTreeValue2
	return ReflectProbability, ReflectShockDmgPercentage, Duration
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1216, Spear Storm Enhancement Skill
function SpearStormEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 3) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	end

	return OutDamage
end

-- SkillID: 1220, Shining Bird Enhancement Skill
function ShiningBirdEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	end

	return OutDamage
end

-- SkillID: 1221, Dragon Violent Enhancement Skill
function DragonViolentEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 3) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	end

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2080, Spear Storm of Saturation
function SpearStormOfSaturation(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 202, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 3) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	elseif (BarrageCount == 4) then
		OutDamage = ((InDamage * 1.0) * MagicAttackPower) / 100
	end

	return OutDamage
end
