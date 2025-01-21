local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Zircon Hub | Pillow Fight")

local Section = Window:NewSection("Main")

local AutoHitbox = false
local AutoTPRandom = false
local AutoSmack = false
local AutoIn = false
local AutoEquip = false

spawn(function()
	while task.wait() do
			game.Players.LocalPlayer.CharacterAdded:Connect(function()
				if AutoIn then
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = workspace.Lobby.Portals.RedPortal.gate.CFrame
				end
			end)
	end
end)

spawn(function()
while task.wait() do
		game.Players.PlayerRemoving:Connect(function(plr)
			if AutoRejoin == true then
    		if plr == game.Players.LocalPlayer then
      			game:GetService('TeleportService'):Teleport(game.PlaceId)
    		end
			end
		end)
end
end)

spawn(function()
	while task.wait(0.5) do
		if AutoSmack == true then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
     			if v:IsA("Tool") then
            		v:Activate()
        		end 
    		end
		end
	end
end)

spawn(function()
	while task.wait(0.1) do
		if AutoEquip == true then
			for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
        		LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
    		end
		end
	end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

spawn(function()
    while task.wait() do
        if AutoHitbox == true then
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
		            if v.Name == "HumanoidRootPart" then
			            if v.Parent ~= game.Players.LocalPlayer.Character then
				        v.Size = Vector3.new(10, 10, 10)
				        v.CanCollide = false
				        v.Transparency = "0.5"
			        end
		        end
	        end
        end
    end
    end
end)

Section:CreateButton("TP Random", function()
    for i, v in pairs(workspace:GetDescendants()) do
	    if v:IsA("BasePart") then
		    if v.Name == "HumanoidRootPart" then
			    if v.Parent ~= game.Players.LocalPlayer.Character then
                    if v.Parent.Name ~= "Friend" or v.Parent.Name ~= "Sensei" then
				    if v.Parent.CanBeHit.Value == true then
				    	if v.Parent.Humanoid.Health ~= 0 then
						    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,0,0)
					    end
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

Section:CreateToggle("Auto Smack", function(value)
	AutoSmack = value
end)

Section:CreateToggle("Auto Rejoin", function(value)
	AutoRejoin = value
end)

Section:CreateToggle("Auto In", function(value)
	AutoIn = value
end)

Section:CreateToggle("Auto Equip", function(value)
	AutoEquip = value
end)

Section:CreateToggle("Auto TP Random", function(value)
    AutoTPRandom = value
end)

Section:CreateButton("Discord Link:lolbad", function()
    setclipboard("https://discord.gg/rWtJdkjBfJ")
end)

local function teleport()
    while task.wait() do
        if AutoTPRandom then
            if LocalPlayer.Character:FindFirstChild("CanBeHit") then
                if LocalPlayer.Character.CanBeHit.Value == true then
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
                            if v.Parent ~= LocalPlayer.Character then
                                if v.Parent.Name ~= "Friend" or v.Parent.Name ~= "Sensei" then
                                    if v.Parent:FindFirstChild("CanBeHit") then
                                        if v.Parent.CanBeHit.Value == true then
                                            if v.Parent.Humanoid.Health ~= 0 then
                                                LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame + Vector3.new(0,3,0)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    teleport()
end)

-- Start teleportation if the character is already loaded
if LocalPlayer.Character then
    teleport()
end
