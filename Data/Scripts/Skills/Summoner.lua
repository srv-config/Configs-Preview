-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- Summoner Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 2, Meteorite
function Meteorite_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 4, Fire Ball
function FireBall_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 7, Ice
function Ice_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 11, Power Wave
function PowerWave_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 45, Lance
function Lance_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_Summoner(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_Summoner(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 214, Drain Life
function DrainLife(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AddHP = 0

	if (oTarget.Type == OBJ_MONSTER) then
		AddHP = (Energy / 15) + (oTarget.Level / 2.5)
	elseif (oTarget.Type == OBJ_USER) then
		AddHP = Energy / 23 + (10 * InDamage / 100)
	end

	return AddHP
end

-- SkillID: 215, Chain Lightning
function ChainLightning(oPlayer, InDamage, TargetNumber)
	local DamagePercent = 0

	if (TargetNumber == 1) then
		DamagePercent = 100
	elseif (TargetNumber == 2) then
		DamagePercent = 70
	elseif (TargetNumber == 3) then
		DamagePercent = 50
	else
		DamagePercent = 0
	end

	local OutDamage = InDamage * DamagePercent / 100

	return OutDamage
end

-- SkillID: 217, Damage Reflection
function DamageReflection(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Reflect = 30 + (Energy / 42)
	local Time = 30 + (Energy / 25)

	if (Reflect > 25) then
		Reflect = 25
	end

	return Reflect, Time
end

-- SkillID: 218, Berserker - the life it costs to hold the buff up
function Berserker_DecreaseLife(oPlayer, MaxLife, DecMultiplier)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DecLife = (Agility / 3) * DecMultiplier

	if ((MaxLife - DecLife) < 50) then
		DecLife = MaxLife - 50
	end

	if (DecLife < 0) then
		DecLife = 0
	end

	return DecLife
end

-- SkillID: 219, Sleep
function Sleep(oPlayer, oTarget, Curse)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillSuccessRate = 0
	local SkillTime = 0

	if (oTarget.Type == OBJ_MONSTER) then
		SkillSuccessRate = Energy / 30 + Curse / 6 + 20
		SkillTime = Energy / 100 + 5 - oTarget.Level / 20
	elseif (oTarget.Type == OBJ_USER) then
		SkillSuccessRate = Energy / 37 + Curse / 6 + 15
		SkillTime = Energy / 250 + (oPlayer.Level - oTarget.Level) / 100 + 4
	end

	return SkillSuccessRate, SkillTime
end

-- SkillID: 223, Explosion
function Explosion_Dot(oPlayer, Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5

	return DotDamage, Time
end

-- SkillID: 224, Requiem
function Requiem_Dot(oPlayer, Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5

	return DotDamage, Time
end

-- SkillID: 225, Pollution
function Pollution(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 230, Lightning Shock
function LightningShock(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 288, Death Scythe
function DeathScythe(oPlayer, oTarget, InDamage, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	end

	return OutDamage
end

-- SkillID: 289, Darkness - the life it costs to hold the buff up
function Darkness_DecreaseLife(oPlayer, MaxLife, DecMultiplier)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local DecLife = (Agility / 3) * DecMultiplier

	if ((MaxLife - DecLife) < 50) then
		DecLife = MaxLife - 50
	end

	if (DecLife < 0) then
		DecLife = 0
	end

	return DecLife
end

-- SkillID: 454, Sleep Strengthener
function SleepStrengthener(oPlayer, oTarget, Curse)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillSuccessRate = 0
	local SkillTime = 0

	if (oTarget.Type == OBJ_MONSTER) then
		SkillSuccessRate = Energy / 30 + Curse / 6 + 20
		SkillTime = Energy / 100 + 5 - oTarget.Level / 20
	elseif (oTarget.Type == OBJ_USER) then
		SkillSuccessRate = Energy / 37 + Curse / 6 + 15
		SkillTime = Energy / 250 + (oPlayer.Level - oTarget.Level) / 100 + 4
	end

	return SkillSuccessRate, SkillTime
end

-- SkillID: 729, Fire Beast
function FireBeast(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 730, Aqua Beast
function AquaBeast(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 455, Chain Lightning Strengthener
function ChainLightningStrengthener(oPlayer, InDamage, TargetNumber)
	local DamagePercent = 0

	if (TargetNumber == 1) then
		DamagePercent = 100
	elseif (TargetNumber == 2) then
		DamagePercent = 70
	elseif (TargetNumber == 3) then
		DamagePercent = 50
	else
		DamagePercent = 0
	end

	local OutDamage = InDamage * DamagePercent / 100

	return OutDamage
end

-- SkillID: 456, Lightning Shock Strengthener
function LightningShockStrengthener(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 458, Drain Life Strengthener
function DrainLifeStrengthener(oPlayer, oTarget, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local AddHP = 0

	if (oTarget.Type == OBJ_MONSTER) then
		AddHP = (Energy / 15) + oTarget.Level / 2.5
	elseif (oTarget.Type == OBJ_USER) then
		AddHP = Energy / 23 + 10 * InDamage / 100
	end

	return AddHP
end

-- SkillID: 776, Pollution Strengthener
function PollutionStrengthener(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 777, Pollution Proficiency
function PollutionProficiency(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 778, Pollution Mastery
function PollutionMastery(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1102, Fire Beast Enhancement Skill
function FireBeastEnhancementSkill(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 1103, Lightning Shock Enhancement Skill
function LightningShockEnhancementSkill(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 1105, Aqua Beast Enhancement Skill
function AquaBeastEnhancementSkill(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 1155, Deathside Enhancement
function DeathsideEnhancement(oPlayer, oTarget, InDamage, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * 1.3
	end

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2058, Fire Beast of Saturation
function FireBeastOfSaturation(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- SkillID: 2060, Death Scythe of Fury
function DeathScytheOfFury(oPlayer, oTarget, InDamage, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * 1.3
	elseif (BarrageCount == 6) then
		OutDamage = InDamage * 1.4
	end

	return OutDamage
end
