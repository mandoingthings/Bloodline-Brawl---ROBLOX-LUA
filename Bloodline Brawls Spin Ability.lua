local Player = game.Players.LocalPlayer
local MouseActive = false
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local Fasttweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local UIStroke = script.Parent.UIStroke
local Dark = tween:Create(UIStroke, tweeninfo, {Color = Color3.new(0.27451, 0.27451, 0.27451)})
local Light = tween:Create(UIStroke, tweeninfo, {Color = Color3.new(1, 1, 1)})
local activated = false
local tweening = false
local othersOpen = false
local Cooldown = false

local Lighting  = game:GetService("Lighting")
local Blur  = Lighting:FindFirstChild("Blur")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCPrompt = ReplicatedStorage:FindFirstChild("NPCPrompt")
local AbilityEvent = NPCPrompt:FindFirstChild("AbilityEvent")
local StatChangeF = ReplicatedStorage:FindFirstChild("StatChangeF")
local AbilityRoll
local AbilityRoll
local StatAdderEvent
local AbilityChecker
if StatChangeF then
	AbilityRoll = StatChangeF:FindFirstChild("AbilityRoll")
	StatAdderEvent = StatChangeF:FindFirstChild("StatAdderEvent")
	AbilityChecker = StatChangeF:FindFirstChild("AbilityChecker")
end
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


script.Parent.MouseEnter:Connect(function()
	MouseActive = true
	UIStroke.Transparency = 0

	repeat
		Light:Play()
		wait(0.15)
		Dark:Play()
		wait(0.15)
	until MouseActive == false

end)

script.Parent.MouseLeave:Connect(function()
	MouseActive = false
	Light:Play()
	UIStroke.Transparency = 1
end)


script.Parent.MouseButton1Click:Connect(function()
	if Cooldown == false then
		Cooldown = true
		AbilityRoll:FireServer()
		wait(0.5)
		Cooldown = false
	end
end)
AbilityRoll.OnClientEvent:Connect(function(RarityType)
	if RarityType == "Started" then
		script.Parent.Visible = false
	end
	local RarityLabel = script.Parent.Parent.RarityLabel
	RarityLabel.Text = RarityType
	RarityLabel.Visible = true
	if RarityType == "Common" then
		RarityLabel.TextColor3 = Color3.new(0.290196, 1, 0.290196)
	elseif RarityType == "Rare" then
		RarityLabel.TextColor3 = Color3.new(0.478431, 0.439216, 1)
	elseif RarityType == "Legendary" then
		RarityLabel.TextColor3 = Color3.new(1, 0.384314, 0.384314)
	end
	wait(1.5)
	RarityLabel.Visible = false
	script.Parent.Visible = true
end)
AbilityChecker.OnClientEvent:Connect(function()
	local CheckerFrame = AbilityFrame:FindFirstChild("CheckerFrame")
	local YesButton = CheckerFrame:FindFirstChild("YesButton")
	local NoButton = CheckerFrame:FindFirstChild("NoButton")
	local SpinButton = AbilityFrame:FindFirstChild("SpinButton")
	CheckerFrame.Visible = true
	local Chosen
	YesButton.MouseButton1Click:Connect(function()
		CheckerFrame.Visible = false
		Chosen = "Yes"
		
		if Cooldown == false then
			Cooldown = true
			AbilityChecker:FireServer(Chosen)
			wait(0.5)
			Cooldown = false
		end
		
		
	end)
	NoButton.MouseButton1Click:Connect(function()
		Chosen = "No"
		AbilityChecker:FireServer(Chosen)
		CheckerFrame.Visible = false
		wait(0.2)
		SpinButton.Visible = true
	end)
end)