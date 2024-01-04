local GuiOpen = false

script.Parent.Triggered:Connect(function(Player)
	local tween = game:GetService("TweenService")
	local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local Fasttweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local PlayerGui = Player:WaitForChild("PlayerGui")
	local ScreenGui = PlayerGui:WaitForChild("ScreenGui")
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
	local MenuF = ScreenGui:FindFirstChild("MenuF")
	local MenuOptionsF = ScreenGui:FindFirstChild("MenuOptionsF")
	local StatsFrame = MenuOptionsF:FindFirstChild("StatsFrame")
	local MenuF = ScreenGui:FindFirstChild("MenuF")
	local AbilityF = ScreenGui:FindFirstChild("AbilityF")
	local AbilityFrame = AbilityF:FindFirstChild("AbilityFrame")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local NPCPrompt = ReplicatedStorage:FindFirstChild("NPCPrompt")
	local AbilityEvent = NPCPrompt:FindFirstChild("AbilityEvent")

	for i, v in ipairs(ScreenGui:GetChildren()) do
		if v:GetAttribute("Priority") == "Secondary" and v ~= AbilityF and v ~= MenuF then
			for i, e in ipairs(v:GetChildren()) do
				if e:IsA("GuiObject") then
					if e.Visible == true then
						GuiOpen = true
					else
						GuiOpen = false					
					end		
				end
			end
		end
	end
	
	if GuiOpen == false then
		AbilityEvent:FireClient(Player)
	end
	
	
	
end)