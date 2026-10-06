-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- IllusionKnight Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 22, Cyclone
function Cyclone_IllusionKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = InDamage * IllusionAttackPower / 100

	return OutDamage
end

-- SkillID: 44, Crescent Moon Slash
function CrescentMoonSlash_IllusionKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = InDamage * IllusionAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_IllusionKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = InDamage * IllusionAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_IllusionKnight(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 2028, Charge Slash
function ChargeSlash(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2029, Wind Glaive
function WindGlaive(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2030, Blade Storm
function BladeStorm(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2031, Illusion Avatar - base Life and Damage before mastery improvements
function IllusionAvatar(oPlayer, InDamageMin, InDamageMax, PlayerMaxLife)
	local PlayerTotalLevel = oPlayer.Level + oPlayer.userData.MasterLevel
	local OutDamageMin = InDamageMin * 1.5
	local OutDamageMax = InDamageMax * 2
	local OutLife = (PlayerTotalLevel / 20) * PlayerMaxLife

	return OutDamageMin, OutDamageMax, OutLife
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 877, Charge Slash Strengthener
function ChargeSlashStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 878, Charge Slash Mastery
function ChargeSlashMastery(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 879, Wind Glaive Strengthener
function WindGlaiveStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 880, Wind Glaive Mastery
function WindGlaiveMastery(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 881, Blade Storm Strengthener
function BladeStormStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 882, Blade Storm Mastery
function BladeStormMastery(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1231, Charge Slash Enhancement Skill
function ChargeSlashEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1232, Wind Glaive Enhancement Skill
function WindGlaiveEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1233, Blade Storm Enhancement Skill
function BladeStormEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2082, Blade Storm of Saturation
function BladeStormOfSaturation(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local IllusionAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		IllusionAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 200, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * IllusionAttackPower / 100
	elseif (BarrageCount == 6) then
		OutDamage = InDamage * IllusionAttackPower / 100
	end

	return OutDamage
end
