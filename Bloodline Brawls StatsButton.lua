local Player = game.Players.LocalPlayer
local MouseActive = false
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.55, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local Fasttweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local UIStroke = script.Parent.UIStroke
local Dark = tween:Create(UIStroke, tweeninfo, {Color = Color3.new(0.27451, 0.27451, 0.27451)})
local Light = tween:Create(UIStroke, tweeninfo, {Color = Color3.new(1, 1, 1)})
local activated = false
local tweening = false
local othersOpen = false

local leaderstats = Player:WaitForChild("leaderstats")
local PlayerStats = Player:WaitForChild("PlayerStats")
local Cash = PlayerStats:FindFirstChild("Cash")
local Magic = PlayerStats:FindFirstChild("Magic")
local Title = leaderstats:FindFirstChild("Title")
local Cash = PlayerStats:FindFirstChild("Cash")
local Mana = PlayerStats:FindFirstChild("Mana")
local StatPoints = PlayerStats:FindFirstChild("StatPoints")
local Lighting  = game:GetService("Lighting")
local Blur  = Lighting:FindFirstChild("Blur")
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = PlayerGui:WaitForChild("ScreenGui")


script.Parent.MouseEnter:Connect(function()
	MouseActive = true
	UIStroke.Transparency = 0
	
	repeat
		Light:Play()
		wait(0.55)
		Dark:Play()
		wait(0.55)
	until MouseActive == false
	
end)

script.Parent.MouseLeave:Connect(function()
	MouseActive = false
	local Light = tween:Create(UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Color = Color3.new(0.588235, 0.588235, 0.588235)})
	Light:Play()
	UIStroke.Transparency = 1
end)

script.Parent.MouseButton1Click:Connect(function()
	local MenuF = ScreenGui:FindFirstChild("MenuF")
	local MenuOptionsF = ScreenGui:FindFirstChild("MenuOptionsF")
	local StatsFrame = MenuOptionsF:FindFirstChild("StatsFrame")
	local AbilityF = ScreenGui:FindFirstChild("AbilityF")
	local AbilityFrame = AbilityF:FindFirstChild("AbilityFrame")
	
	for i, v in ipairs(ScreenGui:GetChildren()) do
		if v:GetAttribute("Priority") == "Secondary" and v ~= MenuF and v ~= MenuOptionsF then
			for i, e in ipairs(v:GetChildren()) do
				if e:IsA("GuiObject") then
					if e:GetChildren("UIScale") then
						local DisapearExtra = tween:Create(e.UIScale, Fasttweeninfo, {Scale = 0.25})
						DisapearExtra:Play()
						wait(0.15)
						e.Visible = false
					else
						e.Visible = false
					end
				end
			end
		end
	end
	
	if tweening == false then
		if activated then
			
			local MakeBlur = tween:Create(Blur, Fasttweeninfo, {Size = 0})
			local ColorChange = tween:Create(script.Parent, Fasttweeninfo, {TextStrokeColor3 = Color3.new(1, 0, 0)})
			local CloseFrame = tween:Create(StatsFrame.UIScale, Fasttweeninfo, {Scale = .25})
			tweening = true
			CloseFrame:Play()
			MakeBlur:Play()
			ColorChange:Play()	
			wait(0.15)
			
			StatsFrame.Visible = false
			activated = false
			tweening = false
		else
			StatsFrame.Visible = true
			local MakeBlur = tween:Create(Blur, Fasttweeninfo, {Size = 15})
			local ColorChange = tween:Create(script.Parent, Fasttweeninfo, {TextStrokeColor3 = Color3.new(0, 0, 1)})
			local OpenFrame = tween:Create(StatsFrame.UIScale, Fasttweeninfo, {Scale = 1})
			tweening = true
			OpenFrame:Play()
			MakeBlur:Play()
			ColorChange:Play()
			wait(0.15)
			activated = true
			tweening = false
		end
	end
end)