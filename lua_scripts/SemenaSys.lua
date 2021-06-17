local Zones = {
	[286] = {1500014},
	[271] = {1500015},
	[289] = {1500016},
	[272] = {1500017},
	[280] = {1500018},
	[1682] = {1500019},
	[3486] = {1500020},
	[313] = {1500021},
	[314] = {1500022},
	[315] = {1500023},
	[59] = {1500024},
	[63] = {1500025},
	[64] = {1500026},
	[62] = {1500027},
	[88] = {1500028},
	[916] = {1500029},
	[109] = {1500030},
	[107] = {1500031},
	[918] = {1500032},
	[219] = {1500033},
	[917] = {1500034},
	[536] = {1500035},
	[245] = {1500036},
	[1098] = {1500037}
}
local semenaspellnums = 
{
	97125,
	97126,
	97127,
	97128,
	97129,
	97130,
	97131,
	97132,
	97133,
	97134
}
local semenaobjectnums = 
{
	507023,
	532893,
	507158,
	507553,
	510364,
	512687,
	512697,
	512709,
	520989,
	534454
}
local semenafinishtimes = 
{
	1250,
	3000,
	600,
	300,
	600,
	300,
	300,
	1250,
	1250,
	3000
}
local semenaobjectnames = 
{
	"Тыква",
	"Яблоня",
	"Кукуруза",
	"Пшеница",
	"Арбуз",
	"Лен",
	"Луноягода",
	"Капуста",
	"Виноградная лоза",
	"Грибы"
}

local function WheatSpawnAndSaveToDb(event, player, spell, skipCheck)
	for k, v in pairs(semenaspellnums) do
		if (v == spell:GetEntry()) then
			--for k, v in pairs(Zones) do
				if not((Zones[player:GetAreaId()]) and (player:HasItem(Zones[player:GetAreaId()][1]))) then
					spell:Finish()
					player:SendUnitWhisper("- Я не могу сажать в этой зоне.", player)
					return false;
				end

				local numofplants = WorldDBQuery("SELECT guid FROM roleplay_wheat WHERE player = '"..player:GetName().."';")
				if (numofplants and numofplants:GetRowCount() >= 10) then
					spell:Finish()
					player:SendUnitWhisper("- Я не сажать больше растений.", player)
					return false;
				end
			--end
			--spell:Finish()
			local x,y,z = spell:GetTargetDest()
			local sungrass = PerformIngameSpawn(2, 512715, player:GetMapId(), player:GetInstanceId(), x, y, z, player:GetO(), 1, 0, player:GetPhaseMask())
				local object = PerformIngameSpawn(2, semenaobjectnums[k], player:GetMapId(), player:GetInstanceId(), x, y, z, player:GetO(), 1, 0, 2)
				--if (object) then
					local presenttime = os.time()
					local finishtime = os.time() + semenafinishtimes[k]
					WorldDBExecute("INSERT INTO gameobject_inform VALUES ("..object:GetGUIDLow()..", "..semenaobjectnums[k]..", '"..player:GetName().."');")
					WorldDBExecute("INSERT INTO roleplay_wheat VALUES ('"..player:GetName().."', "..object:GetGUIDLow()..", "..presenttime..", "..finishtime..", "..object:GetEntry()..", "..sungrass:GetGUIDLow()..");")
				--end
		end
	end
end
	RegisterPlayerEvent(5, WheatSpawnAndSaveToDb)

local function ROST(event, go, diff)
	local lootstate = go:GetLootState()
	if (lootstate == 3) then
	WorldDBExecute("DELETE FROM gameobject_inform WHERE guid = "..go:GetGUIDLow()..";")
	WorldDBExecute("DELETE FROM gameobject_inform_scales WHERE guid = "..go:GetGUIDLow()..";")
	go:DeleteFromDB()
	end
	--if (diff == 100) then
	local playername = WorldDBQuery("SELECT player FROM roleplay_wheat WHERE guid = "..go:GetGUIDLow()..";")
	if (playername) then
		local player = GetPlayerByName(playername:GetString(0))
		if (player) then
		local presenttime = WorldDBQuery("SELECT created FROM roleplay_wheat WHERE guid = "..go:GetGUIDLow()..";")
		local finishtime = WorldDBQuery("SELECT ends FROM roleplay_wheat WHERE guid = "..go:GetGUIDLow()..";")
		if (os.time() >= finishtime:GetInt32(0)) then
			go:SetPhaseMask(player:GetPhaseMask())

			player:SendBroadcastMessage("[SADDON_SEMYANADELETE_"..go:GetGUIDLow().."]")

			local sungrassSQL = WorldDBQuery("SELECT sungrassGUID FROM roleplay_wheat WHERE guid = "..go:GetGUIDLow()..";")
			local mapid = WorldDBQuery("SELECT map FROM gameobject WHERE guid = "..sungrassSQL:GetInt32(0)..";")
			local sungrass = GetObjectByGUID(sungrassSQL:GetInt32(0), mapid:GetInt32(0))
			sungrass:DeleteFromDB()

			WorldDBExecute("DELETE FROM roleplay_wheat WHERE guid = "..go:GetGUIDLow()..";")
			WorldDBExecute("UPDATE gameobject SET phasemask = "..player:GetPhaseMask().." WHERE guid = "..go:GetGUIDLow()..";")
		end
	end
end
--diff = 0
end
--end

--[[local function LOOT(event, go, state, unit)
	WorldDBExecute("DELETE FROM gameobject_inform WHERE guid = "..go:GetGUIDLow()..";")
	WorldDBExecute("DELETE FROM gameobject_inform_scales WHERE guid = "..go:GetGUIDLow()..";")
	go:DeleteFromDB()
end]]--

for k, v in pairs(semenaobjectnums) do
	RegisterGameObjectEvent(v, 1, ROST)
	--RegisterGameObjectEvent(v, 9, LOOT)
	end


local function TimeleftObjectsOfplayer() 

		local object = WorldDBQuery("SELECT guid FROM roleplay_wheat")
		if (object) then
		for i = 1, object:GetRowCount() do
			local player = GetPlayerByName(WorldDBQuery("SELECT player FROM roleplay_wheat WHERE guid = '"..object:GetInt32(0).."';"):GetString(0))
					if (player) then
			local presenttime = WorldDBQuery("SELECT created FROM roleplay_wheat WHERE guid = '"..object:GetInt32(0).."';")
		local finishtime = WorldDBQuery("SELECT ends FROM roleplay_wheat WHERE guid = '"..object:GetInt32(0).."';")
		local entry = WorldDBQuery("SELECT entry FROM roleplay_wheat WHERE guid = '"..object:GetInt32(0).."';")

	local nameoftree = ""
		for k, v in pairs(semenaobjectnums) do
		if (v == entry:GetInt32(0)) then
			nameoftree = semenaobjectnames[k]
		end
		end
		local time = math.ceil((finishtime:GetInt32(0)-os.time())/60)
		local minuta = "минуты"
		if (time == 1) then 
			minuta = "минуту"
			elseif (time > 1 and time < 5) then
				minuta = "минуты"
				elseif (time >= 5 and time < 21) then
				minuta = "минут"
				elseif (time >= 21 and time < 22) then
				minuta = "минуту"
				elseif (time >= 22 and time < 25) then
				minuta = "минуты"
				elseif (time >= 25 and time < 31) then
				minuta = "минут"

				elseif (time >= 31 and time < 32) then
				minuta = "минуту"
				elseif (time >= 32 and time < 35) then
				minuta = "минуты"
				elseif (time >= 35 and time < 41) then
				minuta = "минут"

				elseif (time >= 41 and time < 42) then
				minuta = "минуту"
				elseif (time >= 42 and time < 45) then
				minuta = "минуты"
				elseif (time >= 45 and time < 51) then
				minuta = "минут"

				elseif (time >= 51 and time < 52) then
				minuta = "минуту"
				elseif (time >= 52 and time < 55) then
				minuta = "минуты"
				elseif (time >= 55 and time < 61) then
				minuta = "минут"

				elseif (time >= 61 and time < 62) then
				minuta = "минуту"
				elseif (time >= 62 and time < 65) then
				minuta = "минуты"
				elseif (time >= 65 and time < 71) then
				minuta = "минут"

		end
			player:SendBroadcastMessage("[SADDON_SEMYANA_"..nameoftree.."_"..time.."_"..minuta.."_"..object:GetInt32(0).."]")
			

	end
	object:NextRow()
	end
end
end
CreateLuaEvent(TimeleftObjectsOfplayer, 48000, 0)
--CreateLuaEvent(TimeleftObjectsOfplayer, 1000, 0)