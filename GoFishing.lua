local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

--CFrame.new(244.910355, 124.443222, 867.954529, 0.957217932, -1.53162425e-08, -0.289367974, -7.89627119e-09, 1, -7.90505368e-08, 0.289367974, 7.79535227e-08, 0.957217932)


_G.Settings = {
    ["AutoFish"] = false,
	["StopTween"] = false,
	["AutoTap"] = true,
	["AutoFight"] = true,
	["AutoEquip"] = true,
	["AutoLuck"] = false,
	["AutoStrength"] = false,
	["AutoFishSpeed"] = false,
    ["Island"] = "DefaultIsle",
	["IslandCFrame"] = nil,
}

task.spawn(function()
	while task.wait() do
	if _G.Settings.Island == "DefaultIsle" then
		_G.Settings.IslandCFrame = CFrame.new(823.411804, 124.982384, -293.386292, 0.871252596, -1.10771436e-09, -0.490834892, 4.15978008e-08, 1, 7.15810557e-08, 0.490834892, -8.2782833e-08, 0.871252596)
	elseif _G.Settings.Island == "VulcanoIsle" then
		_G.Settings.IslandCFrame = CFrame.new(244.910355, 124.443222, 867.954529, 0.957217932, -1.53162425e-08, -0.289367974, -7.89627119e-09, 1, -7.90505368e-08, 0.289367974, 7.79535227e-08, 0.957217932)
	elseif _G.Settings.Island == "Snowy Biome" then
		_G.Settings.IslandCFrame = CFrame.new(2264.20972, 127.382469, 320.215881, -0.0274457615, 2.68453704e-08, 0.999623299, -8.20718711e-08, 1, -2.91088611e-08, -0.999623299, -8.28398683e-08, -0.0274457615)
	elseif _G.Settings.Island == "Mansion Island" then
		_G.Settings.IslandCFrame = CFrame.new(5213.93652, 129.299301, 711.229431, -0.999623358, 3.89708745e-08, 0.0274442472, 3.75277551e-08, 1, -5.30987023e-08, -0.0274442472, -5.20487795e-08, -0.999623358)
	elseif _G.Settings.Island == "Deep Waters" then
		_G.Settings.IslandCFrame = CFrame.new(-948.510803, 123.951172, -1555.08545, -0.00122487731, 7.20872961e-08, -0.999999225, 4.33509264e-08, 1, 7.20342541e-08, 0.999999225, -4.32626628e-08, -0.00122487731)
	elseif _G.Settings.Island == "Shipwreck Island" then
		_G.Settings.IslandCFrame = CFrame.new(2813.8877, 124.292038, 2982.09058, 0.707289875, 2.5574467e-08, 0.706923604, 1.05669606e-09, 1, -3.7234372e-08, -0.706923604, 2.70824998e-08, 0.707289875)
	elseif _G.Settings.Island == "Ancient Ocean" then
		_G.Settings.IslandCFrame = CFrame.new(609.130432, 125.807808, -2809.15918, -0.996957242, -4.52952769e-08, 0.0779505447, -4.64235264e-08, 1, -1.26617525e-08, -0.0779505447, -1.62419642e-08, -0.996957242)
	elseif _G.Settings.Island == "High Field" then
		_G.Settings.IslandCFrame = CFrame.new(2554.84497, 123.854439, -3448.67505, -0.683419943, 7.25790539e-09, 0.73002547, -5.98914807e-10, 1, -1.0502669e-08, -0.73002547, -7.61495667e-09, -0.683419943)
	elseif _G.Settings.Island == "Toxic Zone" then
		_G.Settings.IslandCFrame = CFrame.new(4669.06055, 125.012848, -2380.9751, -0.690396428, 5.29944089e-08, 0.72343123, -7.58739793e-10, 1, -7.39783346e-08, -0.72343123, -5.16232745e-08, -0.690396428)
	end
	end
end)

-- function
function Tween(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance > 1 then
        Speed = 250
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1}):Play()
    if _G.Settings.StopTween then
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1}):Cancel()
    end
end

-- windows
local Window = Fluent:CreateWindow({
    Title = "Zircon Hub",
    SubTitle = "Go Fishing",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 400),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons, they are optional
local Tab = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
	Skill = Window:AddTab({ Title = "Skill", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "" })
}

local Toggle = Tab.Main:AddToggle("Auto Fish", 
{
    Title = "Auto Farm", 
    Description = "Auto Fish",
    Default = _G.Settings.AutoFish,
    Callback = function(state)
    _G.Settings.AutoFish = state
	if state then
		_G.Settings.StopTween = false
	end
    if state == false then
        _G.Settings.StopTween = true
    end
    end
})

local Dropdown = Tab.Main:AddDropdown("Island", {
    Title = "Island",
    Description = "Self explanatory",
    Values = {"DefaultIsle", "VulcanoIsle", "Snowy Biome", "Mansion Island", "Deep Waters", "Shipwreck Island", "Ancient Ocean", "High Field"},
    Multi = false,
    Default = 1,
})

local Toggle = Tab.Settings:AddToggle("AutoTap", 
{
    Title = "Auto Tap", 
    Description = "Automatic Tap",
    Default = true,
    Callback = function(state)
	_G.Settings.AutoTap = state
    end 
})

local Toggle = Tab.Settings:AddToggle("AutoFight", 
{
    Title = "Auto Fight", 
    Description = "Automatic Fight",
    Default = true,
    Callback = function(state)
	_G.Settings.AutoFight = state
    end 
})

local Toggle = Tab.Skill:AddToggle("AutoLuck", 
{
    Title = "Auto Luck", 
    Description = "Automatic do luck on skills",
    Default = false,
    Callback = function(state)
	_G.Settings.AutoLuck = state
    end 
})

local Toggle = Tab.Skill:AddToggle("AutoStrength", 
{
    Title = "Auto Strength", 
    Description = "Automatic do strength on skills",
    Default = false,
    Callback = function(state)
	_G.Settings.AutoStrength = state
    end 
})

local Toggle = Tab.Skill:AddToggle("Auto FishSpeed", 
{
    Title = "Auto Fishing Speed", 
    Description = "Automatic do fishing speed on skills",
    Default = false,
    Callback = function(state)
	_G.Settings.AutoFishSpeed = state
    end 
})

Window:SelectTab(1)

-- do
spawn(function()
	while task.wait() do
		Dropdown:OnChanged(function(Value)
    		_G.Settings.Island = Value
		end)
	end
end)

spawn(function()
    while task.wait() do
		if _G.Settings.AutoFish then
			pcall(function()
        		repeat task.wait()
            		Tween(_G.Settings.IslandCFrame)
        		until _G.Settings.StopTween == true
			end)
		end
    end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoFish then
			pcall(function()
				repeat task.wait(1)
					game:GetService('VirtualUser'):CaptureController()
					game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
					task.wait(1.4)
					game:GetService('VirtualUser'):Button1Up(Vector2.new(1280, 672))
				until _G.Settings.AutoFish == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoFight then
			pcall(function()
				repeat task.wait()
					game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("fishing"):WaitForChild("fightClick"):FireServer()
				until _G.Settings.AutoFight == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoTap then
			pcall(function()
				repeat task.wait()
					game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("fishing"):WaitForChild("targetTap"):InvokeServer()
				until _G.Settings.AutoTap == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoEquip then
			pcall(function()
				repeat task.wait()
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
   						game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					end
				until _G.Settings.AutoEquip == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoLuck then
			pcall(function()
				repeat task.wait(1)
					game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("fishing"):WaitForChild("canPurchaseUpgrade"):InvokeServer("luckBoost")
				until _G.Settings.AutoLuck == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoStrength then
			pcall(function()
				repeat task.wait(1)
					game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("fishing"):WaitForChild("canPurchaseUpgrade"):InvokeServer("powerBoost")
				until _G.Settings.AutoStrength == false
			end)
		end
	end
end)

spawn(function()
	while task.wait() do
		if _G.Settings.AutoFishSpeed then
			pcall(function()
				repeat task.wait(1)
					game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("fishing"):WaitForChild("canPurchaseUpgrade"):InvokeServer("speedBoost")
				until _G.Settings.AutoFishSpeed == false
			end)
		end
	end
end)
