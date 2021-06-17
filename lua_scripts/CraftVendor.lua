local NpcGoblinID = 90021
local MenuGoblinID = 1243878
local crystal = "|TInterface\\icons\\FB415EF44E64A165E29BD1EBCD747627.blp:16:16|t"
local currency = 150006

local RULON_LNYANAYA_TKAN = 2996
local TONKAYA_NIT = 2321
local RULON_SHERSTI = 2997
local TIGROVII_GLAZ = 818
local MOXOVII_AGAT = 1206
local SHELKOVAYA_NIT = 4291
local RULON_SHELKA = 4305
local MAGICHESKAYA_TKAN = 4339
local JESTKAYA_KOJA = 2319
local TOLSTAYA_KOJA = 4234
local OBRABOTANNAYA_PLOTNAYA_SHKURA = 8172
local PLOTNAYA_KOJA = 4304
local JELEZNII_SLITOK = 3575
local MALENKAYA_BLESTASHAYA_JEMCHUZHINA = 5498
local MALAXIT = 774
local STALNOI_SLITOK = 3859
local MIFRILOVII_SLITOK = 3860
local PROCHNII_PRIKLAD = 4400
local DEREVYANNI_PRIKLAD = 4399

local function OnGossipHelloGoblin(event, player, object)
    player:GossipClearMenu()
    local chartype = WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';")
    if (chartype and chartype:GetInt32(0)==0) then
    player:GossipMenuAddItem(3, "Прокачка профессий", 1, 1)
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на реагенты", 1, 2)
    player:GossipMenuAddItem(1, "Покупка инструментов. 250 "..crystal, 1, 3)
    end
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на золото (500 осколков - 2.5 золотые)", 1, 4)
    player:GossipMenuAddItem(0, "До скорого!", 1, 228)
    player:GossipSendMenu(1, object, MenuGoblinID)
end

local function OnGossipSelectGoblin(event, player, object, sender, intid, code, menuid)
if (intid == 229) then
   player:GossipClearMenu()
    local chartype = WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';")
    if (chartype and chartype:GetInt32(0)==0) then
    player:GossipMenuAddItem(3, "Прокачка профессий", 1, 1)
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на реагенты", 1, 2)
    player:GossipMenuAddItem(1, "Покупка инструментов. 250 "..crystal, 1, 3)
    end
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на золото (500 осколков - 2.5 золотые)", 1, 4)
    player:GossipMenuAddItem(0, "До скорого!", 1, 228)
    player:GossipSendMenu(1, object, MenuGoblinID)
end

if (intid == 228) then
  player:GossipComplete()
end

--professionz
if (intid == 1) then
  
  player:GossipClearMenu()
  player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

  elseif (intid == 11) then
    --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)
  
    --//"hack"
    player:GossipComplete()

    if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3465)
    player:SetSkill(171, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
    elseif (intid == 12) then
      --player:GossipClearMenu() commented out on the advice of Tommy
      player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

      if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3539)
    player:SetSkill(164, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
      elseif (intid == 13) then
        --player:GossipClearMenu() commented out on the advice of Tommy
        player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

        if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3568)
    player:SetSkill(186, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
        elseif (intid == 14) then
          --player:GossipClearMenu() commented out on the advice of Tommy
          player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

          if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3571)
    player:SetSkill(182, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
          elseif (intid == 15) then
            --player:GossipClearMenu() commented out on the advice of Tommy
            player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

            if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3812)
    player:SetSkill(165, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
            elseif (intid == 16) then
              --player:GossipClearMenu() commented out on the advice of Tommy
              player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

              if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(3913)
    player:SetSkill(197, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
              elseif (intid == 17) then
                --player:GossipClearMenu() commented out on the advice of Tommy
                player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

                if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(4041)
    player:SetSkill(202, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                elseif (intid == 18) then
                  --player:GossipClearMenu() commented out on the advice of Tommy
                  player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

                  if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(7416)
    player:SetSkill(333, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                  elseif (intid == 19) then
                    --player:GossipClearMenu() commented out on the advice of Tommy
                    player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

                    if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(8620)
    player:SetSkill(393, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                    elseif (intid == 20) then
                      --player:GossipClearMenu() commented out on the advice of Tommy
                      player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

                      if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(28896)
    player:SetSkill(755, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                      elseif (intid == 21) then
                        --player:GossipClearMenu() commented out on the advice of Tommy
                        player:GossipMenuAddItem(3, "Алхимия. 250 "..crystal, 1, 11)
  player:GossipMenuAddItem(3, "Кузнечное дело. 250 "..crystal, 1, 12)
  player:GossipMenuAddItem(3, "Горное дело. 250 "..crystal, 1, 13)
  player:GossipMenuAddItem(3, "Травничество. 250 "..crystal, 1, 14)
  player:GossipMenuAddItem(3, "Кожевничество. 250 "..crystal, 1, 15)
  player:GossipMenuAddItem(3, "Портняжное дело. 250 "..crystal, 1, 16)
  player:GossipMenuAddItem(3, "Инженерное дело. 250 "..crystal, 1, 17)
  player:GossipMenuAddItem(3, "Наложение чар. 250 "..crystal, 1, 18)
  player:GossipMenuAddItem(3, "Снятие шкур. 250 "..crystal, 1, 19)
  player:GossipMenuAddItem(3, "Ювелирное дело. 250 "..crystal, 1, 20)
  player:GossipMenuAddItem(3, "Начертание. 250 "..crystal, 1, 21)

  player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

                        if player:HasItem(currency, 50*5) then
    player:RemoveItem(currency, 50*5)
    player:LearnSpell(45377)
    player:SetSkill(773, 2, 225, 225)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
  end
--professionz end

--trade of reagenrz
if (intid == 2) then
    player:GossipClearMenu()
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
  player:GossipSendMenu(1, object, MenuGoblinID)
  elseif (intid == 30) then
      --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
    if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(JELEZNII_SLITOK, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
    elseif (intid == 31) then
        --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
      if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(JESTKAYA_KOJA, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
      elseif (intid == 32) then
          --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
        if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(STALNOI_SLITOK, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
        elseif (intid == 33) then
            --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
          if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(PLOTNAYA_KOJA, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
          elseif (intid == 34) then
              --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
            if player:HasItem(currency, 5*5) then
    player:RemoveItem(currency, 5*5)
    player:AddItem(TIGROVII_GLAZ, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
            elseif (intid == 35) then
                --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
              if player:HasItem(currency, 3*5) then
    player:RemoveItem(currency, 3*5)
    player:AddItem(MIFRILOVII_SLITOK, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
              elseif (intid == 36) then
                  --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                if player:HasItem(currency, 15*5) then
    player:RemoveItem(currency, 15*5)
    player:AddItem(MOXOVII_AGAT, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                elseif (intid == 37) then
                    --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                  if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(RULON_LNYANAYA_TKAN, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                  elseif (intid == 38) then
                      --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                    if player:HasItem(currency, 3*5) then
    player:RemoveItem(currency, 3*5)
    player:AddItem(MAGICHESKAYA_TKAN, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                    elseif (intid == 39) then
                        --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                      if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(RULON_SHELKA, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end

    elseif (intid == 40) then
        --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                      if player:HasItem(currency, 2*5) then
    player:RemoveItem(currency, 2*5)
    player:AddItem(RULON_SHERSTI, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
                      elseif (intid == 41) then
                          --player:GossipClearMenu() commented out on the advice of Tommy
    player:GossipMenuAddItem(6, "Железный слиток. 10 "..crystal, 1, 30)
    player:GossipMenuAddItem(6, "Жесткая кожа. 10 "..crystal, 1, 31) 
    player:GossipMenuAddItem(6, "Стальной слиток. 10 "..crystal, 1, 32) 
    player:GossipMenuAddItem(6, "Плотная кожа. 10 "..crystal, 1, 33)
    player:GossipMenuAddItem(6, "Тигровый глаз. 25 "..crystal, 1, 34)
    player:GossipMenuAddItem(6, "Мифриловый слиток. 15 "..crystal, 1, 35)
    player:GossipMenuAddItem(6, "Моховой агат. 75 "..crystal, 1, 36)
    player:GossipMenuAddItem(6, "Рулон льняной ткани. 10 "..crystal, 1, 37)
    player:GossipMenuAddItem(6, "Рулон магической ткани. 15 "..crystal, 1, 38)
    player:GossipMenuAddItem(6, "Рулон шелка. 10 "..crystal, 1, 39)
    player:GossipMenuAddItem(6, "Рулон шерсти. 10 "..crystal, 1, 40)
    player:GossipMenuAddItem(6, "Маленькая блестящая жемчужина. 25 "..crystal, 1, 41)

    player:GossipMenuAddItem(0, "Назад", 1, 229)
    player:GossipSendMenu(1, object, MenuGoblinID)
                        if player:HasItem(currency, 5*5) then
    player:RemoveItem(currency, 5*5)
    player:AddItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
end
-- trade of reagentz end

-- all other shit
if (intid == 3) then
  --player:GossipClearMenu() commented out on the advice of Tommy
    local chartype = WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';")
    if (chartype and chartype:GetInt32(0)==0) then
    player:GossipMenuAddItem(3, "Прокачка профессий", 1, 1)
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на реагенты", 1, 2)
    player:GossipMenuAddItem(1, "Покупка инструментов. 250 "..crystal, 1, 3)
    end
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на золото (500 осколков - 2.5 золотые)", 1, 4)
    player:GossipMenuAddItem(0, "До скорого!", 1, 228)
    player:GossipSendMenu(1, object, MenuGoblinID)
    
  if player:HasItem(currency, 50*5) then
    if not(player:HasItem(97400, 1)) then
          player:RemoveItem(currency, 50*5)
    player:AddItem(97400, 1)
  else 
    player:SendUnitWhisper(" - У меня уже достаточно таких предметов.", player)
  end
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
end

if (intid == 4) then
  --player:GossipClearMenu() commented out on the advice of Tommy
    local chartype = WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';")
    if (chartype and chartype:GetInt32(0)==0) then
    player:GossipMenuAddItem(3, "Прокачка профессий", 1, 1)
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на реагенты", 1, 2)
    player:GossipMenuAddItem(1, "Покупка инструментов. 250 "..crystal, 1, 3)
    end
    player:GossipMenuAddItem(6, "Обмен "..crystal.." на золото (500 осколков - 2.5 золотые)", 1, 4)
    player:GossipMenuAddItem(0, "До скорого!", 1, 228)
    player:GossipSendMenu(1, object, MenuGoblinID)

    --//"hack"
    player:GossipComplete()

  if player:HasItem(currency, 100*5) then
    player:RemoveItem(currency, 100*5)
    player:ModifyMoney(25000)
  else
    player:SendUnitWhisper(" - У меня недостаточно средств для совершения этой операции.", player)
    end
end
-- all other shit end
end




RegisterCreatureGossipEvent(NpcGoblinID, 1, OnGossipHelloGoblin)
RegisterCreatureGossipEvent(NpcGoblinID, 2, OnGossipSelectGoblin)