local BSCraftText1 = 45000 -- "Кажется, огонь разгорелся достаточно. Можно приступать к ковке."
local BSCraftText2 = 45001 -- "Надо бы определиться, чего ковать-то будем..."
local BSCraftText3 = 45002 -- "Вы с недоумением, и в то же время с негодованием смотрите на горн, угли которого не так давно погасли."

local itemId = 0
local class = 0
local subclass = 0
local Quality = 0
local InventoryType = 0
local entry = 0
local ObjectID = 600010




function BlacksmithCraft_OnHello(event, player, object)
	player:GossipClearMenu()

  if (player:HasItem(150001)) then
  player:GossipClearMenu()
	player:GossipMenuAddItem(4, "Создание брони", 1, 1)
	player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
	player:GossipSendMenu(1, object, BSCraftText1)
  player:AddAura(58925, player)
else
  player:SendUnitWhisper("- Я не могу этого сделать.", player)
  end

end


function BlacksmithCraft_OnSelect(event, player, object, sender, intid, code, menuid)
   if (intid == 1) then
   	    player:GossipClearMenu()
   	    player:GossipMenuAddItem(4, "Сборка кольчуги", 1, 3)
   	    player:GossipMenuAddItem(4, "Сборка лат", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
   	    player:GossipSendMenu(1, object, BSCraftText1)
   end

   if (intid == 2) then
   	    player:GossipComplete()
        player:RemoveAura(58925)
        
   end

   if (intid == 3) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(4, "Выковать предмет", 1, 5, true)
        player:GossipMenuAddItem(0, "Назад", 1, 7)
        player:GossipSendMenu(1, object, BSCraftText1)
   end

   if (intid == 7) then
   	    player:GossipClearMenu()
   	    player:GossipMenuAddItem(4, "Ковка кольчуги", 1, 3)
   	    player:GossipMenuAddItem(4, "Ковка лат", 1, 3)
        player:GossipMenuAddItem(0, "Назад", 1, 50)
        player:GossipSendMenu(1, object, BSCraftText1)
   end

   if (intid == 50) then
       player:GossipClearMenu()
       player:GossipMenuAddItem(4, "Создание брони", 1, 1)
       player:GossipMenuAddItem(0, "Развесить инструменты на свои места", 1, 2)
       player:GossipSendMenu(1, object, BSCraftText1)
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
                  player:GossipMenuAddItem(4, "Выковать предмет", 1, 5, true)
        
                  player:GossipMenuAddItem(0, "Назад", 1, 7)
                  player:GossipSendMenu(1, object, BSCraftText1)

                    if (class == 4 and subclass == 3) then
               if (Quality == 0 and InventoryType == 1) then
                  if (player:HasItem(3575, 2) and player:HasItem(2319, 1)) then
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
                    
                     player:RemoveItem(3575, 2)
                     player:RemoveItem(2319, 1)
                   else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 3) then
                  if (player:HasItem(3575, 4) and player:HasItem(2319, 2)) then
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
                    
                     player:RemoveItem(3575, 4)
                     player:RemoveItem(2319, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and (InventoryType == 5 or InventoryType == 20 or InventoryType == 14)) then
                  if (player:HasItem(3575, 6) and player:HasItem(2319, 3)) then
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
                    
                     player:RemoveItem(3575, 6)
                     player:RemoveItem(2319, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 7) then
                  if (player:HasItem(3575, 5) and player:HasItem(2319, 4)) then
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
                    
                     player:RemoveItem(3575, 5)
                     player:RemoveItem(2319, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 10) then
                  if (player:HasItem(3575, 3) and player:HasItem(2319, 2)) then
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
                    
                     player:RemoveItem(3575, 3)
                     player:RemoveItem(2319, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 6) then
                  if (player:HasItem(3575, 2) and player:HasItem(2319, 1)) then
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
                    
                     player:RemoveItem(3575, 2)
                     player:RemoveItem(2319, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


              if (Quality == 1 and InventoryType == 1) then
                  if (player:HasItem(3859, 2) and player:HasItem(4304, 1)) then
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
                    
                     player:RemoveItem(3859, 2)
                     player:RemoveItem(4304, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 3) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 2)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(3859, 6) and player:HasItem(4304, 3)) then
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
                    
                     player:RemoveItem(3859, 6)
                     player:RemoveItem(4304, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 7) then
                  if (player:HasItem(3859, 5) and player:HasItem(4304, 4)) then
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
                    
                     player:RemoveItem(3859, 5)
                     player:RemoveItem(4304, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 10) then
                  if (player:HasItem(3859, 3) and player:HasItem(4304, 2)) then
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
                    
                     player:RemoveItem(3859, 3)
                     player:RemoveItem(4304, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 6) then
                  if (player:HasItem(3859, 2) and player:HasItem(4304, 1)) then
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
                    
                     player:RemoveItem(3859, 2)
                     player:RemoveItem(4304, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end



               if (Quality == 2 and InventoryType == 1) then
                  if (player:HasItem(3859, 2) and player:HasItem(4304, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 2)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 3) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 2) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                  end
                  end

               if (Quality == 2 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(3859, 6) and player:HasItem(4304, 3) and player:HasItem(818, 3)) then
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
                    
                     player:RemoveItem(3859, 6)
                     player:RemoveItem(4304, 3)
                     player:RemoveItem(818, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 7) then
                  if (player:HasItem(3859, 5) and player:HasItem(4304, 4) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(3859, 5)
                     player:RemoveItem(4304, 4)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 10) then
                  if (player:HasItem(3859, 3) and player:HasItem(4304, 2) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 3)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 6) then
                  if (player:HasItem(3859, 2) and player:HasItem(4304, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 2)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


               if (Quality == 3 and InventoryType == 1) then
                  if (player:HasItem(3860, 2) and player:HasItem(4304, 1) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(3860, 2)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 3) then
                  if (player:HasItem(3860, 4) and player:HasItem(4304, 2) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(3860, 4)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and (InventoryType == 5 or InventoryType == 20)) then
                  if (player:HasItem(3860, 6) and player:HasItem(4304, 3) and player:HasItem(1206, 5)) then
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
                    
                     player:RemoveItem(3860, 6)
                     player:RemoveItem(4304, 3)
                     player:RemoveItem(1206, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 7) then
                  if (player:HasItem(3860, 5) and player:HasItem(4304, 4) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(3860, 5)
                     player:RemoveItem(4304, 4)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 10) then
                  if (player:HasItem(3860, 3) and player:HasItem(4304, 2) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(3860, 3)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 6) then
                  if (player:HasItem(3860, 2) and player:HasItem(4304, 1) and player:HasItem(1206, 1)) then
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
                    
                     player:RemoveItem(3860, 2)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(1206, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

                    else
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    

        end

          if (class == 4 and (subclass == 4 or subclass == 6)) then
               if (Quality == 0 and InventoryType == 1) then
                  if (player:HasItem(3575, 4) and player:HasItem(2319, 1)) then
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
                    
                     player:RemoveItem(3575, 4)
                     player:RemoveItem(2319, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 3) then
                  if (player:HasItem(3575, 8) and player:HasItem(2319, 2)) then
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
                    
                     player:RemoveItem(3575, 8)
                     player:RemoveItem(2319, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and (InventoryType == 5 or InventoryType == 20 or InventoryType == 14)) then
                  if (player:HasItem(3575, 12) and player:HasItem(2319, 3)) then
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
                    
                     player:RemoveItem(3575, 12)
                     player:RemoveItem(2319, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 7) then
                  if (player:HasItem(3575, 10) and player:HasItem(2319, 4)) then
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
                    
                     player:RemoveItem(3575, 10)
                     player:RemoveItem(2319, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 10) then
                  if (player:HasItem(3575, 6) and player:HasItem(2319, 2)) then
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
                    
                     player:RemoveItem(3575, 6)
                     player:RemoveItem(2319, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 0 and InventoryType == 6) then
                  if (player:HasItem(3575, 4) and player:HasItem(2319, 1)) then
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
                    
                     player:RemoveItem(3575, 4)
                     player:RemoveItem(2319, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


              if (Quality == 1 and InventoryType == 1) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 1)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 3) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 2)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and (InventoryType == 5 or InventoryType == 20 or InventoryType == 14)) then
                  if (player:HasItem(3859, 12) and player:HasItem(4304, 3)) then
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
                    
                     player:RemoveItem(3859, 12)
                     player:RemoveItem(4304, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 7) then
                  if (player:HasItem(3859, 10) and player:HasItem(4304, 4)) then
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
                    
                     player:RemoveItem(3859, 10)
                     player:RemoveItem(4304, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 10) then
                  if (player:HasItem(3859, 6) and player:HasItem(4304, 2)) then
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
                    
                     player:RemoveItem(3859, 6)
                     player:RemoveItem(4304, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 1 and InventoryType == 6) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 1)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end



               if (Quality == 2 and InventoryType == 1) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 3) then
                  if (player:HasItem(3859, 8) and player:HasItem(4304, 2) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(3859, 8)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                  end
                  end

               if (Quality == 2 and (InventoryType == 5 or InventoryType == 20 or InventoryType == 14)) then
                  if (player:HasItem(3859, 12) and player:HasItem(4304, 3) and player:HasItem(818, 3)) then
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
                    
                     player:RemoveItem(3859, 12)
                     player:RemoveItem(4304, 3)
                     player:RemoveItem(818, 3)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 7) then
                  if (player:HasItem(3859, 10) and player:HasItem(4304, 4) and player:HasItem(818, 2)) then
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
                    
                     player:RemoveItem(3859, 10)
                     player:RemoveItem(4304, 4)
                     player:RemoveItem(818, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 10) then
                  if (player:HasItem(3859, 6) and player:HasItem(4304, 2) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 6)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 2 and InventoryType == 6) then
                  if (player:HasItem(3859, 4) and player:HasItem(4304, 1) and player:HasItem(818, 1)) then
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
                    
                     player:RemoveItem(3859, 4)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(818, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end


               if (Quality == 3 and InventoryType == 1) then
                  if (player:HasItem(3860, 4) and player:HasItem(4304, 1) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(3860, 4)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 3) then
                  if (player:HasItem(3860, 8) and player:HasItem(4304, 2) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(3860, 8)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and (InventoryType == 5 or InventoryType == 20 or InventoryType == 14)) then
                  if (player:HasItem(3860, 12) and player:HasItem(4304, 3) and player:HasItem(1206, 5)) then
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
                    
                     player:RemoveItem(3860, 12)
                     player:RemoveItem(4304, 3)
                     player:RemoveItem(1206, 5)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

              if (Quality == 3 and InventoryType == 7) then
                  if (player:HasItem(3860, 10) and player:HasItem(4304, 4) and player:HasItem(1206, 4)) then
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
                    
                     player:RemoveItem(3860, 5)
                     player:RemoveItem(4304, 4)
                     player:RemoveItem(1206, 4)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 10) then
                  if (player:HasItem(3860, 6) and player:HasItem(4304, 2) and player:HasItem(1206, 2)) then
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
                    
                     player:RemoveItem(3860, 6)
                     player:RemoveItem(4304, 2)
                     player:RemoveItem(1206, 2)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end

               if (Quality == 3 and InventoryType == 6) then
                  if (player:HasItem(3860, 4) and player:HasItem(4304, 1) and player:HasItem(1206, 1)) then
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
                    
                     player:RemoveItem(3860, 4)
                     player:RemoveItem(4304, 1)
                     player:RemoveItem(1206, 1)
                     else
                    player:SendUnitWhisper("- У меня недостаточно ресурсов для создания этого предмета.", player)
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    
                   end
                   end
                 else
                    player:GossipComplete()
                    player:RemoveAura(58925)
                    

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






RegisterGameObjectGossipEvent(ObjectID, 1, BlacksmithCraft_OnHello)
RegisterGameObjectGossipEvent(ObjectID, 2, BlacksmithCraft_OnSelect)
