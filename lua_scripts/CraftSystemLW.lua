local BSCraftText1 = 45000 -- "Кажется, огонь разгорелся достаточно. Можно приступать к ковке."
local BSCraftText2 = 45001 -- "Надо бы определиться, чего ковать-то будем..."
local BSCraftText3 = 45002 -- "Вы с недоумением, и в то же время с негодованием смотрите на горн, угли которого не так давно погасли."

local itemId = 0
local class = 0
local subclass = 0
local Quality = 0
local InventoryType = 0
local entry = 0

LWObjectID = 600015
LWCraftText1 = 45002

--RESOURCES--

local JESTKAYA_KOJA = 2319
local RULON_LNYANAYA_TKAN = 2996
local TOLSTAYA_KOJA = 4234
local TONKAYA_NIT = 2321
local OBRABOTANNAYA_PLOTNAYA_SHKURA = 8172
local TIGER_EYE = 818
local PLOTNAYA_KOJA = 4304
local MOXOVII_AGAT = 1206

function LeatherworkingCraft_OnHello(event, player, object)
  player:GossipClearMenu()

  if (player:HasItem(150002)) then
  player:GossipClearMenu()
  player:GossipMenuAddItem(4, "Работа по коже", 1, 1)
  player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
  player:GossipSendMenu(1, object, LWCraftText1)
  player:AddAura(58925, player)
  
else
  player:SendUnitWhisper("- Я не могу этого сделать.", player)
  end

end


function LeatherworkingCraft_OnSelect(event, player, object, sender, intid, code, menuid)
   if (intid == 1) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Начать работу", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, LWCraftText1)
   end

   if (intid == 2) then
        player:GossipComplete()
        player:RemoveAura(58925)
        
   end

   if (intid == 3) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Создать предмет", 1, 5, true)
        player:GossipMenuAddItem(0, "Назад", 1, 7)
        player:GossipSendMenu(1, object, LWCraftText1)
   end

   if (intid == 7) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Начать работу", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, LWCraftText1)
   end

   if (intid == 50) then
       player:GossipClearMenu()
       player:GossipMenuAddItem(4, "Работа по коже", 1, 1)
       player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
       player:GossipSendMenu(1, object, LWCraftText1)
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
                  player:GossipMenuAddItem(4, "Создать предмет", 1, 5, true)
                  player:GossipMenuAddItem(0, "Назад", 1, 7)
                  player:GossipSendMenu(1, object, LWCraftText1)

                     if (class == 4 and subclass == 2) then
               if (Quality == 0 and InventoryType == 1) then
                  if (player:HasItem(JESTKAYA_KOJA, 3) and player:HasItem(RULON_LNYANAYA_TKAN, 2)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 3)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 2)
                   else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 3) then
                  if (player:HasItem(JESTKAYA_KOJA, 5) and player:HasItem(RULON_LNYANAYA_TKAN,3)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 5)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(JESTKAYA_KOJA, 7) and player:HasItem(RULON_LNYANAYA_TKAN, 4)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 7)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 7) then
                  if (player:HasItem(JESTKAYA_KOJA, 6) and player:HasItem(RULON_LNYANAYA_TKAN, 5)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 6)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 10) then
                  if (player:HasItem(JESTKAYA_KOJA, 4) and player:HasItem(RULON_LNYANAYA_TKAN, 3)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 4)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 6) then
                  if (player:HasItem(JESTKAYA_KOJA, 2) and player:HasItem(RULON_LNYANAYA_TKAN, 2)) then
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
                    
                     player:RemoveItem(JESTKAYA_KOJA, 2)
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


              if (Quality == 1 and InventoryType == 1) then
                  if (player:HasItem(TOLSTAYA_KOJA, 3) and player:HasItem(MAGICHESKAYA_TKAN, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 3)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 3) then
                  if (player:HasItem(TOLSTAYA_KOJA, 5) and player:HasItem(MAGICHESKAYA_TKAN, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 5)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(TOLSTAYA_KOJA, 7) and player:HasItem(MAGICHESKAYA_TKAN, 3)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 7)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 7) then
                  if (player:HasItem(TOLSTAYA_KOJA, 6) and player:HasItem(MAGICHESKAYA_TKAN, 4)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 6)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 10) then
                  if (player:HasItem(TOLSTAYA_KOJA, 4) and player:HasItem(MAGICHESKAYA_TKAN, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 4)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 6) then
                  if (player:HasItem(TOLSTAYA_KOJA, 2) and player:HasItem(MAGICHESKAYA_TKAN, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 2)
                     player:RemoveItem(MAGICHESKAYA_TKAN, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end



               if (Quality == 2 and InventoryType == 1) then
                  if (player:HasItem(TOLSTAYA_KOJA, 4) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 4)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 3) then
                  if (player:HasItem(TOLSTAYA_KOJA, 5) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 5)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                  end
                  end

               if (Quality == 2 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(TOLSTAYA_KOJA, 7) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 3) and player:HasItem(818, 3)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 7)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 3)
                     player:RemoveItem(818, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 7) then
                  if (player:HasItem(TOLSTAYA_KOJA, 6) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 6)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 10) then
                  if (player:HasItem(TOLSTAYA_KOJA, 4) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 4)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 2)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 6) then
                  if (player:HasItem(TOLSTAYA_KOJA, 2) and player:HasItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 2)
                     player:RemoveItem(OBRABOTANNAYA_PLOTNAYA_SHKURA, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


               if (Quality == 3 and InventoryType == 1) then
                  if (player:HasItem(TOLSTAYA_KOJA, 5) and player:HasItem(PLOTNAYA_KOJA, 2) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 5)
                     player:RemoveItem(PLOTNAYA_KOJA, 2)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 3) then
                  if (player:HasItem(TOLSTAYA_KOJA, 7) and player:HasItem(PLOTNAYA_KOJA, 3) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 7)
                     player:RemoveItem(PLOTNAYA_KOJA, 3)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(TOLSTAYA_KOJA, 9) and player:HasItem(PLOTNAYA_KOJA, 3) and player:HasItem(1206, 5)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 9)
                     player:RemoveItem(PLOTNAYA_KOJA, 3)
                     player:RemoveItem(1206, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 7) then
                  if (player:HasItem(TOLSTAYA_KOJA, 8) and player:HasItem(PLOTNAYA_KOJA, 2) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 8)
                     player:RemoveItem(PLOTNAYA_KOJA, 2)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 10) then
                  if (player:HasItem(TOLSTAYA_KOJA, 6) and player:HasItem(PLOTNAYA_KOJA, 2) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 6)
                     player:RemoveItem(PLOTNAYA_KOJA, 2)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 6) then
                  if (player:HasItem(TOLSTAYA_KOJA, 4) and player:HasItem(PLOTNAYA_KOJA, 1) and player:HasItem(1206, 1)) then
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
                    
                     player:RemoveItem(TOLSTAYA_KOJA, 4)
                     player:RemoveItem(PLOTNAYA_KOJA, 1)
                     player:RemoveItem(1206, 1)
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






RegisterGameObjectGossipEvent(LWObjectID, 1, LeatherworkingCraft_OnHello)
RegisterGameObjectGossipEvent(LWObjectID, 2, LeatherworkingCraft_OnSelect)    