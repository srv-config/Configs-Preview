-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- GrowLancer Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_GrowLancer(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 20, Lunge
function Lunge_GrowLancer(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_GrowLancer(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_GrowLancer(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 271, Spin Step
function SpinStep(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 273, Obsidian
function Obsidian(oPlayer, oTarget)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local SkillEffect = Strength / 20
	local SkillTime = 240

	return SkillEffect, SkillTime
end

-- SkillID: 274, Magic Pin
function MagicPin(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 276, Harsh Strike
function HarshStrike(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 277, Shining Peak
function ShiningPeak(oPlayer, InDamage, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100
	local RageAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = InDamage * (((RetaliationAttackPower + SkillTreeBonus_Retailation) + (RageAttackPower + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 279, Breche
function Breche(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 2036, Oversting
function Oversting(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 2085, Wild Breath
function WildBreath(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 329, Lunge Strengthener
function LungeStrengthener_GrowLancer(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 687, Spin Step Strengthener
function SpinStepStrengthener(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 688, Harsh Strike Strengthener
function HarshStrikeStrengthener(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 690, Spin Step Mastery
function SpinStepMastery(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 691, Harsh Strike Mastery
function HarshStrikeMastery(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * (RetaliationAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 692, Magic Pin Strengthener
function MagicPinStrengthener(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 693, Obsidian Strengthener
function ObsidianStrengthener(oPlayer, oTarget)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local SkillEffect = Strength / 20
	local SkillTime = 240

	return SkillEffect, SkillTime
end

-- SkillID: 695, Magic Pin Mastery
function MagicPinMastery(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 696, Breche Strengthener
function BrecheStrengthener(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 698, Breche Mastery
function BrecheMastery(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 699, Shining Peak Strengthener
function ShiningPeakStrengthener(oPlayer, InDamage, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100
	local RageAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = InDamage * (((RetaliationAttackPower + SkillTreeBonus_Retailation) + (RageAttackPower + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 894, Oversting Strengthener
function OverstingStrengthener(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 896, Wild Breath Strengthener
function WildBreathStrengthener(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1117, Magic Pin Enhancement Skill
function MagicPinEnhancementSkill(oPlayer, InDamage, SkillTreeBonus, BarrageCount)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 1.2) * (RageAttackPower + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 5) then
		OutDamage = (InDamage * 1.3) * (RageAttackPower + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 1118, Breche Enhancement Skill
function BrecheEnhancementSkill(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 1119, Shining Peak Enhancement Skill
function ShiningPeakEnhancementSkill(oPlayer, InDamage, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100
	local RageAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = InDamage * (((RetaliationAttackPower + SkillTreeBonus_Retailation) + (RageAttackPower + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 1235, Oversting Enhancement Skill
function OverstingEnhancementSkill(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 1236, Wild Breath Enhancement Skill
function WildBreathEnhancementSkill(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2065, Oversting of Saturation
function OverstingOfSaturation(oPlayer, InDamage, SkillTreeBonus)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local RageAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RageAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 64, Agility)
	end

	local OutDamage = (InDamage * 1.0) * (RageAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 2089, Wild Breath of Gale
function WildBreathOfGale(oPlayer, InDamage, SkillTreeBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local RetaliationAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		RetaliationAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 63, Strength)
	end

	local OutDamage = (InDamage * 0.5) * (RetaliationAttackPower + SkillTreeBonus) / 100.0

	return OutDamage
end
