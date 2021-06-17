local function hidemessage(event, player, msg, Type, lang)
	if (msg == "[SADDON_FIGHTSTARTED]") then
		return false;
	end
	if (msg:find("%[SADDON.*")) then
		return false;
	end
end
RegisterPlayerEvent(18, hidemessage)

local BADPLAYER = nil
local function carcer(event, player, msg, Type, lang)
	if (msg == "[SADDON_FIGHTSTARTED]" and player:GetSelectedPlayer()) then
		local straj = player:GetNearestCreature(8, 90001)
		if (straj) then
			player:AddAura(35182, player)
			player:SetFlag(150,0x00800000)
			player:SetFlag(150,0x01000000)
			straj:SendUnitSay("- Вы и тут умудряетесь нарушать закон, недоноски... В карцер!", 0)
			straj:SendUnitWhisper("[SADDON_FADEIN]И гнить тебе до конца твоего срока в карцере.", player)
			straj:MoveTo(1, player:GetX(), player:GetY(), player:GetZ())
			BADPLAYER = player
		end
		end
	end
RegisterPlayerEvent(18, carcer)
local function tocarcer(event, creature, type, id)
	if (id == 1) then
		--local listofplayer = creature:GetPlayersInRange(2)
		--if (listofplayer) then
		--for k, v in pairs(listofplayer) do
			 player = BADPLAYER
		--end
	--end
--if (player) then
	player:SendUnitWhisper("[SADDON_FADEOUT]Похоже мне придется долго тут просидеть.", player)
	player:RemoveAura(35182)
					player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..player:GetName().."';") -- DB
	player:Teleport(35, 0.0511, 94.126, -40.050667, 3.199544)

	player:SetBindPoint(0.0511, 94.126, -40.050667, 35, 717)
	player:AddItem(90020, 40)
	if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..player:GetName().."';")) then
			WorldDBExecute("UPDATE roleplay_jail SET state = 2 WHERE player = '"..player:GetName().."';")
		end
--end
	creature:MoveHome()
end
end
RegisterCreatureEvent(90001, 6, tocarcer)



local function sendtoprison(player)
	player:SetBindPoint(-42.766251, 118.957657, -40.1, 35, 717)
			for i = 0, 38 do
		local item = player:GetItemByPos(-1, i)
		if (item) then
		SendMail("Штормградская тюрьма", "Возвращение ваших вещей.", player:GetGUIDLow(), player, 0, 0, item:GetEntry(), item:GetCount())
		player:RemoveItem(item:GetEntry(), item:GetCount())
end
end
		player:AddItem(859, 1)
		player:AddItem(1396, 1)
		player:AddItem(11191, 1)
		player:AddItem(3377, 1)
end

local function leaveprison(player)
		player:SetBindPoint(-8804.816, 471.41, 95.1055, 0, 1519)
		player:RemoveItem(859, 100)
		player:RemoveItem(1396, 100)
		player:RemoveItem(11191, 100)
		player:RemoveItem(3377, 100)
	end

local horse_id = {5403, 5406, 5405, 5404, 12376, 14559, 15460, 14561}
local num = 0
local function HourseCustomSpell(event, creature, unit)
	num = num+1
if (num == 15) then
	local customspellornot = math.random(1, 2)
		if (customspellornot == 1) then
				creature:RemoveAura(55587)
		elseif (customspellornot == 2) then
				creature:AddAura(55587, creature)
		end
num = 0
end
end
for k, v in pairs(horse_id) do
RegisterCreatureEvent(v, 27, HourseCustomSpell)
end

local gruntids = {
}
local factionids = {
	88, -- dwarwes of dungarok
	11, -- stormwind guards
	57, -- ironforge
	56, -- night watch
	--71, -- undercity
	--85, -- orgrimmar
	64, -- gnomerigan
	473, -- chernii woron
	1625, -- serebryanni rassvet
	814, -- serebryanni rassvet
	123, -- arathor
	1054, -- wildhammer dwarf
	--1603, -- lunosvet
	76, -- dalaran mages (EASTERN KINGDOM)
	79, -- darnas
	1575, -- straji pustoti
	--412, -- oskvernitely
	1577 -- liga arathora
}
for k, v in pairs(factionids) do 
	local entry = WorldDBQuery("SELECT entry FROM creature_template WHERE faction_A = "..v..";")
	if (entry) then
		for i = 1, entry:GetRowCount() do
			table.insert(gruntids, entry:GetInt32(0))
			entry:NextRow()
		end
	end
	end

local function patrul(event, player, msg, Type, lang)
	if (msg == "[SADDON_FIGHTSTARTED]" and player:GetSelectedPlayer() and ((player:IsAlliance() and player:GetSelectedPlayer():IsAlliance()) or (player:IsHorde() and player:GetSelectedPlayer():IsHorde()))) then
		local massiveoffriendlycreatures = player:GetFriendlyUnitsInRange(15)

		for n, m in pairs(massiveoffriendlycreatures) do
		local idofnearestfirnedlymob = m:GetEntry()

	for k, v in pairs(gruntids) do
		if (v == idofnearestfirnedlymob) then
			local creature = nil
			while not(creature) do 
				creature = player:GetNearestCreature(15, v)
			end
	if (creature and not (creature:GetFaction() == player:GetFaction())) then
				creature:SendUnitSay("Стой, нарушитель закона!", 0)
		local creatureverynear = player:GetNearestCreature(3, creature:GetEntry())
			if (creatureverynear) then
		player:AddAura(47923, player)
		creature:MoveChase(player)
		creature:CastSpell(player, 51959)
		creature:SendUnitWhisper("[SADDON_BATTLEGRUNT_FINISHED]Ну что, спета твоя песенка?", player)
		player:AddAura(35182, player)
		player:SetFlag(150,0x00800000)
		player:SetFlag(150,0x01000000)
			WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..player:GetName().."');") -- DB
			return false
	else
		creature:SendUnitWhisper("[SADDON_BATTLEGRUNT_AGRO15METROV]А ну стой, сейчас я тебе покажу! "..creature:GetGUIDLow(), player)
		player:AddAura(35182, player)
		player:SetFlag(150,0x00800000)
		player:SetFlag(150,0x01000000)
			WorldDBExecute("INSERT INTO roleplay_stunned VALUES ('"..player:GetName().."');") -- DB
		creature:MoveChase(player)
		return false
	end
end
end

end
end

 return false;
end
end
local function factionback(event, creature)
	local faction = WorldDBQuery("SELECT faction_A FROM creature_template where entry = '"..creature:GetEntry().."';")
	creature:SetFaction(faction:GetInt32(0))
end
for k, v in pairs(gruntids) do
RegisterCreatureEvent(v, 2, factionback)
RegisterCreatureEvent(v, 3, factionback)
end

local function patrul_go_jail(event, player, msg, Type, lang)
	if (msg == "[SADDON_GOPRISON_GRUNT]") then
						player:RemoveAura(47923)
				player:RemoveAura(35182)
								player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..player:GetName().."';") -- DB
		for k, v in pairs(gruntids) do
	local creature = player:GetNearestCreature(15, v)
	if (creature) then
				creature:SendUnitSay("И гнить тебе там до конца твоих дней, жалкий ублюдок!", 0)
				player:SendUnitWhisper("[SADDON_FADEOUT]За это нарушение меня отправили в тюрьму на два часа.", player)
				WorldDBExecute("INSERT INTO roleplay_jail VALUES ('"..player:GetName().."', 0, UNIX_TIMESTAMP());")
				player:Teleport(35, -42.766251, 118.957657, -40.1, 1.6)
				sendtoprison(player)
				creature:MoveHome()
			end
		end
		 return false;
	end
end

	local function patrul_go_killme(event, player, msg, Type, lang)
		if (msg == "[SADDON_GOFUCK_GRUNT]") then
		player:RemoveAura(47923)
		player:RemoveAura(35182)
						player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..player:GetName().."';") -- DB

								if (WorldDBQuery("SELECT nickname FROM roleplay_headhunting WHERE nickname = '"..player:GetName().."';")) then
		WorldDBExecute("UPDATE roleplay_headhunting SET gold = gold+500 WHERE nickname = '"..player:GetName().."';")
		else
		WorldDBExecute("INSERT INTO roleplay_headhunting VALUES ('"..player:GetName().."', 500, 'Казна королевства');")
		SendWorldMessage("|cfffdeaa8Сегодня список охотников за головами пополнился новым именем. |cff7fc800"..player:GetName().." |cfffdeaa8разыскивается по всему Азероту, и тот, кто первый нанесет ему(ей) поражение, получит награду.|r");
	end
	
			for k, v in pairs(gruntids) do
	local creatures = player:GetCreaturesInRange(20, v)
	if (creatures) then
	for n, creature in pairs(creatures) do
	if (creature) then
		--player:SetReputation(creature:GetFaction(), player:GetReputation(creature:GetFaction())-500)
			creature:SendUnitSay("Как пожелаешь, подлая тварь!", 0)
				creature:SetFaction(7)
		creature:AttackStart(player)
			end
		end
	end
end
		 return false;
		end
	end

		local function patrul_go_shtraf(event, player, msg, Type, lang)
			if (msg == "[SADDON_PAYTO_GRUNT]") then
			    player:RemoveAura(47923)
				player:RemoveAura(35182)
								player:RemoveFlag(150,0x00800000)
				player:RemoveFlag(150,0x01000000)
				WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..player:GetName().."';") -- DB
				if (player:GetCoinage() >= 2500) then
				player:ModifyMoney(-2500)
				for k, v in pairs(gruntids) do
	local creature = player:GetNearestCreature(15, v)
	if (creature) then
		creature:SendUnitSay("На первый раз с тебя хватит, но увижу еще раз - прибью.", 0)
		creature:MoveHome()
		local faction = WorldDBQuery("SELECT faction_A FROM creature_template where entry = '"..creature:GetEntry().."';")
			creature:SetFaction(faction:GetInt32(0))
		end
	end
			else
				for k, v in pairs(gruntids) do
	local creature = player:GetNearestCreature(15, v)
	if (creature) then
				creature:SendUnitSay("Да у тебя же нету золота, паскуда. Сейчас я отправлю тебя гнить до конца твоих дней в тюрьму.", 0)
				creature:MoveHome()
				player:SendUnitWhisper("[SADDON_FADEOUT]За это нарушение меня отправили в тюрьму на два часа.", player)
				WorldDBExecute("INSERT INTO roleplay_jail VALUES ('"..player:GetName().."', 0, UNIX_TIMESTAMP());")
				player:Teleport(35, -42.766251, 118.957657, -40.1, 1.6)
				sendtoprison(player)
			end
		end
			end
			 return false;
		end
		end





RegisterPlayerEvent(18, patrul)
RegisterPlayerEvent(18, patrul_go_jail)
RegisterPlayerEvent(18, patrul_go_killme)
RegisterPlayerEvent(18, patrul_go_shtraf)



	local T = {
	{-46.06, 149.3674, -39.134},
	{-46.24, 144.783, -40.05},
	{-46.847, 148.7, -39.13},
	{-60.97, 149.887, -39.133},
	{-72.511, 149.834, -40.38},
	{-83.94, 165.10, -40.38},
	--circle1--
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	--circle2--
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	--circle3--
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38},
	{-97.1, 163.38, -40.38},
	{-106.51, 163.01, -40.38},
	{-109.62, 150.8, -40.38},
	{-107.12, 136.3, -40.38},
	{-87.83, 136.56, -40.38},
	{-84.557, 149.67, -40.38},
	{-83.94, 165.10, -40.38}, -- 91
	--backtocamera--
	{-84.061, 162.337, -40.38},
	{-84.398, 158.614, -40.38},
	{-83.565, 150.04, -40.38},
	{-84.59799, 149.65, -40.38}, -- 95
	{-81.3586, 145.3186, -40.38},
	{-68.2771, 150.52, -40.38},
	{-61.773506, 149.77, -39.134},
	{-46.06, 149.3674, -39.134}, -- 99
	{-46.24, 144.783, -40.05},
	{-46.06, 149.3674, -39.134},
	{-35.111370, 153.37, -39.134}, -- 102 final
	{-35.2276, 153.048 , -39.134},

}

local function Move(creature, id)
    creature:MoveClear()
    if(not id) then
        id = 1
    elseif(#T < id) then -- last point reached, dont do anything
        return
    end

    local x,y,z,text = table.unpack(T[id])
    creature:MoveTo(id, x, y, z)
    pointId = id
end

local numeatingstart = 0

local function prison(event, creature, unit)
	if(creature:GetMapId() == 35) then
	numeatingstart = numeatingstart +1
	--creature:SendUnitSay(numeatingstart, 0)
	if (numeatingstart == 10) then
		local dateoffeed = WorldDBQuery("SELECT date FROM roleplay_jail_feedtime")
		if (dateoffeed) then
			if (dateoffeed:GetInt32(0)+900 < os.time()) then

				local Ccreature = creature:GetNearestCreature(600, 90002)
				Ccreature:AddAura(90013, Ccreature)
		 		Move(Ccreature)
		 		numeatingstart = 0
		 		WorldDBExecute("UPDATE roleplay_jail_feedtime SET date = UNIX_TIMESTAMP() WHERE date = "..dateoffeed:GetInt32(0))
			end
		else
			WorldDBExecute("INSERT INTO roleplay_jail_feedtime VALUES (UNIX_TIMESTAMP());")
		end
		numeatingstart = 0
	end
end
	end
RegisterCreatureEvent(90001, 27, prison)


local function onwpprison(event, creature, type, id)
	creature:RegisterEvent(function() Move(creature, id+1) end, 0, 1)

	if (id == 1) then
		creature:SetFacing(-1.76)
	creature:SendUnitSay("Эй, вы там, выметайтесь!", 0)
	local listofplayers = creature:GetPlayersInRange(60)
	if (listofplayers) then
		for k, v in pairs(listofplayers) do
			if not (v:IsAFK()) then
				if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==0) then
			WorldDBExecute("UPDATE roleplay_jail SET state = 1 WHERE player = '"..v:GetName().."';")
			v:MoveFollow(creature)
		end
		end
		end
	end
	elseif(id == 2) then
		s = creature:GetNearestGameObject(5, 533802)
       if (s) then
        s:SetGoState(0)
    end
    elseif(id == 3) then
    	local listofplayers = creature:GetPlayersInRange(60)
	if (listofplayers) then
		for k, v in pairs(listofplayers) do
			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
			v:AddAura(90013, v)
		end
		end
	end
    elseif(id == 6) then
    	 s:SetGoState(1)
       	creature:SetFacing(-1.76)
    	creature:SendUnitSay("А теперь взяли то, что дают и сели за стол. У вас 10 минут, недоноски!", 0)
    	local listofplayers = creature:GetPlayersInRange(60)
	if (listofplayers) then
		for k, v in pairs(listofplayers) do
			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
			v:RemoveAura(90013)
			v:MoveClear()
		end
		end
	end
	 elseif(id == 91) then
	 	creature:SendUnitSay("Хватит жрать, свиньи. Пора назад в камеру.", 0)
    	local listofplayers = creature:GetPlayersInRange(60)
	if (listofplayers) then
		for k, v in pairs(listofplayers) do
			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
			v:MoveFollow(creature)
		end
		end
	end
	elseif(id == 95) then
		local listofplayers = creature:GetPlayersInRange(60)
	if (listofplayers) then
		for k, v in pairs(listofplayers) do
			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
			v:AddAura(90013, v)
		end
		end
	end
		elseif(id == 99) then
		creature:SendUnitSay("Все в клетку, быстро!", 0)
		s = creature:GetNearestGameObject(40, 533802)
       if (s) then
		  s:SetGoState(0)
		end
		 elseif(id == 100) then
		 		local stalker = creature:GetNearestCreature(20, 25171)
		 		local listofplayers = stalker:GetPlayersInRange(60)
		 		if (listofplayers) then
		 		for k, v in pairs(listofplayers) do
		 			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
		 		v:MoveClear()
				v:MoveFollow(stalker)
				v:RemoveItem(90020, 10000)
			end
			end
				end
				stalker:MoveTo(1, -46.27, 122.73, -40)
		 		elseif (id == 102) then
		 			creature:SetFacing(-1.60)
end
end

local function tojail(event, creature, type, id)
	if (creature:GetMapId() == 35) then

		s = creature:GetNearestGameObject(40, 533802)
       if (s) then
        s:SetGoState(1)
    end

local listofplayers = creature:GetPlayersInRange(60)
		 		for k, v in pairs(listofplayers) do
		 			if (WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';") and WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..v:GetName().."';"):GetInt32(0)==1) then
		 		v:MoveClear()
				v:RemoveAura(90013)
				WorldDBExecute("UPDATE roleplay_jail SET state = 0 WHERE player = '"..v:GetName().."';")
			end
				end
			end
			creature:MoveHome()
end
RegisterCreatureEvent(25171, 6, tojail)
RegisterCreatureEvent(90002, 6, onwpprison)

local function logautineating(event, player)
	local currstateofjail = 0
	local currstateofjailSQL = WorldDBQuery("SELECT state FROM roleplay_jail WHERE player = '"..player:GetName().."';")
	if (currstateofjailSQL) then
		currstateofjail = currstateofjailSQL:GetInt32(0)
	end
	if (currstateofjail==1) then
		player:RemoveItem(90020, 10000)
		player:RemoveAura(90013)
		player:Teleport(35, -42.766251, 118.957657, -40.1, 1.6)
		WorldDBExecute("UPDATE roleplay_jail SET state = 0 WHERE player = '"..player:GetName().."';")
	end
	end
	RegisterPlayerEvent(3, logautineating)


local function Timeleft() 
local names = WorldDBQuery("SELECT player FROM roleplay_jail WHERE state IN (0, 2);")
if (names) then
	for i = 1, names:GetRowCount() do
		local player = GetPlayerByName(names:GetString(0))
		if (player) then
		local WhenWasJailed = WorldDBQuery("SELECT date FROM roleplay_jail WHERE player = '"..player:GetName().."';")
		if (WhenWasJailed:GetInt32(0)+7200 < os.time()) then
			player:SendUnitWhisper("[SADDON_FADEOUT]Наконец-то этот тюремный срок за плечами.", player)
			player:Teleport(0, -8804.816, 471.41, 95.1055, 0.704)
			WorldDBExecute("DELETE FROM roleplay_jail WHERE player = '"..player:GetName().."';")
			player:RemoveItem(90020, 10000)
			leaveprison(player)
		else
		player:SendUnitWhisper("- Мне осталось сидеть "..math.ceil((WhenWasJailed:GetInt32(0)+7200-os.time())/60).." минут(ы).", player)
	end
end
		names:NextRow()
	end
end
end
CreateLuaEvent(Timeleft, 48000, 0)