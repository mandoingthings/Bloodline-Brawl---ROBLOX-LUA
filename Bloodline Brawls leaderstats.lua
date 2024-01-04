local DataStoreService = game:GetService("DataStoreService")
local PlayerData = DataStoreService:GetDataStore("PlayerData")
local tween = game:GetService("TweenService")
local ServerStorage = game:GetService("ServerStorage")
local ExtraStuff = ServerStorage:FindFirstChild("ExtraStuff")
local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local Fasttweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

local function TitleJoined(Title)
	if Title == "Sorcerer" then
		
	end
end

local function ClanAttributes(Clan, MagicMultiplier, StrengthMultiplier, DefenceMultiplier, AbilityMultiplier)
	
end


game.Players.PlayerAdded:Connect(function(Player)
	
	
	local PlayerGui = Player:WaitForChild("PlayerGui")
	local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
	
	-- Stats
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = Player

	local PlayerStats = Instance.new("Folder")
	PlayerStats.Name = "PlayerStats"
	PlayerStats.Parent = Player
	
	local Cash = Instance.new("IntValue")
	Cash.Name = "Cash"
	Cash.Parent = PlayerStats
	Cash.Value = 0
	
	local Magic = Instance.new("IntValue")
	Magic.Name = "Magic"
	Magic.Parent = PlayerStats
	Magic.Value = 0
	
	local Title = Instance.new("StringValue")
	Title.Name = "Title"
	Title.Parent = leaderstats
	Title.Value = "Sorcerer"
	
	local Mana = Instance.new("IntValue")
	Mana.Name = "Mana"
	Mana.Parent = PlayerStats
	Mana.Value = 0
	
	local StatPoints = Instance.new("IntValue")
	StatPoints.Name = "StatPoints"
	StatPoints.Parent = PlayerStats
	StatPoints.Value = 5
	
	local Spins = Instance.new("IntValue")
	Spins.Name = "Spins"
	Spins.Parent = PlayerStats
	Spins.Value = 200
	
	local Defence = Instance.new("IntValue")
	Defence.Name = "Defence"
	Defence.Parent = PlayerStats
	Defence.Value = 1
	
	local Strength = Instance.new("IntValue")
	Strength.Name = "Strength"
	Strength.Parent = PlayerStats
	Strength.Value = 1
	
	local Stamina = Instance.new("IntValue")
	Stamina.Name = "Stamina"
	Stamina.Parent = PlayerStats
	Stamina.Value = 1
	
	local Ability = Instance.new("StringValue")
	Ability.Name = "Ability"
	Ability.Parent = PlayerStats
	Ability.Value = "None"
	
	local Clan = Instance.new("StringValue")
	Clan.Name = "Clan"
	Clan.Parent = PlayerStats
	Clan.Value = "None"
	
	-- Multipliers
	
	local Multipliers = Instance.new("Folder")
	Multipliers.Name = "Multipliers"
	Multipliers.Parent = Player
	
	local MagicMultiplier = Instance.new("NumberValue")
	MagicMultiplier.Name = "MagicMultiplier"
	MagicMultiplier.Parent = Multipliers
	MagicMultiplier.Value = 1
	
	local StrengthMultiplier = Instance.new("NumberValue")
	StrengthMultiplier.Name = "StrengthMultiplier"
	StrengthMultiplier.Parent = Multipliers
	StrengthMultiplier.Value = 1
	
	local DefenceMultiplier = Instance.new("NumberValue")
	DefenceMultiplier.Name = "DefenceMultiplier"
	DefenceMultiplier.Parent = Multipliers
	DefenceMultiplier.Value = 1
	
	local AbilityMultiplier = Instance.new("NumberValue")
	AbilityMultiplier.Name = "AbilityMultiplier"
	AbilityMultiplier.Parent = Multipliers
	AbilityMultiplier.Value = 1
	
	-- Slots
	
	local Slots = Instance.new("Folder")
	Slots.Name = "Slots"
	Slots.Parent = Player
	
	local FirstSlot = Instance.new("StringValue")
	FirstSlot.Name = "FirstSlot"
	FirstSlot.Parent = Slots
	FirstSlot.Value = "Wood Extention"
	
	local SecondSlot = Instance.new("StringValue")
	SecondSlot.Name = "SecondSlot"
	SecondSlot.Parent = Slots
	SecondSlot.Value = ""
	
	local ThirdSlot = Instance.new("StringValue")
	ThirdSlot.Name = "ThirdSlot"
	ThirdSlot.Parent = Slots
	ThirdSlot.Value = ""
	
	local FourthSlot = Instance.new("StringValue")
	FourthSlot.Name = "FourthSlot"
	FourthSlot.Parent = Slots
	FourthSlot.Value = ""
	
	local FifthSlot = Instance.new("StringValue")
	FifthSlot.Name = "FifthSlot"
	FifthSlot.Parent = Slots
	FifthSlot.Value = ""
	
	--- Checkers
	
	local Checkers = Instance.new("Folder")
	Checkers.Name = "Checkers"
	Checkers.Parent = Player
	
	local CanPunch = Instance.new("BoolValue")
	CanPunch.Name = "CanPunch"
	CanPunch.Parent = Checkers
	CanPunch.Value = true

	local Data
	local Success, Failure = pcall(function()
		Data = PlayerData:GetAsync(Player.UserId)
	end)
	
	if Success and Data then
		if Data[1] then
			Cash.Value = Data[1]
		end
		if Data[2] then
			Magic.Value = Data[2]
		end
		if Data[3] then
			Title.Value = Data[3]
			TitleJoined(Title)
		end
		if Data[4] then
			Mana.Value = Data[4]
		end
		if Data[5] then
			StatPoints.Value = Data[5]
		end
		if Data[6] then
			Defence.Value = Data[6]
		end
		if Data[7] then
			Strength.Value = Data[7]
		end
		if Data[8] then
			Stamina.Value = Data[8]
		end
		if Data[9] then
			Ability.Value = Data[9]
		end
		if Data[10] then
			Clan.Value = Data[10]
			ClanAttributes(Clan.Value, MagicMultiplier, StrengthMultiplier, DefenceMultiplier, AbilityMultiplier)
		end
		if Data[11] then
			Spins.Value = Data[11]
		end
		if Data[12] then
			FirstSlot.Value = Data[12]
		end
		if Data[13] then
			SecondSlot.Value = Data[13]
		end
		if Data[14] then
			ThirdSlot.Value = Data[14]
		end
		if Data[15] then
			FourthSlot.Value = Data[15]
		end
		if Data[16] then
			FifthSlot.Value = Data[16]
		end
	end
	Ability.Changed:Connect(function()
		if Ability.Value == "Hidden" then
			local Character = Player.Character
			for i, v in ipairs(Character:GetChildren()) do
				if v:IsA("Part") then
					for i, e in ipairs(v:GetChildren()) do
						if e:IsA("Decal") then
							e.Transparency = 1
						end
					end
					local Disapear = tween:Create(v, Fasttweeninfo, {Transparency = 0.96})
					Disapear:Play()
				elseif v:IsA("Accessory") then
					print(v)
					v.Parent = ExtraStuff
					wait(5)
					v.Parent = Character
				
				end
			end
		end
	end)
	
	
	
	
end)

game.Players.PlayerRemoving:Connect(function(Player)

	local leaderstats = Player:FindFirstChild("leaderstats")
	local PlayerStats = Player:FindFirstChild("PlayerStats")
	local Cash = PlayerStats:FindFirstChild("Cash")
	local Magic = PlayerStats:FindFirstChild("Magic")
	local Title = leaderstats:FindFirstChild("Title")
	local Mana = PlayerStats:FindFirstChild("Mana")
	local StatPoints = PlayerStats:FindFirstChild("StatPoints")
	local Strength = PlayerStats:FindFirstChild("Strength")
	local Defence = PlayerStats:FindFirstChild("Defence")
	local Stamina = PlayerStats:FindFirstChild("Stamina")
	local Ability = PlayerStats:FindFirstChild("Ability")
	local Clan = PlayerStats:FindFirstChild("Clan")
	local Spins = PlayerStats:FindFirstChild("Spins")
	local Slots = Player:FindFirstChild("Slots")
	local FirstSlot = Slots:FindFirstChild("FirstSlot")
	local SecondSlot = Slots:FindFirstChild("SecondSlot")
	local ThirdSlot = Slots:FindFirstChild("ThirdSlot")
	local FourthSlot = Slots:FindFirstChild("FourthSlot")
	local FifthSlot = Slots:FindFirstChild("FifthSlot")
	
	local Data = {
		Cash.Value, Magic.Value, Title.Value, Mana.Value, StatPoints.Value, Defence.Value, Strength.Value, Stamina.Value, Ability.Value, Clan.Value, Spins.Value, FirstSlot.Value, SecondSlot.Value, ThirdSlot.Value, FourthSlot.Value, FifthSlot.Value
	}
	PlayerData:SetAsync(Player.UserId, Data)
	local Success, Failure = pcall(function()
		PlayerData:SetAsync(Player.UserId, Data)
	end)
	if Success then
		print("Saved")
	else
		print(Failure.. ": Not Saved")
		
		--repeat
		--	local Success, Failure = pcall(function()
		--		PlayerData:SetAsync(Player.UserId, Data)
		--	end)
		--	print("Saving Again")
		--	wait()
		--until Success == true
	end
	
end)

game:BindToClose(function()
	wait(2)
end)