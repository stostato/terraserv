local BSCraftText1 = 45000 -- "Кажется, огонь разгорелся достаточно. Можно приступать к ковке."
local BSCraftText2 = 45001 -- "Надо бы определиться, чего ковать-то будем..."
local BSCraftText3 = 45002 -- "Вы с недоумением, и в то же время с негодованием смотрите на горн, угли которого не так давно погасли."

local itemId = 0
local class = 0
local subclass = 0
local Quality = 0
local InventoryType = 0
local entry = 0

ARObjectID = 600012
ARCraftText1 = 45001

--RESOURCES--

local RULON_LNYANAYA_TKAN = 2996
local TONKAYA_NIT = 2321
local RULON_SHERSTI = 2997
local TIGROVII_GLAZ = 818
local MOXOVII_AGAT = 1206
local SHELKOVAYA_NIT = 4291
local RULON_SHELKA = 4305
local MAGICHESKAYA_TKAN = 4339
local JESTKAYA_KOJA = 2319
local JELEZNII_SLITOK = 3575
local MALENKAYA_BLESTASHAYA_JEMCHUZHINA = 5498
local MALAXIT = 774
local STALNOI_SLITOK = 3859
local MIFRILOVII_SLITOK = 3860
local PLOTNAYA_KOJA = 4304
local PROCHNII_PRIKLAD = 4400
local DEREVYANNI_PRIKLAD = 4399


function ArmorCraft_OnHello(event, player, object)
  player:GossipClearMenu()

  if (player:HasItem(150004)) then
  player:GossipClearMenu()
  player:GossipMenuAddItem(4, "Создание оружия", 1, 1)
  player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
  player:GossipSendMenu(1, object, ARCraftText1)
  player:AddAura(58925, player)
else
  player:SendUnitWhisper("- Я не могу этого сделать.", player)
  end

end


function ArmorCraft_OnSelect(event, player, object, sender, intid, code, menuid)
   if (intid == 1) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Приступить к изготовлению", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, ARCraftText1)
   end

   if (intid == 2) then
        player:GossipComplete()
        player:RemoveAura(58925)
        
   end

   if (intid == 3) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Создать оружие", 1, 5, true)
        player:GossipMenuAddItem(0, "Назад", 1, 7)
        player:GossipSendMenu(1, object, ARCraftText1)
   end

   if (intid == 7) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Приступить к изготовлению", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, ARCraftText1)
   end

   if (intid == 50) then
       player:GossipClearMenu()
       player:GossipMenuAddItem(4, "Создание оружия", 1, 1)
       player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
       player:GossipSendMenu(1, object, ARCraftText1)
   end


   if (intid == 5) then
        if (tonumber(code) and tonumber(code) ~= 0) then
            local checkIdAndQuality = WorldDBQuery("SELECT class, subclass, Quality, InventoryType, entry FROM item_template WHERE entry = "..tonumber(code).."")
                 if (checkIdAndQuality) then
                  class = checkIdAndQuality:GetInt32(0)
                  subclass = checkIdAndQuality:GetInt32(1)
                  Quality = checkIdAndQuality:GetInt32(2)
                  InventoryType = checkIdAndQuality:GetInt32(3)
                  entry = checkIdAndQuality:GetInt32(4)
                  player:GossipClearMenu()
                  player:GossipMenuAddItem(4, "Сшить предмет", 1, 5, true)
                  player:GossipMenuAddItem(0, "Назад", 1, 7)
                  player:GossipSendMenu(1, object, ARCraftText1)

                  if (class == 4 and subclass == 0 and InventoryType == 23) then -- оффхенды
                    if (Quality == 0) then

                       if (player:HasItem(MALAXIT, 1) and player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MALAXIT, 1)
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                         if (player:HasItem(MALAXIT, 1) and player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MALAXIT, 1)
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                           if (player:HasItem(TIGROVII_GLAZ, 2) and player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 3) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(TIGROVII_GLAZ, 1)
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 3)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                            if (player:HasItem(MOXOVII_AGAT, 2) and player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 3) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  player:GossipComplete()
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MOXOVII_AGAT, 2)
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 3)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                  if (class == 2 and (subclass == 0 or subclass == 4 or subclass == 7 or subclass == 13 or subclass == 15)) then -- 1h weapon
                     if (Quality == 0) then

                       if (player:HasItem(JELEZNII_SLITOK, 4) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 4)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                          if (player:HasItem(JELEZNII_SLITOK, 4) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 4)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                          if (player:HasItem(STALNOI_SLITOK, 4) and player:HasItem(PLOTNAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(STALNOI_SLITOK, 4)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                           if (player:HasItem(MIFRILOVII_SLITOK, 4) and player:HasItem(PLOTNAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MIFRILOVII_SLITOK, 4)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                  if (class == 2 and (subclass == 1 or subclass == 5 or subclass == 6 or subclass == 8 or subclass == 18 or subclass == 20)) then -- 2h weapon
                     if (Quality == 0) then

                       if (player:HasItem(JELEZNII_SLITOK, 8) and player:HasItem(JESTKAYA_KOJA, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 4)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                          if (player:HasItem(JELEZNII_SLITOK, 8) and player:HasItem(JESTKAYA_KOJA, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 4)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                          if (player:HasItem(STALNOI_SLITOK, 8) and player:HasItem(PLOTNAYA_KOJA, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(STALNOI_SLITOK, 4)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                           if (player:HasItem(MIFRILOVII_SLITOK, 8) and player:HasItem(PLOTNAYA_KOJA, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MIFRILOVII_SLITOK, 4)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                  if (class == 2 and (subclass == 2 or subclass == 3 or subclass == 16)) then -- bow,gun
                     if (Quality == 0) then

                       if (player:HasItem(JELEZNII_SLITOK, 2) and player:HasItem(JESTKAYA_KOJA, 1) and player:HasItem(DEREVYANNI_PRIKLAD, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 2)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                          if (player:HasItem(JELEZNII_SLITOK, 2) and player:HasItem(JESTKAYA_KOJA, 1) and player:HasItem(DEREVYANNI_PRIKLAD, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(JELEZNII_SLITOK, 2)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                           if (player:HasItem(STALNOI_SLITOK, 2) and player:HasItem(JESTKAYA_KOJA, 1) and player:HasItem(DEREVYANNI_PRIKLAD, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(STALNOI_SLITOK, 2)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                             if (player:HasItem(MIFRILOVII_SLITOK, 2) and player:HasItem(PLOTNAYA_KOJA, 1) and player:HasItem(PROCHNII_PRIKLAD, 2)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
               if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MIFRILOVII_SLITOK, 2)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     player:RemoveItem(PROCHNII_PRIKLAD, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                  if (class == 2 and (subclass == 10)) then -- staff
                     if (Quality == 0) then

                       if (player:HasItem(DEREVYANNI_PRIKLAD, 2) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 2)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                          if (player:HasItem(DEREVYANNI_PRIKLAD, 2) and player:HasItem(JESTKAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 2)
                     player:RemoveItem(JESTKAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                          if (player:HasItem(DEREVYANNI_PRIKLAD, 4) and player:HasItem(PLOTNAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 2)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                             if (player:HasItem(PROCHNII_PRIKLAD, 4) and player:HasItem(PLOTNAYA_KOJA, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(PROCHNII_PRIKLAD, 2)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                  if (class == 2 and (subclass == 19)) then -- wand
                     if (Quality == 0) then

                       if (player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1) and player:HasItem(DEREVYANNI_PRIKLAD, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                      elseif (Quality == 1) then

                         if (player:HasItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1) and player:HasItem(DEREVYANNI_PRIKLAD, 1)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MALENKAYA_BLESTASHAYA_JEMCHUZHINA, 1)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                        elseif (Quality == 2) then

                          if (player:HasItem(TIGROVII_GLAZ, 3) and player:HasItem(DEREVYANNI_PRIKLAD, 3)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(TIGROVII_GLAZ, 3)
                     player:RemoveItem(DEREVYANNI_PRIKLAD, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          elseif (Quality == 3) then

                              if (player:HasItem(MOXOVII_AGAT, 3) and player:HasItem(PROCHNII_PRIKLAD, 3)) then
                                             local chance = 0

if (WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';") and WorldDBQuery("SELECT type FROM roleplay_characters WHERE player = '"..player:GetName().."';"):GetInt32(0) == 0) then
                chance = math.random(60, 100)
                if (player:HasItem(97400, 1)) then
                  chance = 100
                else
                  chance = 0
                  player:SendUnitWhisper("- Для создания этого предмета мне нужен инструмент получше.", player)
                  return false
                end
               else 
                chance = math.random(20, 100)
              end
                        if (chance >= 80) then
                     player:AddItem(entry, 1)
                          else
                            player:SendUnitWhisper("- Неудачная попытка..", player)
                          end
                                         player:GossipComplete()
                    player:RemoveAura(58925)
                    
                     player:RemoveItem(MOXOVII_AGAT, 3)
                     player:RemoveItem(PROCHNII_PRIKLAD, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end

                          end
                  end

                else
                  player:SendUnitWhisper("- Я не могу создать этот предмет.", player)
                   player:GossipComplete()
                    player:RemoveAura(58925)
                    
        end
   end
        player:GossipComplete()
        player:RemoveAura(58925)
        
end
end






RegisterGameObjectGossipEvent(ARObjectID, 1, ArmorCraft_OnHello)
RegisterGameObjectGossipEvent(ARObjectID, 2, ArmorCraft_OnSelect)    