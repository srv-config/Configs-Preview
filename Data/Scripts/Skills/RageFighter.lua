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
function FallingSlash_RageFighter(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_RageFighter(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_RageFighter(oPlayer, oTarget, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 260, Killing Blow
function KillingBlow(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 261, Beast Uppercut
function BeastUppercut(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 262, Chain Drive
function ChainDrive(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 263, Dark Side
function DarkSide(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (Agility / 8 + InDamage + Energy / 10) * (Agility / 8 + Energy / 10 + 100) / 100.0

	return OutDamage
end

-- SkillID: 264, Dragon Roar
function DragonRoar(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 265, Dragon Slasher
function DragonSlasher(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then -- Player
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	else -- Monster
		OutDamage = (InDamage * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
	end

	return OutDamage
end

-- SkillID: 265, Dragon Slasher
function DragonSlasher_DecreaseSD(oPlayer, oTarget)
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
function Charge(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 270, Phoenix Shot
function PhoenixShot(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0

	return OutDamage
end

-- SkillID: 282, Spirit Hook
function SpiritHook(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 564, Dragon Slasher Strengthener
function DragonSlasherStrengthener_DecreaseSD(oPlayer, oTarget)
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
function DarkPhoenixShot(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Agility / 10 + 50) / 100.0

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 551, Killing Blow Strengthener
function KillingBlowStrengthener(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 552, Beast Uppercut Strengthener
function BeastUppercutStrengthener(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 554, Killing Blow Mastery
function KillingBlowMastery(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 555, Beast Uppercut Mastery
function BeastUppercutMastery(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 558, Chain Drive Strengthener
function ChainDriveStrengthener(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 559, Dark Side Strengthener
function DarkSideStrengthener(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (Agility / 8 + InDamage + Energy / 10) * (Agility / 8 + Energy / 10 + 100) / 100.0

	return OutDamage
end

-- SkillID: 560, Dragon Roar Strengthener
function DragonRoarStrengthener(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 563, Dark Side Mastery
function DarkSideMastery(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (Agility / 8 + InDamage + Energy / 10) * (Agility / 8 + Energy / 10 + 100) / 100.0

	return OutDamage
end

-- SkillID: 564, Dragon Slasher Strengthener
function DragonSlasherStrengthener(oPlayer, oTarget, InDamage, SkillBonus)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = 0

	if (oTarget.Type == OBJ_USER) then -- User
		OutDamage = (InDamage + SkillBonus) * (Energy / 10 + 50) / 100.0
	else -- Monster
		OutDamage = ((InDamage + SkillBonus) * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
	end

	return OutDamage
end

-- SkillID: 565, Blood Howling
function BloodHowling(oPlayer, oTarget, TargetHP)
	local SkillEffect = 200 -- TargetHP * 5 / 100
	local SkillSuccessRate = 10 -- 1
	local SkillTime = 10

	return SkillEffect, SkillSuccessRate, SkillTime
end

-- SkillID: 567, Blood Howling Strengthener
function BloodHowlingStrengthener(oPlayer, oTarget, TargetHP)
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
function EnhancePhoenixShot(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0

	return OutDamage
end

-- SkillID: 745, Phoenix Shot Mastery
function PhoenixShotMastery(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1111, Dragon Roar Enhancement Skill
function DragonRoarEnhancementSkill(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0

	return OutDamage
end

-- SkillID: 1113, Dark Side Enhancement Skill
function DarkSideEnhancementSkill(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (Agility / 8 + InDamage + Energy / 10) * (Agility / 8 + Energy / 10 + 100) / 100.0

	return OutDamage
end

-- SkillID: 1147, Spirit Hook Enhancement Skill
function SpiritHookEnhancementSkill(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2061, Dark Side of Saturation
function DarkSideOfSaturation(oPlayer, oTarget, InDamage)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local OutDamage = (Agility / 8 + InDamage + Energy / 10) * (Agility / 8 + Energy / 10 + 100) / 100.0

	return OutDamage
end

-- SkillID: 2063, Spirit Hook of Saturation
function SpiritHookOfSaturation(oPlayer, oTarget, InDamage)
	local Vitality = Stats.Get(oPlayer, STAT_VITALITY, STAT_BOTHTYPE)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0

	return OutDamage
end
