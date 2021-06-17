		local factionitems = {
	[23192] = {[89] = {28, 192, 190, 200, 199, 193, 202, 2266, 2265, 160, 161, 796, 167, 154, 203}}, -- scarlet
	[7997] = {[17] = {20, 1581, 920, 59, 86, 536}}, -- BS
	[90106] = {[56] = {"all"}}, -- night watch (friendly faction)
	[7188] = {[11] = {"all"}}, -- stormwind (friendly faction)
	[90107] = {[21] = {1098, 121, 241, 94, 492, 2098}}, -- necromancer
	[148807] = {[123] = {"all"}}, -- arathor (friendly faction)
	[148900] = {[11] = {"all"}}, -- southshore (friendly faction)

	[148829] = {[87] = {"all"}}, -- sindicate
	[1996] = {[654] = {317, 1858, 316, 1884, 1917, 354, 355, 353, 1885}}, -- trolls
}

local build = "69g3guc5k"

local zonez = {267,130,36,45,47,28,139,85, 1519, 12, 10, 40, 717, 14, 1, 85, 215, 141, 3524, 3430, 4298}

local typeofdamage = {
[96150] = {"|TInterface\\icons\\ability_hunter_mendpet.blp:32:32|t Перелом ноги"},
[96151] = {"|TInterface\\icons\\INV_Misc_Bone_01.blp:32:32|t Перелом руки"},
[96152] = {"|TInterface\\icons\\ABILITY_MAGE_MOLTENARMOR.blp:32:32|t Разлом доспеха"},
[96153] = {"|TInterface\\icons\\Ability_Rogue_BloodyEye.blp:32:32|t Контузия"}
}


local function randomdamage(event, player, msg, Type, lang)
	if (msg == "[SADDON_GETDAMAGE]" and player:GetSelectedUnit()) then
		local creatures = player:GetCreaturesInRange(15)
		local count = 0
		if (creatures) then
		for k,creature in pairs(creatures) do
			local ctarget = creature:GetVictim()
			if (ctarget and ctarget:GetName() == player:GetName()) then
				count = count +1
			end
		end
	end
		if (count > 2) then
		local chance = math.random(1, 100)
		if (chance >= (100-count)) then
			local damage = 0
			damageSTATE1 = math.random(1, 100)
			if (damageSTATE1 <= 50) then
				damage = typeofdamage[97150][1]
				player:AddAura(97150, player)
				elseif (damageSTATE1 > 50 and damageSTATE1 <= 85) then
					damage = typeofdamage[97151][1]
					player:AddAura(97151, player)
					elseif (damageSTATE1 > 85 and damageSTATE1 <= 95) then
						damage = typeofdamage[97152][1]
						player:DurabilityPointsLossAll(25)
						player:AddAura(97152, player)
						elseif (damageSTATE1 > 95 and damageSTATE1 <= 100) then
							damage = typeofdamage[97153][1]
							player:AddAura(97153, player)
							player:SetDrunkValue(100)
				end

			if (player:GetGender() == 0) then
			player:SendBroadcastMessage("|cfffdeaa8- После атаки существа |cff960018["..player:GetSelectedUnit():ToCreature():GetName().."]|cfffdeaa8 я получил увечие: |cff960018"..damage.."|cfffdeaa8.\n|cfffdeaa8Шанс нового ранения составляет |cffffba00"..count.."%|r")
			else
			player:SendBroadcastMessage("|cfffdeaa8- После атаки существа |cff960018["..player:GetSelectedUnit():ToCreature():GetName().."]|cfffdeaa8 я получила увечие: |cff960018"..damage.."|cfffdeaa8.\n|cfffdeaa8Шанс нового ранения составляет |cffffba00"..count.."%|r")
			end

		end
	end
		return false
	end
end
RegisterPlayerEvent(18, randomdamage)

local function removetransport(event, player, spell, skipCheck)
	if (spell:GetEntry() == 1784 or spell:GetEntry() == 1856) then
		player:RemoveAura(90124)
		player:RemoveAura(90124)
	end
end
	RegisterPlayerEvent(5, removetransport)

local function incorrectzoneid(event, player)
	if (player:GetGMRank() > 0) then
		return false
	end

	local tru = 0
for k, v in pairs(zonez) do
	if (v == player:GetZoneId()) then
		tru = 1
	end
end
if (tru == 0) then
	player:Teleport(0, -1232.37353, 390.489899, 0.23567, 1.909795)
	player:SetBindPoint(-1232.37353, 390.489899, 0.23567, 0, 896)
player:AddAura(52721, player)
player:SendUnitWhisper("[SADDON_FADEOUT]Я не могу переместиться в эту зону.", player)

	end
end
--RegisterPlayerEvent(27, incorrectzoneid)
--RegisterPlayerEvent(28, incorrectzoneid)


local function item_template_praser(event, player, msg, Type, lang)
	if (msg == "DEV_IT_PRASE") then
	local SQL = WorldDBQuery("SELECT data1 FROM gameobject_template WHERE data1 > 0 and type IN (3, 25);")
	for i= 1, SQL:GetRowCount() do
		player:SendBroadcastMessage(SQL:GetInt32(0).." - normal")
		SQL:NextRow()
	end
end
end
RegisterPlayerEvent(18, item_template_praser)


local function evermorph(event, player, msg, Type, lang)
	if (msg:find("#evermorph") and player:GetGMRank() >= 1) then
		local target = player:GetSelectedPlayer()

		if not(target) then
			player:SendBroadcastMessage("#evermorph: Неподходящая цель.")
			return false;
		end

		if (msg:find("#evermorph .*")) then
			local _,_,id = msg:find("#evermorph (.*)")
			if (id) then
			target:SetDisplayId(id)
				target:SetNativeDisplayId(id)
			local IsInBD = WorldDBQuery("SELECT displayid FROM roleplay_evermorph WHERE player = '"..target:GetName().."';")
			if (IsInBD) then
				WorldDBExecute("UPDATE roleplay_evermorph SET displayid = "..tonumber(id).." WHERE player = '"..target:GetName().."';")
			else
				WorldDBExecute("INSERT INTO roleplay_evermorph VALUES ('"..target:GetName().."', "..tonumber(id)..");")
			end

			player:SendBroadcastMessage("#everporph: Установлен displayid: "..id)
		end

		end

return false
end
end
RegisterPlayerEvent(18, evermorph)

local function deevermorph(event, player, msg, Type, lang)
	if (msg:find("#deevermorph")) then
		local target = player:GetSelectedPlayer()

		if not(target) then
			player:SendBroadcastMessage("#deevermorph: Неподходящая цель.")
			return false;
		end

			WorldDBExecute("DELETE FROM roleplay_evermorph WHERE player = '"..target:GetName().."';")
			target:DeMorph()

return false
end
end
RegisterPlayerEvent(18, deevermorph)

local function todisplay(event, player)
	local IsInBD = WorldDBQuery("SELECT displayid FROM roleplay_evermorph WHERE player = '"..player:GetName().."';")
			if (IsInBD) then
				player:SetDisplayId(IsInBD:GetInt32(0))
				player:SetNativeDisplayId(IsInBD:GetInt32(0))
			end
	end
	RegisterPlayerEvent(3, todisplay)

--[[local function bagobject(event, killer, killed)
	local GOBIDSQL = WorldDBQuery("SELECT gameobject FROM `ROLEPLAY_CharGobNums` WHERE player = '"..killed:GetGUID().."';")
	local LOOTIDSQL = WorldDBQuery("SELECT lootid FROM `ROLEPLAY_CharGobNums` WHERE player = '"..killed:GetGUID().."';")
	if (LOOTIDSQL) then
		WorldDBExecute("DELETE FROM `gameobject_loot_template` WHERE entry = '"..LOOTIDSQL:GetInt32(0).."';");
		ReloadGameobjectLootTemplate()
	end
	if (GOBIDSQL) then
	for slot = 1, 38 do
	local killeditem = killed:GetItemByPos(-1, slot)
	if (killeditem) then
	WorldDBExecute("INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES ("..LOOTIDSQL:GetInt32(0)..","..killeditem:GetEntry()..",100,1,0,1,1);")
	killed:RemoveItem(killeditem, -100)
end
end
ReloadGameobjectLootTemplate()
if (killer) then
killer:SummonGameObject(GOBIDSQL:GetInt32(0), killed:GetX()+1, killed:GetY()+1, killed:GetZ(), killed:GetO())
else
	killed:SummonGameObject(GOBIDSQL:GetInt32(0), killed:GetX()+1, killed:GetY()+1, killed:GetZ(), killed:GetO())
end
Kick(killed)
--CharDBExecute("INSERT INTO `character_banned` VALUES ('"..killed:GetGUID().."', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+604800,'"..killed:GetName().."', 'Убит в процессе игры', '1');")
PerformIngameSpawn(2, GOBIDSQL:GetInt32(0), killed:GetMapId(), killed:GetInstanceId(), killed:GetX()+1, killed:GetY()+1, killed:GetZ(), killed:GetO())
end
end

local function GOBadd(event, player)
	local GOBIDSql = WorldDBQuery("SELECT MAX(entry) FROM `gameobject_template`;")
	local GOBID = GOBIDSql:GetInt32(0)+1
	local LOOTIDSql = WorldDBQuery("SELECT MAX(entry) FROM `gameobject_loot_template`;")
	local LOOTID = LOOTIDSql:GetInt32(0)+1
	local playerguid = player:GetGUID()

	WorldDBExecute("INSERT INTO `ROLEPLAY_CharGobNums` VALUES ('"..playerguid.."', '"..GOBID.."', '"..LOOTID.."');")
	WorldDBExecute("INSERT INTO `gameobject_template` VALUES ('"..GOBID.."', '3', '86023', 'Странный мешок', '', '', '', '35', '0', '1', '0', '0', '0', '0', '0', '0', '57', '"..LOOTID.."', '0', '1', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '12340');")
end
local function GOBtoDB(event, player)
	local GOBIDSQL = WorldDBQuery("SELECT gameobject FROM `ROLEPLAY_CharGobNums` WHERE player = '"..player:GetGUID().."';")
	if (GOBIDSQL) then
			ReloadGameobjectTemplate()
		end
		end
RegisterPlayerEvent(6, bagobject)
RegisterPlayerEvent(8, bagobject)
RegisterPlayerEvent(1, GOBadd)
RegisterPlayerEvent(30, GOBtoDB)]]--

local function lootchara(event, player, spell, skipCheck)
	if (spell:GetEntry() == 90502) then
		local target = spell:GetTarget()
		if (target:ToPlayer() and (target:HasAura(90510) or target:HasAura(90500)))then

				if (WorldDBQuery("SELECT gold FROM roleplay_headhunting WHERE nickname = '"..target:GetName().."';") and (target:GetName() ~= player:GetName())) then
		local gold = WorldDBQuery("SELECT gold FROM roleplay_headhunting WHERE nickname = '"..target:GetName().."';")
		player:SendUnitWhisper("- Я только что одолел игрока, за которого была назначена награда. Моя выручка составила "..gold:GetInt32(0).." медных монет.", player)
		player:ModifyMoney(gold:GetInt32(0))
		WorldDBExecute("DELETE FROM roleplay_headhunting WHERE nickname = '"..target:GetName().."';")
	end

			for i = 0, 38 do
		local item = target:GetItemByPos(-1, i)
		if (item) then

local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								chance = math.random(60, 100)
        							else 
        								chance = math.random(20, 100)
        						end

	if (chance >= 80) then
	
	local mv = WorldDBQuery("SELECT bonding FROM item_template WHERE entry = "..item:GetEntry().."")
		  if (item:GetEntry() >= 60000 and mv:GetInt32(0) == 1) then
		    return false
			end
	if (player:AddItem(item:GetEntry(), item:GetCount())) then
		target:RemoveItem(item:GetEntry(), item:GetCount())
	--else 
		--player:SendUnitSay("net", 0)
		--SendMail("Вещи, добытые марадерством", "То, что не уместилось в вашу сумку.", player:GetGUIDLow(), target, 0, 0, item:GetEntry(), 1)
	end
end
		end
	end
	else
		player:SendUnitWhisper("- Это существо нельзя обыскать.", player)
	end
end
end

RegisterPlayerEvent(5, lootchara)

local function afteraura(event, player, msg, Type, lang)
	if (msg == "[SADDON_NEARLYDIEDBUTALIVE]") then
		player:RemoveAura(35070)
		player:AddAura(38663, player)
		player:AddAura(90513, player)
		player:RemoveAura(29266)
		player:AddAura(5384, player)
		player:MoveTo(1, player:GetX()+0.2, player:GetY(), player:GetZ())
		player:RemoveFlag(150,0x00800000)
		player:RemoveFlag(150,0x01000000)
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..player:GetName().."';") -- DB
		--player:SetHealth(player:GetMaxHealth()-(player:GetMaxHealth()*70/100))
		return false;
	end
end
RegisterPlayerEvent(18, afteraura)




	local function diednigga(killed)
		killed:SetHealth(killed:GetMaxHealth()-(killed:GetMaxHealth()*99/100))
		killed:AddAura(90510, killed)
		killed:AddAura(29266, killed)
		killed:AddAura(1852, killed)
		killed:AddAura(35182, killed)
		killed:SetFlag(150,0x00800000)
		killed:SetFlag(150,0x01000000)
		WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..killed:GetName().."');") -- DB
	end


local function dienigga(event, killer, killed)
	local canbekilled = WorldDBQuery("SELECT time FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")

	if not(canbekilled) then
			WorldDBExecute("INSERT INTO roleplay_recentlydied VALUES ('"..killed:GetName().."', UNIX_TIMESTAMP());")
	killed:SendUnitSay("- Я больше.. не могу сражаться..", 0)
	killed:ResurrectPlayer(10, false)
	killed:AddAura(35070, killed)
	killed:AddAura(90500, killed)

	killed:SetFlag(150,0x00800000)
		killed:SetFlag(150,0x01000000)
		WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..killed:GetName().."');") -- DB

	killed:SetHealth(killed:GetMaxHealth()-(killed:GetMaxHealth()*95/100))

	elseif (canbekilled and not(canbekilled:GetInt32(0)+70 < os.time())) then
				killed:ResurrectPlayer(10, false)
				diednigga(killed)
	WorldDBExecute("DELETE FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")

	elseif (canbekilled and canbekilled:GetInt32(0)+70 < os.time()) then
	WorldDBExecute("DELETE FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")
	WorldDBExecute("INSERT INTO roleplay_recentlydied VALUES ('"..killed:GetName().."', UNIX_TIMESTAMP());")
	killed:SendUnitSay("- Я больше.. не могу сражаться..", 0)
	killed:ResurrectPlayer(10, false)
	killed:AddAura(35070, killed)
	killed:AddAura(90500, killed)

	killed:SetFlag(150,0x00800000)
		killed:SetFlag(150,0x01000000)
		WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..killed:GetName().."');") -- DB

	killed:SetHealth(killed:GetMaxHealth()-(killed:GetMaxHealth()*95/100))
end
	end


	local function dieniggaNPC(event, killer, killed)
	local canbekilled = WorldDBQuery("SELECT time FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")

	if not(canbekilled) then
			WorldDBExecute("INSERT INTO roleplay_recentlydied VALUES ('"..killed:GetName().."', UNIX_TIMESTAMP());")
	killed:SendUnitWhisper("- Существа нанесли мне колоссальный урон. Я больше не могу участвовать в битве. Мне нужно время, чтобы прийти в себя.", killed)
	killed:ResurrectPlayer(10, false)
	killed:AddAura(29266, killed)
	killed:AddAura(90500, killed)

	killed:SetFlag(150,0x00800000)
		killed:SetFlag(150,0x01000000)
		WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..killed:GetName().."');") -- DB

	killed:SetHealth(killed:GetMaxHealth()-(killed:GetMaxHealth()*60/100))

	elseif (canbekilled and not(canbekilled:GetInt32(0)+70 < os.time())) then
				killed:ResurrectPlayer(10, false)
				diednigga(killed)
	WorldDBExecute("DELETE FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")

	elseif (canbekilled and canbekilled:GetInt32(0)+70 < os.time()) then
	WorldDBExecute("DELETE FROM roleplay_recentlydied WHERE player = '"..killed:GetName().."';")
	WorldDBExecute("INSERT INTO roleplay_recentlydied VALUES ('"..killed:GetName().."', UNIX_TIMESTAMP());")
	killed:SendUnitWhisper("- Существа нанесли мне колоссальный урон. Я больше не могу участвовать в битве. Мне нужно время, чтобы прийти в себя.", killed)
	killed:ResurrectPlayer(10, false)
	killed:AddAura(29266, killed)
	killed:AddAura(90500, killed)

	killed:SetFlag(150,0x00800000)
		killed:SetFlag(150,0x01000000)
		WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..killed:GetName().."');") -- DB

	killed:SetHealth(killed:GetMaxHealth()-(killed:GetMaxHealth()*60/100))
end
	end

	RegisterPlayerEvent(6, dienigga)
	RegisterPlayerEvent(8, dieniggaNPC)

local function nearlydied(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_NEARLYDEAD_INCOMBAT_.*%]")) then
		local _,_,victimname = msg:find("%[SADDON_NEARLYDEAD_INCOMBAT_(.*)%]")
		local victim = GetPlayerByName(victimname)
		if (victim and victim:HasAura(90500)) then
		player:SendUnitWhisper("[SADDON_IKILLEDYOU_"..player:GetName().."]Твоя судьба теперь в моих руках..", victim)
		victim:SendUnitWhisper("[SADDON_UJUSTKILLED_"..victim:GetName().."]В твоих руках дальнейшая судьба моя.", player)
		--player:AddAura(35070, player)
		--player:AddAura(35182, player)
	elseif (player) then
		player:SendUnitWhisper("- Я не могу добить этого игрока.", player)
	end
		return false;
	end
	end

local function killplayerinduel(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_KILLPLAYER_%S+_%S+%]")) then
		local _,_,killedname = msg:find("%[SADDON_KILLPLAYER_(%S+)_%S+%]")
		local killername = player:GetName()
		local killed = GetPlayerByName(killedname)
		local killer = GetPlayerByName(player:GetName())
		if (killed and killer and WorldDBQuery("SELECT player FROM roleplay_canbekilled WHERE player = '"..killed:GetName().."';")) then
		killed:RemoveAura(35070)
		killed:RemoveAura(90500)

		killed:RemoveFlag(150,0x00800000)
		killed:RemoveFlag(150,0x01000000)
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..killed:GetName().."';") -- DB

			if (killedname == killername and killedname == player:GetName()) then
				killed:TextEmote("совершает самоубийство.")
				diednigga(killed)
			else

		killed:SendUnitWhisper("[SADDON_CLOSE]"..killedname.." мертв.", killer)
		killer:SendUnitWhisper("[SADDON_CLOSE]"..killername.." убил вас.", killed)
		killer:CastSpell(killed, 62973)
		diednigga(killed)
	end
	end
		return false;
	end
end

local function stayaliveplayerinduel(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_STAYALIVE_%S+_%S+%]")) then
		local _,_,slayedname, slayername = msg:find("%[SADDON_STAYALIVE_(%S+)_(%S+)%]")
		local slayed = GetPlayerByName(slayedname)
		local slayer = GetPlayerByName(slayername)
		if (slayed and slayer) then
		slayed:RemoveAura(35070)
		slayed:RemoveAura(90500)

		slayed:RemoveFlag(150,0x00800000)
		slayed:RemoveFlag(150,0x01000000)
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..slayed:GetName().."';") -- DB

		slayed:SetHealth(slayed:GetMaxHealth()-(slayed:GetMaxHealth()*60/100))
		slayed:SendUnitWhisper("[SADDON_CLOSE]"..slayername.." решил, что вы достойны оставаться в Азероте.", slayed)
		slayed:CastSpell(slayed, 7267)
	end
		return false;
	end
	end

	local function trytoleaveplayerinduel(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_PVPPOBEG_%S+_%S+%]")) then
		local _,_,attackername,runnername = msg:find("%[SADDON_PVPPOBEG_(%S+)_(%S+)%]")
		local attacker = GetPlayerByName(attackername)
		local runner = GetPlayerByName(runnername)
		if (attacker and runner) then
		runner:RemoveAura(35070)
		runner:RemoveAura(90500)

		runner:RemoveFlag(150,0x00800000)
		runner:RemoveFlag(150,0x01000000)
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..runner:GetName().."';") -- DB

		runner:AddAura(38663, runner)
		runner:SetHealth(runner:GetMaxHealth()-(runner:GetMaxHealth()*85/100))
		runner:SendUnitWhisper("[SADDON_CLOSE]"..runnername.." предпринял попытку побега.", attacker)
	end
		return false;
	end
	end

	local function closeaddonto(event, player, msg, Type, lang)
		if (msg:find("%[SADDON_CLOSETO_%S+%]")) then
			local _,_,closeto = msg:find("%[SADDON_CLOSETO_(%S+)%]")
			player:SendUnitWhisper("[SADDON_CLOSE]"..player:GetName().." мертв.", GetPlayerByName(closeto))
			return false;
		end
	end
	RegisterPlayerEvent(18, killplayerinduel)
	RegisterPlayerEvent(18, stayaliveplayerinduel)
	RegisterPlayerEvent(18, trytoleaveplayerinduel)
	RegisterPlayerEvent(18, nearlydied)
	RegisterPlayerEvent(18, closeaddonto)

	local function toafk(event, player, msg, Type, lang)
		if (msg == "[SADDON_IMAFKNOW]") then
			if not(WorldDBQuery("SELECT player FROM roleplay_afknow WHERE player = '"..player:GetName().."';") or CharDBQuery("SELECT phase FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")) then
		WorldDBExecute("INSERT INTO roleplay_afknow VALUES ("..player:GetX()..","..player:GetY()..","..player:GetZ()..","..player:GetO()..","..player:GetMapId()..", '"..player:GetName().."');")
		local pet = player:GetPetGUID()
		if (pet) then
			player:CastSpell(player, 36562)
		end
		player:RemoveAura(90124)
		player:SetCanFly(1)
		player:SetFlag(150,0x00800000)
		player:SetFlag(150,0x01000000)
		player:CastSpell(player, 53708)
		player:AddAura(32759, player)
		player:AddAura(37803, player)
		player:SetGameMaster(1)
		player:SetGMVisible(0)
	end
		return false;
		elseif (msg == "[SADDON_IMHERENOW]") then
			if (CharDBQuery("SELECT phase FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")) then
				return false
			end
			player:Mute(1)
			local wasAFK = WorldDBQuery("SELECT player FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
			if (wasAFK) then
				player:ToggleAFK()
				if (player:IsAFK()) then
					player:ToggleAFK()
				end
				local x = WorldDBQuery("SELECT x FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
				local y =  WorldDBQuery("SELECT y FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
				local z =  WorldDBQuery("SELECT z FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
				local o =  WorldDBQuery("SELECT o FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
				local mapid =  WorldDBQuery("SELECT map FROM roleplay_afknow WHERE player = '"..player:GetName().."';")

				for i= 0,8 do
					player:SetSpeed(i, 1, 1)
				end
		player:SetCanFly(0)
		player:RemoveFlag(150,0x00800000)
		player:RemoveFlag(150,0x01000000)
		if (WorldDBQuery("SELECT player FROM roleplay_stunned WHERE player = '"..player:GetName().."';")) then
		player:SetFlag(150,0x00800000)
		player:SetFlag(150,0x01000000)
		end
		player:SetGameMaster(0)
		player:SetGMVisible(1)
		player:RemoveAura(32759)
		player:RemoveAura(37803)
		player:CastSpell(player, 65632)
		player:Teleport(mapid:GetInt32(0), x:GetInt32(0), y:GetInt32(0), z:GetInt32(0)+0.5, o:GetFloat(0))

		local aura = player:GetAura(97150)
		if(aura) then
			time = aura:GetDuration()
			player:RemoveAura(97150)
			player:AddAura(97150, player)
			local aura2 = player:GetAura(97150)
			aura2:SetDuration(time)
		end
    			local hasitem = nil
		factiontochange = 0
		----
		for k in pairs(factionitems) do
			for n in pairs(factionitems[k]) do
				for m, v in pairs(factionitems[k][n]) do
					local areaid = v
					if (player:GetAreaId() == areaid or v == "all") then
					---NOTALLBEGIN
		for i = 0, 38 do
		local item = player:GetItemByPos(-1, i)
		if (item) then
			if (item:GetEntry() == k and item:IsEquipped()) then
				hasitem = item
		end
		end
		end
					if (hasitem) then
						factiontochange = n
						hasitem = nil
					end
					---NOTALLAEND
					end
				end
			end
		end
		if (factiontochange > 0) then
			player:SetFaction(factiontochange)
			factiontochange = 0
					else
						player:SetFactionForRace(player:GetRace())
					end
		----
		WorldDBExecute("DELETE FROM roleplay_afknow WHERE player = '"..player:GetName().."';")
		local IsInBD = WorldDBQuery("SELECT displayid FROM roleplay_evermorph WHERE player = '"..player:GetName().."';")
			if (IsInBD) then
				player:SetDisplayId(IsInBD:GetInt32(0))
				player:SetNativeDisplayId(IsInBD:GetInt32(0))
			end
	end
			return false;
			elseif (msg:find("%[SADDON_MODSPEED_%S+%]")) then
				local _,_, value = msg:find("%[SADDON_MODSPEED_(%S+)%]")
				for i= 0,8 do
					if (player:IsAFK() and player:HasAura(37803) and player:IsGM()) then player:SetSpeed(i, value, 1) end
				end
				return false;
	end
	end
	RegisterPlayerEvent(18, toafk)

	local function golod(event, player, msg, Type, lang)
		if (msg == "[SADDON_NOTHUNGRY]") then
			player:RemoveAura(90000)
					return false;
		elseif (msg == "[SADDON_HUNGRY]") then
			player:AddAura(90000, player)
					return false;
			elseif(msg == "[SADDON_FUCKNVERYHUNGRY]") then
				if (player:GetHealth() <= player:GetMaxHealth()*5/100) then
					diednigga(player)
				else
				player:SetHealth(player:GetHealth()-(player:GetMaxHealth()*5/100))
				player:AddAura(90000, player)
			end
				return false;
				elseif(msg == "[SADDON_TOOMANYHUNGRY]") then
					player:CastSpell(player,67468)
				return false;
			end
	end
	RegisterPlayerEvent(18, golod)


massiveofweapons1 = {"60000", "60001"}
massiveofweapons2 = {"60002","60003","60004"}
massiveofweapons3 = {"60005","60006","60007"}
massiveofweapons4 = {"60008","60009","60010"}
massiveofweapons5 = {"60011","60012"}

	local function vorovstvo(event, player, msg, Type, lang)
		if (msg:find("%[SADDON_STEAL_%S+_%S+%]")) then
			local _,_,victimname = msg:find("%[SADDON_STEAL_%S+_(%S+)%]")
			local _,_,weaponid = msg:find("%[SADDON_STEAL_(%S+)_%S+%]")
			local victim = GetPlayerByName(victimname)
			if (victim) then
			local bonusofweapn = 0

			for k,v in pairs(massiveofweapons1) do
				if (weaponid == v) then
					bonusofweapn = bonusofweapn + 5
					end
			end

			for k,v in pairs(massiveofweapons2) do
				if (weaponid == v) then
					bonusofweapn = bonusofweapn + 10
				end
			end

			for k,v in pairs(massiveofweapons3) do
				if (weaponid == v) then
					bonusofweapn = bonusofweapn + 15
					end
			end

			for k,v in pairs(massiveofweapons4) do
				if (weaponid == v) then
					bonusofweapn = bonusofweapn + 20
					end
			end

			for k,v in pairs(massiveofweapons5) do
				if (weaponid == v) then
					bonusofweapn = bonusofweapn + 30
					end
			end

			local raznicaoflevels = victim:GetLevel() - player:GetLevel() 

				local RollVOR = math.random(1,100) - raznicaoflevels*5 + bonusofweapn
				local RollVICTIM = math.random(15,100)

				if (RollVOR > RollVICTIM) then
					local currmoney = victim:GetCoinage()
					if (currmoney > 0) then
						local moneyamout = math.ceil((currmoney*math.random(5,25))/100)
							player:ModifyMoney(moneyamout)
							victim:ModifyMoney(-moneyamout)
						player:SendUnitWhisper("- Я украл у этого игрока "..moneyamout.." меди, бонус от оружия +"..bonusofweapn, player)
						victim:SendUnitWhisper("- Меня только что ограбили.", victim)
					else
						player:SendUnitWhisper("- У этого игрока нету денег.", player)
					end
				else
						victim:SendUnitWhisper("- Меня пытался ограбить "..player:GetName(), victim)
						player:SendUnitWhisper("[SADDON_STEALFAIL]Неудачный грабеж.", player)
						player:SetPvP(true)
						if (player:GetGender() == 0) then
						player:TextEmote("медленно и аккуратно подносил свой нож к кошелю "..victimname..", но, сделав небрежное движение рукой, "..player:GetName().." кольнул лезвием свою жертву и орудие несостоявшегося вора со звоном выпало у него из рук.")
					else
						player:TextEmote("медленно и аккуратно подносила свой нож к кошелю "..victimname..", но, сделав небрежное движение рукой, "..player:GetName().." кольнула лезвием свою жертву и орудие несостоявшейся воровки со звоном выпало у неё из рук.")
					
					end
				end

			end
				return false;
		end
	end
	RegisterPlayerEvent(18, vorovstvo)

	local function delBANSfromdDB(event,guid)
		CharDBExecute("DELETE FROM character_banned WHERE guid = '"..guid.."';")
		local playername = CharDBQuery("SELECT name FROM characters WHERE guid = '"..guid.."';")
		WorldDBExecute("DELETE FROM roleplay_jail WHERE player = '"..playername:GetString(0).."';")
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..playername:GetString(0).."';")
		WorldDBExecute("DELETE FROM roleplay_headhunting WHERE nickname = '"..playername:GetString(0).."';")
		WorldDBExecute("DELETE FROM roleplay_evermorph WHERE player = '"..playername:GetString(0).."';")
		WorldDBExecute("DELETE FROM roleplay_characters WHERE player = '"..playername:GetString(0).."';")
		WorldDBExecute("DELETE FROM roleplay_customrace WHERE player = '"..playername:GetString(0).."';")
		AuthDBExecute("DELETE FROM roleplay_news WHERE player = '"..playername:GetString(0).."';")
	end
	RegisterPlayerEvent(2, delBANSfromdDB)

	local function backpack(event, player, msg, Type, lang)
		if(msg == "[SADDON_UNUSEBACKPACK]") then
			player:RemoveAura(90200)
			player:RemoveAura(90201)
			return false;
		end
		if (msg:find("%[SADDON_USEBACKPACK_.*%]")) then
			local _,_,kind = msg:find("%[SADDON_USEBACKPACK_(.*)%]")
			if (kind == "1") then
			player:AddAura(90200, player)
		else
			player:AddAura(90201, player)
		end
			return false;
		end
	end
	RegisterPlayerEvent(18, backpack)

	local function myhorseisyours(event, player, msg, Type, lang)
		if (msg == "[SADDON_CANUSEMYMOUNT]") then
			player:AddAura(90123, player)
			return false;
			elseif (msg == "[SADDON_CANTUSEMYMOUNT]") then	
				player:RemoveAura(90123)
				return false;
				elseif (msg == "[SADDON_UDALIMOVEOTHERS]") then
				player:RemoveAura(90124)
				return false;
			end
	end
	RegisterPlayerEvent(18, myhorseisyours)

	

	local function addnpctoplayer(event,player)
		WorldDBExecute("INSERT INTO roleplay_firstway VALUES ('"..player:GetName().."', 0);")
		WorldDBExecute("INSERT INTO roleplay_customrace VALUES ('"..player:GetName().."', 0);")
	end
	RegisterPlayerEvent(1, addnpctoplayer)



MSG_HELLO_FIRST = "- Приветствую тебя в наших краях. Скорее поведай же мне о себе, путник."
	local function chooseyourplace(event,player)
		local havefinishedfirstchoice = WorldDBQuery("SELECT choose FROM roleplay_firstway WHERE player = '"..player:GetName().."'")
		if (havefinishedfirstchoice and (havefinishedfirstchoice:GetInt32(0) == 0 or havefinishedfirstchoice:GetInt32(0) == 1 or havefinishedfirstchoice:GetInt32(0) == 2 or havefinishedfirstchoice:GetInt32(0) == 3 or havefinishedfirstchoice:GetInt32(0) == 4611 or havefinishedfirstchoice:GetInt32(0) == 4612)) then
				player:RemoveAura(52970)
				player:RemoveAura(44816)
				player:RemoveAura(35182)
				player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
			    player:SendUnitWhisper("- Что за странная книга там? Мне кажется, она говорит...\n"..MSG_HELLO_FIRST.."..", player)
				player:CastSpell(player, 90127)
				player:AddAura(52970, player)
				player:AddAura(44816, player)
				player:AddAura(35182, player)

				player:SetFlag(150,0x00800000)
				player:SetFlag(150,0x01000000)

				player:Teleport(player:GetMapId(), player:GetX(), player:GetY(), player:GetZ()+0.3, player:GetO())
			  end
	end
	RegisterPlayerEvent(3,chooseyourplace)


local NpcId = 90019
local MenuId = 90019

MSG_FAMILY = {
	"1. Мой отец был тем еще засранцем - он вечно устраивал семейные скандалы и учил меня жизни с позиции силы. Единственное, что мне досталось от него, это пара кастетов, с которыми тот выходил на бои в переулках. ",

"2. Мой отец был брошен в темницу много-много лет назад - пытался прокормить семью воровством. Всё, что мне досталось от него, это два обыкновенных ножа. ",

"3. Как и многие мужчины его времени, мой отец был воином, защищавшим свою семью и родные земли. Состарившись, он больше не мог зарабатывать денег, чтобы прокормить семью. И тогда, он отдал мне свой щит и меч.  ",

"4. Мой отец был преуспевающим торговцем, державшим свой магазинчик в большом городе. Но обстоятельства и конкуренты разорили беднягу, у него не осталось ничего, кроме одного волшебного кольца. Именно его он мне и передал. ",

"5. Из поколения в поколение моя семья занималась охотой, ведь только охота могла нас прокормить. Надо ли говорить, что рано или поздно мне пришлось влиться в этот маленький семейный бизнес, получив в свои руки небольшой лук. ",

"6. Мой отец сапожник. Но не подумайте! Это был лучший сапожник, которого мне только доводилось знать. Жили мы не богато, но и не бедно, а когда пришло моё время начать зарабатывать деньги для семьи, отец передал мне пару отличных сапог, которые, как он говорил, всегда помогут мне вернуться домой, куда бы дороги меня не завели. ",

"7. О, чего только про моего отца не говорили окружающие! В доме вечно валялся мусор: гайки, доски, ящики, коробки, медные изделия, железные скобы, да чего там только не было. Он мастерил, сооружал, выдумывал, чертил, как настоящий изобретатель. И вот, однажды он вручил мне одно из своих изобретений – кремнёвый мушкет. ",

"8. Мы жили на небольшой лесопилке вдали от огней большого города, мало кто к нам захаживал. Работа была трудная, но честная. И на жизнь мы не жаловались. От отца мне досталось моё первое рабочее оружие – добротный топор дровосека. ",

"9. Отвоевав своё на войне, мой отец попросту не нашёл себе занятий в новом мире, принявшись заниматься тем, что ему было понятно. Он стал наёмником, вечно странствующим и вечно с кем-то сражающимся. Когда он погиб в одном из своих походов, его товарищи вернули мне лишь одну вещь, его излюбленный клеймор.",

"10. Война – это всё, что чтит моё семейство. Мой прадед был знатным воителем. Мой дед, шпыняемый им в детстве, стал суровым и бородатым воином. И от своего сына, моего отца, он ждал того же. Надо ли говорить, что и на мою долю выпало немало оплеух и пинков, прежде чем в мои покрытые мозолями от постоянных тренировок руки вложили настоящее оружие – два закалённых в огне топора.",

"11. Как говорили его коллеги, мой отец был немного чудаковатым, но вполне мирным волшебником, большую часть своей жизни проводящим в библиотеке. Когда пришёл и мой черёд чему-то учиться, он передал мне волшебный жезл, говоря, что это намного лучше, чем какое-то там бесполезное оружие. ",

"12. С детства я занимаюсь тем, что помогаю своему отцу собирать разнообразные ингредиенты для его зелий. Может, конечно, учитель из него был и не самый лучший, но простое наблюдение за его действиями открыло мне очень многое! Когда пришло время перехватить его ремесло, в наследство мне досталось несколько склянок, колб, реторта, пестик и книга рецептов.",

"13. Мы с отцом вместе работали в кузнице, он обучал меня мастерству, хотя поначалу и приходилось ковать одни гвозди да сваи. Работа была тяжёлая, жаркая, пыльная, но со временем к ней привыкаешь. От отца мне досталось моё первое рабочее оружие – молоток.",

"14. Не знаю, кем был мой отец, наверное, каким-нибудь солдатом, решившим развлечься с потерявшей кров сельской девкой. Я не знаю ни его, ни свою мать. Моё детство прошло в трущобах большого города, среди таких же малолетних воришек, пытающихся попросту выжить. Всё, что я имею теперь, это нож, да то, чего могу унести на себе.",

"15. Мы с семьёй путешествовали меж селениями и городами, развлекая местный люд и всячески дурачась. Фокусники и артисты, менестрели и циркачи, вот кто мы! Ныне же, продолжая это нехитрое дело, я имею при себе лишь хорошее чувство юмора и доставшийся от отца волшебный плащ.",

"16. Батя говорил, что моё место на ферме с братьями. Но мне всегда хотелось чего-то большего. Я буду героем, да-да! Как-то раз, когда батя пошёл в сортир и хорошенько там залип, мне посчастливилось сбежать с фермы, прихватив с собой свои вилы.",

"17. Мой отец это старый скупердяй, зажавший своё золото и не желающий отдавать его просто по той причине, что это он его заработал, а не я. От меня он хочет того же. Иди, мол, в большой мир, найди себе работу и докажи, кто тут больше достоин семейных богатств, ты, или твои родственнички. Всё, что он дал мне перед тем, как выгнать навстречу приключениям, это грёбаную аристократскую шпагу!",

"18. В нашей семье с давних времён все женщины всегда занимались колдовством. С раннего детства девочек воспитывали старшие сёстры, а мальчиков, если таковые рождались, попросту возвращали отцам на хутор. Так или иначе, в наследство от моих странных родителей мне достался ведовской посох, как знак напоминания о том, что ведьмы всегда помнят обо мне. ",

"19. Ваш папка был рудокопом, как и его батька в своё время, что провёл всю свою жизнь на корячках, пробираясь в самые опасные и самые тёмные уголки пещер, обуреваемый алчностью и жаждой золота. Вы, впрочем, решили как-то, что быть грязным шахтёром – не для вас, сбежав с киркой в руках из своего дома прямиком навстречу приключениям.",

"20. Однажды ваш отец, спустившись с судна, зашёл в салун и оприходовал вашу мать. С тех пор этого бородача никто не видел до самой той поры, когда вы встретили его вновь, старого и больного просоленного моряка, доживающего свои последние дни в портовом кабаке. Признав вас, как своего отпрыска, он передал вам старую добрую саблю, не раз спасавшую этому пирату жизнь.",

"21. Вы плохо знали своего отца, хотя бы просто потому, что он вечно находился в каких-то разъездах и экспедициях со своими дружками-волшебниками, оставляя вас на попечение нянек. Однажды он в своих экспедициях так и сгинул, оставив вам только долги и свою запасную волшебную шляпу.",

"22. Неизвестно, кто были вашими родителями, вы выросли при церкви в качестве одного из служек, с ранних лет помогающего старшим братьям и сёстрам с уборкой и готовкой. Когда вы повзрослели, вам было позволено обучаться чтению, а после – принимать участие в ритуалах. Закончив обучение при церкви, вы вышли в большой мир, держа в руках церковный амулет.",

"23. Ваша семья, будучи достаточно уважаемой и богатой, чтобы позволить себе это, отправила вас ещё в детстве на обучение к паладинам, надеясь, что вы вырастете достойным воином. Вы побыли и слугой, и оруженосцем, прежде чем спустя много-много лет, вас, наконец, выпустили в мир, позволяя самостоятельно определять свою дальнейшую судьбу. ",

"24. Старый волшебник, не имеющий своих детей, выкрал вас из вашей семьи, когда вы были ещё совсем ребёнком. Он обнаружил в вас какой-то потенциал, решив, что если никто не будет заниматься вашим обучением, то в будущем вы погибнете, не сумев справиться со своей силой. Спустя многие годы, когда волшебник умер, вы оказались сами по себе, имея на руках лишь сделанную специально для вас чародейскую мантию.",

"25. Отказаться от выбора предыстории персонажа. Вам предоставят стандартный набор вещей для выживания."
}

MSG_SCALE = {
	"1. Невысокий",
	"2. Обычный рост",
	"3. Высокий",
	"4. Огромный!"
}

local function OnGossipHello(event, player, object)
	if (player:GetGUID() == object:GetOwnerGUID()) then
    player:GossipClearMenu() -- required for player gossip
    local havefinishedfirstchoice = WorldDBQuery("SELECT choose FROM roleplay_firstway WHERE player = '"..player:GetName().."'")

    if (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 0) then
    player:GossipMenuAddItem(0, "Доброго времени суток! Чтобы покинуть эту локацию и войти в игровой мир, вам нужно ответить на несколько вопросов. |cff4e1609Следите за игровым чатом, там будут появляться подсказки.|r Ответы на вопросы помогут вам подобрать внешнюю экипировку персонажа, его размер, а также точку старта.", 1, 4611)

	elseif (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 1) then

		for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)

    elseif (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 4611) then
    	player:SendUnitWhisper("- Ну вот, я стою на самом важном перекрестке в своей истории. При выборе |cfffdeaa8героического|r варианта отыгрыша, я получу дополнительные единицы устойчивости и брони, опыт будет начисляться быстрее. Еще я смогу сражаться лучше любого местного деревенщины и овладею верховой ездой! В тоже время, выбрав |cfffdeaa8мирный|r вариант отыгрыша, я обучусь дополнительным навыкам, таким как: Рыбная ловля, Кулинария, Первая помощь. Мне будет разрешено взять одну из лицензий на изготовление вещей и мой шанс удачного создания любого предмета будет выше, чем у остальных!", player)
            player:GossipMenuAddItem(9, "Героический вариант отыгрыша персонажа", 1, 4710)
        	player:GossipMenuAddItem(6, "Мирный вариант отыгрыша персонажа", 1, 4612)
        	player:GossipSendMenu(1, object, MenuId)

    elseif (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 4612) then
    	player:GossipMenuAddItem(3, "Лицензия на изготовление брони", 1, 4711)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление кожаной брони", 1, 4712)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление тканевой брони", 1, 4713)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление оружия", 1, 4714)
        		player:GossipSendMenu(1, object, MenuId)

	elseif (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 2) then
			player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)

        	elseif (havefinishedfirstchoice:GetInt32(0) and havefinishedfirstchoice:GetInt32(0) == 3) then
        	player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 205)
        	 if (player:GetTeam() == 0) then
        	player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 206)
        end
        	player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 207)
        	  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Южнобережье", 1, 904)
        				end
        				if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Павший молот", 1, 905)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Дун Гарок", 1, 906)
        				end
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Опорный пункт", 1, 907)
        				end
        				 if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Мельница Таррен", 1, 908)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Заоблачный пик", 1, 909)
        				end
        	        		 player:GossipMenuAddItem(0, "Назад", 1, 7)
	end
    --player:GossipMenuAddItem(0, "Test popup box", 1, 2, nil, "Test popup")
    --player:GossipMenuAddItem(0, "Test codebox", 1, 3, true)
    --player:GossipMenuAddItem(0, "Test money requirement", 1, 4, nil, nil, 50000)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
player:GossipClearMenu()
    if (intid == 1) then
    	WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
    	for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
    --[[elseif (intid == 2) then
        OnGossipHello(event, player, object)
    elseif (intid == 3) then
        player:SendBroadcastMessage(code)
        OnGossipHello(event, player, object)
    elseif (intid == 4) then
        if (player:GetCoinage() >= 50000) then
            player:ModifyMoney(-50000)
        end
        OnGossipHello(event, player, object)
    elseif (intid == 5) then
        player:GossipComplete()]]--
        elseif (intid == 4611) then
        	WorldDBExecute("UPDATE roleplay_firstway SET choose = 4611 WHERE player = '"..player:GetName().."'")
        	player:SendUnitWhisper("- Ну вот, я стою на самом важном перекрестке в своей истории. При выборе |cfffdeaa8героического|r варианта отыгрыша, я получу дополнительные единицы устойчивости и брони, опыт будет начисляться быстрее. Еще я смогу сражаться лучше любого местного деревенщины и овладею верховой ездой! В тоже время, выбрав |cfffdeaa8мирный|r вариант отыгрыша, я обучусь дополнительным навыкам, таким как: Рыбная ловля, Кулинария, Первая помощь. Мне будет разрешено взять одну из лицензий на изготовление вещей и мой шанс удачного создания любого предмета будет выше, чем у остальных!", player)
            player:GossipMenuAddItem(9, "Героический вариант отыгрыша персонажа", 1, 4710)
        	player:GossipMenuAddItem(6, "Мирный вариант отыгрыша персонажа", 1, 4612)
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 4612) then
        		WorldDBExecute("UPDATE roleplay_firstway SET choose = 4612 WHERE player = '"..player:GetName().."'")
        		player:GossipMenuAddItem(3, "Лицензия на изготовление брони", 1, 4711)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление кожаной брони", 1, 4712)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление тканевой брони", 1, 4713)
        		player:GossipMenuAddItem(3, "Лицензия на изготовление оружия", 1, 4714)
        		player:GossipSendMenu(1, object, MenuId)
        		elseif (intid == 4710) then -- HEROOOO
        			player:LearnSpell(33388)
					player:LearnSpell(33391)
					player:LearnSpell(34090)
					player:SetSkill(762, 1, 150, 150)
					player:LearnSpell(56450)
					player:LearnSpell(56509)
					player:LearnSpell(2833)
					player:LearnSpell(19057)
					player:LearnSpell(71354)
					player:LearnSpell(57353)
					--player:LearnSpell(46052) -- 279 spd
					player:LearnSpell(25901)
					player:LearnSpell(26596)
					player:LearnSpell(26597)
					player:LearnSpell(26598)
					player:LearnSpell(33488)
					player:LearnSpell(40723)
					player:LearnSpell(41655)
					player:LearnSpell(45793)
					player:LearnSpell(45817)
					player:LearnSpell(45818)
					player:LearnSpell(71851) -- spd
        			player:LearnSpell(71852) -- spd
        			player:LearnSpell(71853) -- spd
        			--player:LearnSpell(71860) -- spd
        			WorldDBExecute("INSERT INTO roleplay_characters VALUES ('"..player:GetName().."', 1);")
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
        					for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip

        			elseif (intid == 4711) then -- OBIVATEL
        				player:AddItem(150005, 1)
        				player:LearnSpell(2550)
        				player:LearnSpell(3102)
        				player:LearnSpell(3413)
        				player:LearnSpell(3273)
        				player:LearnSpell(3274)
        				player:LearnSpell(7924)
        				player:LearnSpell(7620)
        				player:LearnSpell(7731)
        				player:LearnSpell(7732)
        				player:SetSkill(185, 2, 225, 225)
        				player:SetSkill(129, 2, 225, 225)

        				--profession
        				player:LearnSpell(3568)
        				player:LearnSpell(3539)
        				player:SetSkill(186, 2, 225, 225)
        				player:SetSkill(164, 2, 225, 225)


        					player:SetSkill(356, 2, 225, 225)
        					player:AddItem(150001, 1)
        				WorldDBExecute("INSERT INTO roleplay_characters VALUES ('"..player:GetName().."', 0);")
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
        					for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip

        			elseif (intid == 4712) then -- OBIVATEL
        				player:AddItem(150005, 1)
        				player:LearnSpell(2550)
        				player:LearnSpell(3102)
        				player:LearnSpell(3413)
        				player:LearnSpell(3273)
        				player:LearnSpell(3274)
        				player:LearnSpell(7924)
        				player:LearnSpell(7620)
        				player:LearnSpell(7731)
        				player:LearnSpell(7732)
        				player:SetSkill(185, 2, 225, 225)
        				player:SetSkill(129, 2, 225, 225)

        				--profession
        				player:LearnSpell(3812)
        				player:LearnSpell(8620)
        				player:SetSkill(393, 2, 225, 225)
        				player:SetSkill(165, 2, 225, 225)


        					player:SetSkill(356, 2, 225, 225)
        					player:AddItem(150002, 1)
        				WorldDBExecute("INSERT INTO roleplay_characters VALUES ('"..player:GetName().."', 0);")
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
        					for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip

        			elseif (intid == 4713) then -- OBIVATEL
        				player:AddItem(150005, 1)
        				player:LearnSpell(2550)
        				player:LearnSpell(3102)
        				player:LearnSpell(3413)
        				player:LearnSpell(3273)
        				player:LearnSpell(3274)
        				player:LearnSpell(7924)
        				player:LearnSpell(7620)
        				player:LearnSpell(7731)
        				player:LearnSpell(7732)
        				player:SetSkill(185, 2, 225, 225)
        				player:SetSkill(129, 2, 225, 225)

        				--profession
        				player:LearnSpell(3913)
        				player:SetSkill(197, 2, 225, 225)


        					player:SetSkill(356, 2, 225, 225)
        					player:AddItem(150003, 1)
        				WorldDBExecute("INSERT INTO roleplay_characters VALUES ('"..player:GetName().."', 0);")
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
        					for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip

        			elseif (intid == 4714) then -- OBIVATEL
        				player:AddItem(150005, 1)
        				player:LearnSpell(2550)
        				player:LearnSpell(3102)
        				player:LearnSpell(3413)
        				player:LearnSpell(3273)
        				player:LearnSpell(3274)
        				player:LearnSpell(7924)
        				player:LearnSpell(7620)
        				player:LearnSpell(7731)
        				player:LearnSpell(7732)
        				player:SetSkill(185, 2, 225, 225)
        				player:SetSkill(129, 2, 225, 225)

        				--profession
        				player:LearnSpell(3568)
        				player:LearnSpell(3539)
        				player:SetSkill(186, 2, 225, 225)
        				player:SetSkill(164, 2, 225, 225)


        					player:SetSkill(356, 2, 225, 225)
        					player:AddItem(150004, 1)
        				WorldDBExecute("INSERT INTO roleplay_characters VALUES ('"..player:GetName().."', 0);")
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 1 WHERE player = '"..player:GetName().."'")
        					for k,v in pairs(MSG_FAMILY) do
    		local msg = MSG_FAMILY[k]
        player:GossipMenuAddItem(1, msg, 1, 100+k)
    end
        player:GossipMenuAddItem(0, "Назад", 1, 6)
        player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip


        elseif (intid == 7) then
        	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:RemoveAura(91231)
        	player:RemoveAura(91230)
        	player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
        	player:GossipSendMenu(1, object, MenuId)

    elseif (intid == 6) then
        OnGossipHello(event, player, object)

        	elseif (intid == 101) then
        	player:AddItem(36560,2)
        	player:AddItem(3342, 1) player:AddItem(21002, 1)  player:AddItem(794, 1) player:AddItem(25342,1)
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 102) then
        	player:AddItem(15242,2)
        	player:AddItem(53, 1) player:AddItem(52,1) player:AddItem(6148, 1) player:AddItem(21002,1)
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 103) then
        	player:AddItem(3400,1) player:AddItem(15543,1)
        	player:AddItem(2105,1) player:AddItem(3976,1) player:AddItem(3974,1) player:AddItem(3970,1) player:AddItem(3973,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 104) then
        	player:AddItem(2160,1) player:AddItem(3442,1) player:AddItem(2159,1) player:AddItem(21008,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 105) then
        	player:AddItem(8180,1)
        	player:AddItem(2515, 250)
        	player:AddItem(44743,1) player:AddItem(2069,1) player:AddItem(33373,1) player:AddItem(1423,1) player:AddItem(3801,1) player:AddItem(3973,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 106) then
        	player:AddItem(8246,1) 
        	player:AddItem(3342,1) player:AddItem(2121,1) player:AddItem(3363,1) player:AddItem(2437, 1)
        	player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 107) then
        	player:AddItem(3079,1) 
        	player:AddItem(3886,1) player:AddItem(3342,1) player:AddItem(3959,1) player:AddItem(3363,1) player:AddItem(3967,1) player:AddItem(3953,1) player:AddItem(3956,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 108) then
        	player:AddItem(3488,1) 
        	player:AddItem(41249,1) player:AddItem(3363,1) player:AddItem(21006,1) player:AddItem(3953,1) player:AddItem(1430,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 109) then
        	player:AddItem(913,1) 
        	player:AddItem(6120,1) player:AddItem(2370,1) player:AddItem(4982,1) player:AddItem(1423,1) player:AddItem(2467,1) player:AddItem(4973,1) player:AddItem(2375,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 110) then
        	player:AddItem(25200,2) 
        	player:AddItem(33378,1) player:AddItem(6120,1) player:AddItem(33372,1) player:AddItem(4982,1) player:AddItem(33377,1) player:AddItem(33374,1) player:AddItem(33376,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 111) then
        	player:AddItem(15282,1) 
        	player:AddItem(6140,1) player:AddItem(21008,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 112) then
        	player:AddItem(38579,1) 
        	player:AddItem(44743,1) player:AddItem(21007,1) player:AddItem(21008,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 113) then
        	player:AddItem(23498,1) 
        	player:AddItem(5107,1) player:AddItem(4693,1) player:AddItem(21013,1) player:AddItem(33374,1) player:AddItem(23498,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 114) then
        	player:AddItem(4571,1) 
        	player:AddItem(25349,1) player:AddItem(25350,1) player:AddItem(25355,1) player:AddItem(25351,1) player:AddItem(25353,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 115) then
        	player:AddItem(11873,1) 
        	player:AddItem(42377,1) player:AddItem(3376,1) player:AddItem(201,1) player:AddItem(3953,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 116) then
        	player:AddItem(1485,1) 
        	player:AddItem(1786,1) player:AddItem(1784,1) player:AddItem(25342,1) player:AddItem(8749,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 117) then
        	player:AddItem(23505,1) 
        	player:AddItem(2435,1) player:AddItem(2464,1) player:AddItem(2465,1) player:AddItem(2467,1) player:AddItem(23505,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 118) then
        	player:AddItem(15276,1) 
        	player:AddItem(6140,1) player:AddItem(20985,1) player:AddItem(1479,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 119) then
        	player:AddItem(20723,1) 
        	player:AddItem(837,1) player:AddItem(3363,1) player:AddItem(25346,1) player:AddItem(21008,1) player:AddItem(3940,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 120) then
        	player:AddItem(25933,1) 
        	player:AddItem(22742,1) player:AddItem(20989,1) player:AddItem(6076,1) player:AddItem(33366,1) 
        	player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 121) then
        	player:AddItem(6429,1) 
        	player:AddItem(6144,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 122) then
        	player:AddItem(2616,1) player:AddItem(1427,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 123) then
        	player:AddItem(15263,1) 
        	player:AddItem(45,1) player:AddItem(3151,1) player:AddItem(1845,1) player:AddItem(33369,1) player:AddItem(43,1) player:AddItem(2397,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 124) then
        	player:AddItem(2231,1) player:AddItem(43,1) 
        	player:AddItem(38262,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)
        	elseif (intid == 125) then
        	player:AddItem(15443,1) 
        	player:AddItem(2429,1) player:AddItem(3593,1) player:AddItem(2431,1) player:AddItem(2432,1) player:AddItem(2434,1) 
        		player:GossipMenuAddItem(4, MSG_SCALE[1], 1, 201)
        	player:GossipMenuAddItem(4, MSG_SCALE[2], 1, 202)
        	player:GossipMenuAddItem(4, MSG_SCALE[3], 1, 203)
        	player:GossipMenuAddItem(4, MSG_SCALE[4], 1, 204)
	player:SendUnitWhisper("- Хм, а вот тут написано:\nРасскажи мне подробнее о том, какого роста ты сейчас.", player)
	WorldDBExecute("UPDATE roleplay_firstway SET choose = 2 WHERE player = '"..player:GetName().."'")
        	player:GossipSendMenu(1, object, MenuId)

        	elseif (intid == 201) then
        		player:SendUnitWhisper("- Теперь мне предосит выбрать, откуда же начать мое путешествие.", player)
        		player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 205)
        		 if (player:GetTeam() == 0) then
        		player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 206)
        	end
        		player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 207)
        		  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Южнобережье", 1, 904)
        				end
        				if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Павший молот", 1, 905)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Дун Гарок", 1, 906)
        				end
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Опорный пункт", 1, 907)
        				end
        				 if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Мельница Таррен", 1, 908)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Заоблачный пик", 1, 909)
        				end
        	        		 player:GossipMenuAddItem(0, "Назад", 1, 7)
        		 player:GossipSendMenu(1, object, MenuId)
        		WorldDBExecute("UPDATE roleplay_firstway SET choose = 3 WHERE player = '"..player:GetName().."'")
        		player:CastSpell(player, 91230)
        		elseif (intid == 202) then
        			player:SendUnitWhisper("- Теперь мне предосит выбрать, откуда же начать мое путешествие.", player)
        			player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 205)
        			 if (player:GetTeam() == 0) then
        			player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 206)
        		end
        			player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 207)
        			  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Южнобережье", 1, 904)
        				end
        				if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Павший молот", 1, 905)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Дун Гарок", 1, 906)
        				end
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Опорный пункт", 1, 907)
        				end
        				 if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Мельница Таррен", 1, 908)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Заоблачный пик", 1, 909)
        				end
        	        		 player:GossipMenuAddItem(0, "Назад", 1, 7)
        			player:GossipSendMenu(1, object, MenuId)
        			WorldDBExecute("UPDATE roleplay_firstway SET choose = 3 WHERE player = '"..player:GetName().."'")
        			elseif (intid == 203) then
        				player:SendUnitWhisper("- Теперь мне предосит выбрать, откуда же начать мое путешествие.", player)
        				 player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 205)
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 206)
        				end
        				 player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 207)
        				   if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Южнобережье", 1, 904)
        				end
        				if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Павший молот", 1, 905)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Дун Гарок", 1, 906)
        				end
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Опорный пункт", 1, 907)
        				end
        				 if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Мельница Таррен", 1, 908)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Заоблачный пик", 1, 909)
        				end
        	        		 player:GossipMenuAddItem(0, "Назад", 1, 7)
        				player:GossipSendMenu(1, object, MenuId)
        				WorldDBExecute("UPDATE roleplay_firstway SET choose = 3 WHERE player = '"..player:GetName().."'")
        				player:CastSpell(player, 91231)
        				elseif (intid == 204) then
        					player:SendUnitWhisper("- Теперь мне предосит выбрать, откуда же начать мое путешествие.", player)
        					player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 205)
        					 if (player:GetTeam() == 0) then
        					player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 206)
        				end
        					player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 207)
        					  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Южнобережье", 1, 904)
        				end
        				if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Павший молот", 1, 905)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Дун Гарок", 1, 906)
        				end
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Опорный пункт", 1, 907)
        				end
        				 if (player:GetTeam() == 1) then
        				 player:GossipMenuAddItem(2, "Мельница Таррен", 1, 908)
        				end
        				  if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "Заоблачный пик", 1, 909)
        				end
        	        		 player:GossipMenuAddItem(0, "Назад", 1, 7)
        					player:GossipSendMenu(1, object, MenuId)
        					WorldDBExecute("UPDATE roleplay_firstway SET choose = 3 WHERE player = '"..player:GetName().."'")
        					player:CastSpell(player, 91231)
        					player:CastSpell(player, 91231)
        					
        					elseif (intid == 205) then
        						object:DespawnOrUnsummon()
        						player:GiveLevel(40)
        						if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
        						--player:SendUnitSay(player:GetClassAsString(), 0)
        						if (player:GetClassAsString() == "Warrior") then
        							player:LearnSpell(71)
        							player:LearnSpell(750)
        						end
        						if (player:GetClassAsString() == "Hunter") then
        							player:LearnSpell(8737)
        							player:LearnSpell(883)
        							player:LearnSpell(1515)
        							player:LearnSpell(6991)
        							player:LearnSpell(19885)
        							player:LearnSpell(2641)
        							player:LearnSpell(982)
        						end
        						if (player:GetClassAsString() == "Rogue") then
        							player:LearnSpell(90001)
        						end
        						if (player:GetClassAsString() == "Shaman") then
        							player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
        						end
        						if (player:GetClassAsString() == "Paladin") then
        							player:LearnSpell(750)
        						end
        						--xxx--
        						player:RemoveItem(6948, 100)
        						player:AddItem(159,5) 
        						if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
        						player:AddItem(4536,5) 
        						WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
        						object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
        						player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
								player:Teleport(0, -10418.123, 940.65844, 38.2745, 1.62)
								player:SetBindPoint(-10418.123, 940.65844, 38.2745, 0, 40)
								player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)

								elseif (intid == 206) then
								object:DespawnOrUnsummon()
        						player:GiveLevel(40)
        						if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
        						--player:SendUnitSay(player:GetClassAsString(), 0)
        						if (player:GetClassAsString() == "Warrior") then
        							player:LearnSpell(71)
        							player:LearnSpell(750)
        						end
        						if (player:GetClassAsString() == "Hunter") then
        							player:LearnSpell(8737)
        							player:LearnSpell(883)
        							player:LearnSpell(1515)
        							player:LearnSpell(6991)
        							player:LearnSpell(19885)
        							player:LearnSpell(2641)
        							player:LearnSpell(982)
        						end
        						if (player:GetClassAsString() == "Rogue") then
        							player:LearnSpell(90001)
        						end
        						if (player:GetClassAsString() == "Shaman") then
        							player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
        						end
        						if (player:GetClassAsString() == "Paladin") then
        							player:LearnSpell(750)
        						end
        						--xxx--
        						player:RemoveItem(6948, 100)
        						player:AddItem(159,5) 
        						if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
        						player:AddItem(4536,5) 
        						WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
        						object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
        						player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
								player:Teleport(0, -8627.1162, 456.198, 102.708, 3.163308)
								player:SetBindPoint(-8627.1162, 456.198, 102.708, 0, 1519)
								player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				elseif (intid == 207) then
								object:DespawnOrUnsummon()
        						player:GiveLevel(40)
        						if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
        						--player:SendUnitSay(player:GetClassAsString(), 0)
        						if (player:GetClassAsString() == "Warrior") then
        							player:LearnSpell(71)
        							player:LearnSpell(750)
        						end
        						if (player:GetClassAsString() == "Hunter") then
        							player:LearnSpell(8737)
        							player:LearnSpell(883)
        							player:LearnSpell(1515)
        							player:LearnSpell(6991)
        							player:LearnSpell(19885)
        							player:LearnSpell(2641)
        							player:LearnSpell(982)
        						end
        						if (player:GetClassAsString() == "Rogue") then
        							player:LearnSpell(90001)
        						end
        						if (player:GetClassAsString() == "Shaman") then
        							player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
        						end
        						if (player:GetClassAsString() == "Paladin") then
        							player:LearnSpell(750)
        						end
        						--xxx--
        						player:RemoveItem(6948, 100)
        						player:AddItem(159,5) 
        						if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
        						player:AddItem(4536,5) 
        						WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
        						object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
        						player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
								player:Teleport(0, -10758.74, -1234.826904, 31.66, 0.397)
								player:SetBindPoint(-10758.74, -1234.826904, 31.66, 0, 42)
								player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				elseif (intid == 904) then
								object:DespawnOrUnsummon()
        						player:GiveLevel(40)
        						if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
        						--player:SendUnitSay(player:GetClassAsString(), 0)
        						if (player:GetClassAsString() == "Warrior") then
        							player:LearnSpell(71)
        							player:LearnSpell(750)
        						end
        						if (player:GetClassAsString() == "Hunter") then
        							player:LearnSpell(8737)
        							player:LearnSpell(883)
        							player:LearnSpell(1515)
        							player:LearnSpell(6991)
        							player:LearnSpell(19885)
        							player:LearnSpell(2641)
        							player:LearnSpell(982)
        						end
        						if (player:GetClassAsString() == "Rogue") then
        							player:LearnSpell(90001)
        						end
        						if (player:GetClassAsString() == "Shaman") then
        							player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
        						end
        						if (player:GetClassAsString() == "Paladin") then
        							player:LearnSpell(750)
        						end
        						--xxx--
        						player:RemoveItem(6948, 100)
        						player:AddItem(159,5) 
        						if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
        						player:AddItem(4536,5) 
        						WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
        						object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
        						player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
								player:Teleport(0, -783.825, -247.698074, 18.29, 4.764)
                                                                player:SetBindPoint(-783.825, -247.698074, 18.29, 0, 267)
								player:RemoveAura(52970)
								player:RemoveAura(44816)
								player:RemoveAura(35182)
												player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
                                elseif (intid == 905) then
                                                                object:DespawnOrUnsummon()
                                                        player:GiveLevel(40)
                                                        if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
                                                        --player:SendUnitSay(player:GetClassAsString(), 0)
                                                        if (player:GetClassAsString() == "Warrior") then
                                                                player:LearnSpell(71)
                                                                player:LearnSpell(750)
                                                        end
                                                        if (player:GetClassAsString() == "Hunter") then
                                                                player:LearnSpell(8737)
                                                                player:LearnSpell(883)
                                                                player:LearnSpell(1515)
                                                                player:LearnSpell(6991)
                                                                player:LearnSpell(19885)
                                                                player:LearnSpell(2641)
                                                                player:LearnSpell(982)
                                                        end
                                                        if (player:GetClassAsString() == "Rogue") then
                                                                player:LearnSpell(90001)
                                                        end
                                                        if (player:GetClassAsString() == "Shaman") then
                                                                player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
                                                        end
                                                        if (player:GetClassAsString() == "Paladin") then
                                                                player:LearnSpell(750)
                                                        end
                                                        --xxx--
                                                        player:RemoveItem(6948, 100)
                                                        player:AddItem(159,5) 
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
                                                        player:AddItem(4536,5) 
                                                        WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
                                                        object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
                                                        player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                                                player:Teleport(0, -815, -3507.858154, 72.8834, 3.6853)
                                                                player:SetBindPoint(-815, -3507.858154, 72.8834, 0, 321)
                                                                player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                elseif (intid == 906) then
                                                                object:DespawnOrUnsummon()
                                                        player:GiveLevel(40)
                                                        if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
                                                        --player:SendUnitSay(player:GetClassAsString(), 0)
                                                        if (player:GetClassAsString() == "Warrior") then
                                                                player:LearnSpell(71)
                                                                player:LearnSpell(750)
                                                        end
                                                        if (player:GetClassAsString() == "Hunter") then
                                                                player:LearnSpell(8737)
                                                                player:LearnSpell(883)
                                                                player:LearnSpell(1515)
                                                                player:LearnSpell(6991)
                                                                player:LearnSpell(19885)
                                                                player:LearnSpell(2641)
                                                                player:LearnSpell(982)
                                                        end
                                                        if (player:GetClassAsString() == "Rogue") then
                                                                player:LearnSpell(90001)
                                                        end
                                                        if (player:GetClassAsString() == "Shaman") then
                                                                player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
                                                        end
                                                        if (player:GetClassAsString() == "Paladin") then
                                                                player:LearnSpell(750)
                                                        end
                                                        --xxx--
                                                        player:RemoveItem(6948, 100)
                                                        player:AddItem(159,5) 
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
                                                        player:AddItem(4536,5) 
                                                        WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
                                                        object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
                                                        player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                                               player:Teleport(0, -1420.726196, -1115.893311, 35.334522, 2.089330)
                                                                player:SetBindPoint(-1420.726196, -1115.893311, 35.334522, 0, 294)
                                                                player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                elseif (intid == 907) then
                                                                object:DespawnOrUnsummon()
                                                        player:GiveLevel(40)
                                                        if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        player:LearnSpell(9116)
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
                                                        --player:SendUnitSay(player:GetClassAsString(), 0)
                                                        if (player:GetClassAsString() == "Warrior") then
                                                                player:LearnSpell(71)
                                                                player:LearnSpell(750)
                                                        end
                                                        if (player:GetClassAsString() == "Hunter") then
                                                                player:LearnSpell(8737)
                                                                player:LearnSpell(883)
                                                                player:LearnSpell(1515)
                                                                player:LearnSpell(6991)
                                                                player:LearnSpell(19885)
                                                                player:LearnSpell(2641)
                                                                player:LearnSpell(982)
                                                        end
                                                        if (player:GetClassAsString() == "Rogue") then
                                                                player:LearnSpell(90001)
                                                        end
                                                        if (player:GetClassAsString() == "Shaman") then
                                                                player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
                                                        end
                                                        if (player:GetClassAsString() == "Paladin") then
                                                                player:LearnSpell(750)
                                                        end
                                                        --xxx--
                                                        player:RemoveItem(6948, 100)
                                                        player:AddItem(159,5) 
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
                                                        player:AddItem(4536,5) 
                                                        WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
                                                        object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
                                                        player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                                               player:Teleport(0, -1450.689087, -2429.699463, 59.751411, 4.263313)
                                                                player:SetBindPoint(-1450.689087, -2429.699463, 59.751411, 0, 45)
                                                                player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                elseif (intid == 908) then
                                                                object:DespawnOrUnsummon()
                                                        player:GiveLevel(40)
                                                        if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
                                                        --player:SendUnitSay(player:GetClassAsString(), 0)
                                                        if (player:GetClassAsString() == "Warrior") then
                                                                player:LearnSpell(71)
                                                                player:LearnSpell(750)
                                                        end
                                                        if (player:GetClassAsString() == "Hunter") then
                                                                player:LearnSpell(8737)
                                                                player:LearnSpell(883)
                                                                player:LearnSpell(1515)
                                                                player:LearnSpell(6991)
                                                                player:LearnSpell(19885)
                                                                player:LearnSpell(2641)
                                                                player:LearnSpell(982)
                                                        end
                                                        if (player:GetClassAsString() == "Rogue") then
                                                                player:LearnSpell(90001)
                                                        end
                                                        if (player:GetClassAsString() == "Shaman") then
                                                                player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
                                                        end
                                                        if (player:GetClassAsString() == "Paladin") then
                                                                player:LearnSpell(750)
                                                        end
                                                        --xxx--
                                                        player:RemoveItem(6948, 100)
                                                        player:AddItem(159,5) 
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
                                                        player:AddItem(4536,5) 
                                                        WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
                                                        object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
                                                        player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                                               player:Teleport(0, -16.2, -1104.373169, 36.524387, 1.536354)
                                                                player:SetBindPoint(-16.2, -1104.373169, 36.524387, 0, 267)
                                                                player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                elseif (intid == 909) then
                                                                object:DespawnOrUnsummon()
                                                       player:GiveLevel(40)
                                                       if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        player:LearnSpell(90124)
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
                                                        --player:LearnSpell(90502)
                                                        player:LearnSpell(97001)
                                                        --classspells(weaponz)--
                                                        player:LearnSpell(5011)
                                                        player:LearnSpell(107)
                                                        if not(player:GetClassAsString() == "Mage" or player:GetClassAsString() == "Priest" or player:GetClassAsString() == "Warlock" or player:GetClassAsString() == "Druid") then
                                                        player:LearnSpell(9116)
                                                    end
                                                        player:LearnSpell(674)
                                                        --player:LearnSpell(5019)
                                                        player:LearnSpell(5384)
                                                        player:LearnSpell(16723)
                                                        if not(player:GetClassAsString() == "Rogue") then
                                                        player:LearnSpell(199)
                                                        player:LearnSpell(202)
                                                        player:LearnSpell(197)
                                                        player:LearnSpell(200)
                                                    end
                                                        --player:LearnSpell(5009)
                                                        player:LearnSpell(3018)
                                                        player:LearnSpell(1180)
                                                        player:LearnSpell(15590)
                                                        player:LearnSpell(264)
                                                        player:LearnSpell(198)
                                                        player:LearnSpell(201)
                                                        player:LearnSpell(196)
                                                        player:LearnSpell(227)
                                                        player:LearnSpell(266)
                                                        --player:SendUnitSay(player:GetClassAsString(), 0)
                                                        if (player:GetClassAsString() == "Warrior") then
                                                                player:LearnSpell(71)
                                                                player:LearnSpell(750)
                                                        end
                                                        if (player:GetClassAsString() == "Hunter") then
                                                                player:LearnSpell(8737)
                                                                player:LearnSpell(883)
                                                                player:LearnSpell(1515)
                                                                player:LearnSpell(6991)
                                                                player:LearnSpell(19885)
                                                                player:LearnSpell(2641)
                                                                player:LearnSpell(982)
                                                        end
                                                        if (player:GetClassAsString() == "Rogue") then
                                                                player:LearnSpell(90001)
                                                        end
                                                        if (player:GetClassAsString() == "Shaman") then
                                                                player:LearnSpell(8737)
        							player:AddItem(5175, 1)
        							player:AddItem(5176, 1)
        							player:AddItem(5177, 1)
        							player:AddItem(5178, 1)
                                                        end
                                                        if (player:GetClassAsString() == "Paladin") then
                                                                player:LearnSpell(750)
                                                        end
                                                        --xxx--
                                                        player:RemoveItem(6948, 100)
                                                        player:AddItem(159,5) 
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 1) then
        								player:AdvanceSkillsToMax()
        								player:SendUnitWhisper("|cffFF0000!ВНИМАНИЕ!|r убедительная просьба совершить повторный вход в игровой мир, некоторые из бонусов могли не сработать для вашего персонажа.", player)
        						
        						end
                                                        player:AddItem(4536,5) 
                                                        WorldDBExecute("DELETE FROM roleplay_firstway WHERE player = '"..player:GetName().."';")
                                                        object:SendUnitWhisper("[SADDON_FADEOUT]|cfffdeaa8Добро пожаловать на |cff7fc800наш сервер|cfffdeaa8. Скорее погружайтесь в уютную атмосферу ролевой игры, желаем удачных приключений!", player)
                                                        player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)
                                                               player:Teleport(0, 83.835, -2092.365479, 112.9925, 0.506741)
                                                                player:SetBindPoint(83.835, -2092.365479, 112.9925, 0, 1880)
                                                                player:RemoveAura(52970)
                                                                player:RemoveAura(44816)
                                                                player:RemoveAura(35182)
                                                                                                player:RemoveFlag(150,0x00800000)
                                player:RemoveFlag(150,0x01000000)

    end
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)



local function samsaura(event, player, msg, Type, lang)
	if (msg == "[SADDON_SAMSAURADEBUG]") then
	player:AddAura(26659, player)
	return false;
	elseif (msg == "[SADDON_REMOVESAMS]") then
		player:RemoveAura(26659)
		return false;
end
	end
	RegisterPlayerEvent(18, samsaura)


local function factionchange(event, player, msg, Type, lang)
	if (msg:find("%[SADDON_FACTION_.*%]") and not(player:IsAFK())) then

		local exp = WorldDBQuery("SELECT exp FROM roleplay_levelup WHERE player = '"..player:GetName().."';")
		if (exp) then
			--720--
			if (exp:GetInt32(0) >= 1800 and (player:GetLevel() < 45)) then
				player:GiveXP(7900)
				WorldDBExecute("DELETE FROM roleplay_levelup WHERE player = '"..player:GetName().."';")
			else
				local addexp = exp:GetInt32(0)+1
		WorldDBExecute("UPDATE roleplay_levelup SET exp = "..addexp.." WHERE player = '"..player:GetName().."';")
	end
	else
		WorldDBExecute("INSERT INTO roleplay_levelup VALUES ('"..player:GetName().."', 0);")
	end

		local _,_,faction = msg:find("%[SADDON_FACTION_(.*)%]")
    			local hasitem = nil
		factiontochange = 0
		----
		for k in pairs(factionitems) do
			for n in pairs(factionitems[k]) do
				for m, v in pairs(factionitems[k][n]) do
					local areaid = v
					if (player:GetAreaId() == areaid or v == "all") then
					---NOTALLBEGIN
		for i = 0, 38 do
		local item = player:GetItemByPos(-1, i)
		if (item) then
			if (item:GetEntry() == k and item:IsEquipped()) then
				hasitem = item
		end
		end
		end
					if (hasitem) then
						factiontochange = n
						hasitem = nil
					end
					---NOTALLAEND
					end
				end
			end
		end
		if (factiontochange > 0) then
			player:SetFaction(factiontochange)
			factiontochange = 0
					else
						player:SetFactionForRace(player:GetRace())
					end
		----
		return false;
	end
end
RegisterPlayerEvent(18, factionchange)

local function addflags(event, player)
	player:SendBroadcastMessage("[SADDON_CURRBUILD_"..build.."]")
	
	if (WorldDBQuery("SELECT player FROM roleplay_stunned WHERE player = '"..player:GetName().."';")) then
		player:SetFlag(150,0x00800000)
		player:SetFlag(150,0x01000000)
	end

    			local hasitem = nil
		factiontochange = 0
		----
		for k in pairs(factionitems) do
			for n in pairs(factionitems[k]) do
				for m, v in pairs(factionitems[k][n]) do
					local areaid = v
					if (player:GetAreaId() == areaid or v == "all") then
					---NOTALLBEGIN
		for i = 0, 38 do
		local item = player:GetItemByPos(-1, i)
		if (item) then
			if (item:GetEntry() == k and item:IsEquipped()) then
				hasitem = item
		end
		end
		end
					if (hasitem) then
						factiontochange = n
						hasitem = nil
					end
					---NOTALLAEND
					end
				end
			end
		end
		if (factiontochange > 0) then
			player:SetFaction(factiontochange)
			factiontochange = 0
					else
						player:SetFactionForRace(player:GetRace())
					end
		----
	end
	RegisterPlayerEvent(3, addflags)



local function databazekiller()
	local plrs = GetPlayersInWorld()
if(plrs) then
    for k, player in ipairs(plrs) do
        if (player) then
        	if (player:HasAura(90500)) then
        		if not(WorldDBQuery("SELECT player FROM roleplay_canbekilled WHERE player = '"..player:GetName().."';")) then
        			WorldDBExecute("INSERT INTO roleplay_canbekilled VALUES ('"..player:GetName().."');")
        		end
        		elseif (WorldDBQuery("SELECT player FROM roleplay_canbekilled WHERE player = '"..player:GetName().."';")) then
        			WorldDBExecute("DELETE FROM roleplay_canbekilled WHERE player = '"..player:GetName().."';")
        			--[[elseif (CharDBQuery("SELECT phase FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")) then
        				player:SetPhaseMask(CharDBQuery("SELECT phase FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";"):GetInt32(0))]]--
        	end
        	if (player:IsPvPFlagged()) then
        		player:SetFFA(true)
        	else
        		player:SetFFA(false)
        	end
        end
    end
end
end
CreateLuaEvent(databazekiller, 50, 0)