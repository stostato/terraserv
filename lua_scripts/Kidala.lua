local NpcKidalaID = 90022
local MenuKidalaID = 1243877
local crystal = "|TInterface\\icons\\FB415EF44E64A165E29BD1EBCD747627.blp:16:16|t"
local currency = 150006

function kidanie(player, class, subclass, num, invtype)
          if (player:HasItem(currency, num)) then
            player:RemoveItem(currency, num)
            local quality = 0
            local listofIDS
            local i = 0
          local chance = math.random(1, 100)

          if (chance <= 40) then
            quality = 1
          elseif (chance > 20 and chance <= 97) then
            quality = 2
            elseif (chance > 97 and chance <= 99) then
              quality = 3
              elseif (chance > 99 and chance <= 100) then
                quality = 4
          end

          if not(invtype) then
          listofIDS = WorldDBQuery("SELECT entry FROM item_template WHERE class = "..class.." AND subclass = "..subclass.." AND quality = "..quality.." ORDER BY RAND() LIMIT 1;")
        else
          listofIDS = WorldDBQuery("SELECT entry FROM item_template WHERE class = "..class.." AND subclass = "..subclass.." AND quality = "..quality.." AND InventoryType = "..invtype.." ORDER BY RAND() LIMIT 1;")
        end


          --for i = 1, math.random(1, listofIDS:GetRowCount()) do
            --listofIDS:NextRow(math.random(1, listofIDS:GetRowCount()))
            --listofIDS:ToRow(math.random(1, listofIDS:GetRowCount()))
          --end


          player:AddItem(listofIDS:GetInt32(0), 1)

        else
          player:SendUnitWhisper(" - У меня недостаточно предметов для совершения покупки.", player)
        end
end

function OnGossipHelloKIDALA(event, player, object)
  local chartype = WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';")
  if (chartype and chartype:GetInt32(0)==1) then
  player:GossipClearMenu()
  player:GossipMenuAddItem(1, "Покупка случайного одноручного оружия. 40 "..crystal, 1, 1)
  player:GossipMenuAddItem(1, "Покупка случайного двуручного оружия. 40 "..crystal, 1, 2)
    player:GossipMenuAddItem(1, "Покупка случайного оружия дальнего боя. 40 "..crystal, 1, 9)
  player:GossipMenuAddItem(1, "Покупка щитов. 40 "..crystal, 1, 3)
  player:GossipMenuAddItem(1, "Покупка латной брони. 30 "..crystal, 1, 4)
  player:GossipMenuAddItem(1, "Покупка кольчужной брони. 30 "..crystal, 1, 5)
  player:GossipMenuAddItem(1, "Покупка кожаной брони. 30 "..crystal, 1, 6)
  player:GossipMenuAddItem(1, "Покупка тканевой брони. 30 "..crystal, 1, 7)
  player:GossipMenuAddItem(1, "Покупка бижутерии. 25 "..crystal, 1, 8)
  player:GossipMenuAddItem(0, "До скорого!", 1, 228)
  player:GossipSendMenu(1, object, MenuKidalaID)
end
end

function OnGossipSelectKIDALA(event, player, object, sender, intid, code, menuid)
--EXIT
if (intid == 228) then
    player:GossipComplete()
    end
    if (intid == 229) then
    player:GossipClearMenu()
  player:GossipMenuAddItem(1, "Покупка случайного одноручного оружия. 40 "..crystal, 1, 1)
  player:GossipMenuAddItem(1, "Покупка случайного двуручного оружия. 40 "..crystal, 1, 2)
    player:GossipMenuAddItem(1, "Покупка случайного оружия дальнего боя. 40 "..crystal, 1, 9)
  player:GossipMenuAddItem(1, "Покупка щитов. 40 "..crystal, 1, 3)
  player:GossipMenuAddItem(1, "Покупка латной брони. 30 "..crystal, 1, 4)
  player:GossipMenuAddItem(1, "Покупка кольчужной брони. 30 "..crystal, 1, 5)
  player:GossipMenuAddItem(1, "Покупка кожаной брони. 30 "..crystal, 1, 6)
  player:GossipMenuAddItem(1, "Покупка тканевой брони. 30 "..crystal, 1, 7)
  player:GossipMenuAddItem(1, "Покупка бижутерии. 25 "..crystal, 1, 8)
  player:GossipMenuAddItem(0, "До скорого!", 1, 228)
  player:GossipSendMenu(1, object, MenuKidalaID)
    end
-- END EXIT

-- 1h
    if (intid == 1) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        end

        --itemaddpart
        if (intid == 11) then
                  player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 0, 40)
          elseif (intid == 12) then
                    player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 4, 40)
            elseif (intid == 13) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 7, 40)
              elseif (intid == 14) then
                        player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 13, 40)
                elseif (intid == 15) then
                          player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Одноручный топор. 40 "..crystal, 1, 11)
        player:GossipMenuAddItem(6, "Одноручная булава. 40 "..crystal, 1, 12)
        player:GossipMenuAddItem(6, "Одноручный меч. 40 "..crystal, 1, 13)
        player:GossipMenuAddItem(6, "Кастет. 40 "..crystal, 1, 14)
        player:GossipMenuAddItem(6, "Кинжал. 40 "..crystal, 1, 15)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 15, 40)
      end
-- END 1h

-- 2h
if (intid == 2) then
            player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
    end

    if (intid == 21) then
      player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 1, 40)
      elseif (intid == 22) then
        player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 5, 40)
        elseif (intid == 23) then
          player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 8, 40)
          elseif (intid == 24) then
            player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 6, 40)
            elseif (intid == 25) then
              player:GossipClearMenu()
                    player:GossipMenuAddItem(6, "Двуручный топор. 40 "..crystal, 1, 21)
        player:GossipMenuAddItem(6, "Двуручная булава. 40 "..crystal, 1, 22)
        player:GossipMenuAddItem(6, "Двуручный меч. 40 "..crystal, 1, 23)
        player:GossipMenuAddItem(6, "Копье. 40 "..crystal, 1, 24)
        player:GossipMenuAddItem(6, "Посох. 40 "..crystal, 1, 25)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 10, 40)

    end
-- END 2h

-- shield
    if (intid == 3) then
                player:GossipClearMenu()
                  player:GossipMenuAddItem(1, "Покупка случайного одноручного оружия. 40 "..crystal, 1, 1)
  player:GossipMenuAddItem(1, "Покупка случайного двуручного оружия. 40 "..crystal, 1, 2)
  player:GossipMenuAddItem(1, "Покупка случайного оружия дальнего боя. 40 "..crystal, 1, 9)
  player:GossipMenuAddItem(1, "Покупка щитов. 40 "..crystal, 1, 3)
  player:GossipMenuAddItem(1, "Покупка латной брони. 30 "..crystal, 1, 4)
  player:GossipMenuAddItem(1, "Покупка кольчужной брони. 30 "..crystal, 1, 5)
  player:GossipMenuAddItem(1, "Покупка кожаной брони. 30 "..crystal, 1, 6)
  player:GossipMenuAddItem(1, "Покупка тканевой брони. 30 "..crystal, 1, 7)
  player:GossipMenuAddItem(1, "Покупка бижутерии. 25 "..crystal, 1, 8)
  player:GossipMenuAddItem(0, "До скорого!", 1, 228)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 6, 40)
        end
-- END shield

-- plate
    if (intid == 4) then
                player:GossipClearMenu()

        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)

        player:GossipSendMenu(1, object, MenuKidalaID)
        end

        if (intid == 41) then
          player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 1)
          elseif (intid == 42) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 3)
        elseif (intid == 43) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 5)
        elseif (intid == 44) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 6)
        elseif (intid == 45) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 7)
        elseif (intid == 46) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 8)
        elseif (intid == 47) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 9)
        elseif (intid == 48) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 41)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 42)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 43)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 44)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 45)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 46)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 47)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 48)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 4, 30, 10)
          end
-- END plate

-- mail
   if (intid == 5) then
                player:GossipClearMenu()

        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)

        player:GossipSendMenu(1, object, MenuKidalaID)
        end

        if (intid == 51) then
          player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 1)
          elseif (intid == 52) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 3)
        elseif (intid == 53) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 5)
        elseif (intid == 54) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 6)
        elseif (intid == 55) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 7)
        elseif (intid == 56) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 8)
        elseif (intid == 57) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 9)
        elseif (intid == 58) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 51)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 52)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 53)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 54)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 55)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 56)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 57)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 58)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 3, 30, 10)
          end
-- END mail

-- leather
       if (intid == 6) then
                player:GossipClearMenu()

        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)

        player:GossipSendMenu(1, object, MenuKidalaID)
        end

        if (intid == 61) then
          player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 1)
          elseif (intid == 62) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 3)
        elseif (intid == 63) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 5)
        elseif (intid == 64) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 6)
        elseif (intid == 65) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 7)
        elseif (intid == 66) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 8)
        elseif (intid == 67) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 9)
        elseif (intid == 68) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 61)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 62)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 63)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 64)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 65)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 66)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 67)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 68)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 2, 30, 10)
          end
-- END leather

-- cloth
   if (intid == 7) then
                player:GossipClearMenu()

        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)

        player:GossipSendMenu(1, object, MenuKidalaID)
        end

        if (intid == 71) then
          player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 1)
          elseif (intid == 72) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 3)
        elseif (intid == 73) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 5)
        elseif (intid == 74) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 6)
        elseif (intid == 75) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 7)
        elseif (intid == 76) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 8)
        elseif (intid == 77) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 9)
        elseif (intid == 78) then
                      player:GossipClearMenu()
        player:GossipMenuAddItem(6, "Головной убор. 30 "..crystal, 1, 71)
        player:GossipMenuAddItem(6, "Плечи. 30 "..crystal, 1, 72)
        player:GossipMenuAddItem(6, "Нагрудный доспех. 30 "..crystal, 1, 73)
        player:GossipMenuAddItem(6, "Пояс. 30 "..crystal, 1, 74)
        player:GossipMenuAddItem(6, "Ноги. 30 "..crystal, 1, 75)
        player:GossipMenuAddItem(6, "Обувь. 30 "..crystal, 1, 76)
        player:GossipMenuAddItem(6, "Запястья. 30 "..crystal, 1, 77)
        player:GossipMenuAddItem(6, "Перчатки. 30 "..crystal, 1, 78)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 1, 30, 10)
          end
-- END cloth

-- other
    if (intid == 8) then
                player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Кольцо. 25 "..crystal, 1, 81)
        player:GossipMenuAddItem(6, "Шея. 25 "..crystal, 1, 82)
        player:GossipMenuAddItem(6, "Аксессуар. 25 "..crystal, 1, 83)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        end
        if (intid == 81) then
           player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Кольцо. 25 "..crystal, 1, 81)
        player:GossipMenuAddItem(6, "Шея. 25 "..crystal, 1, 82)
        player:GossipMenuAddItem(6, "Аксессуар. 25 "..crystal, 1, 83)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 0, 25, 11)
          elseif (intid == 82) then
             player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Кольцо. 25 "..crystal, 1, 81)
        player:GossipMenuAddItem(6, "Шея. 25 "..crystal, 1, 82)
        player:GossipMenuAddItem(6, "Аксессуар. 25 "..crystal, 1, 83)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 0, 25, 2)
        elseif (intid == 83) then
          player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Кольцо. 25 "..crystal, 1, 81)
        player:GossipMenuAddItem(6, "Шея. 25 "..crystal, 1, 82)
        player:GossipMenuAddItem(6, "Аксессуар. 25 "..crystal, 1, 83)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 4, 0, 25, 12)
          end
-- END other

-- range weapon
    if (intid == 9) then
                player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Ружье/Лук/Арбалет. 40 "..crystal, 1, 91)
        player:GossipMenuAddItem(6, "Метательное. 40 "..crystal, 1, 92)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        end
        if (intid == 91) then
           player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Ружье/Лук/Арбалет. 40 "..crystal, 1, 91)
        player:GossipMenuAddItem(6, "Метательное. 40 "..crystal, 1, 92)
        player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        local typ = math.random(1,3)
        local range = 2
        if (typ == 1) then
          range = 2
          elseif (typ == 2) then
            range = 3
            elseif (typ == 3) then
              range = 18
          end
        kidanie(player, 2, range, 40)
          elseif (intid == 92) then
             player:GossipClearMenu()
                player:GossipMenuAddItem(6, "Ружье/Лук/Арбалет. 40 "..crystal, 1, 91)
        player:GossipMenuAddItem(6, "Метательное. 40 "..crystal, 1, 92)
                player:GossipMenuAddItem(0, "Назад", 1, 229)
        player:GossipSendMenu(1, object, MenuKidalaID)
        kidanie(player, 2, 16, 40)
      end
-- range
end



RegisterCreatureGossipEvent(NpcKidalaID, 1, OnGossipHelloKIDALA)
RegisterCreatureGossipEvent(NpcKidalaID, 2, OnGossipSelectKIDALA)