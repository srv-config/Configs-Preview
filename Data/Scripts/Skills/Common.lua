-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2026 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- Common Skill Calc Script, Lua v5.3 - constants and class independent calcs

-- ============================================================
-- oPlayer, oTarget : the objects every skill function gets
-- ============================================================
-- oTarget can be nil. Without the Lua API plugin both are read-only and hold only what is listed below.
-- With the Lua API plugin the whole object and many more functions are available:
-- https://github.com/srv-config/Configs-Preview/wiki/Player-Structure
-- https://github.com/srv-config/Configs-Preview/wiki/Global-Functions

-- ---- .Index : object number ----
-- if (oTarget.Index == oPlayer.Index) then return InDamage end

-- ---- .Type : OBJ_USER or OBJ_MONSTER ----
-- if (oTarget.Type == OBJ_USER) then OutDamage = OutDamage * 0.8 end

-- ---- .Class : CLASS_* for players, the MonsterList.xml index for monsters ----
-- if (oPlayer.Class == CLASS_KNIGHT) then OutDamage = OutDamage * 1.1 end

-- ---- .Level : character or monster level ----
-- local LevelBonus = oPlayer.Level / 10

-- ---- .userData : players only, nil for monsters ----
-- Base points: .Strength, .Agility, .Vitality, .Energy, .Command
-- local Energy = oPlayer.userData.Energy
-- Points from items and buffs: .AddStrength, .AddAgility, .AddVitality, .AddEnergy, .AddCommand
-- local Strength = oPlayer.userData.Strength + oPlayer.userData.AddStrength
-- .MasterLevel
-- local TotalLevel = oPlayer.Level + oPlayer.userData.MasterLevel
-- if (oTarget.userData ~= nil) then OutDamage = OutDamage - oTarget.userData.Vitality / 10 end

-- ============================================================
-- Functions for skill scripts, with and without the Lua API plugin
-- ============================================================

-- ---- Stats.Get(Object, STAT_*, STAT_PERMANENT / STAT_VARIABLE / STAT_BOTHTYPE) ----
-- The userData points with the master tree and ability card stat bonuses; 0 for monsters
-- local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)

-- ---- Formula.GetValue(FORMULA_TYPE_*, ID, arguments...) : FormulaData.xml, nil when the formula is missing ----
-- local AttackPower = Formula.GetValue(FORMULA_TYPE_CHARACTER, 54, Energy, Command)

-- ---- Buff.CheckUsed(Object, BUFFTYPE_*) : BuffEffectManager.xml ----
-- if (Buff.CheckUsed(oPlayer, BUFFTYPE_CRUSHER_CHARGE)) then OutDamage = OutDamage * 1.2 end

-- Character Classes
CLASS_WIZARD = 0
CLASS_KNIGHT = 1
CLASS_ELF = 2
CLASS_GLADIATOR = 3
CLASS_DARKLORD = 4
CLASS_SUMMONER = 5
CLASS_RAGEFIGHTER = 6
CLASS_GROWLANCER = 7
CLASS_RUNEWIZARD = 8
CLASS_SLAYER = 9
CLASS_GUNCRUSHER = 10
CLASS_LIGHTWIZARD = 11
CLASS_LEMURIAMAGE = 12
CLASS_ILLUSIONKNIGHT = 13
CLASS_ALCHEMIST = 14
CLASS_CRUSADER = 15

-- Object Types
OBJ_USER = 1
OBJ_MONSTER = 2

-- Stats.Get(oPlayer, StatType, GetType)
STAT_STRENGTH = 0
STAT_AGILITY = 1
STAT_VITALITY = 2
STAT_ENERGY = 3
STAT_COMMAND = 4

STAT_PERMANENT = 1
STAT_VARIABLE = 2
STAT_BOTHTYPE = 3

-- Formula.GetValue(FormulaType, FormulaID, ...) - FormulaData.xml
FORMULA_TYPE_CHARACTER = 8
FORMULA_TYPE_COMBATPOWER = 13

-- Buff.CheckUsed(oPlayer, BuffIndex) - BuffEffectManager.xml
BUFFTYPE_CRUSHER_CHARGE = 366
BUFFTYPE_CRUSHER_CHARGE_STRENGTHENER = 370
BUFFTYPE_CRUSHER_CHARGE_MASTERY = 371

-- SkillID: 59, Combo
function Combo(oPlayer, InDamage)
	local Strength = Stats.Get(oPlayer, STAT_STRENGTH, STAT_BOTHTYPE)
	local Agility = Stats.Get(oPlayer, STAT_AGILITY, STAT_BOTHTYPE)
	local Energy = Stats.Get(oPlayer, STAT_ENERGY, STAT_BOTHTYPE)
	local ComboDamage = 0

	if (oPlayer.Class == CLASS_WIZARD) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_KNIGHT) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_ELF) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_GLADIATOR) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_DARKLORD) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_SUMMONER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_RAGEFIGHTER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_GROWLANCER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_RUNEWIZARD) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_SLAYER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_GUNCRUSHER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_LIGHTWIZARD) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_LEMURIAMAGE) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_ILLUSIONKNIGHT) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_ALCHEMIST) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	elseif (oPlayer.Class == CLASS_CRUSADER) then
		ComboDamage = (Strength * 1.5) + Agility + Energy
	end

	return ComboDamage
end

-- SkillID: 47, Impale - not in SkillList.xml
function Impale(oPlayer, InDamage)
	local OutDamage = InDamage

	return OutDamage
end

-- BuffIndex: 238, Bastion
function Bastion(oPlayer, oTarget)
	local SuccessRate = 50
	local MinShieldPercent = 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate, MinShieldPercent
end

-- BuffIndex: 239, Hemorrhage
function Hemorrhage(oPlayer)
	local CharacterLevel = oPlayer.Level + oPlayer.userData.MasterLevel
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate, Duration
end

-- BuffIndex: 240, Paralysis
function Paralysis(oPlayer)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate
end

-- BuffIndex: 241, Bondage
function Bondage(oPlayer)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate
end

-- BuffIndex: 242, Blindness
function Blindness(oPlayer)
	local CharacterLevel = oPlayer.Level + oPlayer.userData.MasterLevel
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate, Duration
end

-- SkillID: 2022, Bond - tick damage on monsters
function Bond_Dot(oPlayer, MagicDamageMin, MagicDamageMax)
	local SkillEffect = MagicDamageMax / 4
	local Duration = 3

	return SkillEffect, Duration
end

-- SkillID: 2022, Bond - bonus for Light Wizard and Lemuria Mage
function Bond_Active(oPlayer, InDamage)
	local OutDamage = InDamage * 130 / 100

	return OutDamage
end

-- SkillID: 2022, Bond - bonus for other class party members
function Bond_PartyMember(oPlayer, InDamage)
	local OutDamage = InDamage * 115 / 100

	return OutDamage
end
