local allianceracesNAME = {"Высший эльф", 
"Человек-некромант", "Дворф Громового Молота"
}
local allianceracesNPC = {30244, 
34734, 20510
}
local allianceracesMORPHMALE = {90011, 
90013, 90018
}
local allianceracesMORPHFEMALE = {90010, 
90012, 90019
}

local horderacesNAME = {"Дренорский орк", 
"Орк из клана Черной Горы", "Лесной тролль", 
"Огр (Бежевый, обычный)",
 "Огр (Бежевый, воитель)",
  "Огр (Красный, двухголовый)",
   "Огр (Черный, маг)"
}
local horderacesNPC = {16911, 
435, 23597,
20935,
20937,
20962,
20945
}
local horderacesMORPHMALE = {90015, 
90017, 90020,
1122,
19921,
19939,
19749
}
local horderacesMORPHFEMALE = {90014, 
90016, 90020,
1122,
19921,
19939,
19749
}

function SendRaceSelect(event,player)
local havefinishedfirstchoice = WorldDBQuery("SELECT choose FROM roleplay_firstway WHERE player = '"..player:GetName().."'")
local customrace = WorldDBQuery("SELECT player FROM roleplay_customrace WHERE player = '"..player:GetName().."' AND race = 0;")
		if (customrace and havefinishedfirstchoice and (havefinishedfirstchoice:GetInt32(0) == 0 or havefinishedfirstchoice:GetInt32(0) == 1 or havefinishedfirstchoice:GetInt32(0) == 2 or havefinishedfirstchoice:GetInt32(0) == 3 or havefinishedfirstchoice:GetInt32(0) == 4611 or havefinishedfirstchoice:GetInt32(0) == 4612)) then
		player:SendBroadcastMessage("[SADDON_RACESELECT]")

		if (player:IsAlliance()) then
		for k, v in pairs(allianceracesNPC) do
			PerformIngameSpawn(1, v, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, player:GetPhaseMask())
		end

		for k,v in pairs(allianceracesNPC) do
			local creature = player:GetNearestCreature(10, v)
			if (creature) then
			creature:DeleteFromDB()
		end
		end
	end

	if (player:IsHorde()) then
		for k, v in pairs(horderacesNPC) do
			PerformIngameSpawn(1, v, player:GetMapId(), player:GetInstanceId(), player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, player:GetPhaseMask())
		end

		for k,v in pairs(horderacesNPC) do
			local creature = player:GetNearestCreature(10, v)
			if (creature) then
			creature:DeleteFromDB()
		end
		end
	end

		end
	end
	RegisterPlayerEvent(3, SendRaceSelect)

	function Main_RaceSelect(event, player, msg, Type, lang)
		if (msg == "[SADDON_CUSTOMRACE_NO]") then
			WorldDBExecute("DELETE FROM roleplay_customrace WHERE player = '"..player:GetName().."';")
			return false;
		end
		--RACEZ
		if (msg:find("%[SADDON_CUSTOMRACE_.*%]")) then
		local _,_,num = msg:find("%[SADDON_CUSTOMRACE_(.*)%]")
		--alliance
		if (player:IsAlliance()) then
		if not(allianceracesNAME[tonumber(num)]) then
			player:SendBroadcastMessage("[SADDON_RACESELECT]")
			num = 1
			if (player:GetGender() == 0) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..allianceracesNAME[1].."_"..allianceracesNPC[1].."_"..allianceracesMORPHMALE[1].."]")
			elseif (player:GetGender() == 1) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..allianceracesNAME[1].."_"..allianceracesNPC[1].."_"..allianceracesMORPHFEMALE[1].."]")
			end


		end
			if (player:GetGender() == 0) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..allianceracesNAME[tonumber(num)].."_"..allianceracesNPC[tonumber(num)].."_"..allianceracesMORPHMALE[tonumber(num)].."]")
			elseif (player:GetGender() == 1) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..allianceracesNAME[tonumber(num)].."_"..allianceracesNPC[tonumber(num)].."_"..allianceracesMORPHFEMALE[tonumber(num)].."]")
			end
		end
		--horde
		if (player:IsHorde()) then
			if not(horderacesNAME[tonumber(num)]) then
			player:SendBroadcastMessage("[SADDON_RACESELECT]")
			num = 1
			if (player:GetGender() == 0) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..horderacesNAME[1].."_"..horderacesNPC[1].."_"..horderacesMORPHMALE[1].."]")
			elseif (player:GetGender() == 1) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..horderacesNAME[1].."_"..horderacesNPC[1].."_"..horderacesMORPHFEMALE[1].."]")
			end


		end
			if (player:GetGender() == 0) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..horderacesNAME[tonumber(num)].."_"..horderacesNPC[tonumber(num)].."_"..horderacesMORPHMALE[tonumber(num)].."]")
			elseif (player:GetGender() == 1) then
			player:SendBroadcastMessage("[SADDON_CUSTOMRACE_"..horderacesNAME[tonumber(num)].."_"..horderacesNPC[tonumber(num)].."_"..horderacesMORPHFEMALE[tonumber(num)].."]")
			end
		end
			return false;
		end
		if (msg:find("%[SADDON_SETRACE_.*%]")) then
			local _,_,id = msg:find("%[SADDON_SETRACE_(.-)%]")
			WorldDBExecute("DELETE FROM roleplay_customrace WHERE player = '"..player:GetName().."';")

			if (tonumber(id) == 90013 or tonumber(id) == 90012) then
				player:AddItem(90107, 1)
				player:SendUnitWhisper("- Мне необходимо использовать этот предмет, чтобы полностью погрузиться в роль.", player)
				elseif (tonumber(id) == 90020 or tonumber(id) == 1122 or tonumber(id) == 19921 or tonumber(id) == 19939 or tonumber(id) == 19749) then
					player:AddItem(1996, 1)
					player:SendUnitWhisper("- Мне необходимо использовать этот предмет, чтобы полностью погрузиться в роль.", player)
				end

			player:SetDisplayId(tonumber(id))

			local IsInBD = WorldDBQuery("SELECT displayid FROM roleplay_evermorph WHERE player = '"..player:GetName().."';")
			if (IsInBD) then
				WorldDBExecute("UPDATE roleplay_evermorph SET displayid = "..tonumber(id).." WHERE player = '"..player:GetName().."';")
			else
				WorldDBExecute("INSERT INTO roleplay_evermorph VALUES ('"..player:GetName().."', "..tonumber(id)..");")
			end
			return false;
		end
		--RACEZ
	end
	RegisterPlayerEvent(18, Main_RaceSelect)