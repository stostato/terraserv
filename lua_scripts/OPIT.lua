
local OPITspellnums = 
{
	[97141] = {10},
	[97142] = {15},
	[97143] = {25},
	[97144] = {50},
	[97145] = {100}
}
local levelXP = 
{
	[40] = {74300},
	[41] = {78500},
	[42] = {82800},
	[43] = {87100},
	[44] = {91600},
	--[45] = {96300}
}


local function OPITCAST(event, player, spell, skipCheck)
	for k, v in pairs(OPITspellnums) do
		if (k == spell:GetEntry() and (player:GetLevel() < 45)) then
			local xp = math.ceil((levelXP[player:GetLevel()][1]*OPITspellnums[k][1])/100)
			player:GiveXP(xp)
		end
	end
end
	RegisterPlayerEvent(5, OPITCAST)
