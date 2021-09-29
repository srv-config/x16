-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2019 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- CalcCharacter Control Script, Lua v5.2
-- Character Calculations Configuration - Can be modified to adjust for own needs
-- For more CalcCharacter options refer to \Data\CalcCharacter.ini

-- Character Classes
CLASS_WIZARD                                          = 0	-- Fairy Elf, Muse Elf, High Elf
CLASS_KNIGHT                                          = 1	-- Dark Wizard, Soul Master, Grand Master
CLASS_ELF                                             = 2	-- Dark Knight, Blade Knight, Blade Master
CLASS_GLADIATOR                                       = 3	-- Magic Gladiator, Duel Master
CLASS_DARKLORD                                        = 4	-- Dark Lord, Lord Emperor
CLASS_SUMMONER                                        = 5	-- Summoner, Bloody Summoner, Dimension Master
CLASS_RAGEFIGHTER                                     = 6	-- Rage Fighter, Fist Master
CLASS_GROWLANCER									  = 7	-- Grow Lancer, Mirage Lancer
CLASS_RUNEWIZARD									  = 8	-- Rune Wizard, Rune Spell Master, Grand Rune Master
CLASS_SLAYER									  	  = 9	-- Slayer, Royal Slayer, Master Slayer, Slaughterer
CLASS_GUNCRUSHER									  = 10	-- Gun Crusher, Gun Breaker, Master Gun Breaker, Heist Gun Crusher

-- Character Damage - Fist Fighting - (Dark Wizard, Soul Master, Grand Master)
function WizardDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 8 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Dark Knight, Blade Knight, Blade Master)
function KnightDamageCalc(Strength, Dexterity, Vitality, Energy, IsStrongBeliefActive)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	if (IsStrongBeliefActive == 1) then
		AttackDamageMinLeft = Strength / 6 -- Minimum Left Hand Damage
		AttackDamageMinRight = Strength / 6 -- Minimum Right Hand Damage
		AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
		AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	else
		AttackDamageMinLeft = Strength / 9 -- Minimum Left Hand Damage
		AttackDamageMinRight = Strength / 9 -- Minimum Right Hand Damage
		AttackDamageMaxLeft = Strength / 6 -- Maximum Left Hand Damage
		AttackDamageMaxRight = Strength / 6 -- Maximum Right Hand Damage
	end
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage without bow - Fist Fighting - (Fairy Elf, Muse Elf, Hight Elf)
function ElfWithoutBowDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = (Dexterity + Strength) / 7 -- Minimum Left Hand Damage
	AttackDamageMinRight = (Dexterity + Strength) / 7 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = (Dexterity + Strength) / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = (Dexterity + Strength) / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage with Bow - (Fairy Elf, Muse Elf, Hight Elf)
function ElfWithBowDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 14 + Dexterity / 7 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 14 + Dexterity / 7 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 8 + Dexterity / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 8 + Dexterity / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Magic Gladiator, Duel master)
function GladiatorDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 6 + Energy / 12 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 6 + Energy / 12 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 + Energy / 8 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 + Energy / 8 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Dark Lord, Lord Emperor)
function LordDamageCalc(Strength, Dexterity, Vitality, Energy, Command)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 7 + Energy / 14 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 7 + Energy / 14 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 5 + Energy / 10 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 5 + Energy / 10 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = (Dexterity + Strength) / 7 -- Minimum Left Hand Damage
	AttackDamageMinRight = (Dexterity + Strength) / 7 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = (Dexterity + Strength) / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = (Dexterity + Strength) / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Rage Fighter, Fist Master)
function RageFighterDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 7 + Vitality / 15 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 7 + Vitality / 15 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 5 + Vitality / 12 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 5 + Vitality / 12 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Damage - Fist Fighting - (Grow Lancer, Mirage Lancer)
function GrowLancerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 8 + Dexterity / 10 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 8 + Dexterity / 10 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 + Dexterity / 6 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 + Dexterity / 6 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

function RuneWizardDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 8 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

function SlayerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 8 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

function GunCrusherDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	AttackDamageMinLeft = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMinRight = Strength / 8 -- Minimum Right Hand Damage
	AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
	AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Magic Damage - (Dark Wizard, Soul Master, Grand Master)
function WizardMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character magic Damage - (Dark Knight, Blade Knight, Blade Master)
function KnightMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Fairy Elf, Muse Elf, High Elf)
function ElfMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Magic Gladiator, Duel Master)
function GladiatorMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Dark Lord, Lord Emperor)
function LordMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Summoner, Bloody Summoner, Dimension Master)
function SummonerMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	local CurseDamageMin = 0
	local CurseDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 + 0.015 -- Minimum Magic Damage
	CurseDamageMin = Energy / 18 -- Minimum Curse Damage
	CurseDamageMax = Energy / 10 + 0.015 -- Minimum Curse Damage
	
	return MagicDamageMin, MagicDamageMax, CurseDamageMin, CurseDamageMax
end

-- Magic Damage is not used by Rage Fighter, refer to individual Rage Fighter skills formulas 
-- Character Magic Damage - (Rage Fighter, Fist Master)
function RageFighterMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Grow Lancer, Mirage Lancer)
function GrowLancerMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Rune Wizard, Rune Spell Master, Grand Rune Master)
function RuneWizardMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Slayer, Royal Slayer, Master Slayer)
function SlayerMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Gun Crusher, Gun Breaker, Master Gun Breaker)
function GunCrusherMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 8 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Attack Speed - for Anti-Hack purpose only, does not take effect in Game for versions lower than w Season 8 Episode 3
function CalcAttackSpeed(Class, Dexterity)
	local AttackSpeed = 0
	local MagicSpeed = 0
	
	if(Class == CLASS_WIZARD) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_KNIGHT) then
		AttackSpeed = Dexterity / 15
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_ELF) then 
		AttackSpeed = Dexterity / 50
		MagicSpeed = Dexterity / 50
	elseif(Class == CLASS_GLADIATOR) then
		AttackSpeed = Dexterity / 15
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_DARKLORD) then
		AttackSpeed = Dexterity / 10
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_SUMMONER) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSpeed = Dexterity / 9
		MagicSpeed = Dexterity / 9
	elseif(Class == CLASS_GROWLANCER) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSpeed = Dexterity / 12
		MagicSpeed = Dexterity / 12
	elseif(Class == CLASS_SLAYER) then
		AttackSpeed = Dexterity / 12
		MagicSpeed = Dexterity / 12
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 20
	end
	
	return AttackSpeed, MagicSpeed
end

-- Character Attack Success Rate - PvM 
function CalcAttackSuccessRate_PvM(Class, Strength, Dexterity, Vitality, Energy, Command, NormalLevel, MasterLevel)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 3 + Strength / 4 + Command / 10
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = TotalLevel * 3 + Dexterity * 1.25 + Strength / 6
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.25 + Strength / 4
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	end
	
	return AttackSuccessRate
end	

-- Character Defense Success Rate - PvM
function CalcDefenseSuccessRate_PvM(Class, Strength, Dexterity, Vitality, Energy, NormalLevel, MasterLevel)
	local DefenseSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_KNIGHT) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_ELF) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_GLADIATOR) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_DARKLORD) then
		DefenseSuccessRate = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseSuccessRate = Dexterity / 10
	elseif(Class == CLASS_GROWLANCER) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_SLAYER) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseSuccessRate = Dexterity / 4
	end
	
	return DefenseSuccessRate
end

-- Character Defense - General
function CalcDefense(Class, Dexterity, IsSpecialBuff)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_KNIGHT) then
		if (IsSpecialBuff == 1) then -- Strong Belief
			Defense = Dexterity / 2
		else
			Defense = Dexterity / 3
		end
	elseif(Class == CLASS_ELF) then
		Defense = Dexterity / 10
	elseif(Class == CLASS_GLADIATOR) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_DARKLORD) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_RAGEFIGHTER) then
		Defense = Dexterity / 8
	elseif(Class == CLASS_GROWLANCER) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_RUNEWIZARD) then
		Defense = Dexterity / 5
	elseif(Class == CLASS_SLAYER) then
		Defense = Dexterity / 5
	elseif(Class == CLASS_GUNCRUSHER) then
		Defense = Dexterity / 4
	end
	
	return Defense
end

-- Character Attack Success Rate - PvP
function CalcAttackSuccessRate_PvP(Class, Strength, Dexterity, Vitality, Energy, Command, NormalLevel, MasterLevel)
	local AttackRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_KNIGHT) then
		AttackRate = Dexterity * 4.5 + 3 * TotalLevel
	elseif(Class == CLASS_ELF) then
		AttackRate = Dexterity * 0.6 + 3 * TotalLevel
	elseif(Class == CLASS_GLADIATOR) then
		AttackRate = Dexterity * 3.5 + 3 * TotalLevel
	elseif(Class == CLASS_DARKLORD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_SUMMONER) then
		AttackRate = Dexterity * 3.5 + 3 * TotalLevel
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackRate = Dexterity * 3.6 + 2.6 * TotalLevel
	elseif(Class == CLASS_GROWLANCER) then
		AttackRate = Dexterity * 2 + 3 * TotalLevel
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_SLAYER) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackRate = Dexterity * 3.5 + 3 * TotalLevel
	end
	
	return AttackRate
end

-- Character Defense Success Rate - PvP
function CalcDefenseSuccessRate_PvP(Class, Strength, Dexterity, Vitality, Energy, NormalLevel, MasterLevel)
	local DefenseRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_KNIGHT) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_ELF) then
		DefenseRate = Dexterity / 10 + 2 * TotalLevel
	elseif(Class == CLASS_GLADIATOR) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_DARKLORD) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_SUMMONER) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseRate = Dexterity / 5 + 1.5 * TotalLevel
	elseif(Class == CLASS_GROWLANCER) then
		DefenseRate = Dexterity / 5 + 2 * TotalLevel
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseRate = Dexterity / 3 + 4 * TotalLevel
	elseif(Class == CLASS_SLAYER) then
		DefenseRate = Dexterity / 3 + 4 * TotalLevel
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	end
	
	return DefenseRate
end

-- Character Elemental Damage - PvP and MvP - Dark Wizard, Soul Master, Grand Master)
function WizardElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Energy / 9)
	MaxDamage = ItemMaxDamage + (Energy / 6)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Dark Knight, Blade Knight, Blade Master)
function KnightElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Strength / 6)
	MaxDamage = ItemMaxDamage + (Strength / 4)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Fairy Elf, Muse Elf, High Elf)
function ElfElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Dexterity / 8) + (Strength / 14)
	MaxDamage = ItemMaxDamage + (Dexterity / 4) + (Strength / 8)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Magic Gladiator, Duel Master)
function GladiatorElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Strength / 10) + (Energy / 14)
	MaxDamage = ItemMaxDamage + (Strength / 6) + (Energy / 8)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Dark Lord, Lord Emperor)
function LordElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Strength / 10) + (Energy / 14)
	MaxDamage = ItemMaxDamage + (Strength / 6) + (Energy / 10)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Energy / 10)
	MaxDamage = ItemMaxDamage + (Energy / 6)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Rage Fighter, Fist Master)
function RageFighterElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Strength / 10) + (Vitality / 20)
	MaxDamage = ItemMaxDamage + (Strength / 6) + (Vitality / 15)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Grow Lancer, Mirage Lancer)
function GrowLancerElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Strength / 4) + (Dexterity / 1)
	MaxDamage = ItemMaxDamage + (Strength / 4) + (Dexterity / 1)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Rune Wizard, Rune Spell Master, Grand Rune Master)
function RuneWizardElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Energy / 9)
	MaxDamage = ItemMaxDamage + (Energy / 6)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Slayer, Royal Slayer, Master Slayer)
function SlayerElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Energy / 9)
	MaxDamage = ItemMaxDamage + (Energy / 6)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Damage - PvP and MvP - (Gun Crusher, Gun Breaker, Master Gun Breaker)
function GunCrusherElementalDamageCalc(Strength, Dexterity, Vitality, Energy, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	MinDamage = ItemMinDamage + (Energy / 9)
	MaxDamage = ItemMaxDamage + (Energy / 6)
	
	return MinDamage, MaxDamage
end

-- Character Elemental Attack Rate MvP - General
function ElementalAttackRateCalc_MvP(Class, NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy, Command)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	end
	
	return AttackSuccessRate
end

-- Character Elemental Attack Rate PvP - General
function ElementalAttackRateCalc_PvP(Class, NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy, Command)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	end
	
	return AttackSuccessRate
end

-- Character Elemental Defense - General
function ElementalDefenseCalc(Class, Dexterity, Energy)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_KNIGHT) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_ELF) then
		Defense = Dexterity / 10
	elseif(Class == CLASS_GLADIATOR) then
		Defense = Dexterity / 5
	elseif(Class == CLASS_DARKLORD) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_RAGEFIGHTER) then
		Defense = Dexterity / 8
	elseif(Class == CLASS_GROWLANCER) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_RUNEWIZARD) then
		Defense = (Dexterity / 10) + (Energy / 5)
	elseif(Class == CLASS_SLAYER) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		Defense = Dexterity / 3
	end
	
	return Defense
end

-- Character Elemental Defense Success Rate - General
function ElementalDefenseRateCalc(Class, Strength, Dexterity, Energy, Vitality, Command)
	local DefenseRate = 0
	
	if(Class == CLASS_WIZARD) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_KNIGHT) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_ELF) then
		DefenseRate = Dexterity / 4
	elseif(Class == CLASS_GLADIATOR) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_DARKLORD) then
		DefenseRate = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		DefenseRate = Dexterity / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseRate = Dexterity / 10
	elseif(Class == CLASS_GROWLANCER) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_SLAYER) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseRate = Dexterity / 3
	end
	
	return DefenseRate
end

-- Only for Dark Knight, Magic Gladiator, Slayer
function CalcTwoSameWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight, Class)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 65 / 100
	OutDamageMinRight = AtkMinRight * 65 / 100
	OutDamageMaxLeft = AtkMaxLeft * 65 / 100
	OutDamageMaxRight = AtkMaxRight * 65 / 100
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Only for Dark Knight, Magic Gladiator, Slayer and Dark Lord
function CalcTwoDifferentWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight, Class)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 55 / 100
	OutDamageMinRight = AtkMinRight * 55 / 100
	OutDamageMaxLeft = AtkMaxLeft * 55 / 100
	OutDamageMaxRight = AtkMaxRight * 55 / 100
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Only for Rage Fighter
function CalcRageFighterTwoWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 120 / 100 / 2
	OutDamageMinRight = AtkMinRight * 120 / 100 / 2
	OutDamageMaxLeft = AtkMaxLeft * 130 / 100 / 2
	OutDamageMaxRight = AtkMaxRight * 130 / 100 / 2
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Dark Horse Defense Bonus
function CalcDarkHorseDefenseBonus(Dexterity, PetLevel)
 local AddDefense = Dexterity / 20 + 5 + PetLevel * 2

 return AddDefense
end

-- Fourth Class Character Damage calc from user
function Calc4thClassDamageFromUser(UserLevel, UserMasterLevel, MonsterLevel, InDamage)
	local SumUserLevel = UserLevel + UserMasterLevel
	local SumMonLevel = MonsterLevel + 600
	local LevelDiff = SumMonLevel - SumUserLevel
	local OutDamage = InDamage
	
	if LevelDiff <= 0 then
		return OutDamage
	end
		
	if (LevelDiff > 7) then
		LevelDiff = 7
	end
		
	OutDamage = OutDamage - (OutDamage * (LevelDiff * 10) / 100)
	return OutDamage
end

-- Fourth Class Character Damage calc from monster
function Calc4thClassDamageFromMonster(UserLevel, UserMasterLevel, MonsterLevel, InDamage)
	local SumUserLevel = UserLevel + UserMasterLevel
	local SumMonLevel = MonsterLevel + 600
	local LevelDiff = SumMonLevel - SumUserLevel
	local OutDamage = InDamage
	
	if LevelDiff <= 0 then
		return OutDamage
	end
		
	if LevelDiff > 7 then
		LevelDiff = 7
	end
		
	OutDamage = OutDamage + (OutDamage * (LevelDiff * 10) / 100)
	return OutDamage
end																					   