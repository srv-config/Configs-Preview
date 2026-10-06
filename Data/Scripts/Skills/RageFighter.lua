-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- RageFighter Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 19, Falling Slash
function FallingSlash_RageFighter(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_RageFighter(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_RageFighter(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 260, Killing Blow
function KillingBlow(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 261, Beast Uppercut
function BeastUppercut(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 262, Chain Drive
function ChainDrive(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 263, Dark Side
function DarkSide(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100
	local AOEAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 67, Strength, Agility)
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * (DivineAttackPower + AOEAttackPower) / 100

	return OutDamage
end

-- SkillID: 264, Dragon Roar
function DragonRoar(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AOEAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * AOEAttackPower / 100

	return OutDamage
end

-- SkillID: 265, Dragon Slasher
function DragonSlasher(oPlayer, oTarget, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AOEAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then -- Player
		OutDamage = InDamage * AOEAttackPower / 100
	else -- Monster
		OutDamage = InDamage * 3.0 * AOEAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 265, Dragon Slasher
function DragonSlasher_DecreaseSD(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SuccessRate = 0
	local DecreasePercent = 0

	SuccessRate = Energy / 100 + 10
	DecreasePercent = Energy / 30 + 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	if (DecreasePercent > 100) then
		DecreasePercent = 100
	end

	return SuccessRate, DecreasePercent
end

-- SkillID: 266, Ignore Defense
function IgnoreDefense(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 404) / 100 + 3.0
	local SkillTime = Energy / 5 + 60

	if (SkillEffect > 10) then
		SkillEffect = 10
	end

	return SkillEffect, SkillTime
end

-- SkillID: 267, Increase Health
function IncreaseHealth(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0
	local SkillTime = Energy / 5 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 268, Increase Block
function IncreaseBlock(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0
	local SkillTime = Energy / 5 + 60

	if (SkillEffect > 100) then
		SkillEffect = 100
	end

	return SkillEffect, SkillTime
end

-- SkillID: 269, Charge
function Charge(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 270, Phoenix Shot
function PhoenixShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 282, Spirit Hook
function SpiritHook(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 564, Dragon Slasher Strengthener
function DragonSlasherStrengthener_DecreaseSD(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SuccessRate = 0
	local DecreasePercent = 0

	SuccessRate = Energy / 100 + 10
	DecreasePercent = Energy / 30 + 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	if (DecreasePercent > 100) then
		DecreasePercent = 100
	end

	return SuccessRate, DecreasePercent
end

-- SkillID: 739, Dark Phoenix Shot
function DarkPhoenixShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 551, Killing Blow Strengthener
function KillingBlowStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 552, Beast Uppercut Strengthener
function BeastUppercutStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 554, Killing Blow Mastery
function KillingBlowMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 555, Beast Uppercut Mastery
function BeastUppercutMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 558, Chain Drive Strengthener
function ChainDriveStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 559, Dark Side Strengthener
function DarkSideStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100
	local AOEAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 67, Strength, Agility)
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * (DivineAttackPower + AOEAttackPower) / 100

	return OutDamage
end

-- SkillID: 560, Dragon Roar Strengthener
function DragonRoarStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AOEAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * AOEAttackPower / 100

	return OutDamage
end

-- SkillID: 563, Dark Side Mastery
function DarkSideMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100
	local AOEAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 67, Strength, Agility)
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * (DivineAttackPower + AOEAttackPower) / 100

	return OutDamage
end

-- SkillID: 564, Dragon Slasher Strengthener
function DragonSlasherStrengthener(oPlayer, oTarget, InDamage, SkillBonus)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AOEAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then -- User
		OutDamage = (InDamage + SkillBonus) * AOEAttackPower / 100
	else -- Monster
		OutDamage = (InDamage + SkillBonus) * 3.0 * AOEAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 565, Blood Howling
function BloodHowling(oPlayer, TargetHP)
	local SkillEffect = 200 -- TargetHP * 5 / 100
	local SkillSuccessRate = 10 -- 1
	local SkillTime = 10

	return SkillEffect, SkillSuccessRate, SkillTime
end

-- SkillID: 567, Blood Howling Strengthener
function BloodHowlingStrengthener(oPlayer, TargetHP)
	local SkillEffect = 200 -- TargetHP * 5 / 100
	local SkillSuccessRate = 10 -- 1
	local SkillTime = 10

	return SkillEffect, SkillSuccessRate, SkillTime
end

-- SkillID: 569, Defense Success Rate Increase PowUp
function DefenseSuccessRateIncreasePowUp(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0
	local SkillTime = Energy / 5 + 60

	if (SkillEffect > 100) then
		SkillEffect = 100
	end

	return SkillEffect, SkillTime
end

-- SkillID: 572, DefSuccessRate Increase Mastery
function DefSuccessRateIncreaseMastery(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0
	local SkillTime = Energy / 5 + 60

	if (SkillEffect > 100) then
		SkillEffect = 100
	end

	return SkillEffect, SkillTime
end

-- SkillID: 573, Stamina Increase Strengthener
function StaminaIncreaseStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0
	local SkillTime = Energy / 5 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 744, Enhance Phoenix Shot
function EnhancePhoenixShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- SkillID: 745, Phoenix Shot Mastery
function PhoenixShotMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1111, Dragon Roar Enhancement Skill
function DragonRoarEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AOEAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * AOEAttackPower / 100

	return OutDamage
end

-- SkillID: 1113, Dark Side Enhancement Skill
function DarkSideEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100
	local AOEAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 67, Strength, Agility)
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * (DivineAttackPower + AOEAttackPower) / 100

	return OutDamage
end

-- SkillID: 1147, Spirit Hook Enhancement Skill
function SpiritHookEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2061, Dark Side of Saturation
function DarkSideOfSaturation(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local DivineAttackPower = 100
	local AOEAttackPower = 0

	if (oPlayer.Type == OBJ_USER) then
		DivineAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 67, Strength, Agility)
		AOEAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 68, Strength, Energy)
	end

	local OutDamage = InDamage * (DivineAttackPower + AOEAttackPower) / 100

	return OutDamage
end

-- SkillID: 2063, Spirit Hook of Saturation
function SpiritHookOfSaturation(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local MeleeAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MeleeAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 69, Strength, Vitality)
	end

	local OutDamage = InDamage * MeleeAttackPower / 100

	return OutDamage
end
