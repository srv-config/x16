-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2019 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- MasterSkillCalc Control Script, Lua v5.3
-- Skill Tree Skill Configuration (Result, Time) - Can be modified to adjust for own needs

-- SkillID refers to Index of skill in \Data\Skills\SkillList.xml

-- Character Classes
CLASS_WIZARD                                          = 0
CLASS_KNIGHT                                          = 1
CLASS_ELF                                             = 2
CLASS_GLADIATOR                                       = 3
CLASS_DARKLORD                                        = 4
CLASS_SUMMONER                                        = 5
CLASS_RAGEFIGHTER                                     = 6
CLASS_GROWLANCER									  = 7
CLASS_RUNEWIZARD									  = 8
CLASS_SLAYER									  	  = 9
CLASS_GUNCRUSHER									  = 10

-- SkillID: 385, 487, Evil Spirit Strengthener
function EvilSpirit_MasterLevel1_Calc(Class, InDamage, Strength, Dexterity, Vitality, Energy)
 local OutDamage = 0
 
 	if (Class == CLASS_WIZARD) then
		OutDamage = InDamage
	elseif (Class == CLASS_GLADIATOR) then
		OutDamage = InDamage
	elseif (Class == CLASS_RUNEWIZARD) then
		OutDamage = InDamage
	end
 
 return OutDamage
end

-- SkillID: 392, Nova Strengthener - (Grand Master)
function NovaSkillCalc_Master_Wizard(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 403, Soul Barrier Strengthener - (Grand Master)
function WizardMagicDefense_Level1(Index, TargetIndex, TargetClass, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if (Index == TargetIndex and SkillEffect > 60) then -- casting spell on yourself
		SkillEffect = 60
	elseif (Index ~= TargetIndex and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 50
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 404, Soul Barrier Proficiency - (Grand Master)
function WizardMagicDefense_Level2(Index, TargetIndex, TargetClass, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if (Index == TargetIndex and SkillEffect > 70) then -- casting spell on yourself
		SkillEffect = 70
	elseif (Index ~= TargetIndex and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 50
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 406, Soul Barrier Mastery (Grand Master)
function WizardMagicDefense_Level3(Index, TargetIndex, TargetClass, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if (Index == TargetIndex and SkillEffect > 75) then -- casting spell on yourself
		SkillEffect = 75
	elseif (Index ~= TargetIndex and SkillEffect > 50) then -- casting spell on others
		SkillEffect = 60
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 330, Twisting Slash Strengthener - (Blade Master)
function TwistingSlashCalc_Master_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 326, Cyclone Strengthener - (Blade Master)
function CycloneCalc_Master_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 327, Slash Strengthener - (Blade Master)
function SlashCalc_Master_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 328, Falling Slash Strengthener - (Blade Master)
function FallingSlashCalc_Master_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 329, Lunge Strengthener - (Blade Master)
function LungeCalc_Master_Knight(Class, InDamage, Energy)
	local OutDamage = 0

	if (Class == CLASS_KNIGHT) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	elseif (Class == CLASS_GROWLANCER) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	end

	return OutDamage
end

-- SkillID: 331, 812, Anger Blow Strengthener
function AngerBlow_Master_Level1(Class, SkillId, InDamage, Strength, Dexterity, Vitality, Energy)
 local OutDamage = 0
 
 	if (Class == CLASS_KNIGHT and SkillId == 812) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	elseif (Class == CLASS_SLAYER and SkillId == 331) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	end
 
 return OutDamage
end

-- SkillID: 336, Death Stab Strengthener - (Blade Master)
function DeathStab_MasterLevel1_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 339, Death Stab Proficiency - (Blade Master)
function DeathStab_MasterLevel2_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 344, Blood Storm - (Blade Master)
function BloodStormCalc_MasterLevel1_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 346, Blood Storm Strengthener
function BloodStormCalc_MasterLevel2_Knight(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 356, Swell Life Strengthener - (Blade Master)
function KnightSkillAddLife_Level1(Index, TargetIndex, TargetClass, Vitality, Energy, PartyBonus)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 360, Swell Life Proficiency - (Blade Master)
function KnightSkillAddLife_Level2(Index, TargetIndex, TargetClass, Vitality, Energy, PartyBonus)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 363, Swell Life Mastery - (Blade Master)
function KnightSkillAddLife_Level3(Index, TargetIndex, TargetClass, Vitality, Energy, PartyBonus)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 411, Multi-Shot Strengthener - (High Elf)
function MultiShotCalc_Master_Elf(InDamage, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 413, Heal Strengthener - (High Elf)
function ElfHeal_Level1(TargetClass, Index, TargetIndex, Energy)
	local SkillEffect = 0
	
	if (Index ~= TargetIndex) then
		if (TargetClass == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 5 + 5			
		end
	elseif (Index == TargetIndex) then
		SkillEffect = Energy / 5 + 5
	end
	
	return SkillEffect
end

-- SkillID: 414, Triple-Shot Strengthener - (High Elf)
function Elf_CalcTripleShot_Level1(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 416, Penetration Strengthener - (High Elf)
function PenetrationCalc_Master_Elf(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 417, Defense Increase Strengthener - (High Elf)
function ElfDefense_Level1(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 8
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 418, Triple Shot Mastery - (High Elf)
function Elf_CalcTripleShot_Level2(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 423, Defense Increase Mastery - (High Elf)
function ElfDefense_Level2(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 8
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 420, Attack Increase Strengthener - (High Elf)
function ElfAttack_Level1(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 7
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 422, Attack Increase Mastery - (High Elf)
function ElfAttack_Level2(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 7
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 424, Ice Arrow Strengthener - (High Elf)
function IceArrowCalc_Master_Elf(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 427, Poison Arrow - (Damage over time) - (High Elf)
function PoisonArrow_MasterLevel1_DotDamage(InDamage)
	local DotDamage = InDamage / 10
	local Time = 10
	local Rate = 30
	
	return DotDamage, Time, Rate
end

-- SkillID: 436, Poison Arrow Strengthener - (Damage over time) - (High Elf)
function PoisonArrow_MasterLevel2_DotDamage(InDamage, MasterEffect)
	local DotDamage = (InDamage / 10) + MasterEffect
	local Time = 10
	local Rate = 30
	
	return DotDamage, Time, Rate
end

-- SkillID: 429, Party Healing Strengthener - (High Elf)
function ElfPartyHealing(Energy)
	local HP = Energy / 6 + 6
	
	return HP
end

-- SkillID: 430, Bless - (High ELf)
function ElfBless_Level1(Energy)
	local SkillEffect = Energy / 100
	
	return SkillEffect
end

-- SkillID: 433, Bless Strengthener - (High Elf)
function ElfBless_Level2(Energy)
	local SkillEffect = Energy / 100
	
	return SkillEffect
end

-- SkillID: 479, Cyclone Strengthener - (Duel Master)
function CycloneCalc_Master_Gladiator(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 481, Twisting Slash Strengthener - (Duel Master)
function TwistingSlashCalc_Master_Gladiator(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 482, Power Slash Strengthener - (Duel Master)
function PowerSlash_Master_Gladiator(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 490, Fire Slash Strengthener - (Duel Master)
function FireSlash_MasterLevel1_Gladiator(InDamage, Strength, Energy, BarrageCount)
    local OutDamage = 0
    
    if (BarrageCount == 1) then
        OutDamage = (InDamage * 0.15) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 2) then
        OutDamage = (InDamage * 0.18) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 3) then
        OutDamage = (InDamage * 0.22) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 4) then
        OutDamage = (InDamage * 0.25) * ( 200 + ( Energy / 10 ) ) / 100;
    end
	
    return OutDamage
end


-- SkillID: 492, Flame Strike Strengthener - (Duel Master)
function FlameStrike_MasterLevel1_Gladiator(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 493, Fire Slash Mastery - (Duel Master)
function FireSlash_MasterLevel2_Gladiator(InDamage, Strength, Energy, BarrageCount)
    local OutDamage = 0
    
    if (BarrageCount == 1) then
        OutDamage = (InDamage * 0.15) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 2) then
        OutDamage = (InDamage * 0.18) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 3) then
        OutDamage = (InDamage * 0.22) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 4) then
        OutDamage = (InDamage * 0.25) * ( 200 + ( Energy / 10 ) ) / 100;
    end
	
    return OutDamage
end

-- SkillID: 495, Earth Prison - (Duel Master)
function EarthPrison_Level1()
 local DebuffSuccessRate = 5
 local DebuffTime = 5
 
 return DebuffSuccessRate, DebuffTime
end

-- SkillID: 496, Gigantic Storm Strengthener - (Duel Master)
function GiganticStormCalc_Master_Gladiator(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 497, Earth Prison Strengthener - (Duel Master)
function EarthPrison_Level2()
 local DebuffSuccessRate = 5
 local DebuffTime = 5
 
 return DebuffSuccessRate, DebuffTime
end

-- SkillID: 508, Fire Burst Strengthener - (Lord Emperor)
function FireBurst_MasterLevel1_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 509, Force Wave Strengthener - (Lord Emperor)
function ForceWave_Master_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 511, Critical DMG Increase PowUp - (Lord Emperor)
function DarkLordCriticalDamage_Level1(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 512, Earthshake Strengthener - (Lord Emperor)
function EarthShake_MasterLevel1_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 515, Critical DMG Increase PowUp (2) - (Lord Emperor)
function DarkLordCriticalDamage_Level2(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 517, Critical DMG Increase PowUp (3) - (Lord Emperor)
function DarkLordCriticalDamage_Level3(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 522, Critical Damage Increase Master - (Lord Emperor)
function DarkLordCriticalDamage_Level4(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 518, Fire Scream Strengthener - (Lord Emperor)
function FireScream_MasterLevel1_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 520, Fire Scream Mastery - (Lord Emperor)
function FireScream_MasterLevel2_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 519, Electric Spark Strengthener - (Lord Emperor)
function ElectricSpark_Master_Lord(InDamage, Energy)
	local OutDamage = (InDamage * (((Energy) / 20 + 200))) / 100;
	
	return OutDamage
end

-- SkillID: 523, Chaotic Diseier Strengthener - (Lord Emperor)
function ChaoticDiseier_Master_Lord(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 25 + 200) / 100
	
	return OutDamage
end

-- SkillID: 454, Sleep Strengthener - MvP - (Dimension Master)
function Sleep_Monster_Level1(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 30 + Curse / 6 + 20
	local SkillTime = Energy / 100 + 5 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 454, Sleep Strengthener - PvP - (Dimension Master)
function Sleep_PvP_Level1(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate = Energy / 37 + Curse / 6 + 15
	local SkillTime = Energy / 250 + (PlayerLevel - TargetLevel) / 100 + 4
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 455, Chain Lightning Strengthener - (Dimension Master)
function ChainLightning_Master_Summoner(InDamage, TargetNumber)
	local DamagePercent = 0
	
	if(TargetNumber == 1) then
		DamagePercent = 100
	elseif(TargetNumber == 2) then
		DamagePercent = 70
	elseif(TargetNumber == 3) then
		DamagePercent = 50
	else
		DamagePercent = 0
	end
		
	local OutDamage = InDamage * DamagePercent / 100
	
	return OutDamage
end

-- SkillID: 456, Lightning Shock - (Dimension Master)
function LightningShock_Master_Summoner(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 459, Weakness Strengthener - MvP - (Dimension Master)
function SummonerWeakness_Monster_Level1(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 58 + 4
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 459, Weakness Strengthener - PvP - (Dimension Master)
function SummonerWeakness_PvP_Level1(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 93 + 3
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 460, Innovation Strengthener - MvP - (Dimension Master)
function SummonerInnovation_Monster_Level1(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 90 + 20
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 460, Innovation Strengthener - PvP - (Dimension Master)
function SummonerInnovation_PvP_Level1(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 110 + 12
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 772, Weakness Mastery - MvP - (Dimension Master)
function SummonerWeakness_Monster_Level2(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 58 + 4
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 772, Weakness Mastery - PvP - (Dimension Master)
function SummonerWeakness_PvP_Level2(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 93 + 3
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 773, Innovation Mastery - MvP - (Dimension Master)
function SummonerInnovation_Monster_Level2(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 90 + 20
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 773, Innovation Mastery - PvP - (Dimension Master)
function SummonerInnovation_PvP_Level2(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 110 + 12
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 458, Drain Life Strengthener - MvP - (Dimension Master)
function SummonerDrainLife_Monster_Level1(Energy, MonsterLevel)
	local AddHP = (Energy / 15) + MonsterLevel / 2.5
	
	return AddHP
end

-- SkillID: 458, Drain Life Skill - PvP - (Dimension Master)
function SummonerDrainLife_PvP_Level1(Energy, Damage)
	local AddHP = Energy / 23 + 10 * Damage / 100
	
	return AddHP
end

-- SkillID: 469, Berserker Strengthener - (Dimension Master)
function SummonerBerserker_Level1(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	local SkillTime = -10
	
	return SkillEffectUP, SkillEffectDOWN, SkillTime
end

-- SkillID: 470, Berserker Proficiency - (Dimension Master)
function SummonerBerserker_Level2(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillTime = -10
	
	return SkillEffectUP, SkillTime
end

-- SkillID: 770, Darkness Strengthener - (Dimension Master)
function SummonerDarkness_Level1(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	
	return SkillEffectUP, SkillEffectDOWN
end

-- SkillID: 771, Darkness Proficiency - (Dimension Master)
function SummonerDarkness_Level2(Energy)
	local SkillEffectUP = (Energy / 30)
	
	return SkillEffectUP
end

-- SkillID: 554, Killing Blow Mastery - (Fist Master)
function KillingBlow_Master(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
 
	return OutDamage
end

-- SkillID: 555, Beast Uppercut Mastery - (Fist Master)
function BeastUppercut_Master(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
 
	return OutDamage
end

-- SkillID: 558, Chain Drive Mastery - (Fist Master)
function ChainDrive_Master(InDamage, Vitality)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0
 
	return OutDamage
end

-- SkillID: 563, Dark Side Strengthener - (Fist Master)
function RageFighterDarkSideIncDamage_Master(InDamage, Dexterity, Energy)
	local OutDamage = (Dexterity / 8 + InDamage + Energy / 10) * (Dexterity / 8 + Energy / 10 + 100) / 100.0
 
	return OutDamage
end

-- SkillID: 560: Dragon Roar Mastery - (Fist Master)
function DragonRoar_Master(InDamage, Energy)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0
 
	return OutDamage
end

-- SkillID: 564, Dragon Slasher Strengthener - (Fist Master)
function DragonSlasher_Level1(InDamage, SkillBonus, Energy, TargetType)
	local OutDamage = 0
 
	if (TargetType == 1) then -- User
 		OutDamage = (InDamage + SkillBonus) * (Energy / 10 + 50) / 100.0
 	else -- Monster
 		OutDamage = ((InDamage + SkillBonus) * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
 	end
 
	return OutDamage
end

-- SkillID: 565, Blood Howling - (Fist Master)
function BloodHowl_Level1(TargetHP)
 	local SkillEffect = 200 -- TargetHP * 5 / 100
 	local SkillSuccessRate = 10 -- 1
 	local SkillTime = 10

 	return SkillEffect, SkillSuccessRate, SkillTime
end

-- SkillID: 567, Blood Howling Strengthener - (Fist Master)
function BloodHowl_Level2(TargetHP)
 	local SkillEffect = 200 -- TargetHP * 5 / 100
 	local SkillSuccessRate = 10 -- 1
 	local SkillTime = 10

 	return SkillEffect, SkillSuccessRate, SkillTime
end

-- SkillID: 573, Stamina Increase Strengthener - (Fist Master)
function FighterIncLifeCalcEffect_Level1(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0;
	local SkillTime = Energy / 5 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 569, Def SuccessRate Increase PowUp - (Fist Master)
function FighterIncDefRateCalcEffect_Level1(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0;
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 100) then
		SkillEffect = 100
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 572, DefSuccessRate Increase Mastery - (Fist Master)
function FighterIncDefRateCalcEffect_Level2(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0;
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 100) then
		SkillEffect = 100
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 631, 813, Rush
function RushCalc_Master(Class, SkillId, InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 0
	
	if (Class == CLASS_KNIGHT and SkillId == 813) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	elseif (Class == CLASS_SLAYER and SkillId == 631) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	end
	
	return OutDamage
end

-- SkillID: 652, Evasion
function EvasionCalc_Master(NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local SkillEffect = 50
	local SkillTime = 7
	
	return SkillEffect, SkillTime
end

-- SkillID: 687, Spin Step PowUp - (Mirage Lancer)
function GrowLancerSpinStep_Level1(InDamage, Dexterity, SkillTreeBonus)
	local OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 690, Spin Step Mastery - (Mirage Lancer)
function GrowLancerSpinStep_Level2(InDamage, Dexterity, SkillTreeBonus)
	local OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 688, Harsh Strike PowUp - (Mirage Lancer)
function GrowLancerHarshStrike_Level1(InDamage, Strength, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 691, Harsh Strike Mastery - (Mirage Lancer)
function GrowLancerHarshStrike_Level2(InDamage, Strength, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif(BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 692, Magic Pin PowUp - (Mirage Lancer)
function GrowLancerMagicPin_Level1(InDamage, Dexterity, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 695, Magic Pin Master - (Mirage Lancer)
function GrowLancerMagicPin_Level2(InDamage, Dexterity, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 696, Breche PowUp - (Mirage Lancer)
function GrowLancerBreche_Level1(InDamage, Strength, SkillTreeBonus)
	local OutDamage = (InDamage * 0.5) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 698, Breche Mastery - (Mirage Lancer)
function GrowLancerBreche_Level2(InDamage, Strength, SkillTreeBonus)
	local OutDamage = (InDamage * 0.5) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 688, Shining Peak PowUp - (Mirage Lancer)
function GrowLancerShiningPeak_Level1(InDamage, Strength, Dexterity, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local OutDamage = InDamage * (((Strength / 10 + 97 + SkillTreeBonus_Retailation) + (Dexterity / 10 + 97 + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 708, Wrath PowUp - (Mirage Lancer)
function GrowLancerWrath_Level1(Strength, Dexterity, Energy)
	local SkillIncDamage = 50
	local SkillDecDefense = 30
	local SkillTime = 15

	return SkillIncDamage, SkillDecDefense, SkillTime
end

-- SkillID: 709, Wrath Proficiency - (Mirage Lancer)
function GrowLancerWrath_Level2(Strength, Dexterity, Energy)
	local SkillIncDamage = 50
	local SkillDecDefense = 30
	local SkillTime = 15

	return SkillIncDamage, SkillDecDefense, SkillTime
end

-- SkillID: 710, Wrath Mastery - (Mirage Lancer)
function GrowLancerWrath_Level3(Strength, Dexterity, Energy)
	local SkillIncDamage = 50
	local SkillDecDefense = 30
	local SkillTime = 15

	return SkillIncDamage, SkillDecDefense, SkillTime
end

-- SkillID: 693, Obsidian PowUp - (Mirage Lancer)
function GrowLancerObsidian_Level1(Index, TargetIndex, TargetClass, Strength, Dexterity, Energy)
	local SkillEffect = Strength / 20
	local SkillTime = 120

	return SkillEffect, SkillTime
end

-- SkillID: 744, Phoenix Shot Strengthener - (Fist Master)
function RageFighterPhoenixShot_Level1(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0
 
	return OutDamage
end

-- SkillID: 745, Phoenix Shot Mastery - (Fist Master)
function RageFighterPhoenixShot_Level2(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0
 
	return OutDamage
end

-- SkillID: 765, Burst Strengthener - (Grand Rune Master)
function RuneWizardBurstCalc_Level1(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 766, Burst Mastery - (Grand Rune Master)
function RuneWizardBurstCalc_Level2(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 768, Haste Strengthener - (Grand Rune Master)
function RuneWizardHasteCalc_Level1(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect1 = Energy / 100
	local SkillEffect2 = Energy / 30
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 769, Haste Mastery - (Grand Rune Master)
function RuneWizardHasteCalc_Level2(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect1 = Energy / 100
	local SkillEffect2 = Energy / 30
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 748, Magic Arrow Enhancement - (Grand Rune Master)
function RuneWizardMagicArrowCalcDamage_Level1(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 750, Plasma Ball Strengthening - (Grand Rune Master)
function RuneWizardPlasmaBallCalcDamage_Level1(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 749, Magic Arrow Mastery - (Grand Rune Master)
function RuneWizardMagicArrowCalcDamage_Level2(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 751, Plasma Ball Mastery - (Grand Rune Master)
function RuneWizardPlasmaBallCalcDamage_Level2(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 380: Expansion of Wizardry Power Up - (Dark Wizard, Soul Master, Grand Master, Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function WizardExpansionWizardryCalc_Level1(Class, Energy, MagicDamageMax, SkillTreeValue)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 383: Expansion of Wizardry Mastery - (Dark Wizard, Soul Master, Grand Master, Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function WizardExpansionWizardryCalc_Level2(Class, Energy, MagicDamageMax, SkillTreeValue)
	local SkillEffect1 = Energy / 9 * 0.20
	local SkillEffect2 = MagicDamageMax / 100.0 * SkillTreeValue
	local SkillTime = 1800

	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 781, Bat Flock Strenghtener - (Damage over time) - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function BatFlock_MasterLevel1_DotDamage(InDamage, Strength, Energy)
	local Damage = InDamage
	local DotDamage = InDamage / 10
	local Time = 3
	
	return Damage, DotDamage, Time
end

-- SkillID: 782, Bat Flock Mastery - (Damage over time) - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function BatFlock_MasterLevel2_DotDamage(InDamage, Strength, Energy)
	local Damage = InDamage
	local DotDamage = (InDamage / 10)
	local Time = 3
	
	return Damage, DotDamage, Time
end

-- SkillID: 781, Bat Flock Strenghtener - (Damage) - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerBatFlock_MasterLevel1_Calc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.5
	
	return OutDamage
end

-- SkillID: 782, Bat Flock Mastery - (Damage) - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerBatFlock_MasterLevel2_Calc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.5
	
	return OutDamage
end

-- SkillID: 779, Sword Inertia Strengthener - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerSwordInertia_MasterLevel1_Calc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.16
	
	return OutDamage
end

-- SkillID: 780, Sword Inertia Mastery - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerSwordInertia_MasterLevel2_Calc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.16
	
	return OutDamage
end

-- SkillID: 787, Demolish Strengthener - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerDemolish_MasterLevel1_Calc(Strength, Dexterity, Vitality, Energy, SkillTreeValue)
	local SkillEffect = ((Strength / 8) + (Dexterity / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03 + SkillTreeValue
	
	return SkillEffect, SkillTime
end

-- SkillID: 788, Demolish Mastery - (Slayer, Royal Slayer, Master Slayer, Slaughterer)
function SlayerDemolish_MasterLevel2_Calc(Strength, Dexterity, Vitality, Energy, SkillTreeValue)
	local SkillEffect = ((Strength / 8) + (Dexterity / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03 + SkillTreeValue
	
	return SkillEffect, SkillTime
end

-- SkillID: 802, Sword's Fury Mastery
function KnightSwordAngerCalc_MasterLevel2(Strength, Dexterity, Vitality, Energy, SkillTreeValue)
	local BaseAddRange = 1
	local SkillTime = -10
	
	local SkillAddRange = BaseAddRange + SkillTreeValue
	
	return SkillAddRange, SkillTime
end

-- SkillID: 803, Solid Protection Strengthener (1)
function KnightSolidProtection_MasterLevel1 (NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180
	
	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 804, Solid Protection Strengthener (2)
function KnightSolidProtection_MasterLevel2 (NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180
	
	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 806, Solid Protection Mastery
function KnightSolidProtection_MasterLevel3 (NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180
	
	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 807, Strike of Destruction Strenghtener - (Blade Master)
function StrikeOfDestructionCalc_MasterLevel1_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	end

	return OutDamage
end

-- SkillID: 809, Strike of Destruction Mastery - (Blade Master)
function StrikeOfDestructionCalc_MasterLevel2_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * (Energy / 10 + 200) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * (Energy / 10 + 200) + SkillTreeValue) / 100
	end

	return OutDamage
end

-- SkillID: 810, Strong Belief Strengthener
function KnightStrongBelief_MasterLevel1(NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local Duration = (NormalLevel + MasterLevel) / 4 + 20
	return Duration
end

-- SkillID: 811, Tornado Cutting Strengthener
function TorandoCuttingCalc_Level1(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage * (Energy / 10 + 200) / 100
	
	return OutDamage
end

-- SkillID: 820, Dark Plasma Strenghtener - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDarkPlasma_Level1(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 0
	OutDamage = InDamage * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	
	return OutDamage
end

-- SkillID: 821, Dark Plasma Proficiency - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDarkPlasma_Level2(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 0
	OutDamage = InDamage * ((Energy / 8) + (Dexterity / 28) + 120) / 100

	return OutDamage
end

-- SkillID: 822, Dark Plasma Mastery - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDarkPlasma_Level3(InDamage, Strength, Dexterity, Vitality, Energy, SkillTreeValue)
	local OutDamage = 0
	OutDamage = InDamage * (((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100

	return OutDamage
end

-- SkillID: 823, Ice Break Strenghtener - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherIceBreak_MasterLevel1_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 3) then
		OutDamage = ((InDamage * 1.2) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end

-- SkillID: 824, Ice Break Mastery - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherIceBreak_MasterLevel2_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 3) then
		OutDamage = ((InDamage * 1.2) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end

-- SkillID: 825, Death Fire Strenghtener - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDeathFire_MasterLevel1_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end

-- SkillID: 826, Death Fire Mastery - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDeathFire_MasterLevel2_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end

-- SkillID: 825, Death Ice Strenghtener - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDeathIce_MasterLevel1_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end

-- SkillID: 826, Death Ice Mastery - (Master Gun Breaker, Heist Gun Crusher)
function GunCrusherDeathIce_MasterLevel2_Calc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount, SkillTreeValue)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) + SkillTreeValue) / 100
	end
	
	return OutDamage
end