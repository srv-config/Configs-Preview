-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- DarkWizard Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 1, Poison
function Poison_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 2, Meteorite
function Meteorite_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 3, Lightning
function Lightning_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 5, Flame
function Flame_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 9, Evil Spirit
function EvilSpirit_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 10, Hellfire
function Hellfire_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 12, Aqua Beam
function AquaBeam_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 13, Cometfall
function Cometfall_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 14, Inferno
function Inferno_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 16, Soul Barrier
function SoulBarrier(oPlayer, oTarget)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Agility / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60

	if (oPlayer.Index == oTarget.Index and SkillEffect > 50) then -- casting spell on yourself
		SkillEffect = 50
	elseif (oPlayer.Index ~= oTarget.Index and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 50
	end

	return SkillEffect, SkillTime
end

-- SkillID: 17, Energy Ball
function EnergyBall(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 38, Decay
function Decay_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 39, Ice Storm
function IceStorm_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 40, Nova
function Nova_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_DarkWizard(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 233, Expansion of Wizardry
function ExpansionOfWizardry_DarkWizard(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 724, Meteor Strike
function MeteorStrike_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 725, Meteor Storm
function MeteorStorm(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 726, Soul Seeker
function SoulSeeker(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 378, Flame Strengthener
function FlameStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 379, Lightning Strengthener
function LightningStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 380, Expansion of Wizardry Power Up
function ExpansionOfWizardryPowerUp_DarkWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 381, Inferno Strengthener
function InfernoStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 382, Blast Strengthener
function BlastStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 383, Expansion of Wizardry Mastery
function ExpansionOfWizardryMastery_DarkWizard(oPlayer, MagicDamageMax, SkillTreeValue)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 384, Poison Strengthener
function PoisonStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 385, Evil Spirit Strengthener
function EvilSpiritStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 387, Decay Strengthener
function DecayStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 388, Hellfire Strengthener
function HellfireStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 389, Ice Strengthener
function IceStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 390, Meteor Strengthener
function MeteorStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 391, Ice Storm Strengthener
function IceStormStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 392, Nova Strengthener
function NovaStrengthener_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 403, Soul Barrier Strengthener
function SoulBarrierStrengthener(oPlayer, oTarget)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Agility / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60

	if (oPlayer.Index == oTarget.Index and SkillEffect > 60) then -- casting spell on yourself
		SkillEffect = 60
	elseif (oPlayer.Index ~= oTarget.Index and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 50
	end

	return SkillEffect, SkillTime
end

-- SkillID: 404, Soul Barrier Proficiency
function SoulBarrierProficiency(oPlayer, oTarget)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Agility / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60

	if (oPlayer.Index == oTarget.Index and SkillEffect > 70) then -- casting spell on yourself
		SkillEffect = 70
	elseif (oPlayer.Index ~= oTarget.Index and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 50
	end

	return SkillEffect, SkillTime
end

-- SkillID: 406, Soul Barrier Mastery
function SoulBarrierMastery(oPlayer, oTarget)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Agility / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60

	if (oPlayer.Index == oTarget.Index and SkillEffect > 75) then -- casting spell on yourself
		SkillEffect = 75
	elseif (oPlayer.Index ~= oTarget.Index and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 60
	end

	return SkillEffect, SkillTime
end

-- SkillID: 495, Earth Prison
function EarthPrison_DarkWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_DarkWizard(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1075, Meteor Strike Enhancement Skill
function MeteorStrikeEnhancementSkill(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 1076, Meteor Storm Enhancement Skill
function MeteorStormEnhancementSkill(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 1078, Evil Spirit Enhancement Skill
function EvilSpiritEnhancementSkill_DarkWizard(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2037, Meteor Storm of Gale
function MeteorStormOfGale(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end
