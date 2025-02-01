local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/FlingerM/Main/main/library.lua'))()
local UserInputService = game:GetService("UserInputService")
local window = lib.createWindow("HOKJHa's GUI", "HOKJHa's GUI", true) 
local maintab = window.createTab("Main")
local mainsection = maintab.createSection("Helper", false)
local teleportab = window.createTab("Teleport")
local tps = teleportab.createSection("X to tp [Testing]")
--local targetsection = maintab.createSection("Targeter", false)
local highlight = Instance.new("Highlight")
local player = game.Players.LocalPlayer
local character = player.Character
local input = mainsection.createTextBox("Range", "20")
local stopped = false
local players = {}
local selected = nil
local vv = false
--loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
local p = {n = false, b = "Cage1", m="Grab"}

local GetDistance = function()
    local maxDistance = if tonumber(input.getText) == nil then 100 else tonumber(input.getText())
    local nearestPlayer = nil
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character.PrimaryPart and stopped == false then
            local distance = (otherPlayer.Character.PrimaryPart.Position - character.PrimaryPart.Position).Magnitude
            if distance < maxDistance then
                maxDistance = distance
                nearestPlayer = otherPlayer
                A_1 = nearestPlayer.Character:FindFirstChildOfClass("Part")
                A_2 = p[2] or "Grab"
		        A_3 = A_1.Position
                A_4 = A_1.CFrame
                local Event = game:GetService("ReplicatedStorage").Events.Grab
                Event:FireServer(A_1, A_2, A_3, A_4)
                local Cage = game:GetService("ReplicatedStorage").Events.ActivateButton
		if selected ~= "None" then
		   if selected == "Mod1" then
		    Cage:FireServer("Guillotine")
		   end
           else
           Cage:FireServer(p[1])
		end
	     end
         end
	 end

                if nearestPlayer then
        -- Calculate the direction to face the nearest player
        --local direction = (nearestPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Unit
        --local studs = math.round((nearestPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude)
        
        -- Rotate the character
        --character.HumanoidRootPart.CFrame = -CFrame.lookAt(character.HumanoidRootPart.Position, character.HumanoidRootPart.Position + Vector3.new(direction.X, 0, direction.Z))
        -- Create a line from the character to the nearest player
        local line = Instance.new("Part")
        line.Anchored = true
        line.CanCollide = false
        line.BrickColor = BrickColor.new("White")
        line.Material = "Neon"
        line.Size = Vector3.new(0.02, 0.02, (character.HumanoidRootPart.Position - nearestPlayer.Character.HumanoidRootPart.Position).Magnitude)
        line.CFrame = CFrame.new(character.HumanoidRootPart.Position, nearestPlayer.Character.HumanoidRootPart.Position) * CFrame.new(0, 0, -line.Size.Z/2)
        line.Parent = workspace
        game.Debris:AddItem(line, 0.002)
            end
end
--[[for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
    if otherPlayer ~= player and otherPlayer.Character then
        players[_]=otherPlayer.Name
    end
end
local lengthNum = 0
for k, v in pairs(players) do 
   lengthNum = lengthNum + 1
end
players[lengthNum+1]="None"
targetsection.createDropdown("Target", players, "None", function(value)
    selected = value
end)]]
--window.notification("Hello!", "Welcome, that script so dangerous but if u used it im reccomend u be in invisible using mind control!", 18 , nil)
mainsection.createToggle("Chaos", false, function(v)
    p[0]=v 
end)
tps.createToggle("Enabled?", false, function(v)
    vv=v
end)
window.notification("Hello!", "My reccomendations: Use mind contol to target player, after player leave you be in invisible and you can grab players without title and nickname near you!", 16 , nil)
maintab.createButton("Remove GUI", function()
    p[0]=not p[0]
    stopped = true
    warn("Script stopped - By HOKJHa!")
    window.deleteWindow("HOKJHa's GUI")
end)
mainsection.createDropdown("Mods", {"Mod1", "None"}, "None", function(value)
v=value 
    selected = v
    if v=="Mod1" then
        window.notification("FAQ", "Loose their head", 18 , nil)
    end
end)
mainsection.createDropdown("Teleport", {"Cage1", "Cage2", "Cage3", "Cage4", "Machine", "Shark", "Void"}, "Cage4", function(value)
v=value 
    p[1]=v 
end)
mainsection.createDropdown("Method", {"Grab", "Grenade Launcher", "Taser", "Mind Control", "Drag"}, "Grab", function(value)
v=value 
    p[2]=v 
end)
local function clip(text)
setclipboard(text)
end
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if vv and input.KeyCode == Enum.KeyCode.X then
     game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("teleportRequest"):FireServer(player:GetMouse().Hit )
     print(player:GetMouse().Hit )
     clip("CFrame.new("..player:GetMouse().Hit..")")
     end
end)
while wait() do
    if p[0] then
        pcall(GetDistance)
    end
end
