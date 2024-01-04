local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StatChangeF = ReplicatedStorage:FindFirstChild("StatChangeF")
local StatAddedEvent = StatChangeF:FindFirstChild("StatAdderEvent")



StatAddedEvent.OnServerEvent:Connect(function(Player, Stat)
	local leaderstats = Player:WaitForChild("leaderstats")
	local PlayerStats = Player:WaitForChild("PlayerStats")
	local Cash = PlayerStats:FindFirstChild("Cash")
	local Magic = PlayerStats:FindFirstChild("Magic")
	local Title = leaderstats:FindFirstChild("Title")
	local Cash = PlayerStats:FindFirstChild("Cash")
	local Mana = PlayerStats:FindFirstChild("Mana")
	local StatPoints = PlayerStats:FindFirstChild("StatPoints")
	if StatPoints.Value >= 1 then
		StatPoints.Value = StatPoints.Value - 1
		if Stat == Magic then
			Magic.Value = Magic.Value + 1
		elseif Stat == Cash then
			Cash.Value = Cash.Value + 1
		elseif Stat == Mana then
			Mana.Value = Mana.Value + 1
		end
	end
end)