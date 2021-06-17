local BSCraftText1 = 45000 -- "Кажется, огонь разгорелся достаточно. Можно приступать к ковке."
local BSCraftText2 = 45001 -- "Надо бы определиться, чего ковать-то будем..."
local BSCraftText3 = 45002 -- "Вы с недоумением, и в то же время с негодованием смотрите на горн, угли которого не так давно погасли."

local itemId = 0
local class = 0
local subclass = 0
local Quality = 0
local InventoryType = 0
local entry = 0

TLObjectID = 600018
TLCraftText1 = 45003

--RESOURCES--

local RULON_LNYANAYA_TKAN = 2996
local TONKAYA_NIT = 2321
local RULON_SHERSTI = 2997
local TIGROVII_GLAZ = 818
local MOXOVII_AGAT = 1206
local SHELKOVAYA_NIT = 4291
local RULON_SHELKA = 4305
local MAGICHESKAYA_TKAN = 4339

function TailoringCraft_OnHello(event, player, object)
  player:GossipClearMenu()

  if (player:HasItem(150003)) then
  player:GossipClearMenu()
  player:GossipMenuAddItem(4, "Портняжное дело", 1, 1)
  player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
  player:GossipSendMenu(1, object, TLCraftText1)
  player:AddAura(58925, player)
else
  player:SendUnitWhisper("- Я не могу этого сделать.", player)
  end

end


function TailoringCraft_OnSelect(event, player, object, sender, intid, code, menuid)
   if (intid == 1) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Начать работу", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, TLCraftText1)
   end

   if (intid == 2) then
        player:GossipComplete()
        player:RemoveAura(58925)
        
   end

   if (intid == 3) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Сшить предмет", 1, 5, true)
        player:GossipMenuAddItem(0, "Назад", 1, 7)
        player:GossipSendMenu(1, object, TLCraftText1)
   end

   if (intid == 7) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Начать работу", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, TLCraftText1)
   end

   if (intid == 50) then
       player:GossipClearMenu()
       player:GossipMenuAddItem(4, "Портняжное дело", 1, 1)
       player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
       player:GossipSendMenu(1, object, TLCraftText1)
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
                  player:GossipSendMenu(1, object, TLCraftText1)

                     if (class == 4 and subclass == 1) then

               if (Quality == 0 and InventoryType == 1) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 3) and player:HasItem(TONKAYA_NIT, 2)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 3)
                     player:RemoveItem(TONKAYA_NIT, 2)
                   else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 3) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 5) and player:HasItem(TONKAYA_NIT,3)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 5)
                     player:RemoveItem(TONKAYA_NIT, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 7) and player:HasItem(TONKAYA_NIT, 4)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 7)
                     player:RemoveItem(TONKAYA_NIT, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 7) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 6) and player:HasItem(TONKAYA_NIT, 5)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 6)
                     player:RemoveItem(TONKAYA_NIT, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 10) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 4) and player:HasItem(TONKAYA_NIT, 3)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 4)
                     player:RemoveItem(TONKAYA_NIT, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 6) then
                  if (player:HasItem(RULON_LNYANAYA_TKAN, 2) and player:HasItem(TONKAYA_NIT, 2)) then
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
                    
                     player:RemoveItem(RULON_LNYANAYA_TKAN, 2)
                     player:RemoveItem(RTONKAYA_NIT, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


              if (Quality == 1 and InventoryType == 1) then
                  if (player:HasItem(RULON_SHERSTI, 3) and player:HasItem(TONKAYA_NIT, 1)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 3)
                     player:RemoveItem(TONKAYA_NIT, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 3) then
                  if (player:HasItem(RULON_SHERSTI, 5) and player:HasItem(TONKAYA_NIT, 2)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 5)
                     player:RemoveItem(TONKAYA_NIT, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(RULON_SHERSTI, 7) and player:HasItem(TONKAYA_NIT, 3)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 7)
                     player:RemoveItem(TONKAYA_NIT, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 7) then
                  if (player:HasItem(RULON_SHERSTI, 6) and player:HasItem(TONKAYA_NIT, 4)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 6)
                     player:RemoveItem(TONKAYA_NIT, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 10) then
                  if (player:HasItem(RULON_SHERSTI, 4) and player:HasItem(TONKAYA_NIT, 2)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 4)
                     player:RemoveItem(TONKAYA_NIT, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 6) then
                  if (player:HasItem(RULON_SHERSTI, 2) and player:HasItem(TONKAYA_NIT, 1)) then
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
                    
                     player:RemoveItem(RULON_SHERSTI, 2)
                     player:RemoveItem(TONKAYA_NIT, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end



               

               if (Quality == 2 and InventoryType == 1) then
                  if (player:HasItem(RULON_SHELKA, 3) and player:HasItem(TONKAYA_NIT, 1) and player:HasItem(TIGROVII_GLAZ, 1)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 3)
                     player:RemoveItem(TONKAYA_NIT, 1)
                     player:RemoveItem(TIGROVII_GLAZ, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 3) then
                  if (player:HasItem(RULON_SHELKA, 4) and player:HasItem(TONKAYA_NIT, 2) and player:HasItem(TIGROVII_GLAZ, 2)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 4)
                     player:RemoveItem(TONKAYA_NIT, 2)
                     player:RemoveItem(TIGROVII_GLAZ, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                  end
                  end

               if (Quality == 2 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(RULON_SHELKA, 5) and player:HasItem(TONKAYA_NIT, 3) and player:HasItem(TIGROVII_GLAZ, 3)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 5)
                     player:RemoveItem(TONKAYA_NIT, 3)
                     player:RemoveItem(TIGROVII_GLAZ, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 7) then
                  if (player:HasItem(RULON_SHELKA, 5) and player:HasItem(TONKAYA_NIT, 2) and player:HasItem(TIGROVII_GLAZ, 2)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 5)
                     player:RemoveItem(TONKAYA_NIT, 2)
                     player:RemoveItem(TIGROVII_GLAZ, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 10) then
                  if (player:HasItem(RULON_SHELKA, 3) and player:HasItem(TONKAYA_NIT, 2) and player:HasItem(TIGROVII_GLAZ, 1)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 3)
                     player:RemoveItem(TONKAYA_NIT, 2)
                     player:RemoveItem(TIGROVII_GLAZ, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 6) then
                  if (player:HasItem(RULON_SHELKA, 1) and player:HasItem(TONKAYA_NIT, 1) and player:HasItem(TIGROVII_GLAZ, 1)) then
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
                    
                     player:RemoveItem(RULON_SHELKA, 1)
                     player:RemoveItem(TONKAYA_NIT, 1)
                     player:RemoveItem(TIGROVII_GLAZ, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


               if (Quality == 3 and InventoryType == 1) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 4) and player:HasItem(SHELKOVAYA_NIT, 2) and player:HasItem(MOXOVII_AGAT, 2)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 4)
                     player:RemoveItem(SHELKOVAYA_NIT, 2)
                     player:RemoveItem(MOXOVII_AGAT, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 3) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 6) and player:HasItem(SHELKOVAYA_NIT, 3) and player:HasItem(MOXOVII_AGAT, 4)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 6)
                     player:RemoveItem(SHELKOVAYA_NIT, 3)
                     player:RemoveItem(MOXOVII_AGAT, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 8) and player:HasItem(SHELKOVAYA_NIT, 3) and player:HasItem(MOXOVII_AGAT, 5)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 8)
                     player:RemoveItem(SHELKOVAYA_NIT, 3)
                     player:RemoveItem(MOXOVII_AGAT, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 7) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 7) and player:HasItem(SHELKOVAYA_NIT, 2) and player:HasItem(MOXOVII_AGAT, 4)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 7)
                     player:RemoveItem(SHELKOVAYA_NIT, 2)
                     player:RemoveItem(MOXOVII_AGAT, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 10) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 5) and player:HasItem(SHELKOVAYA_NIT, 2) and player:HasItem(MOXOVII_AGAT, 2)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 5)
                     player:RemoveItem(SHELKOVAYA_NIT, 2)
                     player:RemoveItem(MOXOVII_AGAT, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 6) then
                  if (player:HasItem(MAGICHESKAYA_TKAN, 3) and player:HasItem(SHELKOVAYA_NIT, 1) and player:HasItem(MOXOVII_AGAT, 1)) then
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
                    
                     player:RemoveItem(MAGICHESKAYA_TKAN, 3)
                     player:RemoveItem(SHELKOVAYA_NIT, 1)
                     player:RemoveItem(MOXOVII_AGAT, 1)
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






RegisterGameObjectGossipEvent(TLObjectID, 1, TailoringCraft_OnHello)
RegisterGameObjectGossipEvent(TLObjectID, 2, TailoringCraft_OnSelect)    