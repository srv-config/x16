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
CLASS_GUNCRUSHER									  = 10

-- SkillID: 9, Evil Spirit
function EvilSpiritCalc(Class, InDamage, Strength, Dexterity, Vitality, Energy)
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

-- SkillID: 16, Soul Barrier
function WizardMagicDefense(Index, TargetIndex, TargetClass, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if(Index == TargetIndex and SkillEffect > 50) then -- casting spell on yourself
		SkillEffect = 50
	elseif (Index ~= TargetIndex and SkillEffect > 50)  then -- casting spell on others
		SkillEffect = 50
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 40, Nova
function Wizard_NovaSkillCalc(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 42, Anger Blow
function AngerBlow_Calc(Class, InDamage, Strength, Dexterity, Vitality, Energy)
 local OutDamage = 0
 
 	if (Class == CLASS_KNIGHT) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	elseif (Class == CLASS_SLAYER) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	end
 
 return OutDamage
end

-- SkillID: 724, Meteor Strike
function WizardMeteorStrikeCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 725, Meteor Storm
function WizardMeteorStormCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 726, Soul Seeker
function WizardSoulSeekerCalcDamage(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 19, 20, 21, 22, 23, 41, 43, 44, 49, 55, 57, Falling Slash, Lunge, Uppercut,
-- Cyclone, Slash, Twisting Slash, Death Stab, Crescent Moon Slash, Fire Breath,
-- Fire Slash, Spiral Slash
function Knight_Gladiator_CalcSkillBonus(SkillID, Class, InDamage, Strength, Energy)	
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	end
		
	return OutDamage
end

-- SkillID: 48, Swell Life
function KnightSkillAddLife(Index, TargetIndex, TargetClass, Vitality, Energy, PartyBonus)
	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 232, Strike of Destruction
function StrikeOfDestructionCalc(InDamage, Energy)
	local OutDamage = InDamage * (Energy /10 + 200) / 100;
	
	return OutDamage
end

-- SkillID: 723, Fireblow - (Blade Knight)
function KnightFireBlowCalcDamage(InDamage, Energy)
	local OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;

	return OutDamage
end

-- SkillID: X, Combo Skill
function ComboSkillDamage(Strength, Dexterity, Vitality, Energy, InDamage)
 local Damage = (Strength * 1.5) + Dexterity + Energy
 local OutDamage = InDamage
 return Damage, OutDamage
end

-- SkillID: 731, Ice Blood
function GladiatorIceBloodCalcDamageAndDot(InDamage, Energy)
	local OutDamage = InDamage * 2
	local SuccessRate = 6
	local DebuffTime = 10
	
	return OutDamage, SuccessRate, DebuffTime
end

-- SkillID: 732, Fire Blood
function GladiatorFireBloodCalcDamageAndDot(InDamage, Strength, Energy)
	local OutDamage = InDamage * 2
	local SuccessRate = 6
	local DebuffDamage = Strength / 10
	local DebuffTime = 10
	
	return OutDamage, SuccessRate, DebuffDamage, DebuffTime
end

-- SkillID: 733, Dark Blast
function GladiatorDarkBlastCalcDamage(InDamage, Strength, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 46, 51, 52, Starfall, Ice Arrow, Penetration
function Elf_CalcSkillBonus(SkillID, InDamage, Dexterity, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 24, Triple-Shot
function Elf_CalcTripleShot(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 26, Heal
function ElfHeal(TargetClass, Index, TargetIndex, Energy)
	local SkillEffect = 0
	
	-- LogAdd(string.format('TargetClass %d Index %d Target %d Ene %d', TargetClass, Index, TargetIndex, Energy))
	
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

-- SkillID: 28, Greater Damage
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
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 7
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 27, Greater Defense
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
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 8
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 234, Recovery
function ElfShieldRecovery(Energy, PlayerLevel)
 local SkillEffect = Energy / 4 + PlayerLevel
 
 return SkillEffect
end

-- SkillID: 235, Multi-Shot
function MultiShotCalc(InDamage, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 727, Focus Shot
function ElfFocusShotCalcDamage(InDamage, Strength, Dexterity, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 47, Impale
function ImpaleSkillCalc(Class, InDamage, Energy)
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = ( InDamage * ( Energy / 10 + 200 )  ) / 100;
	end
		
	return OutDamage
end

-- SkillID: 55, Fire Slash
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

-- SkillID: 56, Power Slash
function GladiatorPowerSlash(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 236, Flame Strike
function FlameStrikeCalc(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 237, Gigantic Storm
function GiganticStormCalc(InDamage, Strength, Dexterity, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 724, Meteor Strike
function GladiatorMeteorStrikeCalcDamage(InDamage, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 60 ,61, 62, 65, 74, 78, Force, Fire Burst, Earthshake, Electric Spike, Fire Blast, Fire Scream
function Lord_CalcSkillBonus(SkillID, InDamage, Strength, Energy, Command)
	local OutDamage = ( InDamage * ( ( Energy / 20 + 200 ) ) ) / 100;
	
	return OutDamage
end

-- SkillID: 64, Increase Critical Damage
function DarkLordCriticalDamage(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = Command / 25 + Energy / 30
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 238, Chaotic Diseier
function ChaoticDiseierCalc(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 25 + 200) / 100
	
	return OutDamage
end

-- SkillID: 737, Wind Soul - (Lord Emperor)
function LordWindSoulCalcDamage(InDamage, Energy)
	local OutDamage = InDamage * (Energy / 25 + 200) / 100
	
	return OutDamage
end

-- SkillID: 214, Drain Life - PVP
function SummonerDrainLife_PvP(Energy, Damage)
	local AddHP = Energy / 23 + (10 * Damage / 100)
	
	return AddHP
end

-- SkillID: 214, Drain Life - MvP
function SummonerDrainLife_Monster(Energy, MonsterLevel)
	local AddHP = (Energy / 15) + (MonsterLevel / 2.5)
	
	return AddHP
end

-- SkillID: 215, Chain Lighting
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

-- SkillID: 217, Damage Reflection
function SummonerDamageReflect(Index, TargetIndex, TargetClass, Energy)
	local Reflect = 30 + (Energy / 42)
	local Time = 30 + (Energy / 25)
	
	if (Reflect > 25) then
		Reflect = 25
	end
	
	return Reflect, Time
end

-- SkillID: 218, Berserker
function SummonerBerserker(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	local SkillTime = -10
	
	return SkillEffectUP, SkillEffectDOWN, SkillTime
end

-- SkillID: 218, Berserker - Magic Damage
function SummonerBerserkerMagicDamage(Energy, Effect)
	local MagicMin = (Energy / 9) * Effect / 100
	local MagicMax = (Energy / 4) * Effect / 100
	
	return MagicMin, MagicMax
end

-- SkillID: 288, Death Scythe
function DeadScythe_Summoner(InDamage, TargetClass, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	end

	return OutDamage
end

-- SkillID: 289, Darkness
function SummonerDarkness(Energy)
	local SkillEffectUP = (Energy / 30)
	local SkillEffectDOWN = (Energy / 60)
	
	return SkillEffectUP, SkillEffectDOWN
end

-- SkillID: 289, Darkness - Curse Damage
function SummonerDarknessCurseDamage(Energy, Effect)
	local CurseMin = ((Energy / 9) + 0.015) * Effect / 100
	local CurseMax = ((Energy / 4) + 0.015) * Effect / 100
	
	return CurseMin, CurseMax
end

-- SkillID: 219, Sleep - MvP
function Sleep_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 30 + Curse / 6 + 20
	local SkillTime = Energy / 100 + 5 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 219, Sleep - PvP
function Sleep_PvP(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate = Energy / 37 + Curse / 6 + 15
	local SkillTime = Energy / 250 + (PlayerLevel - TargetLevel) / 100 + 4
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 221, Weakness - MvP
function SummonerWeakness_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 58 + 4
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 221, Weakness - PvP
function SummonerWeakness_PvP(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 93 + 3
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - MvP
function SummonerInnovation_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 90 + 20
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - PvP
function SummonerInnovation_PvP(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 110 + 12
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 223, Explosion - Damage over time
function ExplosionDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 224, Requiem - Damage over time
function RequiemDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 230, Lightning Shock
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

-- SkillID: 260, Killing Blow
function RageFighterKillingBlow(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 261, Beast Uppercut
function RageFighterBeastUppercut(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 262, Chain Drive
function RageFighterChainDrive(InDamage, Vitality)
	local OutDamage = (InDamage + Vitality / 10) * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 263, Dark Side
function RageFighterDarkSideIncDamage(InDamage, Dexterity, Energy)
 local OutDamage = (Dexterity / 8 + InDamage + Energy / 10) * (Dexterity / 8 + Energy / 10 + 100) / 100.0
 
 return OutDamage
end

-- SkillID: 264, Dragon Roar
function RageFighterDragonRoar(InDamage, Energy)
	local OutDamage = (InDamage + Energy / 10) * (Energy / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 265, Dragon Slasher
function RageFighterDragonSlasher(InDamage, Energy, TargetType)
	local OutDamage = 0
	
	if (TargetType == 1) then -- Player
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	else -- Monster
		OutDamage = (InDamage * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
	end
	
	return OutDamage
end

-- SkillID: 265, 564 - Dragon Slasher - SD Reduction
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
-- SkillID: 266, Ignore Defense
function FighterIgnoreEnemyDefCalcEffect(Energy)
	local SkillEffect = (Energy - 404) / 100 + 3.0
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 10) then
		SkillEffect = 10
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 267, Increase Health
function FighterIncLifeCalcEffect(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0;
	local SkillTime = Energy / 5 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 268, Increase Block
function FighterIncDefRateCalcEffect(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0;
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 100) then
		SkillEffect = 100
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 269, Charge
function RageFighterCharge(InDamage, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 270, Phoenix Shot
function RageFighterPhoenixShot(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Vitality / 10 + 200) / 100.0
 
	return OutDamage
end

-- SkillID: 282, Spirit Hook
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

-- SkillID: 271, Spin Step
function GrowLancerSpinStep(InDamage, Dexterity, SkillTreeBonus)
	local OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	local ExplosionDamage = (InDamage * 0.7) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage, ExplosionDamage
end

-- SkillID: 276, Harsh Strike
function GrowLancerHarshStrike(InDamage, Strength, SkillTreeBonus, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 274, Magic Pin
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

-- SkillID: 279, Breche
function GrowLancerBreche(InDamage, Strength, SkillTreeBonus)
	local OutDamage = (InDamage * 0.5) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0

	return OutDamage
end

-- SkillID: 277, Shining Peak
function GrowLancerShiningPeak(InDamage, Strength, Dexterity, SkillTreeBonus_Retailation, SkillTreeBonus_Rage)
	local OutDamage = InDamage * (((Strength / 10 + 97 + SkillTreeBonus_Retailation) + (Dexterity / 10 + 97 + SkillTreeBonus_Rage)) * 0.8) / 100.0
	OutDamage = OutDamage / 3

	return OutDamage
end

-- SkillID: 278, Wrath
function GrowLancerWrath(Strength, Dexterity, Energy)
	local SkillIncDamage = 50
	local SkillDecDefense = 30
	local SkillTime = 15

	return SkillIncDamage, SkillDecDefense, SkillTime
end

-- SkillID: 273, Obsidian
function GrowLancerObsidian(Index, TargetIndex, TargetClass, Strength, Dexterity, Energy)
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

-- SkillID: 739, Dark Phoenix Shot
function FighterDarkPhoenixShotCalcDamage(InDamage, Dexterity, Vitality)
	local OutDamage = InDamage * (Dexterity / 10 + 50) / 100.0
 
	return OutDamage
end


-- SkillID: 283, Magic Arrow
function RuneWizardMagicArrowCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 284, Plasma Ball
function RuneWizardPlasmaBallCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 285, Lightning Storm
function RuneWizardLightningStormCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 286, Burst
function RuneWizardBurstCalc(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 287, Haste
function RuneWizardHasteCalc(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect1 = Energy / 100
	local SkillEffect2 = Energy / 30
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 233: Expansion of Wizardry
function WizardExpansionWizardryCalc(Class, Energy)
	local SkillEffect = Energy / 9 * 0.20
	local SkillTime = 1800

	return SkillEffect, SkillTime
end

-- SkillID: 293, Bat Flock - (Damage over time)
function BatFlock_DotDamage(InDamage, Strength, Energy)
	local Damage = InDamage
	local DotDamage = InDamage / 10
	local Time = 3
	
	return Damage, DotDamage, Time
end

-- SkillID: 293, Bat Flock - (Damage)
function SlayerBatFlockCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.5
	
	return OutDamage
end

-- SkillID: 294, Pierce Attack
function SlayerPierceAttackCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	return OutDamage
end

-- SkillID: 292, Sword Inertia
function SlayerSwordInertiaCalc(InDamage, Strength, Dexterity)
	local OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	OutDamage = OutDamage * 0.16
	
	return OutDamage
end

-- SkillID: 297, Demolish
function SlayerDemolishCalc(Strength, Dexterity, Vitality, Energy)
	local SkillEffect = ((Strength / 8) + (Dexterity / 28) + 120)
	local SkillTime = 60
	SkillEffect = SkillEffect * 0.03
	
	return SkillEffect, SkillTime
end

-- SkillID: 1500, Sword's Fury
function KnightSwordAngerCalc(Strength, Dexterity, Vitality, Energy)
	local SkillAddRange = 1
	local SkillTime = -10
	
	return SkillAddRange, SkillTime
end

-- SkillID: 1501, Sword Blow
function SwordBlow_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * (Energy / 10 + 200) / 100
	end

	return OutDamage
end

-- SkillID: 1502, Strong Belief
function KnightStrongBelief(NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local Duration = (NormalLevel + MasterLevel) / 4 + 20
	return Duration
end

-- SkillID: 1503, Solid Protection
function KnightSolidProtection (NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local AbsorbHP = 2.21
	local ConvertDamage = 2.21
	local IncAtkPower = 2.21
	local Duration = 180

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 2001, Dark Plasma
function GunCrusherDarkPlasmaCalc(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 0
	OutDamage = InDamage * ((Energy / 8) + (Dexterity / 28) + 120) / 100

	return OutDamage
end

-- SkillID: 2002, Ice Break
function GunCrusherIceBreakCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.2) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	end
	
	return OutDamage
end

-- SkillID: 2004, Death Fire
function GunCrusherDeathFireCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	end
	
	return OutDamage
end

-- SkillID: 2003, Ice Blast
function GunCrusherIceBlastCalc(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 0
	OutDamage = InDamage * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	
	return OutDamage
end

-- SkillID: 2005, Bursting Flare
function GunCrusherBurstingFlareCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 0) then -- Shockwave
		OutDamage = (InDamage * 1.2) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	end
	
	return OutDamage
end

-- SkillID: 2006, Death Ice
function GunCrusherDeathIceCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 8) + (Dexterity / 28) + 120) / 100
	end
	
	return OutDamage
end
