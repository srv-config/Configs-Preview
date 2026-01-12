-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2025 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

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

function ShadowPhantomBuffCalc(Class, Level)
	local IncDamage = 0
	local IncDefense = 0
	local BuffTime = (Level / 6 + 30) * 60
	
	if (Level <= 180) then
		IncDamage = Level / 3 + 45
		IncDefense = Level / 5 + 50
	else
		IncDamage = 105
		IncDefense = 86
	end
	
	return IncDamage, IncDefense, BuffTime
end
