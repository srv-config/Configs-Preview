-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- FairyElf Skill Calc Script, Lua v5.3
-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- ---------- Regular Skills ----------

-- SkillID: 18, Defense - damage taken by the shield user
function Defense_FairyElf(oPlayer, InDamage)
	local OutDamage = InDamage / 2

	return OutDamage
end

-- SkillID: 19, Falling Slash
function FallingSlash_FairyElf(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 20, Lunge
function Lunge_FairyElf(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 22, Cyclone
function Cyclone_FairyElf(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 23, Slash
function Slash_FairyElf(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 24, Triple Shot
function TripleShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 26, Heal
function Heal(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = Energy / 5 + 5
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = Energy / 5 + 5
	end

	return SkillEffect
end

-- SkillID: 27, Greater Defense
function GreaterDefense(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 8
	end

	return SkillEffect, SkillTime
end

-- SkillID: 28, Greater Damage
function GreaterDamage(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 7
	end

	return SkillEffect, SkillTime
end

-- SkillID: 46, Starfall
function Starfall(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * 2 * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 49, Fire Breath
function FireBreath_FairyElf(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 51, Ice Arrow
function IceArrow(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * 2 * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 52, Penetration
function Penetration(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * 2 * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 76, Plasma Storm - Fenrir pet skill
function PlasmaStorm_FairyElf(oPlayer, InDamage)
	local DamageInc = oPlayer.Level - 300 + oPlayer.userData.MasterLevel

	if (DamageInc < 0) then
		DamageInc = 0
	end

	DamageInc = DamageInc / 5

	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100

	return OutDamage
end

-- SkillID: 234, Recovery
function Recovery(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 4 + oPlayer.Level

	return SkillEffect
end

-- SkillID: 235, Multi-Shot
function MultiShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 727, Focus Shot
function FocusShot(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 2023, Raining Arrow
function RainingArrow(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2025, Holy Bolt
function HolyBolt(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2026, Improve Elemental Attack Power
function ImproveElementalAttackPower(oPlayer, oTarget, InEffect, InTime)
	local SkillEffect = InEffect -- result of formula 36 from FormulaData.xml
	local SkillTime = InTime -- result of formula 37 from FormulaData.xml

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = InEffect
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = InEffect
	end

	return SkillEffect, SkillTime
end

-- SkillID: 2027, Improve Elemental Defense
function ImproveElementalDefense(oPlayer, oTarget, InEffect, InTime)
	local SkillEffect = InEffect -- result of formula 38 from FormulaData.xml
	local SkillTime = InTime -- result of formula 37 from FormulaData.xml

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = InEffect
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = InEffect
	end

	return SkillEffect, SkillTime
end

-- ---------- 3rd Skill Tree ----------

-- SkillID: 411, Multi-Shot Strengthener
function MultiShotStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 413, Heal Strengthener
function HealStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = Energy / 5 + 5
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = Energy / 5 + 5
	end

	return SkillEffect
end

-- SkillID: 414, Triple Shot Strengthener
function TripleShotStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 416, Penetration Strengthener
function PenetrationStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * 2 * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 417, Defense Increase Strengthener
function DefenseIncreaseStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 8
	end

	return SkillEffect, SkillTime
end

-- SkillID: 418, Triple Shot Mastery
function TripleShotMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 420, Attack Increase Strengthener
function AttackIncreaseStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 7
	end

	return SkillEffect, SkillTime
end

-- SkillID: 422, Attack Increase Mastery
function AttackIncreaseMastery(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 7
	end

	return SkillEffect, SkillTime
end

-- SkillID: 423, Defense Increase Mastery
function DefenseIncreaseMastery(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 8
	end

	return SkillEffect, SkillTime
end

-- SkillID: 424, Ice Arrow Strengthener
function IceArrowStrengthener(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * 2 * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 427, Poison Arrow
function PoisonArrow_Dot(oPlayer, InDamage)
	local DotDamage = InDamage / 10
	local Time = 10
	local Rate = 30

	return DotDamage, Time, Rate
end

-- SkillID: 429, Party Healing Strengthener
function PartyHealingStrengthener(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local HP = Energy / 6 + 6

	return HP
end

-- SkillID: 430, Bless
function Bless(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 100

	return SkillEffect
end

-- SkillID: 431, Multi-Shot Mastery
function MultiShotMastery(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 433, Bless Strengthener
function BlessStrengthener(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 100

	return SkillEffect
end

-- SkillID: 434, Poison Arrow Strengthener
function PoisonArrowStrengthener_Dot(oPlayer, InDamage, MasterEffect)
	local DotDamage = (InDamage / 10) + MasterEffect
	local Time = 10
	local Rate = 30

	return DotDamage, Time, Rate
end

-- SkillID: 652, Evasion
function Evasion(oPlayer)
	local SkillEffect = 50
	local SkillTime = 7

	return SkillEffect, SkillTime
end

-- SkillID: 876, Holy Bolt Strengthener
function HolyBoltStrengthener(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- ---------- 4th Skill Tree ----------

-- SkillID: 1081, Triple Shot Enhancement Skill
function TripleShotEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 1083, Multi-Shot Enhancement Skill
function MultiShotEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 1085, Focus Shot Enhancement Skill
function FocusShotEnhancementSkill(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	return OutDamage
end

-- SkillID: 1222, Raining Arrow Enhancement Skill
function RainingArrowEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1223, Holy Bolt Enhancement Skill
function HolyBoltEnhancementSkill(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 1224, Elemental Attack Power Enhancement Skill
function ElementalAttackPowerEnhancementSkill(oPlayer, oTarget, InEffect, InTime)
	local SkillEffect = InEffect -- result of formula 36 from FormulaData.xml
	local SkillTime = InTime -- result of formula 37 from FormulaData.xml

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = InEffect
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = InEffect
	end

	return SkillEffect, SkillTime
end

-- SkillID: 1225, Elemental Defense Enhancement Skill
function ElementalDefenseEnhancementSkill(oPlayer, oTarget, InEffect, InTime)
	local SkillEffect = InEffect -- result of formula 38 from FormulaData.xml
	local SkillTime = InTime -- result of formula 37 from FormulaData.xml

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = InEffect
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = InEffect
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = InEffect
	end

	return SkillEffect, SkillTime
end

-- SkillID: 1226, Healing Enhancement Skill
function HealingEnhancementSkill(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = Energy / 5 + 5
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = Energy / 5 + 5
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = Energy / 5 + 5
	end

	return SkillEffect
end

-- SkillID: 1227, Party Healing Enhancement Skill
function PartyHealingEnhancementSkill(oPlayer)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local HP = Energy / 6 + 6

	return HP
end

-- SkillID: 1228, Attack Power Enhancement Skill
function AttackPowerEnhancementSkill(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 3 + Energy / 7
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 3 + Energy / 7
	end

	return SkillEffect, SkillTime
end

-- SkillID: 1229, Defense Enhancement Skill
function DefenseEnhancementSkill(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = 0
	local SkillTime = 60

	if (oPlayer.Index ~= oTarget.Index) then
		if (oTarget.Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_ALCHEMIST) then
			SkillEffect = 2 + Energy / 8
		elseif (oTarget.Class == CLASS_CRUSADER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (oPlayer.Index == oTarget.Index) then
		SkillEffect = 2 + Energy / 8
	end

	return SkillEffect, SkillTime
end

-- SkillID: 1230, Bless Enhancement Skill
function BlessEnhancementSkill(oPlayer, oTarget)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local SkillEffect = Energy / 100

	return SkillEffect
end

-- ---------- 5th Skill Tree ----------

-- SkillID: 2044, Raining Arrow of Saturation
function RainingArrowOfSaturation(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 6) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end

-- SkillID: 2047, Holy Bolt of Gale
function HolyBoltOfGale(oPlayer, InDamage, BarrageCount)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local GaleAttackPower = 100

	if (oPlayer.Type == OBJ_USER) then
		GaleAttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 61, Strength, Agility)
	end

	local OutDamage = InDamage * GaleAttackPower / 100

	if (BarrageCount == 1) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * GaleAttackPower / 100
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * GaleAttackPower / 100
	end

	return OutDamage
end
