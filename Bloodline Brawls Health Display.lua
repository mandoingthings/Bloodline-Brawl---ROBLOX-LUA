local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
local Character = Player.Character
local function HealthDisplayer(Humanoid)
	local Health = Humanoid.Health
	local MaxHealth = Humanoid.MaxHealth
	local HealthPercentage = (Health/MaxHealth)*100
	return HealthPercentage
end

local Character = Character
local Humanoid = Character:WaitForChild("Humanoid")

if Humanoid then
	Humanoid.HealthChanged:Connect(function()
		script.Parent.Text = tostring(HealthDisplayer(Humanoid)).. "%"
	end)
end


