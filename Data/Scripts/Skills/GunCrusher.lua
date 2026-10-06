-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- GunCrusher Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 49, Fire Breath
function FireBreath_GunCrusher(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_GunCrusher(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 2001, Dark Plasma
function DarkPlasma(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2002, Ice Break
function IceBreak(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8 * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0 * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.2 * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2003, Ice Blast
function IceBlast(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2004, Death Fire
function DeathFire(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8 * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0 * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2005, Bursting Flare
function BurstingFlare(oPlayer, InDamage, BarrageCount, IsShockwave)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (IsShockwave == 1) then
		OutDamage = InDamage * 1.5 * MagicAttackPower / 100
		return OutDamage
	end

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2006, Death Ice
function DeathIce(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2021, Fixed Fire
function FixedFire(oPlayer)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillAddAttackSpeed = Agility / 50
	return SkillAddAttackSpeed
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 802, Sword's Fury Mastery
function SwordsFuryMastery_GunCrusher(oPlayer, SkillTreeValue)
	local BaseAddRange = 1
	local SkillTime = -10

	local SkillAddRange = BaseAddRange + SkillTreeValue

	return SkillAddRange, SkillTime
end

-- SkillID: 820, Dark Plasma Strengthener
function DarkPlasmaStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 821, Dark Plasma Proficiency
function DarkPlasmaProficiency(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 822, Dark Plasma Mastery
function DarkPlasmaMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 823, Ice Break Strengthener
function IceBreakStrengthener(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 824, Ice Break Mastery
function IceBreakMastery(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 825, Death Fire Strengthener
function DeathFireStrengthener(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 826, Death Fire Mastery
function DeathFireMastery(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 828, Fixed Fire Strengthener
function FixedFireStrengthener(oPlayer)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillAddAttackSpeed = Agility / 50
	return SkillAddAttackSpeed
end

-- SkillID: 829, Fixed Fire Mastery
function FixedFireMastery(oPlayer)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillAddAttackSpeed = Agility / 50
	return SkillAddAttackSpeed
end

-- SkillID: 835, Death Ice Strengthener
function DeathIceStrengthener(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 836, Death Ice Mastery
function DeathIceMastery(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * MagicAttackPower / 100
	end

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1211, Dark Plasma Enhancement Skill
function DarkPlasmaEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1212, Ice Blast Enhancement Skill
function IceBlastEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1213, Busting Flare Enhancement Skill
function BustingFlareEnhancementSkill(oPlayer, InDamage, BarrageCount, IsShockwave)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (IsShockwave == 1) then
		OutDamage = InDamage * 1.5 * MagicAttackPower / 100
		return OutDamage
	end

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

-- SkillID: 2073, Bursting Flare of Gale
function BurstingFlareOfGale(oPlayer, InDamage, BarrageCount, IsShockwave)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 27, Energy)
	end

	local OutDamage = 0

	if (IsShockwave == 1) then
		OutDamage = InDamage * 1.5 * MagicAttackPower / 100
		return OutDamage
	end

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
