-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2019 IGC-Network (R)
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
	local Exp = (TotalLevel + 9) * TotalLevel * TotalLevel * 10
	
	Exp = Exp + ( ((TotalLevel - 255) + 9) * (TotalLevel - 255) * (TotalLevel - 255) * 1000)
	Exp = (Exp - 3892250000) / 2
	
	if (MasterLevel > 600) then
		Exp = SetExpTable_Master(MasterLevel - 1, MaxNormalLevel)
		Exp = Exp + 80224359459 + (1500000000 * (MasterLevel - 601))
		
	elseif (MasterLevel > 400) then
		Exp = SetExpTable_Master(MasterLevel - 1, MaxNormalLevel)
		Exp = Exp + 19024359459 + (300000000 * (MasterLevel - 401))

	elseif (MasterLevel >= 370) then
		local ModExp = TotalLevel - (600 - ((TotalLevel - 770) * (TotalLevel - 770)) * 0.3)
		Exp = (Exp * (ModExp * ModExp * 1.2 / 100000.0 + 1.0))
	
	elseif(MasterLevel >= 200) then
		Exp = Exp * ( (TotalLevel - 600) * (TotalLevel - 600) * 1.2 / 100000.0 + 1.0 )
	end
	
	return Exp
end

function ExpSystemCalc(FormulaID, StaticExp, DynamicExp, EventExp, VipExp, BonusEvent, MapBonusExp)
	local Exp = 0

-- The OffLevelExp is 1.0 when not having plugin purchased
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
		Exp = (StaticExp+DynamicExp+EventExp+BonusEvent+MapBonusExp)*VipExp;
	end

	return Exp;
end
