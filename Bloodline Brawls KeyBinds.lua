local Player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StatChangeF = ReplicatedStorage:FindFirstChild("StatChangeF")
local StatAddedEvent = StatChangeF:FindFirstChild("StatAdderEvent")
local KeyKindsF = ReplicatedStorage:FindFirstChild("KeyBindsF")
local EEvent = KeyKindsF:FindFirstChild("EEvent")

EEvent.OnServerEvent:Connect(function(Player)
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
	
	
end)

