local object_seller = 600090
local menu_seller = 45004

local object_enter = {600091, 600092, 600093}
local menu_enter = 45005

local object_control = 600094
local menu_control = 45006

local types = {
[0] = {1969.125366, 372.421967, 40.141487, 2.446230, 150},
[1] = {1935.551025, 161.627701, -31.642706, 5.564158, 500},
[2] = {1889.852173, 161.849442, -25.628714, 5.523818, 1200}
}

--SELLER PART--
local function OnGossipHello_seller(event, player, object_seller)
    player:GossipClearMenu()
    player:GossipMenuAddItem(1, "Купить дом на Главной Площади", 1, 101)
    player:GossipMenuAddItem(1, "Купить дом в Эльфийском Закоулке", 1, 102)
    player:GossipMenuAddItem(1, "Купить дом в Королевском Саду", 1, 103)
    player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object_seller, menu_seller) 
end
local function OnGossipSelect_seller(event, player, object_seller, sender, intid, code, menuid)
local cheaphouse = CharDBQuery("SELECT type FROM roleplay_buyed_houses WHERE type = 0 AND ownerguid = "..player:GetGUIDLow()..";")
local coolhouse = CharDBQuery("SELECT type FROM roleplay_buyed_houses WHERE type = 1 AND ownerguid = "..player:GetGUIDLow()..";")
local besthouse = CharDBQuery("SELECT type FROM roleplay_buyed_houses WHERE type = 2 AND ownerguid = "..player:GetGUIDLow()..";")

player:GossipClearMenu()
if (intid == 7) then
    player:GossipComplete()
end
if (intid == 71) then
    player:GossipMenuAddItem(1, "Купить дом на Главной Площади", 1, 101)
    player:GossipMenuAddItem(1, "Купить дом в Эльфийском Закоулке", 1, 102)
    player:GossipMenuAddItem(1, "Купить дом в Королевском Саду", 1, 103)
    player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object_seller, menu_seller) 
    end
if (intid == 101) then
    if not(coolhouse) then
    player:GossipMenuAddItem(6, "Уютное жилище", 1, 201)
end
if not(besthouse) then
    player:GossipMenuAddItem(6, "Роскошный дом", 1, 202)
end
    player:GossipMenuAddItem(7, "Назад", 1, 71)
    player:GossipSendMenu(1, object_seller, menu_seller)
end
if (intid == 102) then
    if not(coolhouse) then
    player:GossipMenuAddItem(6, "Уютное жилище", 1, 201)
end
    player:GossipMenuAddItem(7, "Назад", 1, 71)
    player:GossipSendMenu(1, object_seller, menu_seller)
end
if (intid == 103) then
    if not(cheaphouse) then
    player:GossipMenuAddItem(6, "Комната на чердаке", 1, 200)
end
    if not(coolhouse) then
    player:GossipMenuAddItem(6, "Уютное жилище", 1, 201)
end
    if not(besthouse) then
    player:GossipMenuAddItem(6, "Роскошный дом", 1, 202)
end
    player:GossipMenuAddItem(7, "Назад", 1, 71)
    player:GossipSendMenu(1, object_seller, menu_seller)
end
-- end of menus part -- -- begining of the buying actions --
if (intid == 200) then
    if player:GetCoinage() >= types[0][5]*10000 then
        player:ModifyMoney(-types[0][5]*10000)
        local phase = 2
        while (CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE phase = "..phase..";")) do
            phase = phase*2
        end
        --local numofhouses = CharDBQuery("SELECT id FROM roleplay_buyed_houses;")
        --if (numofhouses) then
        --for i = 1, numofhouses:GetRowCount() do
            --phase = phase*2
        --end
    --end
        local maxid = CharDBQuery("SELECT MAX(id) FROM roleplay_buyed_houses")
        if (maxid) then
            local iddd = maxid:GetInt32(0)+1000
            CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES ("..iddd..", '"..player:GetName().."');")
            CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES ("..iddd..", "..player:GetGUIDLow()..", "..phase..", 0, 'Комната на чердаке', 0, '"..player:GetName().."');")
        else
        CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES (1000, '"..player:GetName().."');")
        CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES (1000, "..player:GetGUIDLow()..", "..phase..", 0, 'Комната на чердаке', 0, '"..player:GetName().."');")
        end
        PerformIngameSpawn(2, 600094, 718, player:GetInstanceId(), 1972.018066, 373.444916, 42.378036, 2.4477501, 1, 0, phase)
        player:SendUnitWhisper("- Теперь у меня есть новый дом!", player)
        player:GossipComplete()
    else
        player:SendUnitWhisper("- У меня недостаточно денег, для этой покупки требуется "..types[0][5].." золотых монет.", player)
        player:GossipComplete()
    end
    end

    if (intid == 201) then
    if player:GetCoinage() >= types[1][5]*10000 then
        player:ModifyMoney(-types[1][5]*10000)
         local phase = 2
        while (CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE phase = "..phase..";")) do
            phase = phase*2
        end
        --local numofhouses = CharDBQuery("SELECT id FROM roleplay_buyed_houses;")
        --if (numofhouses) then
        --for i = 1, numofhouses:GetRowCount() do
            --phase = phase*2
        --end
    --end
        local maxid = CharDBQuery("SELECT MAX(id) FROM roleplay_buyed_houses")
        if (maxid) then
            local iddd = maxid:GetInt32(0)+1000
            CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES ("..iddd..", '"..player:GetName().."');")
            CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES ("..iddd..", "..player:GetGUIDLow()..", "..phase..", 1, 'Уютное жилище', 0, '"..player:GetName().."');")
        else
        CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES (1000, '"..player:GetName().."');")
        CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES (1000, "..player:GetGUIDLow()..", "..phase..", 1, 'Уютное жилище', 0, '"..player:GetName().."');")
        end
        PerformIngameSpawn(2, 600094, 718, player:GetInstanceId(), 1931.826172, 158.869141, -29.349707, 5.672351, 1, 0, phase)
        player:SendUnitWhisper("- Теперь у меня есть новый дом!", player)
        player:GossipComplete()
    else
        player:SendUnitWhisper("- У меня недостаточно денег, для этой покупки требуется "..types[1][5].." золотых монет.", player)
        player:GossipComplete()
    end
    end

    if (intid == 202) then
    if player:GetCoinage() >= types[2][5]*10000 then
        player:ModifyMoney(-types[2][5]*10000)
         local phase = 2
        while (CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE phase = "..phase..";")) do
            phase = phase*2
        end
        --local numofhouses = CharDBQuery("SELECT id FROM roleplay_buyed_houses;")
        --if (numofhouses) then
        --for i = 1, numofhouses:GetRowCount() do
            --phase = phase*2
        --end
    --end
        local maxid = CharDBQuery("SELECT MAX(id) FROM roleplay_buyed_houses")
        if (maxid) then
            local iddd = maxid:GetInt32(0)+1000
            CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES ("..iddd..", '"..player:GetName().."');")
            CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES ("..iddd..", "..player:GetGUIDLow()..", "..phase..", 2, 'Роскошный дом', 0, '"..player:GetName().."');")
        else
        CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES (1000, '"..player:GetName().."');")
        CharDBExecute("INSERT INTO roleplay_buyed_houses VALUES (1000, "..player:GetGUIDLow()..", "..phase..", 2, 'Роскошный дом', 0, '"..player:GetName().."');")
        end
        PerformIngameSpawn(2, 600094, 718, player:GetInstanceId(), 1885.694946, 158.678604, -23.247602, 5.757962, 1, 0, phase)
        player:SendUnitWhisper("- Теперь у меня есть новый дом!", player)
        player:GossipComplete()
    else
        player:SendUnitWhisper("- У меня недостаточно денег, для этой покупки требуется "..types[2][5].." золотых монет.", player)
        player:GossipComplete()
    end
    end

end
RegisterGameObjectGossipEvent(object_seller, 1, OnGossipHello_seller)
RegisterGameObjectGossipEvent(object_seller, 2, OnGossipSelect_seller)
--END OF SELLER PART--

--ENTER PART--
local function OnGossipHello_enter(event, player, object)
     player:GossipClearMenu()
     local playershouses = CharDBQuery("SELECT house_id FROM roleplay_houses_playersallowed WHERE player_name = '"..player:GetName().."';")
     if (playershouses) then
        for i = 1, playershouses:GetRowCount() do
            local housenameDB = CharDBQuery("SELECT house_name FROM roleplay_buyed_houses WHERE id = '"..playershouses:GetInt32(0).."';")
            local houseid = playershouses:GetInt32(0)
            local houseownerDB = CharDBQuery("SELECT player_name FROM roleplay_buyed_houses WHERE id = '"..playershouses:GetInt32(0).."';")

            local housename = nil
            local houseowner = nil
            if (houseownerDB and housenameDB) then
                housename = housenameDB:GetString(0)
                houseowner = houseownerDB:GetString(0)
            end
            player:GossipMenuAddItem(2, "Войти в дом "..housename..", хозяин ("..houseowner..")", 1, houseid)
            playershouses:NextRow()
        end
     end
    player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object, menu_enter) 
end
local function OnGossipSelect_enter(event, player, object, sender, intid, code, menuid)
player:GossipClearMenu()
if (intid == 7) then
    player:GossipComplete()
else

local typezDB = CharDBQuery("SELECT type FROM roleplay_buyed_houses WHERE id = '"..intid.."';")
local phaseDB = CharDBQuery("SELECT phase FROM roleplay_buyed_houses WHERE id = '"..intid.."';")
local typez = nil
local phase = nil
if (phaseDB and typezDB) then
typez = typezDB:GetInt32(0)
phase = phaseDB:GetInt32(0)
end

CharDBExecute("INSERT INTO roleplay_phased_players VALUES ("..phase..", "..player:GetGUIDLow()..");")
player:Teleport(718, types[typez][1], types[typez][2], types[typez][3], types[typez][4])
player:SetPhaseMask(phase)
player:GossipComplete()
end
end
for k,v in pairs(object_enter) do
RegisterGameObjectGossipEvent(v, 1, OnGossipHello_enter)
RegisterGameObjectGossipEvent(v, 2, OnGossipSelect_enter)
end
--END OF ENTER PART--

--CONTROL PART--
local function OnGossipHello_control(event, player, object)
    local housetype = 0
    if (1971<object:GetX() and 1974>object:GetX()) then
        housetype = 0
        elseif(1930<object:GetX() and 1933>object:GetX()) then
            housetype = 1
             elseif(1884<object:GetX() and 1887>object:GetX()) then
            housetype = 2
        --player:SendUnitWhisper("dom 0 urovnya", player)
    end
    player:GossipClearMenu()
    local isowner = CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE ownerguid = "..player:GetGUIDLow().." AND phase = "..player:GetPhaseMask().." AND type = "..housetype..";")
    if (isowner) then
    player:GossipMenuAddItem(6, "Заложить дом", 1, 2)
    player:GossipMenuAddItem(7, "Вселить жильца", 1, 3, true)
    player:GossipMenuAddItem(7, "Выселить жильца", 1, 4, true)
end
    player:GossipMenuAddItem(2, "Покинуть помещение", 1, 5)
    player:GossipMenuAddItem(0, "Выход", 1, 7)
    player:GossipSendMenu(1, object, menu_enter) 
end
local function OnGossipSelect_control(event, player, object, sender, intid, code, menuid)
local housetype = 0
 if (1971<object:GetX() and 1974>object:GetX()) then
        housetype = 0
        elseif(1930<object:GetX() and 1933>object:GetX()) then
            housetype = 1
             elseif(1884<object:GetX() and 1887>object:GetX()) then
            housetype = 2
        --player:SendUnitWhisper("dom 0 urovnya", player)
    end
    local isowner = CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE ownerguid = "..player:GetGUIDLow().." AND phase = "..player:GetPhaseMask().." AND type = "..housetype..";")
player:GossipClearMenu()
if (code and (code:find("['/]"))) then
    player:SendUnitWhisper("- Мое сообщение содержит некорректные символы.", player)
    player:GossipComplete()
    return false;
    end
if (intid == 7) then
    player:GossipComplete()
end
if (intid == 5) then
    CharDBExecute("DELETE FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")
    player:Teleport(718, 1849.23584, 202.75496, 70.851555, 3.184)
    player:SetPhaseMask(1)
    player:GossipComplete()
    end
if (intid == 2) then
    local nearestplayers = object:GetPlayersInRange(20)
    if (nearestplayers) then
        for k,v in pairs(nearestplayers) do
            local isphased = CharDBQuery("SELECT player_name FROM roleplay_houses_playersallowed WHERE house_id =  "..isowner:GetInt32(0).." and player_name = '"..v:GetName().."';")
            if (isphased) then
            v:Teleport(718, 1849.23584, 202.75496, 70.851555, 3.184)
            v:SetPhaseMask(1)
        end
        end
    end
    local nearestobjects = object:GetGameObjectsInRange(20)
    if (nearestobjects) then
        for k,v in pairs(nearestobjects) do
            if (v:GetEntry() ~= object:GetEntry()) then
            v:DeleteFromDB()
            WorldDBExecute("DELETE FROM gameobject_inform WHERE GUID = "..v:GetGUIDLow()..";")
            WorldDBExecute("DELETE FROM gameobject_inform_scales WHERE GUID = "..v:GetGUIDLow()..";")
        end
        end
    end
    CharDBExecute("DELETE FROM roleplay_houses_playersallowed WHERE house_id = "..isowner:GetInt32(0)..";")
    CharDBExecute("DELETE FROM roleplay_buyed_houses WHERE ownerguid = "..player:GetGUIDLow().." AND id = "..isowner:GetInt32(0)..";")
    CharDBExecute("DELETE FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")
    object:DeleteFromDB()
    player:Teleport(718, 1849.23584, 202.75496, 70.851555, 3.184)
    player:SetPhaseMask(1)
    player:ModifyMoney((types[housetype][5]*10000)/2)
    player:GossipComplete()
end

if (intid == 3) then
    local livers = CharDBQuery("SELECT player_name FROM roleplay_houses_playersallowed WHERE house_id = "..isowner:GetInt32(0)..";")
    if (livers) then
        for i = 1, livers:GetRowCount() do
            if (code == livers:GetString(0)) then
                player:SendUnitWhisper("- Этот жилец уже прописан в моем доме.", player)
                 player:GossipComplete()
                return false;
            end
             livers:NextRow()
        end
    end
    CharDBExecute("INSERT INTO roleplay_houses_playersallowed VALUES ("..isowner:GetInt32(0)..", '"..code.."');")
    player:SendUnitWhisper("- "..code.." теперь имеет доступ к этому дому.", player)
    player:GossipComplete()
end

if (intid == 4) then
     local livers = CharDBQuery("SELECT player_name FROM roleplay_houses_playersallowed WHERE house_id = "..isowner:GetInt32(0)..";")
    if (livers) then
        for i = 1, livers:GetRowCount() do
            if (code == livers:GetString(0)) then
                player:SendUnitWhisper("- "..livers:GetString(0).." больше не имеет доступа к этому дому.", player)
                local bivshii = GetPlayerByName(livers:GetString(0))
                if (bivshii) then
                CharDBExecute("DELETE FROM roleplay_phased_players WHERE player_guid = "..bivshii:GetGUIDLow()..";")
                bivshii:Teleport(718, 1849.23584, 202.75496, 70.851555, 3.184)
                bivshii:SetPhaseMask(1)
            end
                CharDBExecute("DELETE FROM roleplay_houses_playersallowed WHERE player_name = "..livers:GetString(0).." AND house_id = "..isowner:GetInt32(0)..";")
                player:GossipComplete()
            end
            livers:NextRow()
        end
    end
end

end
RegisterGameObjectGossipEvent(object_control, 1, OnGossipHello_control)
RegisterGameObjectGossipEvent(object_control, 2, OnGossipSelect_control)
--END OF CONTROL PART--


--player settings part--
local function house_onlogin(event, player)
    local housetype = 0
    local phased = CharDBQuery("SELECT phase FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")
    if (phased) then
        player:SetPhaseMask(phased:GetInt32(0))
        local object = player:GetNearestGameObject(100, 600094)
        if (object and 1971<object:GetX() and 1974>object:GetX()) then
        housetype = 0
         elseif(object and 1930<object:GetX() and 1933>object:GetX()) then
            housetype = 1
             elseif(object and 1884<object:GetX() and 1887>object:GetX()) then
            housetype = 2
        --player:SendUnitWhisper("dom 0 urovnya", player)
    end
    local houseexists = CharDBQuery("SELECT id FROM roleplay_buyed_houses WHERE phase = "..phased:GetInt32(0).." AND type = "..housetype..";")
    if not(houseexists) then
        CharDBExecute("DELETE FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")
    player:Teleport(718, 1849.23584, 202.75496, 70.851555, 3.184)
    player:SetPhaseMask(1)
end
    end
end
RegisterPlayerEvent(3, house_onlogin)

local function house_onchardel(event,guid)
    local player = GetPlayerByGUID(guid)
    if (player) then
     CharDBExecute("DELETE FROM roleplay_houses_playersallowed WHERE player_name = "..player:GetName()..";")
    CharDBExecute("DELETE FROM roleplay_buyed_houses WHERE ownerguid = "..player:GetGUIDLow()..";")
    CharDBExecute("DELETE FROM roleplay_phased_players WHERE player_guid = "..player:GetGUIDLow()..";")
end
end
RegisterPlayerEvent(2, house_onchardel)