local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StatChangeF = ReplicatedStorage:FindFirstChild("StatChangeF")
local StatAddedEvent = StatChangeF:FindFirstChild("StatAdderEvent")
local KeyKindsF = ReplicatedStorage:FindFirstChild("KeyBindsF")
local EEvent = KeyKindsF:FindFirstChild("EEvent")
local FightingF = ReplicatedStorage:FindFirstChild("FightingF")
local FirstFistEvent = FightingF:FindFirstChild("FirstFistEvent")
local SecondFistEvent = FightingF:FindFirstChild("SecondFistEvent")
local ThirdFistEvent = FightingF:FindFirstChild("ThirdFistEvent")
local FinalFistEvent = FightingF:FindFirstChild("FinalFistEvent")
local ServerStorage = game:GetService("ServerStorage")
local HitBoxF = ServerStorage:FindFirstChild("HitBoxF")
local hitbox = HitBoxF:FindFirstChild("hitbox")
local PowersF = ServerStorage:FindFirstChild("PowersF")
local tweenservice = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.55, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local Fasttweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

local function PowerActivated(Player, SelectedPower)
	local Checkers = Player:FindFirstChild("Checkers")
	local CanPunch = Checkers:FindFirstChild("CanPunch")
	CanPunch.Value = false
	local amountOfWood = 1
	local Character = Player.Character
	print("Doing")
	print(SelectedPower)
	
	local WoodF = PowersF:FindFirstChild("WoodF")
	local WoodExtention = WoodF:FindFirstChild("Wood Extention")
	local WoodStalk = WoodF:FindFirstChild("Wood Stalk")
	
	
	if SelectedPower == "Wood Extention" then
		local OldWalkSpeed = Character.Humanoid.WalkSpeed
		Character.Humanoid.WalkSpeed = 0
		wait(0.5)
		
		local WoodOne = WoodExtention:FindFirstChild("Wood"):Clone()
		local WoodTwo = WoodExtention:FindFirstChild("Wood"):Clone()
		local UpperTorso = Character:FindFirstChild("UpperTorso")
		local lookvector = UpperTorso.CFrame + UpperTorso.CFrame.LookVector * ((WoodOne.Size.Z / 2) - 5)
		local Head = Character:FindFirstChild("Head")
		local RaiseAnimation = Instance.new("Animation")
		RaiseAnimation.AnimationId = "rbxassetid://15068724147"
		local AnimationAssign = Character.Humanoid:LoadAnimation(RaiseAnimation) 		
		AnimationAssign:Play()
		WoodOne.CFrame = Head.CFrame * CFrame.new(5,2,(WoodOne.Size.Z) * -0)
		WoodOne.Parent = Character
		WoodTwo.CFrame = Head.CFrame * CFrame.new(-5,2,(WoodTwo.Size.Z) * -0)
		WoodTwo.Parent = Character
		local counter = 0
		repeat
			local smallFirst = tweenservice:Create(WoodOne, tweeninfo, {Size = WoodOne.Size * Vector3.new(0.55,0.5,0.25)})
			local smallSecond = tweenservice:Create(WoodTwo, tweeninfo, {Size = WoodOne.Size * Vector3.new(0.55,0.5,0.25)})
			smallFirst:Play()
			smallSecond:Play()
			wait(0.75)
			counter = counter + 1
		until counter >= 3
		local Woods = {WoodOne, WoodTwo}
		
		for i, v in ipairs(Woods) do
			if v == WoodOne then
				local Shoot = tweenservice:Create(v, tweeninfo, {CFrame = Head.CFrame * CFrame.new(40,1, -200)})
				Shoot:Play()
			else
				local Shoot = tweenservice:Create(v, tweeninfo, {CFrame = Head.CFrame * CFrame.new(-40,1, -200)})
				Shoot:Play()
			end
			
			local Expand = tweenservice:Create(v, Fasttweeninfo, {Size = WoodOne.Size * Vector3.new(300,300,300)})
			Expand:Play()
			v.Touched:Connect(function(hit)
				if hit.Parent:FindFirstChild("Humanoid") and hit.Parent.Name ~= Player.Name then
					print(hit.Parent.Name)
				end
			end)
		end
		
		wait(0.75)
		
		for i, v in ipairs(Woods) do
			v:Destroy()
		end
		Character.Humanoid.WalkSpeed = OldWalkSpeed
		CanPunch.Value = true
		

	elseif SelectedPower == "Wood Stalk" and Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall  then
		print(Character.Humanoid:GetState())
		local OldWalkSpeed = Character.Humanoid.WalkSpeed
		Character.Humanoid.WalkSpeed = 0
		wait(0.5)
		local WoodStalkWood = WoodStalk:FindFirstChild("Wood"):Clone()
		WoodStalkWood.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0)
		local oldPos = WoodStalkWood.Position.Y
		WoodStalkWood.Parent = Character
		local WoodLengthCounter = 0
		WoodLengthCounter = WoodLengthCounter + 1
		local Slowtweeninfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
		local Lengthen = tweenservice:Create(WoodStalkWood, Slowtweeninfo, {Size = WoodStalkWood.Size + Vector3.new(0,75,0), CFrame = WoodStalkWood.CFrame * CFrame.new(0,WoodStalkWood.Size.Y/2, 0)})
		
		

		local MovePerson = tweenservice:Create(Character.HumanoidRootPart, Slowtweeninfo, {CFrame = CFrame.new(0,WoodStalkWood.Size.Y,0)})
		Lengthen:Play()
		wait(1)
		local Positioning = tweenservice:Create(WoodStalkWood, Slowtweeninfo, {CFrame = WoodStalkWood.CFrame * CFrame.new(0,WoodStalkWood.Size.Y/2 + oldPos, 0)})
		Positioning:Play()
		MovePerson:Play()
		wait(1.5)
		Character.Humanoid.WalkSpeed = OldWalkSpeed
		wait(3)
		WoodStalkWood:Destroy()
		
		
		
	elseif SelectedPower == "Wood Stalk" and Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
		
	
		
	end
end



FirstFistEvent.OnServerEvent:Connect(function(Player)
	local Damage = 5
	local hitboxClone = hitbox:Clone()
	local Character = Player.Character
	hitboxClone.Parent = Character
	local Head = Character:FindFirstChild("Head")
	local lookvector = Head.CFrame + Head.CFrame.LookVector * 2 -- Offset
	hitboxClone.CFrame = lookvector
	hitboxClone.Touched:Connect(function(hit)
			local Victim 
			if hit.Parent:IsA("Accessory") then
			Victim = hit.Parent.Parent.Name
			else
				Victim = hit.Parent.Name
			end
			Victim = game.Workspace:FindFirstChild(Victim)
			if Victim and game.Players:FindFirstChild(Victim.Name) then
			if Victim:GetChildren("Humanoid") and Victim.Name ~= Player.Name then
				hitboxClone:Destroy()
				Victim.Humanoid:TakeDamage(Damage)
				end
			end
	end)
	
end)

SecondFistEvent.OnServerEvent:Connect(function(Player)
	local Damage = 5
	local hitboxClone = hitbox:Clone()
	local Character = Player.Character
	hitboxClone.Parent = Character
	local Head = Character:FindFirstChild("Head")
	local lookvector = Head.CFrame + Head.CFrame.LookVector * 2 -- Offset
	hitboxClone.CFrame = lookvector
	hitboxClone.Touched:Connect(function(hit)
		local Victim 
		if hit.Parent:IsA("Accessory") then
			Victim = hit.Parent.Parent.Name
		else
			Victim = hit.Parent.Name
		end
		Victim = game.Workspace:FindFirstChild(Victim)
		if Victim then
			if Victim:GetChildren("Humanoid") and Victim.Name ~= Player.Name then
				hitboxClone:Destroy()
				Victim.Humanoid:TakeDamage(Damage)
			end
		end
	end)

end)

ThirdFistEvent.OnServerEvent:Connect(function(Player)
	local Damage = 15
	local hitboxClone = hitbox:Clone()
	local Character = Player.Character
	hitboxClone.Parent = Character
	local Head = Character:FindFirstChild("Head")
	local lookvector = Head.CFrame + Head.CFrame.LookVector * 2 -- Offset
	hitboxClone.CFrame = lookvector
	hitboxClone.Touched:Connect(function(hit)
		local Victim 
		if hit.Parent:IsA("Accessory") then
			Victim = hit.Parent.Parent.Name
		else
			Victim = hit.Parent.Name
		end
		Victim = game.Workspace:FindFirstChild(Victim)
		if Victim then
			if Victim:GetChildren("Humanoid") and Victim.Name ~= Player.Name then
				hitboxClone:Destroy()
				Victim.Humanoid:TakeDamage(Damage)
			end
		end
	end)

end)

FinalFistEvent.OnServerEvent:Connect(function(Player)
	local Damage = 20
	local hitboxClone = hitbox:Clone()
	local Character = Player.Character
	hitboxClone.Parent = Character
	local Head = Character:FindFirstChild("Head")
	local lookvector = Head.CFrame + Head.CFrame.LookVector * 2 -- Offset
	hitboxClone.CFrame = lookvector
	hitboxClone.Touched:Connect(function(hit)
		local Victim 
		if hit.Parent:IsA("Accessory") then
			Victim = hit.Parent.Parent.Name
		else
			Victim = hit.Parent.Name
		end
		Victim = game.Workspace:FindFirstChild(Victim)
		
		if Victim then
			if Victim:GetChildren("Humanoid") and Victim.Name ~= Player.Name then
				hitboxClone:Destroy()
				wait(0.5)
				Victim.Humanoid:TakeDamage(Damage)
			end
		end
	end)

end)

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
	local Spins = PlayerStats:FindFirstChild("Spins")
	local Slots = Player:FindFirstChild("Slots")
	local FirstSlot = Slots:FindFirstChild("FirstSlot")
	local SecondSlot = Slots:FindFirstChild("SecondSlot")
	local ThirdSlot = Slots:FindFirstChild("ThirdSlot")
	local FourthSlot = Slots:FindFirstChild("FourthSlot")
	local FifthSlot = Slots:FindFirstChild("FifthSlot")
	
	local SelectedPower 
	for i, v in ipairs(PowersF:GetDescendants()) do
		if FirstSlot.Value == v.Name then
			SelectedPower = v.Name
		end
	end
	
	PowerActivated(Player, SelectedPower)
	
end)