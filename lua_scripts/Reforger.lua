--local chatCommand = "#reforger"
local menu_id = 1234
--[[
local NpcREFID = 990020
local NpcREFID2 = 990021
local MenuREFID = 990020
]]--
local EQUIPMENT_SLOT_START        = 0
local EQUIPMENT_SLOT_HEAD         = 0
local EQUIPMENT_SLOT_NECK         = 1
local EQUIPMENT_SLOT_SHOULDERS    = 2
local EQUIPMENT_SLOT_BODY         = 3
local EQUIPMENT_SLOT_CHEST        = 4
local EQUIPMENT_SLOT_WAIST        = 5
local EQUIPMENT_SLOT_LEGS         = 6
local EQUIPMENT_SLOT_FEET         = 7
local EQUIPMENT_SLOT_WRISTS       = 8
local EQUIPMENT_SLOT_HANDS        = 9
local EQUIPMENT_SLOT_FINGER1      = 10
local EQUIPMENT_SLOT_FINGER2      = 11
local EQUIPMENT_SLOT_TRINKET1     = 12
local EQUIPMENT_SLOT_TRINKET2     = 13
local EQUIPMENT_SLOT_BACK         = 14
local EQUIPMENT_SLOT_MAINHAND     = 15
local EQUIPMENT_SLOT_OFFHAND      = 16
local EQUIPMENT_SLOT_RANGED       = 17
local EQUIPMENT_SLOT_TABARD       = 18

local SlotNames = {
    [EQUIPMENT_SLOT_HEAD      ] = {"Head",         nil, nil, nil, nil, nil, nil, nil, "Голова"},
    [EQUIPMENT_SLOT_SHOULDERS ] = {"Shoulders",    nil, nil, nil, nil, nil, nil, nil, "Плечи"},
    [EQUIPMENT_SLOT_BODY      ] = {"Shirt",        nil, nil, nil, nil, nil, nil, nil, "Рубашка"},
    [EQUIPMENT_SLOT_CHEST     ] = {"Chest",        nil, nil, nil, nil, nil, nil, nil, "Грудь"},
    [EQUIPMENT_SLOT_WAIST     ] = {"Waist",        nil, nil, nil, nil, nil, nil, nil, "Пояс"},
    [EQUIPMENT_SLOT_LEGS      ] = {"Legs",         nil, nil, nil, nil, nil, nil, nil, "Ноги"},
    [EQUIPMENT_SLOT_FEET      ] = {"Feet",         nil, nil, nil, nil, nil, nil, nil, "Ботинки"},
    [EQUIPMENT_SLOT_WRISTS    ] = {"Wrists",       nil, nil, nil, nil, nil, nil, nil, "Наручи"},
    [EQUIPMENT_SLOT_HANDS     ] = {"Hands",        nil, nil, nil, nil, nil, nil, nil, "Перчатки"},
    [EQUIPMENT_SLOT_BACK      ] = {"Back",         nil, nil, nil, nil, nil, nil, nil, "Спина"},
    [EQUIPMENT_SLOT_MAINHAND  ] = {"Main hand",    nil, nil, nil, nil, nil, nil, nil, "Правая рука"},
    [EQUIPMENT_SLOT_OFFHAND   ] = {"Off hand",     nil, nil, nil, nil, nil, nil, nil, "Левая рука"},
    [EQUIPMENT_SLOT_RANGED    ] = {"Ranged",       nil, nil, nil, nil, nil, nil, nil, "Оружие дальнего боя"}
}

local Qualities =
{
    [0]  = false, -- AllowPoor    
    [1]  = false, -- AllowCommon  
    [2]  = false , -- AllowUncommon
    [3]  = true , -- AllowRare    
    [4]  = true , -- AllowEpic    
    [5]  = false, -- AllowLegendary
    [6]  = false, -- AllowArtifact
    [7]  = false, -- AllowHeirloom
}

local function GetSlotName(slot, locale)
    if(not SlotNames[slot]) then return end
    return SlotNames[slot][locale and locale+1 or 1]
end

local function HELLO(event, player, unit)
    local itemSQL = AuthDBQuery("SELECT item, item1, item2, item3, item4 FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
if (itemSQL) then
    AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
end
    player:GossipMenuAddItem(7, "Следующие слоты доступны для перековки:", 0, 229)
    for slot, v in pairs(SlotNames) do
 local newItem = player:GetItemByPos(-1, slot)
        if (newItem) then
            if (Qualities[newItem:GetQuality()]) then
                local slotName = GetSlotName(slot, player:GetDbcLocale())
                if (slotName) then
                    player:GossipMenuAddItem(4, slotName, 0, slot)
                end
            end
        end
    end
    player:GossipMenuAddItem(0, "Выход", 0, 228)
    player:GossipSendMenu(100, unit, menu_id)
end

local function CHAT(event, player, msg, Type, lang)
    if(msg == chatCommand) then
        player:GossipClearMenu()
        HELLO(1, player, player)
        return false
    end
end

local item = nil
local item1 = nil
local item2 = nil
local item3 = nil
local item4 = nil

local function SELECT(event, player, unit, sender, action, code)
local itemSQL = AuthDBQuery("SELECT item, item1, item2, item3, item4 FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
if (itemSQL) then
item = GetItemByGUID(itemSQL:GetInt32(0), player)
item1 = GetItemByGUID(itemSQL:GetInt32(1), player)
item2 = GetItemByGUID(itemSQL:GetInt32(2), player)
item3 = GetItemByGUID(itemSQL:GetInt32(3), player)
item4 = GetItemByGUID(itemSQL:GetInt32(4), player)
else 
item = nil
item1 = nil
item2 = nil
item3 = nil
item4 = nil
end

if (action == 228) then
    player:GossipComplete()
    elseif (action == 230) then
        HELLO(1, player, player)
         player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
               item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
        elseif (action == 229) then
        HELLO(1, player, player)

        elseif (item and action == item:GetGUIDLow()) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            player:GossipComplete()
            elseif (item and action == item1:GetGUIDLow()) then
            player:RemoveItem(item, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            player:GossipComplete()
                elseif (item and action == item2:GetGUIDLow()) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            player:GossipComplete()
                    elseif (item and action == item3:GetGUIDLow()) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            player:GossipComplete()
                        elseif (item and action == item4:GetGUIDLow()) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            player:GossipComplete()

    else
        item = player:GetItemByPos(-1, action)
        if (item) then
        local itemlink = item:GetItemLink(player:GetDbcLocale())
player:GossipMenuAddItem(7, "Предмет "..itemlink.." может быть перекован в следующее:", 0, item:GetGUIDLow())

if (item1 or item2 or item3 or item4) then

            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
        end

item1 = player:AddItem(item:GetEntry(), 1)
item2 = player:AddItem(item:GetEntry(), 1)
item3 = player:AddItem(item:GetEntry(), 1)
item4 = player:AddItem(item:GetEntry(), 1)

if not(item1 and item2 and item3 and item4) then
            if (item1) then
            player:RemoveItem(item1, 1)
        end
        if (item2) then
            player:RemoveItem(item2, 1)
        end
        if (item3) then
            player:RemoveItem(item3, 1)
        end
        if (item4) then
            player:RemoveItem(item4, 1)
        end

    player:SendUnitWhisper("- У меня недостаточно места в сумке.", player)
        player:GossipComplete()
    return false;
    end

AuthDBExecute("INSERT INTO roleplay_reforger VALUES ('"..player:GetName().."', "..item:GetGUIDLow()..", "..item1:GetGUIDLow()..", "..item2:GetGUIDLow()..", "..item3:GetGUIDLow()..", "..item4:GetGUIDLow()..");")

player:AddAura(36943, player)
player:AddAura(58925, player)
player:AddAura(35182, player)

player:SetFlag(150,0x00800000)
            player:SetFlag(150,0x01000000)

player:GossipMenuAddItem(4, item1:GetItemLink(player:GetDbcLocale()), 0, item1:GetGUIDLow())
player:GossipMenuAddItem(4, item2:GetItemLink(player:GetDbcLocale()), 0, item2:GetGUIDLow())
player:GossipMenuAddItem(4, item3:GetItemLink(player:GetDbcLocale()), 0, item3:GetGUIDLow())
player:GossipMenuAddItem(4, item4:GetItemLink(player:GetDbcLocale()), 0, item4:GetGUIDLow())

player:GossipMenuAddItem(0, "Назад", 0, 230)
   player:GossipSendMenu(100, unit, menu_id)
end
end
end


--RegisterPlayerEvent(18, CHAT)
RegisterPlayerGossipEvent(menu_id, 2, SELECT)

RegisterItemGossipEvent(1500040, 1, HELLO)
RegisterItemGossipEvent(1500040, 2, SELECT)

--[[RegisterCreatureGossipEvent(NpcREFID, 1, HELLO)
RegisterCreatureGossipEvent(NpcREFID, 2, SELECT)

RegisterCreatureGossipEvent(NpcREFID2, 1, HELLO)
RegisterCreatureGossipEvent(NpcREFID2, 2, SELECT)]]--

local function G_CLOSED(event, player, msg, Type, lang)
    if not(player:ToPlayer()) then
        return false
    end

local itemSQL = AuthDBQuery("SELECT item, item1, item2, item3, item4 FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
if (itemSQL) then
item = GetItemByGUID(itemSQL:GetInt32(0), player)
item1 = GetItemByGUID(itemSQL:GetInt32(1), player)
item2 = GetItemByGUID(itemSQL:GetInt32(2), player)
item3 = GetItemByGUID(itemSQL:GetInt32(3), player)
item4 = GetItemByGUID(itemSQL:GetInt32(4), player)
else 
item = nil
item1 = nil
item2 = nil
item3 = nil
item4 = nil
end

if (event == 18 and msg == "[SADDON_GOSSIP_CLOZED]") then
player:RemoveAura(58925)
end

    if (event == 18 and msg == "[SADDON_GOSSIP_CLOZED]" and (item1 or item2 or item3 or item4)) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
            return false
        elseif (event == 3 and itemSQL) then
            player:RemoveItem(item1, 1)
            player:RemoveItem(item2, 1)
            player:RemoveItem(item3, 1)
            player:RemoveItem(item4, 1)
            item = nil
            item1 = nil
            item2 = nil
            item3 = nil
            item4 = nil
            AuthDBExecute("DELETE FROM roleplay_reforger WHERE player = '"..player:GetName().."';")
            player:RemoveAura(36943)
player:RemoveAura(58925)
player:RemoveAura(35182)
player:RemoveFlag(150,0x00800000)
                player:RemoveFlag(150,0x01000000)
        end
        if (event == 3) then
            player:SendBroadcastMessage("|cfffdeaa8[|cff7fc800Server|cfffdeaa8] |cffFFFF00Для открытия меню трансмогрификации введите #char\n|cfffdeaa8[|cff7fc800Server|cfffdeaa8] |cffFFFF00Для открытия меню смены визуального эффекта оружия введите #enchanter|r")
        end
    end
    RegisterPlayerEvent(18, G_CLOSED)
    RegisterPlayerEvent(3, G_CLOSED)





