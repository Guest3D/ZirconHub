local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Zircon Hub | Be A Parkour Ninja")

local Section = Window:NewSection("Main")

local AutoHitbox = false
local AutoTPRandom = false

Section:CreateButton("TP Random", function()
    for i, v in pairs(workspace:GetDescendants()) do
	    if v:IsA("BasePart") then
		    if v.Name == "HumanoidRootPart" then
			    if v.Parent ~= game.Players.LocalPlayer.Character then
				    if not v.Parent:FindFirstChild("ForceField") then
				    	if v.Parent.Humanoid.Health ~= 0 then
						    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,20,0)
					    end
				    end
			    end
		    end
	    end
    end
end)

Section:CreateToggle("Auto Hitbox", function(value)
    AutoHitbox = value
end)

Section:CreateToggle("Auto TP Random", function(value)
    AutoTPRandom = value
end)

spawn(function()
    while task.wait() do
        if AutoTPRandom == true then
               for i, v in pairs(workspace:GetDescendants()) do
	    if v:IsA("BasePart") then
		    if v.Name == "HumanoidRootPart" then
			    if v.Parent ~= game.Players.LocalPlayer.Character then
				    if not v.Parent:FindFirstChild("ForceField") then
				    	if v.Parent.Humanoid.Health ~= 0 then
						    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,20,0)
					    end
				    end
			    end
		    end
	    end
    end
        end
    end
end)

spawn(function()
    while task.wait() do
        if AutoHitbox == true then
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
		            if v.Name == "HumanoidRootPart" then
			            if v.Parent ~= game.Players.LocalPlayer.Character then
				        v.Size = Vector3.new(20, 20, 20)
				        v.CanCollide = false
				        v.Transparency = "0.5"
			        end
		        end
	        end
        end
    end
    end
end)
