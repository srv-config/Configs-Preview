-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- Alchemist Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 1, Poison
function Poison_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2, Meteorite
function Meteorite_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 3, Lightning
function Lightning_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 5, Flame
function Flame_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 10, Hellfire
function Hellfire_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 12, Aqua Beam
function AquaBeam_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 13, Cometfall
function Cometfall_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 14, Inferno
function Inferno_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_Alchemist(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_Alchemist(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_Alchemist(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 38, Decay
function Decay_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 39, Ice Storm
function IceStorm_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 40, Nova
function Nova_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_Alchemist(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_Alchemist(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 233, Expansion of Wizardry
function ExpansionOfWizardry_Alchemist(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 240, Magical Shot
function MagicalShot_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = (InDamage * 1.0) * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2091, Alchemy: Angel Homunculus
function AlchemyAngelHomunculus(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2092, Alchemy: Ignition Bomber
function AlchemyIgnitionBomber(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2093, Alchemy: Countless Weapon
function AlchemyCountlessWeapon(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 378, Flame Strengthener
function FlameStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 379, Lightning Strengthener
function LightningStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 380, Expansion of Wizardry Power Up
function ExpansionOfWizardryPowerUp_Alchemist(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 381, Inferno Strengthener
function InfernoStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 382, Blast Strengthener
function BlastStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 383, Expansion of Wizardry Mastery
function ExpansionOfWizardryMastery_Alchemist(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 384, Poison Strengthener
function PoisonStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 385, Evil Spirit Strengthener
function EvilSpiritStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 387, Decay Strengthener
function DecayStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 388, Hellfire Strengthener
function HellfireStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 389, Ice Strengthener
function IceStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 390, Meteor Strengthener
function MeteorStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 391, Ice Storm Strengthener
function IceStormStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 392, Nova Strengthener
function NovaStrengthener_Alchemist(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 495, Earth Prison
function EarthPrison_Alchemist(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_Alchemist(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 900, Angel Homunculus Strengthener
function AngelHomunculusStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 901, Angel Homunculus Mastery
function AngelHomunculusMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 903, Ignition Bomber Strengthener
function IgnitionBomberStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 904, Ignition Bomber Mastery
function IgnitionBomberMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1237, Alchemy: Angel Homunculus Enhancement Skill
function AlchemyAngelHomunculusEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1238, Alchemy: Ignition Bomber Enhancement Skill
function AlchemyIgnitionBomberEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1239, Alchemy: Countless Weapon Enhancement Skill
function AlchemyCountlessWeaponEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2094, Fiery Countless Weapon
function FieryCountlessWeapon(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 200, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end
