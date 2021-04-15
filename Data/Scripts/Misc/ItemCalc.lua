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


function MakeItemID(ItemType, ItemIndex)
	return ItemType * 512 + ItemIndex;
end

function Wings_CalcAbsorb(WingID, WingLevel, MLS_WingOption)
	local OutAbsorb = 0
	
	if ( (WingID >= MakeItemID(12,3) and WingID <= MakeItemID(12,6)) or (WingID >= MakeItemID(12,422) and WingID <= MakeItemID(12,425)) or WingID == MakeItemID(12,42) or WingID == MakeItemID(12,427)) then
		OutAbsorb = 25 + (WingLevel * 2)
	elseif (WingID == MakeItemID(12,49) or WingID == MakeItemID(12,428)) then
		OutAbsorb = 10 + (WingLevel * 2)
	elseif (WingID == MakeItemID(13,30) or WingID == MakeItemID(12,426)) then
		OutAbsorb = 10 + WingLevel
	elseif ( (WingID >= MakeItemID(12,36) and WingID <= MakeItemID(12,39)) or (WingID >= MakeItemID(12,430) and WingID <= MakeItemID(12,433)) or WingID == MakeItemID(12,43) or WingID == MakeItemID(12,50) or WingID == MakeItemID(12,435) or WingID == MakeItemID(12,436)) then
		OutAbsorb = 39 + (WingLevel * 2) + MLS_WingOption
	elseif (WingID == MakeItemID(12,40) or WingID == MakeItemID(12,434)) then
		OutAbsorb = 24 + (WingLevel * 2) + MLS_WingOption
	elseif (WingID == MakeItemID(12,264) or WingID == MakeItemID(12,265) or WingID == MakeItemID(12,281) or WingID == MakeItemID(12,282)) then
		OutAbsorb = 29 + (WingLevel * 2)
	elseif (WingID == MakeItemID(12,262) or WingID == MakeItemID(12,279)) then
		OutAbsorb = 13 + (WingLevel * 2)
	elseif (WingID == MakeItemID(12,263) or WingID == MakeItemID(12,280)) then
		OutAbsorb = 30 + (WingLevel * 2)
	elseif (WingID == MakeItemID(12,266)) then
		OutAbsorb = 71 + WingLevel
	elseif (WingID == MakeItemID(12,267)) then
		OutAbsorb = 60 + WingLevel
	elseif (WingID == MakeItemID(12,268)) then
		OutAbsorb = 39 + (WingLevel * 2)
	elseif (WingID == MakeItemID(12,269) or WingID == MakeItemID(12,429)) then
		OutAbsorb = (WingLevel * 2) + 10
	elseif (WingID == MakeItemID(12,270) or WingID == MakeItemID(12,437)) then
		OutAbsorb = (WingLevel * 2) + 39 + MLS_WingOption
	elseif (WingID == MakeItemID(12,130) or WingID == MakeItemID(12,135) or WingID == MakeItemID(12,278)) then
		OutAbsorb = (WingLevel * 2) + 20
	elseif (WingID == MakeItemID(12,414) or WingID == MakeItemID(12,438)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,415) or WingID == MakeItemID(12,439)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,416) or WingID == MakeItemID(12,440)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,417) or WingID == MakeItemID(12,441)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,418) or WingID == MakeItemID(12,442)) then
		OutAbsorb = (WingLevel * 2) + 37
	elseif (WingID == MakeItemID(12,419) or WingID == MakeItemID(12,443)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,420) or WingID == MakeItemID(12,444)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,421) or WingID == MakeItemID(12,445)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,467) or WingID == MakeItemID(12,468)) then
		OutAbsorb = (WingLevel * 2) + 43 + MLS_WingOption
	elseif (WingID == MakeItemID(12,469)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif (WingID == MakeItemID(12,472) or WingID == MakeItemID(12,473)) then
		OutAbsorb = (WingLevel * 2) + 39 + MLS_WingOption
	elseif (WingID == MakeItemID(12,474) or WingID == MakeItemID(12,490)) then
		OutAbsorb = (WingLevel * 2) + 43
	elseif WingID == MakeItemID(12,480) then
		OutAbsorb = 65
	elseif (WingID == MakeItemID(12,489) or WingID == MakeItemID(12,496)) then
		OutAbsorb = (WingLevel * 2) + 39 + MLS_WingOption
	else
		OutAbsorb = 12 + (WingLevel * 2)
	end
	
	return OutAbsorb
end

function Wings_CalcIncAttack(WingID, WingLevel)
	local OutIncAttack = 0
	
	if ((WingID >= MakeItemID(12,3) and WingID <= MakeItemID(12,6)) or (WingID >= MakeItemID(12,422) and WingID <= MakeItemID(12,425)) or WingID == MakeItemID(12,42) or WingID == MakeItemID(12,427)) then
		OutIncAttack = WingLevel + 32
	elseif (WingID == MakeItemID(12,49) or WingID == MakeItemID(12,428)) then
		OutIncAttack = (WingLevel * 2) + 20	
	elseif (WingID == MakeItemID(13,30) or WingID == MakeItemID(12,426)) then
		OutIncAttack = (WingLevel * 2) + 20
	elseif ((WingID >= MakeItemID(12,36) and WingID <= MakeItemID(12,40)) or (WingID >= MakeItemID(12,430) and WingID <= MakeItemID(12,433)) or WingID == MakeItemID(12,43) or WingID == MakeItemID(12,50) or WingID == MakeItemID(12,435) or WingID == MakeItemID(12,436) or WingID == MakeItemID(12,434)) then
		OutIncAttack = (WingLevel * 2) + 39
	elseif (WingID == MakeItemID(12,264) or WingID == MakeItemID(12,265) or WingID == MakeItemID(12,281) or WingID == MakeItemID(12,282)) then
		OutIncAttack = WingLevel + 35
	elseif (WingID == MakeItemID(12,262) or WingID == MakeItemID(12,279)) then
		OutIncAttack = WingLevel + 21
	elseif (WingID == MakeItemID(12,263) or WingID == MakeItemID(12,280)) then
		OutIncAttack = WingLevel + 33
	elseif (WingID == MakeItemID(12,266)) then
		OutIncAttack = WingLevel + 71
	elseif (WingID == MakeItemID(12,267)) then
		OutIncAttack = WingLevel + 60
	elseif (WingID == MakeItemID(12,268)) then
		OutIncAttack = (WingLevel * 2) + 39
	elseif (WingID == MakeItemID(12,269) or WingID == MakeItemID(12,429)) then
		OutIncAttack = (WingLevel * 2) + 20
	elseif (WingID == MakeItemID(12,270) or WingID == MakeItemID(12,437)) then
		OutIncAttack = (WingLevel * 2) + 39
	elseif (WingID == MakeItemID(12,130) or WingID == MakeItemID(12,135) or WingID == MakeItemID(12,278)) then
		OutIncAttack = (WingLevel * 2) + 20
	elseif (WingID >= MakeItemID(12,414) and WingID <= MakeItemID(12,421) or (WingID >= MakeItemID(12,438) and WingID <= MakeItemID(12,445)) or WingID == MakeItemID(12,474) or WingID == MakeItemID(12,490)) then
		OutIncAttack = WingLevel + 55
	elseif (WingID >= MakeItemID(12,467) and WingID <= MakeItemID(12,468)) then
		OutIncAttack = WingLevel + 55
	elseif (WingID == MakeItemID(12,469)) then
		OutIncAttack = WingLevel + 55
	elseif (WingID >= MakeItemID(12,472) and WingID <= MakeItemID(12,473)) then
		OutIncAttack = (WingLevel * 2)  + 39
	elseif WingID == MakeItemID(12,480) then
		OutIncAttack = 65
	elseif (WingID == MakeItemID(12,489) or WingID == MakeItemID(12,496)) then
		OutIncAttack = (WingLevel * 2) + 39
	else
		OutIncAttack = (WingLevel * 2) + 12
	end
	
	return OutIncAttack
end

function Wings_DecreaseHP(WingID, WingDur, Class, Skill)
	local HPDec = 0
	
	if (WingID == MakeItemID(12,266) and Class ~= CLASS_RAGEFIGHTER and WingDur > 0) then
		HPDec = 3
	elseif (Class == CLASS_WIZARD or Class == CLASS_ELF or Class == CLASS_SUMMONER or Class == CLASS_RUNEWIZARD or Class == CLASS_SLAYER) then
		HPDec = 1
	elseif (Class == CLASS_RAGEFIGHTER) then
		if (Skill == 263 or Skill == 559 or Skill == 563 or Skill == 269 or Skill == 262 or Skill == 558 or Skill == 562) then
			HPDec = 4
		elseif (Skill == 265 or Skill == 564 or Skill == 566) then
			HPDec = 100
		elseif (Skill == 260 or Skill == 261 or Skill == 264 or Skill == 551 or Skill == 554 or Skill == 552 or Skill == 555 or Skill == 560 or Skill == 561 or Skill == 270) then
			HPDec = 2
		else
			HPDec = 3
		end
	elseif (Class == CLASS_GROWLANCER) then
		if (WingID == MakeItemID(12,269) and WingDur > 0) then
			HPDec = 1
		elseif (WingID == MakeItemID(12,270) and WingDur > 0) then
			HPDec = 3
		elseif (WingID == MakeItemID(12,421) and WingDur > 0) then
			HPDec = 3
		end
	else
		HPDec = 3
	end
	
	return HPDec
end
	
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

function GoldHellMaine_DropWing()
	local WingDropRate = GetLargeRandomValue(1000000)
	local WingCountRate = GetRandomValue(100)
	local WingCount = 0
	local WingExpireTime = 2419200 -- seconds
	
	if (WingDropRate < 50000) then
		if (WingCountRate >= 75) then
			if (WingCountRate >= 90) then
				if (WingCountRate >= 95) then
					if(WingCountRate >= 98) then
						WingCount = 5
					else
						WingCount = 4
					end
				else
					WingCount = 3
				end
			else
				WingCount = 2
			end
		else
			WingCount = 1
		end
	else
		WingCount = 0
	end
	
	return WingCount, WingExpireTime
end

function GoldKundun_DropWing()
	local WingDropRate = GetLargeRandomValue(1000000)
	local WingCountRate = GetRandomValue(100)
	local WingCount = 0
	local WingExpireTime = 2419200 -- seconds
	
	if (WingDropRate < 200000) then
		if (WingCountRate >= 75) then
			if (WingCountRate >= 90) then
				if (WingCountRate >= 95) then
					if(WingCountRate >= 98) then
						WingCount = 5
					else
						WingCount = 4
					end
				else
					WingCount = 3
				end
			else
				WingCount = 2
			end
		else
			WingCount = 1
		end
	else
		WingCount = 0
	end
	
	return WingCount, WingExpireTime
end

function DarkHorse_CalcAbsorb(PetLevel)
	local Absorb = (PetLevel + 30) / 2
	return Absorb
end
		