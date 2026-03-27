-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2010-2016 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

function DarkSpirit_CalcValues(Command, PetLevel)
	local AttackDamageMin = PetLevel * 15 + Command / 8 + 180
	local AttackDamageMax = PetLevel * 15 + Command / 4 + 200
	
	local CriticalDamage = 30
	local ExcellentDamage = Command / 200 + 3 + PetLevel / 20
	local DoubleDamage = Command / 300 + 2 + PetLevel / 30
	local IgnoreEnemy = Command / 400 + 1 + PetLevel / 40
	
	local AttackSpeed = PetLevel * 4 / 5 + Command / 50 + 20
	local SuccessAtkRate = PetLevel + PetLevel / 15 + 1000
	
	return AttackDamageMin, AttackDamageMax, CriticalDamage, ExcellentDamage, DoubleDamage, IgnoreEnemy, AttackSpeed, SuccessAtkRate
end