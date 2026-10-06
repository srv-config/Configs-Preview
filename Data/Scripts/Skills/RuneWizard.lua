-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- RuneWizard Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 1, Poison
function Poison_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2, Meteorite
function Meteorite_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 5, Flame
function Flame_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 9, Evil Spirit
function EvilSpirit_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 10, Hellfire
function Hellfire_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 13, Cometfall
function Cometfall_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 14, Inferno
function Inferno_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_RuneWizard(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_RuneWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_RuneWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 39, Ice Storm
function IceStorm_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_RuneWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_RuneWizard(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 233, Expansion of Wizardry
function ExpansionOfWizardry_RuneWizard(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 240, Magical Shot
function MagicalShot_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 283, Magic Arrow
function MagicArrow(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 284, Plasma Ball
function PlasmaBall(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 285, Lightning Storm
function LightningStorm(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 286, Burst
function Burst(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 287, Haste
function Haste(oPlayer, oTarget)
	local SkillEffect1 = 25
	local SkillEffect2 = 2
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 2101, Runic Spear
function RunicSpear(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2102, Rune Phrase
function RunePhrase(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 378, Flame Strengthener
function FlameStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 379, Lightning Strengthener
function LightningStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 380, Expansion of Wizardry Power Up
function ExpansionOfWizardryPowerUp_RuneWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 381, Inferno Strengthener
function InfernoStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 382, Blast Strengthener
function BlastStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 383, Expansion of Wizardry Mastery
function ExpansionOfWizardryMastery_RuneWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 384, Poison Strengthener
function PoisonStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 385, Evil Spirit Strengthener
function EvilSpiritStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 387, Decay Strengthener
function DecayStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 388, Hellfire Strengthener
function HellfireStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 389, Ice Strengthener
function IceStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 390, Meteor Strengthener
function MeteorStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 391, Ice Storm Strengthener
function IceStormStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 392, Nova Strengthener
function NovaStrengthener_RuneWizard(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 495, Earth Prison
function EarthPrison_RuneWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_RuneWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 748, Magic Arrow Strengthener
function MagicArrowStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 749, Magic Arrow Mastery
function MagicArrowMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 750, Plasma Ball Strengthener
function PlasmaBallStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 751, Plasma Ball Mastery
function PlasmaBallMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 765, Burst Strengthener
function BurstStrengthener(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 766, Burst Mastery
function BurstMastery(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 768, Haste Strengthener
function HasteStrengthener(oPlayer, oTarget)
	local SkillEffect1 = 25
	local SkillEffect2 = 2
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 769, Haste Mastery
function HasteMastery(oPlayer, oTarget)
	local SkillEffect1 = 25
	local SkillEffect2 = 2
	local SkillTime = 70

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 916, Runic Spear Strengthener
function RunicSpearStrengthener(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1148, Magic Arrow Enhancement Skill
function MagicArrowEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1150, Lightning Storm Enhancement Skill
function LightningStormEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1504, Runic Spear Enhancement Skill
function RunicSpearEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1505, Rune Phrase Enhancement Skill
function RunePhraseEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2068, Lightning Storm of Gale
function LightningStormOfGale(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2103, Rune Phrase of Saturation
function RunePhraseOfSaturation(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 201, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end
