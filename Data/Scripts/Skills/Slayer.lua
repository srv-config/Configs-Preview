-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- Slayer Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 20, Lunge
function Lunge_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 21, Uppercut
function Uppercut_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 41, Twisting Slash
function TwistingSlash_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 42, Anger Strike
function AngerStrike_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 44, Crescent Moon Slash
function CrescentMoonSlash_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_Slayer(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 292, Sword Inertia
function SwordInertia(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 293, Bat Flock
function BatFlock(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * 0.5 * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 293, Bat Flock - DOT value comes from formula 9 of CalcCharacter.ini::Character in FormulaData.xml
function BatFlock_Dot(oPlayer, oTarget, InDamage, DOT)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then
		OutDamage = DOT
	elseif (oTarget.Type == OBJ_MONSTER) then
		OutDamage = DOT
	end

	return OutDamage
end

-- SkillID: 294, Pierce Attack
function PierceAttack(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 297, Demolish
function Demolish(oPlayer)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillEffect = ((Strength / 8) + (Agility / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03

	return SkillEffect, SkillTime
end

-- SkillID: 781, Bat Flock Strengthener - DOT value comes from formula 9 of CalcCharacter.ini::Character in FormulaData.xml
function BatFlockStrengthener_Dot(oPlayer, oTarget, InDamage, DOT)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then
		OutDamage = DOT
	elseif (oTarget.Type == OBJ_MONSTER) then
		OutDamage = DOT
	end

	return OutDamage
end

-- SkillID: 782, Bat Flock Mastery - DOT value comes from formula 9 of CalcCharacter.ini::Character in FormulaData.xml
function BatFlockMastery_Dot(oPlayer, oTarget, InDamage, DOT)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then
		OutDamage = DOT
	elseif (oTarget.Type == OBJ_MONSTER) then
		OutDamage = DOT
	end

	return OutDamage
end

-- SkillID: 1159, Bat Flock Enhancement - DOT value comes from formula 9 of CalcCharacter.ini::Character in FormulaData.xml
function BatFlockEnhancement_Dot(oPlayer, oTarget, InDamage, DOT)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then
		OutDamage = DOT
	elseif (oTarget.Type == OBJ_MONSTER) then
		OutDamage = DOT
	end

	return OutDamage
end

-- SkillID: 2071, Pierce Attack of Saturation - DOT value comes from formula 9 of CalcCharacter.ini::Character in FormulaData.xml
function PierceAttackOfSaturation_Dot(oPlayer, oTarget, InDamage, DOT)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then
		OutDamage = DOT
	elseif (oTarget.Type == OBJ_MONSTER) then
		OutDamage = DOT
	end

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 326, Cyclone Strengthener
function CycloneStrengthener_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 327, Slash Strengthener
function SlashStrengthener_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 330, Twisting Slash Strengthener
function TwistingSlashStrengthener_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 331, Anger Blow Strengthener
function AngerBlowStrengthener_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 356, Swell Life Strengthener
function SwellLifeStrengthener_Slayer(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 360, Swell Life Proficiency
function SwellLifeProficiency_Slayer(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 631, Rush
function Rush_Slayer(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 779, Sword Inertia Strengthener
function SwordInertiaStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 780, Sword Inertia Mastery
function SwordInertiaMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 781, Bat Flock Strengthener
function BatFlockStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * 0.5 * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 782, Bat Flock Mastery
function BatFlockMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * 0.5 * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 787, Demolish Strengthener
function DemolishStrengthener(oPlayer, SkillTreeValue)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillEffect = ((Strength / 8) + (Agility / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03 + SkillTreeValue

	return SkillEffect, SkillTime
end

-- SkillID: 788, Demolish Mastery
function DemolishMastery(oPlayer, SkillTreeValue)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local SkillEffect = ((Strength / 8) + (Agility / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03 + SkillTreeValue

	return SkillEffect, SkillTime
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1158, Sword Inertia Enhancement
function SwordInertiaEnhancement(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 1159, Bat Flock Enhancement
function BatFlockEnhancement(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * 0.5 * DarkAttackPower / 100

	return OutDamage
end

-- SkillID: 1160, Pierce Attack Enhancement
function PierceAttackEnhancement(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2071, Pierce Attack of Saturation
function PierceAttackOfSaturation(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DarkAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		DarkAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 70, Strength, Agility)
	end

	local OutDamage = InDamage * DarkAttackPower / 100

	return OutDamage
end
