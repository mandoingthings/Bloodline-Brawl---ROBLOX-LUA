local Lighting  = game:GetService("Lighting")
local Blur  = Lighting:FindFirstChild("Blur")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCPrompt = ReplicatedStorage:FindFirstChild("NPCPrompt")
local AbilityEvent = NPCPrompt:FindFirstChild("AbilityEvent")
local StatChangeF = ReplicatedStorage:FindFirstChild("StatChangeF")
local AbilityRoll
local StatAdderEvent
local AbilityChecker
if StatChangeF then
	AbilityRoll = StatChangeF:FindFirstChild("AbilityRoll")
	StatAdderEvent = StatChangeF:FindFirstChild("StatAdderEvent")
	AbilityChecker = StatChangeF:FindFirstChild("AbilityChecker")
end

local valid = true
local Spinning = false


AbilityRoll.OnServerEvent:Connect(function(Player)
	local PlayerGui = Player:WaitForChild("PlayerGui")
	local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
	local leaderstats = Player:FindFirstChild("leaderstats")
	local PlayerStats = Player:FindFirstChild("PlayerStats")
	local Cash 
	local Magic 
	local Title 
	local Mana 
	local StatPoints 
	local Strength 
	local Defence 
	local Stamina 
	local Ability 
	local Clan 
	local Spins
	if PlayerStats then
		Cash = PlayerStats:FindFirstChild("Cash")
		Magic = PlayerStats:FindFirstChild("Magic")
		Title = leaderstats:FindFirstChild("Title")
		Mana = PlayerStats:FindFirstChild("Mana")
		StatPoints = PlayerStats:FindFirstChild("StatPoints")
		Strength = PlayerStats:FindFirstChild("Strength")
		Defence = PlayerStats:FindFirstChild("Defence")
		Stamina = PlayerStats:FindFirstChild("Stamina")
		Ability = PlayerStats:FindFirstChild("Ability")
		Clan = PlayerStats:FindFirstChild("Clan")
		Spins = PlayerStats:FindFirstChild("Spins")
	end
	local MenuF 
	local MenuOptionsF
	local StatsFrame 
	local MenuF 
	local AbilityF 
	local AbilityFrame 
	if ScreenGui then
		MenuF = ScreenGui:FindFirstChild("MenuF")
		MenuOptionsF = ScreenGui:FindFirstChild("MenuOptionsF")
		StatsFrame = MenuOptionsF:FindFirstChild("StatsFrame")
		MenuF = ScreenGui:FindFirstChild("MenuF")
		AbilityF = ScreenGui:FindFirstChild("AbilityF")
		AbilityFrame = AbilityF:FindFirstChild("AbilityFrame")
	end
	
	if Spins.Value >= 1 then
		AbilityRoll:FireClient(Player, "Started")
	local Abilities = {
		{Name = "Hidden", Rarity = "Common"},
		{Name = "Swift", Rarity = "Common"},
		{Name = "Tank", Rarity = "Common"},
		{Name = "Jester", Rarity = "Rare"},
		{Name = "Fire", Rarity = "Rare"},
		{Name = "Water", Rarity = "Rare"},
		{Name = "Loki", Rarity = "Legendary"},
		{Name = "Prometheus", Rarity = "Legendary"},
		{Name = "Posiden", Rarity = "Legendary"},
	}
	
	local Rarities = {
		{AbilitiesR = Abilities[1], Weight = 80},
		{AbilitiesR = Abilities[2], Weight = 80},
		{AbilitiesR = Abilities[3], Weight = 80},
		{AbilitiesR = Abilities[4], Weight = 25},
		{AbilitiesR = Abilities[5], Weight = 25},
		{AbilitiesR = Abilities[6], Weight = 25},
		{AbilitiesR = Abilities[7], Weight = 5},
		{AbilitiesR = Abilities[8], Weight = .5},
		{AbilitiesR = Abilities[9], Weight = .5},
	}
	
	for i, v in ipairs(Abilities) do
		if v.Rarity == "Legendary" or v.Rarity == "Rare" then
			if v.Name == Ability.Value  then
				AbilityChecker:FireClient(Player)
					valid = false
					if Spinning == false then
						
						AbilityChecker.OnServerEvent:Connect(function(Player, Chosen)
							if Chosen == "Yes" and Spinning == false then
								valid = true
									if valid == true and Spinning == false then
										Spinning = true
										Spins.Value = Spins.Value - 1
										local function ReturnSumOfWeight(Rarities)

											local sum = 0
											for i, v in ipairs(Rarities) do
												sum = sum + v.Weight

											end
											return sum
										end

										local function GetRandomAbility(Rarities)
											local RandomNumber = math.random(ReturnSumOfWeight(Rarities))
											for i, v in ipairs(Rarities) do
												if RandomNumber <= v.Weight then
													return v.AbilitiesR
												else
													RandomNumber = RandomNumber - v.Weight
												end
											end
										end
										local Roller = GetRandomAbility(Rarities)
										local GottenAbility = Roller.Name
										local RarityType = Roller.Rarity
										AbilityRoll:FireClient(Player, RarityType)
											Ability.Value = GottenAbility
											Spinning = false
								end
							elseif Chosen == "No" then
								valid = false
							end
						end)
					end
			end
		end
	end
		if valid == true and Spinning == false then
			Spins.Value = Spins.Value - 1
			Spinning = true
		local function ReturnSumOfWeight(Rarities)
		
			local sum = 0
			for i, v in ipairs(Rarities) do
				sum = sum + v.Weight
				
			end
			return sum
		end
		
		local function GetRandomAbility(Rarities)
			local RandomNumber = math.random(ReturnSumOfWeight(Rarities))
			for i, v in ipairs(Rarities) do
				if RandomNumber <= v.Weight then
					return v.AbilitiesR
				else
					RandomNumber = RandomNumber - v.Weight
				end
			end
		end
		local Roller = GetRandomAbility(Rarities)
		local GottenAbility = Roller.Name
		local RarityType = Roller.Rarity
		AbilityRoll:FireClient(Player, RarityType)
			Ability.Value = GottenAbility
			Spinning = false
	end
	
	
	end
end)