-- // ============================================================
-- // == INTERNATIONAL GAMING CENTER NETWORK
-- // == www.igcn.mu
-- // == (C) 2019 IGC-Network (R)
-- // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- // == File is a part of IGCN Group MuOnline Server files.
-- // ============================================================

-- RegularSkillCalc Control Script, Lua v5.2
-- Skill Configuration (Result, Time) - Can be modified to adjust for own needs

-- SkillID refers to Index of skill in \Data\Skills\SkillList.txt
-- BuffID refers to \Data\BuffEffectManager.cfg

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
CLASS_SLAYER									 	  = 9

-- SkillID: 16, Soul Barrier - (Dark Wizard, Soul Master, Grand Master)
function WizardMagicDefense(Index, TargetIndex, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if(Index == TargetIndex and SkillEffect > 50) then -- casting spell on yourself
		SkillEffect = 50
	elseif (Index ~= TargetIndex and SkillEffect > 50)  then -- casting spell on others
		SkillEffect = 50
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 40, Nova - (Dark Wizard, Soul Master, Grand Master)
function Wizard_NovaSkillCalc(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 724, Meteor Strike - (Dark Wizard, Soul Master, Grand Master)
function WizardMeteorStrikeCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 725, Meteor Storm - (Dark Wizard, Soul Master, Grand Master)
function WizardMeteorStormCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 726, Soul Seeker - (Dark Wizard, Soul Master, Grand Master)
function WizardSoulSeekerCalcDamage(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 19, 20, 21, 22, 23, 41, 42, 43, 44, 49, 55, 57, Falling Slash, Lunge, Uppercut,
-- Cyclone, Slash, Twisting Slash, Rageful Blow, Death Stab,Crescent Moon Slash, Fire Breath,
-- Fire Slash, Spiral Slash - (Dark Knight, Blade Knight, Blade Master, Magic Gladiator, Duel Master)
function Knight_Gladiator_CalcSkillBonus(SkillID, Class, InDamage, Strength, Energy)	
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	end
		
	return OutDamage
end

-- SkillID: 48, Swell Life - (Dark Knight, Blade Knight, Blade Master)
function KnightSkillAddLife(Vitality, Energy, PartyBonus)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 232, Strike of Destruction -(Dark Knight, Blade Knight, Blade Master)
function StrikeOfDestructionCalc(InDamage, Energy)
	local OutDamage = InDamage * (Energy /10 + 200) / 100;
	
	return OutDamage
end

-- SkillID: 723, Fireblow - (Blade Knight)
function KnightFireBlowCalcDamage(InDamage, Energy)
	local OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;

	return OutDamage
end

-- SkillID: X, Combo Skill - (Dark Knight, Blade Knight, Blade Master)
function ComboSkillDamage(Strength, Dexterity, Vitality, Energy, InDamage)
 local Damage = (Strength * 1.5) + Dexterity + Energy
 local OutDamage = InDamage
 return Damage, OutDamage
end

-- SkillID: 731, Ice Blood - (Blade Master)
function GladiatorIceBloodCalcDamageAndDot(InDamage, Energy)
	local OutDamage = InDamage * 2
	local SuccessRate = 6
	local DebuffTime = 10
	
	return OutDamage, SuccessRate, DebuffTime
end

-- SkillID: 732, Fire Blood - (Blade Master)
function GladiatorFireBloodCalcDamageAndDot(InDamage, Strength, Energy)
	local OutDamage = InDamage * 2
	local SuccessRate = 6
	local DebuffDamage = Strength / 10
	local DebuffTime = 10
	
	return OutDamage, SuccessRate, DebuffDamage, DebuffTime
end

-- SkillID: 733, Dark Blast - (Blade Master)
function GladiatorDarkBlastCalcDamage(InDamage, Strength, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 46, 51, 52, Starfall, Ice Arrow, Penetration - (Fairy Elf, Muse Elf, High Elf)
function Elf_CalcSkillBonus(SkillID, InDamage, Dexterity, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 24, Triple-Shot - (Fairy Elf, Muse Elf, High Elf)
function Elf_CalcTripleShot(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 26, Heal - (Fairy Elf, Muse Elf, High Elf)
function ElfHeal(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	
	-- LogAdd(string.format('Class %d Index %d Target %d Ene %d', Class, Index, TargetIndex, Energy))
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		end
	elseif (Index == TargetIndex) then
		SkillEffect = Energy / 5 + 5
	end
	
	return SkillEffect
end

-- SkillID: 28, Greater Damage - (Fairy Elf, Muse Elf, High Elf)
function ElfAttack(Class, Index, TargetIndex, Energy)
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
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 7
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 27, Greater Defense - (Fairy Elf, Muse Elf, High Elf)
function ElfDefense(Class, Index, TargetIndex, Energy)
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
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 8
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 234, Recovery - (Fairy Elf, Muse Elf, High Elf)
function ElfShieldRecovery(Energy, PlayerLevel)
 local SkillEffect = Energy / 4 + PlayerLevel
 
 return SkillEffect
end

-- SkillID: 235, Multi-Shot - (Fairy Elf, Muse Elf, High Elf)
function MultiShotCalc(InDamage, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 727, Focus Shot - (Fairy Elf, Muse Elf, High Elf)
function ElfFocusShotCalcDamage(InDamage, Strength, Dexterity, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 47, Impale -(Magic Gladiator, Duel Master, Dark Lord, Lord Emperor)
function ImpaleSkillCalc(Class, InDamage, Energy)
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = ( InDamage * ( Energy / 10 + 200 )  ) / 100;
	end
		
	return OutDamage
end

-- SkillID: 55, Fire Slash - (Magic Gladiator, Duel Master)
function GladiatorFireSlash(InDamage, Strength, Energy, BarrageCount)
    local OutDamage = 0
    
    if (BarrageCount == 0) then
        OutDamage = (InDamage * 0.15) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 1) then
        OutDamage = (InDamage * 0.18) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 2) then
        OutDamage = (InDamage * 0.22) * ( 200 + ( Energy / 10 ) ) / 100;
    elseif (BarrageCount == 3) then
        OutDamage = (InDamage * 0.25) * ( 200 + ( Energy / 10 ) ) / 100;
    end
    return OutDamage
end

-- SkillID: 56, Power Slash - (Magic Gladiator, Duel Master)
function GladiatorPowerSlash(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 236, Flame Strike - (Magic Gladiator, Duel Master)
function FlameStrikeCalc(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 237, Gigantic Storm - (Magic Gladiator, Duel Master)
function GiganticStormCalc(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 724, Meteor Strike - (Magic Gladiator, Duel Master)
function GladiatorMeteorStrikeCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 60 ,61, 62, 65, 74, 78, Force, Fire Burst, Earthshake, Electric Spike, Fire Blast, Fire Scream - (Dark Lord, Lord Emperor)
function Lord_CalcSkillBonus(SkillID, InDamage, Strength, Energy, Command)
	local OutDamage = ( InDamage * ( ( Energy / 20 + 200 ) ) ) / 100;
	
	return OutDamage
end

-- SkillID: 64, Increase Critical Damage - (Dark Lord, Lord Emperor)
function DarkLordCriticalDamage(Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 238, Chaotic Diseier - (Dark Lord, Lord Emperor)
function ChaoticDiseierCalc(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 25 + 200) / 100
	
	return OutDamage
end

-- SkillID: 737, Wind Soul - (Lord Emperor)
function LordWindSoulCalcDamage(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 25 + 200) / 100
	
	return OutDamage
end

-- SkillID: 214, Drain Life - PVP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDrainLife_PvP(Energy, Damage)
	local AddHP = Energy / 23 + (10 * Damage / 100)
	
	return AddHP
end

-- SkillID: 214, Drain Life - MvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDrainLife_Monster(Energy, MonsterLevel)
	local AddHP = (Energy / 15) + (MonsterLevel / 2.5)
	
	return AddHP
end

-- SkillID: 215, Chain Lighting - (Summoner, Bloody Summoner, Dimension Master)
function ChainLightningCalc(InDamage, TargetNumber)
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

-- SkillID: 217, Damage Reflection - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDamageReflect(Energy)
	local Reflect = 30 + (Energy / 42)
	local Time = 30 + (Energy / 25)
	
	if (Reflect > 25) then
		Reflect = 25
	end
	
	return Reflect, Time
end

-- SkillID: 218, Berserker - (Summoner, Bloody Summoner, Dimension Master)
function SummonerBerserker(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	local SkillTime = -10
	
	return SkillEffectUP, SkillEffectDOWN, SkillTime
end

-- SkillID: 218, Berserker - Magic Damage - (Summoner, Bloody Summoner, Dimension Master)
function SummonerBerserkerMagicDamage(Energy, Effect)
	local MagicMin = (Energy / 9) * Effect / 100
	local MagicMax = (Energy / 4) * Effect / 100
	
	return MagicMin, MagicMax
end

-- SkillID: 289, Darkness - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDarkness(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	
	return SkillEffectUP, SkillEffectDOWN
end

-- SkillID: 289, Darkness - Curse Damage - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDarknessCurseDamage(Energy, Effect)
	local CurseMin = ((Energy / 9) + 0.015) * Effect / 100
	local CurseMax = ((Energy / 4) + 0.015) * Effect / 100
	
	return CurseMin, CurseMax
end

-- SkillID: 219, Sleep - MvP - (Summoner, Bloody Summoner, Dimension Master)
function Sleep_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 30 + Curse / 6 + 20
	local SkillTime = Energy / 100 + 5 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 219, Sleep - PvP - (Summoner, Bloody Summoner, Dimension Master)
function Sleep_PvP(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate = Energy / 37 + Curse / 6 + 15
	local SkillTime = Energy / 250 + (PlayerLevel - TargetLevel) / 100 + 4
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 221, Weakness - MvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerWeakness_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 58 + 4
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 221, Weakness - PvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerWeakness_PvP(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 93 + 3
	local SkillTime = Energy / 300 + (PlayerLevel - TargetLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - MvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerInnovation_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 90 + 20
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - PvP - (Summoner, Bloody Summoner, Dimension Master)
function SummonerInnovation_PvP(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 110 + 12
	local SkillTime = Energy / 300 + (PlayerLevel - TargetLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 223, Explosion - Damage over time - (Summoner, Bloody Summoner, Dimension Master)
function ExplosionDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 224, Requiem - Damage over time - (Summoner, Bloody Summoner, Dimension Master)
function RequiemDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 230, Lightning Shock - (Summoner, Bloody Summoner, Dimension Master)
function SummonerLightningShock(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 729, Fire Beast - (Dimension Master)
function SummonerFireBeastCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 730, Aqua Beast - (Dimension Master)
function SummonerAquaBeastCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 260, Killing Blow - (Rage Fighter, Fist Master)
function RageFighterKillingBlow(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 261, Beast Uppercut - (Rage Fighter, Fist Master)
function RageFighterBeastUppercut(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 262, Chain Drive - (Rage Fighter, Fist Master)
function RageFighterChainDrive(InDamage, Vitality)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 263, Dark Side - (Rage Fighter, Fist Master)
function RageFighterDarkSideIncDamage(InDamage, Dexterity, Energy)
 local OutDamage = (Dexterity / 8 + InDamage + Energy / 10) * (Dexterity / 8 + Energy / 10 + 100) / 100.0
 
 return OutDamage
end

-- SkillID: 264, Dragon Roar - (Rage Fighter, Fist Master)
function RageFighterDragonRoar(InDamage, Energy)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 265, Dragon Slasher - (Rage Fighter, Fist Master)
function RageFighterDragonSlasher(InDamage, Energy, TargetType)
	local OutDamage = 0
	
	if (TargetType == 1) then -- Player
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	else -- Monster
		OutDamage = (InDamage * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
	end
	
	return OutDamage
end

-- SkillID: 265, 564 - Dragon Slasher - SD Reduction - (Rage Fighter, Fist Master)
function DragonSlasher_DecreaseVictimSD(SkillID, Strength, Energy)
	local SuccessRate = 0
	local DecreasePercent = 0
	
	SuccessRate = Energy / 100 + 10
	DecreasePercent = Energy / 30 + 10
	
	if (SuccessRate > 100) then
		SuccessRate = 100
	end
	
	if (DecreasePercent > 100) then
		DecreasePercent = 100
	end
	
	return SuccessRate, DecreasePercent
end
-- SkillID: 266, Ignore Defense - (Rage Fighter, Fist Master)
function FighterIgnoreEnemyDefCalcEffect(Energy)
	local SkillEffect = (Energy - 404) / 100 + 3.0
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 10) then
		SkillEffect = 10
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 267, Increase Health - (Rage Fighter, Fist Master)
function FighterIncLifeCalcEffect(Energy)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0;
	local SkillTime = Energy / 5 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 268, Increase Block - (Rage Fighter, Fist Master)
function FighterIncDefRateCalcEffect(Energy)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0;
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 100) then
		SkillEffect = 100
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 269, Charge - (Rage Fighter, Fist Master)
function RageFighterCharge(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 270, Phoenix Shot - (Rage Fighter, Fist Master)
function RageFighterPhoenixShot(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0
 
	return OutDamage
end

-- SkillID: 282, Spirit Hook - (Fist Master)
function RageFighterSpiritHook(InDamage, Vitality)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end											


-- SkillID: 18, Defense - (Shields Skill)
function ShieldSkill_DecreaseVictimDamage(InDamage)
 local OutDamage = InDamage / 2
 
 return OutDamage
end

-- SkillID: 76, Plasma Storm - (Fenrir Pets)
function FenrirSkillCalc(InDamage, PlayerLevel, PlayerMasterLevel)
	local DamageInc = PlayerLevel - 300 + PlayerMasterLevel
	
	if (DamageInc < 0) then
		DamageInc = 0
	end
	
	DamageInc = DamageInc / 5
	
	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100;
	
	return OutDamage
end

-- SkillID: 271, Spin Step - (Grow Lancer, Mirage Lancer)
function GrowLancerSpinStep(InDamage, Dexterity, SkillTreeBonus)
	local OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 276, Harsh Strike - (Grow Lancer, Mirage Lancer)
function GrowLancerHarshStrike(InDamage, Strength, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 274, Magic Pin - (Grow Lancer, Mirage Lancer)
function GrowLancerMagicPin(InDamage, Dexterity, SkillTreeBonus, BarrageCount)
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

-- SkillID: 279, Breche - (Grow Lancer, Mirage Lancer)
function GrowLancerBreche(InDamage, Strength, SkillTreeBonus)
	local OutDamage = (InDamage * 0.5) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 277, Shining Peak - (Grow Lancer, Mirage Lancer)
function GrowLancerShiningPeak(InDamage, Strength, Dexterity, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local OutDamage = InDamage * (((Strength / 10 + 97 + SkillTreeBonus_Retailation) + (Dexterity / 10 + 97 + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 278, Wrath - (Grow Lancer, Mirage Lancer)
function GrowLancerWrath(Strength, Dexterity, Energy)
	local SkillIncDamage = 50
	local SkillDecDefense = 30
	local SkillTime = 15

	return SkillIncDamage, SkillDecDefense, SkillTime
end

-- SkillID: 273, Obsidian - (Grow Lancer, Mirage Lancer)
function GrowLancerObsidian(Strength, Dexterity, Energy)
	local SkillEffect = Strength / 20
	local SkillTime = 120

	return SkillEffect, SkillTime
end

-- SkillID: X, Hemorrhage - (BuffEffectManager.xml -> Index: 239)
function BleedingBuffCalcSuccessAndTime(CharacterLevel)
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate, Duration
end

-- SkillID: X, Paralysis - (BuffEffectManager.xml -> Index: 240)
function ParalyzingBuffCalcSuccess(CharacterLevel)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end	

	return SuccessRate
end

-- SkillID: X, Bondage - (BuffEffectManager.xml -> Index: 241)
function BindingBuffCalcSuccess(CharacterLevel)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end	

	return SuccessRate
end

-- SkillID: X, Blindness - (BuffEffectManager.xml -> Index: 242)
function BlindingBuffCalcSuccessAndTime(CharacterLevel)
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end
	
	return SuccessRate, Duration
end

-- SkillID: 739, Dark Phoenix Shot - (Rage Fighter, Fist Master)
function FighterDarkPhoenixShotCalcDamage(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Dexterity / 10 + 50) / 100.0
 
	return OutDamage
end


-- SkillID: 283, Magic Arrow - (Rune Wizard, Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function RuneWizardMagicArrowCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 284, Plasma Ball - (Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function RuneWizardPlasmaBallCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 285, Lightning Storm - (Grand Rune Master, Grand Rune Wizard)
function RuneWizardLightningStormCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 286, Burst - (Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function RuneWizardBurstCalc(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 287, Haste - (Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function RuneWizardHasteCalc(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 233: Expansion of Wizardry - (Dark Wizard, Soul Master, Grand Master, Rune Spell Master, Grand Rune Master, Grand Rune Wizard)
function WizardExpansionWizardryCalc(Class, Energy)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 293, Bat Flock - (Damage over time) - (Slayer, Royal Slayer, Master Slayer)
function BatFlock_DotDamage(InDamage, Strength, Energy)
	local Damage = InDamage
	local DotDamage = InDamage / 10
	local Time = 3
	
	return Damage, DotDamage, Time
end

-- SkillID: 293, Bat Flock - (Damage) - (Slayer, Royal Slayer, Master Slayer)
function SlayerBatFlockCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.5
	
	return OutDamage
end

-- SkillID: 294, Pierce Attack - (Slayer, Royal Slayer, Master Slayer)
function SlayerPierceAttackCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	return OutDamage
end

-- SkillID: 292, Sword Inertia - (Slayer, Royal Slayer, Master Slayer)
function SlayerSwordInertiaCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.16
	
	return OutDamage
end

-- SkillID: 297, Demolish - (Slayer, Royal Slayer, Master Slayer)
function SlayerDemolishCalc(Strength, Dexterity, Vitality, Energy)
	local SkillEffect = ((Strength / 8) + (Dexterity / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03
	
	return SkillEffect, SkillTime
end