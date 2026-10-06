-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- Crusader Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_Crusader(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 41, Twisting Slash
function TwistingSlash_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 42, Anger Strike
function AngerStrike_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 74, Fire Blast
function FireBlast_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_Crusader(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 232, Strike of Destruction
function StrikeOfDestruction_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 2105, Divine Fall
function DivineFall(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 2106, Holly Sweep
function HollySweep(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 2107, Secred Impact
function SecredImpact(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 328, Falling Slash Strengthener
function FallingSlashStrengthener_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 330, Twisting Slash Strengthener
function TwistingSlashStrengthener_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 331, 812, Anger Blow Strengthener
function AngerBlowStrengthener_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 344, Blood Storm
function BloodStorm_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 346, Blood Storm Strengthener
function BloodStormStrengthener_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 807, Strike of Destruction Strengthener
function StrikeOfDestructionStrengthener_Crusader(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * DivineAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * DivineAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 809, Strike of Destruction Mastery
function StrikeOfDestructionMastery_Crusader(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * (DivineAttackPower + SkillTreeValue)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * (DivineAttackPower + SkillTreeValue)) / 100
	end

	return OutDamage
end

-- SkillID: 811, Tornado Strengthener
function TornadoStrengthener_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 813, Rush
function Rush_Crusader(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 919, Divine Fall Strengthener
function DivineFallStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 920, Divine Fall Mastery
function DivineFallMastery(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 921, Holly Sweep Strengthener
function HollySweepStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 923, Secred Impact Strengthener
function SecredImpactStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1506, Divine Fall Enhancement Skill
function DivineFallEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 1507, Holly Sweep Enhancement Skill
function HollySweepEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- SkillID: 1508, Secred Impact Enhancement Skill
function SecredImpactEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2109, Sacred Impact of Gale
function SacredImpactOfGale(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 60, Strength, Energy)
	end

	local OutDamage = InDamage * DivineAttackPower / 100

	return OutDamage
end
