-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2025 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- MasterSkillCalc Control Script, Lua v5.2
-- Regular and Master Experience formulas, - Can be modified to adjust for own needs

-- Regular Exp Table formula - used to calculate exp required for next regular level
function SetExpTable_Normal(Level)
	local Exp = 10 * Level * Level * (Level + 9);

	if ( Level > 255 ) then
		Exp = Exp + ( 1000 * (Level-255) * (Level-255) * ((Level-255) + 9))
	end
	
	return Exp
end

-- Master Exp Table formula - used to calculate exp required for next regular level
function SetExpTable_Master(MasterLevel, MaxNormalLevel)
	local TotalLevel = MasterLevel + MaxNormalLevel
	local Exp = 0

	if (MasterLevel >= 1200) then
		Exp = SetExpTable_Master(400, MaxNormalLevel)
		Exp = Exp + 1026586760718480
			+ ((TotalLevel - 1600) * 22500000000000)
			+ (35500000000 * ((TotalLevel - 1601) * (TotalLevel - 1600) / 2))

	elseif (MasterLevel >= 1150) then
		Exp = SetExpTable_Master(400, MaxNormalLevel)
		Exp = Exp + 396271760718481
			+ (TotalLevel - 1550) * 6300000000000
			+ ((5200000000 * (TotalLevel - 1551) * (TotalLevel - 1550) / 2))
				* (49 + (TotalLevel - 1550)) * 0.5

	elseif (MasterLevel >= 1050) then
		Exp = SetExpTable_Master(400, MaxNormalLevel)
		Exp = Exp + 197413333648350
			+ (((TotalLevel - 1450) * 753724359459)
			+ (1500000000 * (TotalLevel - 1450) * (TotalLevel - 1449) / 2)
			+ (150001 * (TotalLevel - 1450) * (TotalLevel - 1449) / 2)
				* (((TotalLevel - 1450) * (TotalLevel - 1449) / 2) ^ 1.4))

	elseif (MasterLevel >= 600) then
		Exp = SetExpTable_Master(400, MaxNormalLevel)
		Exp = Exp + (((TotalLevel - 800) * 19024359459)
			+ (300000000 * (TotalLevel - 801) * ((TotalLevel - 800) / 2))
			+ (1200000000 * (TotalLevel - 999) * ((TotalLevel - 1000) / 2)))

	elseif (MasterLevel > 400) then
		Exp = SetExpTable_Master(400, MaxNormalLevel)
		Exp = Exp + ((TotalLevel - 800) * 19024359459)
			+ (300000000 * (TotalLevel - 801) * ((TotalLevel - 800) / 2))

	elseif (MasterLevel > 370) then
		Exp = ((((9 + TotalLevel) * TotalLevel * TotalLevel * 10)
			+ ((9 + (TotalLevel - 255)) * (TotalLevel - 255) * (TotalLevel - 255) * 1000)
			- 3892250000) / 2)
			* (1 + (1.2 * ((TotalLevel - (600 - (0.3 * ((TotalLevel - 770) * (TotalLevel - 770))))) ^ 2)) / 100000)

	elseif (MasterLevel > 200) then
		Exp = ((((9 + TotalLevel) * TotalLevel * TotalLevel * 10)
			+ ((9 + (TotalLevel - 255)) * (TotalLevel - 255) * (TotalLevel - 255) * 1000)
			- 3892250000) / 2)
			* (1 + (1.2 * ((TotalLevel - 600) ^ 2)) / 100000)

	else
		Exp = ((((9 + TotalLevel) * TotalLevel * TotalLevel * 10)
			+ ((9 + (TotalLevel - 255)) * (TotalLevel - 255) * (TotalLevel - 255) * 1000)
			- 3892250000) / 2)
	end

	return Exp
end

function ExpSystemCalc(FormulaID, PlayerVipType, StaticExp, DynamicExp, EventExp, VipExp, BonusEvent, MapBonusExp, MiscExp)
	local Exp = 0

-- The OffLevelExp is 1.0 when not having plugin purchased
-- The MiscExp is percentage bonus exp added by Static Option System plugin, default is 0.0
	if (FormulaID == 0) then
		Exp = StaticExp+(EventExp+VipExp+BonusEvent+MapBonusExp);
	elseif (FormulaID == 1) then
		Exp = StaticExp+DynamicExp+(EventExp+VipExp+BonusEvent+MapBonusExp);
	elseif (FormulaID == 2) then
		Exp = StaticExp*DynamicExp+(EventExp+VipExp+BonusEvent+MapBonusExp);
	elseif (FormulaID == 3) then
		Exp = DynamicExp+(EventExp+VipExp+BonusEvent+MapBonusExp);
	elseif (FormulaID == 4) then
		Exp = (StaticExp+EventExp+VipExp+BonusEvent+MapBonusExp)*DynamicExp;
	elseif (FormulaID == 5) then
		if (VipExp <= 0) then -- default is 0, set to 1 (no change) as it is used as multiplier
			VipExp = 1.0
		end
		
		if (PlayerVipType >= 0) then
			VipExp = 1.0 + VipExp; -- set actual VIP increase
		end
		
		Exp = (StaticExp+DynamicExp+EventExp+BonusEvent+MapBonusExp)*VipExp;
	end

	if (MiscExp > 0) then
		Exp = Exp + (Exp * MiscExp / 100)
	end
	
	return Exp;
end

function ExpPenaltyCalc(MapNumber, UserLevel, UserMasterLevel, MonsterLevel, PenaltyMonsterAddLevel)
	local SumUserLevel = UserLevel + UserMasterLevel
	local SumMonLevel = MonsterLevel + PenaltyMonsterAddLevel
	local LevelDiff = SumMonLevel - SumUserLevel
	local ExpRate = 100

	if LevelDiff <= 0 then
		return ExpRate
	end

	if (LevelDiff > 7) then
		LevelDiff = 7
	end

	ExpRate = ExpRate - (LevelDiff * 10)
	
	if (ExpRate < 30) then
		ExpRate = 30
	end
	
	return ExpRate
end