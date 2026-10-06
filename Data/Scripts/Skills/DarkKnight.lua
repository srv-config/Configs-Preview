-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- DarkKnight Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_DarkKnight(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 20, Lunge
function Lunge_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 21, Uppercut
function Uppercut_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 41, Twisting Slash
function TwistingSlash_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 42, Anger Strike
function AngerStrike_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 43, Death Stab
function DeathStab(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 44, Crescent Moon Slash
function CrescentMoonSlash_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 48, Swell Life
function SwellLife(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 49, Fire Breath
function FireBreath_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_DarkKnight(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 232, Strike of Destruction
function StrikeOfDestruction_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 723, Fire Blow
function FireBlow(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 1500, Sword's Fury
function SwordsFury(oPlayer)
	local SkillAddRange = 1
	local SkillTime = -10

	return SkillAddRange, SkillTime
end

-- SkillID: 1501, Sword Blow
function SwordBlow(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * RageAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1503, Solid Protection
function SolidProtection(oPlayer)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 326, Cyclone Strengthener
function CycloneStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 327, Slash Strengthener
function SlashStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 328, Falling Slash Strengthener
function FallingSlashStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 329, Lunge Strengthener
function LungeStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 330, Twisting Slash Strengthener
function TwistingSlashStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 331, 812, Anger Blow Strengthener
function AngerBlowStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 344, Blood Storm
function BloodStorm_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 346, Blood Storm Strengthener
function BloodStormStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 356, Swell Life Strengthener
function SwellLifeStrengthener_DarkKnight(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 360, Swell Life Proficiency
function SwellLifeProficiency_DarkKnight(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 363, Swell Life Mastery
function SwellLifeMastery(oPlayer, oTarget, PartyBonus)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 802, Sword's Fury Mastery
function SwordsFuryMastery_DarkKnight(oPlayer, SkillTreeValue)
	local BaseAddRange = 1
	local SkillTime = -10

	local SkillAddRange = BaseAddRange + SkillTreeValue

	return SkillAddRange, SkillTime
end

-- SkillID: 803, Solid Protection Strengthener
function SolidProtectionStrengthener(oPlayer)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 804, Solid Protection Proficiency
function SolidProtectionProficiency(oPlayer)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 806, Solid Protection Mastery
function SolidProtectionMastery(oPlayer)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 807, Strike of Destruction Strengthener
function StrikeOfDestructionStrengthener_DarkKnight(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 809, Strike of Destruction Mastery
function StrikeOfDestructionMastery_DarkKnight(oPlayer, InDamage, BarrageCount, SkillTreeValue)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * (RageAttackPower + SkillTreeValue)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * (RageAttackPower + SkillTreeValue)) / 100
	end

	return OutDamage
end

-- SkillID: 811, Tornado Strengthener
function TornadoStrengthener_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 813, Rush
function Rush_DarkKnight(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 929, Fire Blow Strengthener
function FireBlowStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 930, Fire Blow Mastery
function FireBlowMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1069, Anger Blow Enhancement Skill
function AngerBlowEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 1071, Death Stab Enhancement Skill
function DeathStabEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 1072, Fire Blow Enhancement Skill
function FireBlowEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = InDamage * RageAttackPower / 100

	return OutDamage
end

-- SkillID: 1202, Strike of Destruction Enhancement Skill
function StrikeOfDestructionEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * RageAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 1.4) * RageAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1203, Sword Blow Enhancement Skill
function SwordBlowEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * RageAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 1.4) * RageAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1204, Solid Protection Enhancement Skill
function SolidProtectionEnhancementSkill(oPlayer)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2040, Sword Blow of Saturation
function SwordBlowOfSaturation(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * RageAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 1.4) * RageAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = (InDamage * 1.6) * RageAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2043, Destruction of Gale
function DestructionOfGale(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 65, Strength, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * RageAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * RageAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * RageAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 1.4) * RageAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = (InDamage * 1.6) * RageAttackPower / 100
	end

	return OutDamage
end
