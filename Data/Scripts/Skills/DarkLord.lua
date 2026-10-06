-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- DarkLord Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_DarkLord(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 20, Lunge
function Lunge_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 21, Uppercut
function Uppercut_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 60, Force
function Force(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 61, Fire Burst
function FireBurst(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 62, Earth-Shake
function EarthShake(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 64, Dignity
function Dignity(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillEffect = (Command / 25 + Energy / 30) / 10
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 65, Electric Spike
function ElectricSpike(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 66, Force Wave
function ForceWave(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 74, Fire Blast
function FireBlast_DarkLord(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_DarkLord(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 78, Fire Scream
function FireScream(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 238, Chaotic Diseier
function ChaoticDiseier(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 737, Wind Soul
function WindSoul(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2095, Spirit Blast
function SpiritBlast(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 508, Fire Burst Strengthener
function FireBurstStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 509, Force Wave Strengthener
function ForceWaveStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 511, Lord Dignity Strengthener
function LordDignityStrengthener(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillEffect = (Command / 25 + Energy / 30) / 10
	local SkillTime = Energy / 10 + 60

	return SkillEffect, SkillTime
end

-- SkillID: 512, Earth-Shake Strengthener
function EarthShakeStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 514, Fire Burst Mastery
function FireBurstMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 518, Fire Scream Strengthener
function FireScreamStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 519, Electric Spark Strengthener
function ElectricSparkStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 520, Fire Scream Mastery
function FireScreamMastery(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 523, Chaotic Diseier Strengthener
function ChaoticDiseierStrengthener(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 911, Spirit Blast Strengthener
function SpiritBlastStrengthener(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1096, Fire Burst Enhancement Skill
function FireBurstEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 1098, Chaotic Diseier Enhancement Skill
function ChaoticDiseierEnhancementSkill(oPlayer, InDamage)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = InDamage * SkillAttackPower / 100

	return OutDamage
end

-- SkillID: 1099, Wind Soul Enhancement Skill
function WindSoulEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1240, Spirit Blast Enhancement Skill
function SpiritBlastEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2054, Wind Soul of Saturation
function WindSoulOfSaturation(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * SkillAttackPower / 100
	end
	return OutDamage
end

-- SkillID: 2096, Spirit Blast of Anger
function SpiritBlastOfAnger(oPlayer, InDamage, BarrageCount)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local Command = Stats.Get(oPlayer, STAT_COMMAND, STAT_BOTHTYPE)
	local SkillAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		SkillAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)
	end

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * SkillAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * SkillAttackPower / 100
	end

	return OutDamage
end
