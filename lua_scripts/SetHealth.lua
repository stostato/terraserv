local function SetHealth(event, player, msg, Type, lang)
   if (msg:find("#sethealth") and player:GetGMRank() >= 1) then
       local target = player:GetSelectedUnit()
	    if (target and target:ToCreature()) then 
		    --if (msg:find("#sethealth .*")) then
            local _, _, healthcount = msg:find("#sethealth (.*)")
                if (healthcount) then
				target:SetMaxHealth(tonumber(healthcount))
				    target:SetHealth(tonumber(healthcount))
				    --return false
				end
			--return false
			--end
		else player:SendBroadcastMessage("Целью для применения команды может быть только NPC.")
		return false
		end
	return false
	end
        
		
end

RegisterPlayerEvent(18, SetHealth)


local function Reviver(event, player, msg, Type, lang)
   if (msg:find("#rprevive") and player:GetGMRank() >= 1) then
       local target = player:GetSelectedUnit()
	    if (target and target:ToPlayer()) then 
		    --if (msg:find("#sethealth .*")) then
            target:RemoveAura(90510)
		target:RemoveAura(29266)
		target:RemoveAura(1852)
		target:RemoveAura(35182)
		target:RemoveFlag(150,0x00800000)
		target:RemoveFlag(150,0x01000000)
		WorldDBExecute("DELETE FROM roleplay_stunned WHERE player = '"..target:GetName().."';") -- DB
		target:AddAura(8226, target)

				    --return false
				
			--return false
			--end
		else player:SendBroadcastMessage("Целью для применения команды может быть только игрок.")
		return false
		end
	return false
	end
        
		
end

RegisterPlayerEvent(18, Reviver)
