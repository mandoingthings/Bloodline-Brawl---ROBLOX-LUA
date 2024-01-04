local Player = game.Players.LocalPlayer
local tween = game:GetService("TweenService")
local Lighting  = game:GetService("Lighting")
local Blur  = Lighting:FindFirstChild("Blur")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCPrompt = ReplicatedStorage:FindFirstChild("NPCPrompt")
local AbilityEvent = NPCPrompt:FindFirstChild("AbilityEvent")
local tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local Fasttweeninfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
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


local Open = false
local GuiOpen = false

local CloseButton = script.Parent.CloseButton

AbilityEvent.OnClientEvent:Connect(function(Player)
	
	for i, v in ipairs(ScreenGui:GetChildren()) do
		if v:GetAttribute("Priority") == "Secondary" and v ~= AbilityF then
			for i, e in ipairs(v:GetChildren()) do
				if e:IsA("GuiObject") then
					if e.Visible == true then
						GuiOpen = true
						Open = false
					else
						GuiOpen = false
						if AbilityFrame.Visible == false then
							Open = false
						end
					end
				end
			end
		end
	end
	if Open == false and GuiOpen == false then
		Open = true
		
		local MakeBlur = tween:Create(Blur, tweeninfo, {Size = 15})
		local AttributeAppear = tween:Create(AbilityFrame.UIScale, tweeninfo, {Scale = 1})
		AbilityFrame.Visible = true
		MakeBlur:Play()
		AttributeAppear:Play()
	elseif Open == true and GuiOpen == false then
		
		
		local AttributeAppear = tween:Create(AbilityFrame.UIScale, tweeninfo, {Scale = 0.25})
		local MakeBlur = tween:Create(Blur, tweeninfo, {Size = 0})
		MakeBlur:Play()
		AttributeAppear:Play()
		wait(0.15)
		AbilityFrame.Visible = false
		Open = false
	end
end)

CloseButton.MouseButton1Click:Connect(function()
		local AttributeAppear = tween:Create(AbilityFrame.UIScale, tweeninfo, {Scale = 0.25})
		local MakeBlur = tween:Create(Blur, tweeninfo, {Size = 0})
		MakeBlur:Play()
		AttributeAppear:Play()
		wait(0.15)
		AbilityFrame.Visible = false
		Open = false
end)