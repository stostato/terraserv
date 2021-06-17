local ObjectId = 600000
local ObjectIdSmall = 600001
local MenuIdq = 1999

local function OnGossipHelloHH(event, player, object)
	player:GossipClearMenu()

	player:GossipMenuAddItem(1, "Просмотр новостей Королевства", 1, 201)

	if (player:GetFaction() == 11 or player:GetFaction() == 56 or player:GetFaction() == 123) then
	player:GossipMenuAddItem(1, "Назначить награду за голову игрока", 1, 1)
	end
	player:GossipMenuAddItem(4, "Просмотр списка игроков, за чью голову назначена награда", 1, 2)

	if (player:GetFaction() == 11 or player:GetFaction() == 56 or player:GetFaction() == 123) then
			player:GossipMenuAddItem(2, "Телепортация в штаб стражи", 1, 3)
	end

	if not(WorldDBQuery("SELECT zone FROM roleplay_currentzone WHERE zone = "..player:GetZoneId()..";")) then
	player:GossipMenuAddItem(2, "Телепортация в стартовую локацию", 1, 900)
end

	player:GossipMenuAddItem(3, "Получить стандартный набор заклинаний", 1, 500)
	player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object, MenuIdq) -- MenuId required for player gossip
end

local function OnGossipSelectHH(event, player, object, sender, intid, code, menuid)
if (code and (code:find("['/]"))) then
	player:SendUnitWhisper("- Мое сообщение содержит некорректные символы.", player)
	player:GossipComplete()
	return false;
	end
player:GossipClearMenu()
--teleportvprison--
if (intid == 3) then
	player:SendUnitWhisper("[SADDON_FADEOUT]Для выхода из штаба я могу использовать специальный портал.", player)
	player:Teleport(35, -12.751493, 135.199783, -39.4, 1.544)

--addname--
elseif (intid == 1) then
	local result = WorldDBQuery("SELECT who FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
	if not(result) then
	WorldDBExecute("INSERT INTO roleplay_headhunting_proc VALUES ('nil', '0', '"..player:GetName().."')")
end
	player:GossipMenuAddItem(7, "Ввести имя игрока.", 1, 10, true)
	player:GossipMenuAddItem(1, "Назначить награду.", 1, 11, true)
	player:GossipMenuAddItem(4, "Опубликовать объявление", 1, 100)

	player:GossipMenuAddItem(0, "Назад", 1, 6)
	player:GossipSendMenu(1, object, MenuIdq)

--listofnames--
elseif (intid == 2) then
	local names = WorldDBQuery("SELECT nickname FROM roleplay_headhunting WHERE gold > 0")
	if (names) then
		for i = 1, names:GetRowCount() do
			player:GossipMenuAddItem(1, names:GetString(0), 1, 2)
			names:NextRow()
		end
	end
	player:GossipMenuAddItem(0, "Назад", 1, 6)
	player:GossipSendMenu(1, object, MenuIdq)

--nicknameenter--
elseif (intid == 10) then
	local result = WorldDBQuery("SELECT who FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
	if (result) then
		if (CharDBQuery("SELECT name FROM characters WHERE name = '"..code.."';")) then
	WorldDBExecute("UPDATE roleplay_headhunting_proc SET nickname = '"..code.."' WHERE who = '"..player:GetName().."';")
else
	player:SendUnitWhisper("- Такого персонажа не существует.", player)
end
player:GossipMenuAddItem(7, "Ввести имя игрока.", 1, 10, true)
	player:GossipMenuAddItem(1, "Назначить награду.", 1, 11, true)
	player:GossipMenuAddItem(4, "Опубликовать объявление", 1, 100)
	player:GossipMenuAddItem(0, "Назад", 1, 6)
	player:GossipSendMenu(1, object, MenuIdq)
end

	--entergold--
	elseif (intid == 11) then
		local result = WorldDBQuery("SELECT who FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
	if (result and (tonumber(code) >= 1500)) then
		WorldDBExecute("UPDATE roleplay_headhunting_proc SET gold = "..tonumber(code).." WHERE who = '"..player:GetName().."';")
	else 
		player:SendUnitWhisper("- У меня недостаточно золота, чтобы объявить этого персонажа в розыск. Начальная ставка 15 серебряных монет. (1500 медных)", player)
	end
	player:GossipMenuAddItem(7, "Ввести имя игрока.", 1, 10, true)
	player:GossipMenuAddItem(1, "Назначить награду.", 1, 11, true)
	player:GossipMenuAddItem(4, "Опубликовать объявление", 1, 100)

	player:GossipMenuAddItem(0, "Назад", 1, 6)
	player:GossipSendMenu(1, object, MenuIdq)

	--finish--
	elseif (intid == 100) then

		local result = WorldDBQuery("SELECT gold FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
	if (result and (result:GetInt32(0) >= 1500)) then
		local nickname = WorldDBQuery("SELECT nickname FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
		if (player:GetCoinage() >= result:GetInt32(0) and (CharDBQuery("SELECT name FROM characters WHERE name = '"..nickname:GetString(0).."';"))) then
			player:ModifyMoney(-result:GetInt32(0))
			
			--if (nickname and CharDBQuery("SELECT name FROM characters WHERE name = '"..nickname:GetString(0).."';")) then

			if (WorldDBQuery("SELECT nickname FROM roleplay_headhunting WHERE nickname = '"..nickname:GetString(0).."';")) then
				WorldDBExecute("UPDATE roleplay_headhunting SET gold = gold+"..result:GetInt32(0).." WHERE nickname = '"..nickname:GetString(0).."';")
			else
			WorldDBExecute("INSERT INTO roleplay_headhunting VALUES ('"..nickname:GetString(0).."', "..result:GetInt32(0)..", '"..player:GetName().."');")
			SendWorldMessage("|cfffdeaa8Сегодня список охотников за головами пополнился новым именем. |cff7fc800"..nickname:GetString(0).." |cfffdeaa8разыскивается по всему Азероту, и тот, кто первый нанесет ему(ей) поражение, получит награду.|r");
		end
			WorldDBExecute("DELETE FROM roleplay_headhunting_proc WHERE who = '"..player:GetName().."';")
			player:SendUnitWhisper("- Я успешно добавил этого игрока в список разыскиваемых, надеюсь найдется тот, кто его остановит.", player)
	else
		player:SendUnitWhisper("- У меня недостаточно золота, либо такого игрока не существует.", player)
	end
else
	player:SendUnitWhisper("- Я не внес в казну золото, которое можно получить за голову этого игрока.", player)
--end
	end

	player:GossipComplete()

--exitfull--
elseif (intid == 7) then
	player:GossipComplete()
--back--
elseif (intid == 6) then
	player:GossipMenuAddItem(1, "Просмотр новостей Королевства", 1, 201)

	if (player:GetFaction() == 11 or player:GetFaction() == 56 or player:GetFaction() == 123) then
	player:GossipMenuAddItem(1, "Назначить награду за голову игрока", 1, 1)
	end
	player:GossipMenuAddItem(4, "Просмотр списка игроков, за чью голову назначена награда", 1, 2)

	if (player:GetFaction() == 11 or player:GetFaction() == 56 or player:GetFaction() == 123) then
			player:GossipMenuAddItem(2, "Телепортация в штаб стражи", 1, 3)
	end
	if not(WorldDBQuery("SELECT zone FROM roleplay_currentzone WHERE zone = "..player:GetZoneId()..";")) then
	player:GossipMenuAddItem(2, "Телепортация в стартовую локацию", 1, 900)
end

	player:GossipMenuAddItem(3, "Получить стандартный набор заклинаний", 1, 500)
	player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object, MenuIdq) -- MenuId required for player gossip
    --newspart--
    elseif (intid == 201) then
    	if not(AuthDBQuery("SELECT msg FROM roleplay_news_proc WHERE player = '"..player:GetName().."' AND topic IN(2, 3);")) then
    	AuthDBExecute("INSERT INTO roleplay_news_proc VALUES ('"..player:GetName().."', 0, 'Объявление от |cff4e1609"..player:GetName().."|r: Введите текст.');")
    end
    	player:GossipMenuAddItem(7, "Официальные заявления", 1, 202)
    	player:GossipMenuAddItem(1, "Торговля", 1, 203)
    	player:GossipMenuAddItem(6, "Прочее", 1, 204)

    	local hasnews = AuthDBQuery("SELECT topic FROM roleplay_news WHERE player = '"..player:GetName().."' AND topic IN(2, 3);")
    	if (hasnews) then

		for i = 1, hasnews:GetRowCount() do

    		if (hasnews:GetInt32(0) == 2) then
    	--player:GossipMenuAddItem(0, "Добавить новость в раздел прочее", 1, 207)
    	player:GossipMenuAddItem(4, "Удалить мои объявления из раздела торговля", 1, 205)
    end

    if (hasnews:GetInt32(0) == 3) then
    	--player:GossipMenuAddItem(0, "Добавить новость в раздел торговля", 1, 208)
    	player:GossipMenuAddItem(4, "Удалить мои объявления из раздела прочее", 1, 206)

    end
    hasnews:NextRow()
end
else
	player:GossipMenuAddItem(3, "Добавить новость в раздел прочее", 1, 207)
	player:GossipMenuAddItem(3, "Добавить новость в раздел торговля", 1, 208)
    	end
    	player:GossipMenuAddItem(0, "Назад", 1, 6)
    	player:GossipSendMenu(1, object, MenuIdq)
    	--addnewsother207--
    	elseif (intid == 207) then
    		AuthDBExecute("UPDATE roleplay_news_proc SET topic = 3 WHERE player = '"..player:GetName().."';")
    	player:GossipMenuAddItem(7, "Ввести содержание объявления", 1, 210, true)
    	player:GossipMenuAddItem(1, "Опубликовать объявление [2 серебряные монеты]", 1, 211, nil, nil, 200)
		player:GossipMenuAddItem(0, "Назад", 1, 201)
		player:GossipSendMenu(1, object, MenuIdq)
		--entertext210--
		elseif (intid == 210) then
			AuthDBExecute("UPDATE roleplay_news_proc SET msg = 'Объявление от |cff4e1609"..player:GetName().."|r: "..code.."' WHERE player = '"..player:GetName().."';")
			    	player:GossipMenuAddItem(7, "Ввести содержание объявления", 1, 210, true)
    	player:GossipMenuAddItem(1, "Опубликовать объявление [2 серебряные монеты]", 1, 211, nil, nil, 200)
		player:GossipMenuAddItem(0, "Назад", 1, 201)
		player:GossipSendMenu(1, object, MenuIdq)
		--addtext211--
		elseif (intid == 211) then
			if (player:GetCoinage() >= 200) then
            player:ModifyMoney(-200)
        end
        local topicnum = AuthDBQuery("SELECT topic FROM roleplay_news_proc WHERE player = '"..player:GetName().."';")
        local msg = AuthDBQuery("SELECT msg FROM roleplay_news_proc WHERE player = '"..player:GetName().."';") 

		AuthDBExecute("INSERT INTO roleplay_news VALUES ('"..player:GetName().."', "..topicnum:GetInt32(0)..", '"..msg:GetString(0).."');")
		player:GossipComplete()
		player:SendUnitWhisper('- Мое объявление было добавлено в раздел "прочее".', player)
		--addnewstrade208--
    	elseif (intid == 208) then
    		AuthDBExecute("UPDATE roleplay_news_proc SET topic = 2 WHERE player = '"..player:GetName().."';")
    	player:GossipMenuAddItem(7, "Ввести содержание объявления", 1, 210, true)
    	player:GossipMenuAddItem(1, "Опубликовать объявление [2 серебряные монеты]", 1, 211, nil, nil, 200)
		player:GossipMenuAddItem(0, "Назад", 1, 201)
		player:GossipSendMenu(1, object, MenuIdq)
		--entertext220--
		elseif (intid == 220) then
			AuthDBExecute("UPDATE roleplay_news_proc SET msg = 'Объявление от |cff4e1609"..player:GetName().."|r: "..code.."' WHERE player = '"..player:GetName().."';")
			    	player:GossipMenuAddItem(7, "Ввести содержание объявления", 1, 210, true)
    	player:GossipMenuAddItem(1, "Опубликовать объявление [2 серебряные монеты]", 1, 211, nil, nil, 200)
    	player:GossipMenuAddItem(0, "Назад", 1, 201)
		player:GossipSendMenu(1, object, MenuIdq)
		--addtext221--
		elseif (intid == 221) then
						if (player:GetCoinage() >= 200) then
            player:ModifyMoney(-200)
        end
        local topicnum = AuthDBQuery("SELECT topic FROM roleplay_news_proc WHERE player = '"..player:GetName().."';")
        local msg = AuthDBQuery("SELECT msg FROM roleplay_news_proc WHERE player = '"..player:GetName().."';") 

		AuthDBExecute("INSERT INTO roleplay_news VALUES ('"..player:GetName().."', "..topicnum:GetInt32(0)..", '"..msg:GetString(0).."');")
		player:GossipComplete()
		player:SendUnitWhisper('- Мое объявление было добавлено в раздел "торговля".', player)
    	--officialnews202--
    	elseif (intid == 202) then
    	local names = AuthDBQuery("SELECT msg FROM roleplay_news WHERE topic = 1")
	if (names) then
		for i = 1, names:GetRowCount() do
			player:GossipMenuAddItem(1, names:GetString(0), 1, 202)
			names:NextRow()
		end
	end
	player:GossipMenuAddItem(0, "Назад", 1, 201)
	player:GossipSendMenu(1, object, MenuIdq)
    	--trade203--
    	elseif (intid == 203) then
    	local names = AuthDBQuery("SELECT msg FROM roleplay_news WHERE topic = 2")
	if (names) then
		for i = 1, names:GetRowCount() do
			player:GossipMenuAddItem(1, names:GetString(0), 1, 203)
			names:NextRow()
		end
	end
	player:GossipMenuAddItem(0, "Назад", 1, 201)
	player:GossipSendMenu(1, object, MenuIdq)
    	--orher204--
    	elseif (intid == 204) then
    	local names = AuthDBQuery("SELECT msg FROM roleplay_news WHERE topic = 3")
	if (names) then
		for i = 1, names:GetRowCount() do
			player:GossipMenuAddItem(1, names:GetString(0), 1, 204)
			names:NextRow()
		end
	end
	player:GossipMenuAddItem(0, "Назад", 1, 201)
	player:GossipSendMenu(1, object, MenuIdq)
	elseif(intid == 205) then
		player:GossipMenuAddItem(0, "Назад", 1, 201)
		player:SendUnitWhisper('- Мои записи из раздела "торговля" были успешно удалены.', player)
		if (AuthDBQuery("SELECT msg FROM roleplay_news WHERE player = '"..player:GetName().."' AND topic = 2;")) then
			AuthDBExecute("DELETE FROM roleplay_news WHERE player = '"..player:GetName().."' AND topic = 2;")
		end
		player:GossipSendMenu(1, object, MenuIdq)
		elseif(intid == 206) then
			player:GossipMenuAddItem(0, "Назад", 1, 201)
			player:SendUnitWhisper('- Мои записи из раздела "прочее" были успешно удалены.', player)
			if (AuthDBQuery("SELECT msg FROM roleplay_news WHERE player = '"..player:GetName().."' AND topic = 3;")) then
				AuthDBExecute("DELETE FROM roleplay_news WHERE player = '"..player:GetName().."' AND topic = 3;")
		end
		player:GossipSendMenu(1, object, MenuIdq)
		elseif (intid == 500) then
  player:LearnSpell(90124)
  if (player:GetClassAsString() == "Warlock") then
        							 player:LearnSpell(697)
									 player:LearnSpell(712)
									 player:LearnSpell(691)
        						end
                                                        --player:LearnSpell(90001)
                                                        player:LearnSpell(90501)
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
                                                        if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0)==1) then
                                                        player:LearnSpell(71851) -- spd
        												player:LearnSpell(71852) -- spd
        												player:LearnSpell(71853) -- spd
                                                        end
                                                       for i = 1, player:GetLevel() do
    local spells = Classes[player:GetClassAsString()] and Classes[player:GetClassAsString()][i] or {}
    for k, v in ipairs(spells) do
        player:LearnSpell(v)
    end
end
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
        						end
        						if (player:GetClassAsString() == "Paladin") then
        							player:LearnSpell(750)
        						end
        						player:GossipComplete()
        						--teleport--
        						elseif (intid == 900) then
        				 player:GossipMenuAddItem(2, "|cff505050Западный Край|r", 1, 901)
        				 if (player:GetTeam() == 0) then
        				 player:GossipMenuAddItem(2, "|cff505050Штормград|r", 1, 902)
        				end
        				 player:GossipMenuAddItem(2, "|cff505050Сумеречный лес|r", 1, 903)

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

        					player:GossipMenuAddItem(0, "Назад", 1, 6)
    							player:GossipSendMenu(1, object, MenuIdq)
    							elseif (intid == 901) then
    								player:Teleport(0, -10418.123, 940.65844, 38.2745, 1.62)
								player:SetBindPoint(-10418.123, 940.65844, 38.2745, 0, 40)
    								elseif (intid == 902) then
    									player:Teleport(0, -8627.1162, 456.198, 102.708, 3.163308)
								player:SetBindPoint(-8627.1162, 456.198, 102.708, 0, 1519)
    									elseif (intid == 903) then
    										player:Teleport(0, -10758.74, -1234.826904, 31.66, 0.397)
								player:SetBindPoint(-10758.74, -1234.826904, 31.66, 0, 42)
								elseif (intid == 904) then
    										player:Teleport(0, -783.825, -247.698074, 18.29, 4.764)
								player:SetBindPoint(-783.825, -247.698074, 18.29, 0, 267)
								elseif (intid == 905) then
    										player:Teleport(0, -815, -3507.858154, 72.8834, 3.6853)
								player:SetBindPoint(-815, -3507.858154, 72.8834, 0, 321)
								elseif (intid == 906) then
    										player:Teleport(0, -1420.726196, -1115.893311, 35.334522, 2.089330)
								player:SetBindPoint(-1420.726196, -1115.893311, 35.334522, 0, 294)
								elseif (intid == 907) then
    										player:Teleport(0, -1450.689087, -2429.699463, 59.751411, 4.263313)
								player:SetBindPoint(-1450.689087, -2429.699463, 59.751411, 0, 45)
								elseif (intid == 908) then
    										player:Teleport(0, -16.2, -1104.373169, 36.524387, 1.536354)
								player:SetBindPoint(-16.2, -1104.373169, 36.524387, 0, 267)
								elseif (intid == 909) then
    										player:Teleport(0, 83.835, -2092.365479, 112.9925, 0.506741)
								player:SetBindPoint(83.835, -2092.365479, 112.9925, 0, 1880)
	end
end

RegisterGameObjectGossipEvent(ObjectId, 1, OnGossipHelloHH)
RegisterGameObjectGossipEvent(ObjectId, 2, OnGossipSelectHH)

RegisterGameObjectGossipEvent(ObjectIdSmall, 1, OnGossipHelloHH)
RegisterGameObjectGossipEvent(ObjectIdSmall, 2, OnGossipSelectHH)

--[[local function givereward(event, killer, killed)
	if (WorldDBQuery("SELECT gold FROM roleplay_headhunting WHERE nickname = '"..killed:GetName().."';") and (killed:GetName() ~= killer:GetName())) then
		local gold = WorldDBQuery("SELECT gold FROM roleplay_headhunting WHERE nickname = '"..killed:GetName().."';")
		killer:SendUnitWhisper("- Я только что одолел игрока, за которого была назначена награда. Моя выручка составила "..gold:GetInt32(0).." медных монет.", killer)
		killer:ModifyMoney(gold:GetInt32(0))
		WorldDBExecute("DELETE FROM roleplay_headhunting WHERE nickname = '"..killed:GetName().."';")
	end
	end
RegisterPlayerEvent(6, givereward)]]-- V CHARACTERSYSTEM.LUA