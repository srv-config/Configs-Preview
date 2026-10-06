-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- MagicGladiator Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- Crusher Charge switches the Strength/Agility skills from Chaos to Spirit Attack Power
local function GladiatorAttackPower(oPlayer)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)

	if (Buff.CheckUsed(oPlayer, BUFFTYPE_CRUSHER_CHARGE) or Buff.CheckUsed(oPlayer, BUFFTYPE_CRUSHER_CHARGE_STRENGTHENER) or Buff.CheckUsed(oPlayer, BUFFTYPE_CRUSHER_CHARGE_MASTERY)) then
		local SpiritAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 66, Strength, Agility)

		return SpiritAttackPower
	end

	local ChaosAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 71, Strength, Agility)

	return ChaosAttackPower
end

-- ---------- Regular Skills ----------

-- SkillID: 1, Poison
function Poison_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2, Meteorite
function Meteorite_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 3, Lightning
function Lightning_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 5, Flame
function Flame_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 8, Twister
function Twister_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 9, Evil Spirit
function EvilSpirit_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 10, Hellfire
function Hellfire_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 12, Aqua Beam
function AquaBeam_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 13, Cometfall
function Cometfall_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 14, Inferno
function Inferno_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_MagicGladiator(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 20, Lunge
function Lunge_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 21, Uppercut
function Uppercut_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 41, Twisting Slash
function TwistingSlash_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 55, Fire Slash
function FireSlash(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.15) * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 0.18) * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 0.22) * AttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 0.25) * AttackPower / 100
	end
	return OutDamage
end

-- SkillID: 56, Power Slash
function PowerSlash(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 57, Spiral Slash
function SpiralSlash(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 73, Mana Rays
function ManaRays(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_MagicGladiator(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 236, Flame Strike
function FlameStrike(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 237, Gigantic Storm
function GiganticStorm(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 731, Ice Blood
function IceBlood(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100
	local SuccessRate = 6
	local DebuffTime = 10

	return OutDamage, SuccessRate, DebuffTime
end

-- SkillID: 732, Fire Blood
function FireBlood(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100
	local SuccessRate = 6
	local DebuffDamage = Strength / 10
	local DebuffTime = 10

	return OutDamage, SuccessRate, DebuffDamage, DebuffTime
end

-- SkillID: 733, Dark Blast
function DarkBlast(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 734, Meteor Strike
function MeteorStrike_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 2012, Chaos Blade
function ChaosBlade(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 4) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end

-- SkillID: 2013, Havok Spear
function HavokSpear(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 4) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 344, Blood Storm
function BloodStorm_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 346, Blood Storm Strengthener
function BloodStormStrengthener_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 479, Cyclone Strengthener
function CycloneStrengthener_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 480, Lightning Strengthener
function LightningStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 481, Twisting Slash Strengthener
function TwistingSlashStrengthener_MagicGladiator(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 482, Power Slash Strengthener
function PowerSlashStrengthener(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 483, Flame Strengthener
function FlameStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 484, Blast Strengthener
function BlastStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 486, Inferno Strengthener
function InfernoStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 487, Evil Spirit Strengthener
function EvilSpiritStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 489, Ice Strengthener
function IceStrengthener_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 490, Fire Slash Strengthener
function FireSlashStrengthener(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.15) * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 0.18) * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 0.22) * AttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 0.25) * AttackPower / 100
	end

	return OutDamage
end

-- SkillID: 492, Flame Strike Strengthener
function FlameStrikeStrengthener(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	return OutDamage
end

-- SkillID: 493, Fire Slash Mastery
function FireSlashMastery(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.15) * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 0.18) * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 0.22) * AttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = (InDamage * 0.25) * AttackPower / 100
	end

	return OutDamage
end

-- SkillID: 495, Earth Prison
function EarthPrison_MagicGladiator(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- SkillID: 496, Gigantic Storm Strengthener
function GiganticStormStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 497, Earth Prison Strengthener
function EarthPrisonStrengthener_MagicGladiator(oPlayer)
	local DebuffSuccessRate = 5
	local DebuffTime = 5

	return DebuffSuccessRate, DebuffTime
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1078, 1088, Evil Spirit Enhancement Skill
function EvilSpiritEnhancementSkill_MagicGladiator(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1087, Gigantic Storm Enhancement Skill
function GiganticStormEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1089, Dark Blast Enhancement Skill
function DarkBlastEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = InDamage * MagicAttackPower / 100

	return OutDamage
end

-- SkillID: 1092, Fire Slash Enhancement Skill
function FireSlashEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = OutDamage * 0.15
	elseif (BarrageCount == 2) then
		OutDamage = OutDamage * 0.18
	elseif (BarrageCount == 3) then
		OutDamage = OutDamage * 0.22
	elseif (BarrageCount == 4) then
		OutDamage = OutDamage * 0.25
	elseif (BarrageCount == 5) then
		OutDamage = OutDamage * 0.27
	elseif (BarrageCount == 6) then
		OutDamage = OutDamage * 0.29
	end

	return OutDamage
end

-- SkillID: 1094, Fire Blood Enhancement Skill
function FireBloodEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100
	local SuccessRate = 6
	local DebuffDamage = Strength / 10
	local DebuffTime = 10

	return OutDamage, SuccessRate, DebuffDamage, DebuffTime
end

-- SkillID: 1095, Ice Blood Enhancement Skill
function IceBloodEnhancementSkill(oPlayer, InDamage)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = InDamage * AttackPower / 100
	local SuccessRate = 6
	local DebuffTime = 10

	return OutDamage, SuccessRate, DebuffTime
end

-- SkillID: 1214, Chaos Blade Enhancement Skill
function ChaosBladeEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 5) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end

-- SkillID: 1215, Havok Spear Enhancement Skill
function HavokSpearEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 5) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2049, Chaos Blade of Saturation
function ChaosBladeOfSaturation(oPlayer, InDamage, BarrageCount)
	local AttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		AttackPower = GladiatorAttackPower(oPlayer)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * AttackPower / 100
	elseif (BarrageCount == 6) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end

-- SkillID: 2051, Havok Spear of Wrath
function HavokSpearOfWrath(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local MagicAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		MagicAttackPower = Formula.GetValue(FORMULA_TYPE_COMBATPOWER, 26, Energy)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * MagicAttackPower / 100
	elseif (BarrageCount == 6) then -- Explosion
		OutDamage = 10000
	end
	return OutDamage
end
