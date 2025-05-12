local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local PrefabsId = 'rbxassetid://71968920594655'
ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})
game:GetService("InsertService"):LoadLocalAsset(PrefabsId).Parent = workspace
local Window = ReGui:TabsWindow({
	Title = "Universal aimbot",
	Size = UDim2.new(0, 350, 0, 350),
	Position = UDim2.new(0.5, 0, 0, 70)
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESP = Window:CreateTab({
	Name = 'ESP'
})

local Aimbot = Window:CreateTab({
	Name = 'Aimbot'
})

local Values = {
	ESP = false,
	ESP_Color = Color3.fromRGB(255,255,255),
	ESP_FColor = Color3.fromRGB(0,255,0),
	ESP_Name = false,
	ESP_Health = false,
	Aimbot = false,
    Aimbot_Team = false,
    Aimbot_Friends = false,
	Aimbot_WallCheck = false,
    Aimbot_Smooth = 0.2,      -- 0 (instant) to 1 (very slow)
    Aimbot_FOV = 100,         -- Field of view radius in pixels
	Aimbot_SwitchSmooth = 0.05 -- smoothing when switching targets
}

function ESP_function()
	ESP:Indent({Offset=5}):DragColor3({
		Value = Color3.fromRGB(255,255,255),
		Label = "ESP Color",
		Callback = function(Color, Value)
			Values.ESP_Color = Value
		end
	})
	ESP:Indent({Offset=5}):DragColor3({
		Value = Color3.fromRGB(0,255,0),
		Label = "Friends Color",
		Callback = function(Color, Value)
			Values.ESP_FColor = Value
		end
	})
	ESP:Indent({Offset=5}):Checkbox({
		Value = false,
		Label = "Name",
		Callback = function(self, Value: boolean)
			Values.ESP_Name = Value
		end
	})
	ESP:Indent({Offset=5}):Checkbox({
		Value = false,
		Label = "Health",
		Callback = function(self, Value: boolean)
			Values.ESP_Health = Value
		end
	})
	ESP:Combo({
		Label = "Display",
		Selected = "3D",
		Items = {
			"3D",
			"2D",
		},
		Callback = function(Combo, Value)
			Values.ESP_Display = Value
		end
	})

	ESP:Checkbox({
		Value = false,
		Label = "Enabled",
		Callback = function(self, Value: boolean)
			Values.ESP = Value
		end
	})
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    -- Storage for ESP overlays
    local espBoxes3D = {}
    local espBoxes2D = {}
    local espLabels = {}     -- store text objects per player

    -- Edge definitions for a cube
    local EDGES = {
        {1,2},{2,4},{4,3},{3,1}, -- bottom
        {5,6},{6,8},{8,7},{7,5}, -- top
        {1,5},{2,6},{3,7},{4,8}  -- vertical
    }

    -- Colors
    local COLOR_FRIEND = Values.ESP_FColor
    local COLOR_NORMAL = {
        box2D = Values.ESP_Color,
        edges3D = Values.ESP_Color
    }

    -- Create 3D wireframe box (12 lines)
    local function create3DBox()
        local box = {}
        for i = 1, #EDGES do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Thickness = 2
            line.Transparency = 1
            table.insert(box, line)
        end
        return box
    end

    -- Create 2D rectangle box
    local function create2DBox()
        local box = Drawing.new("Square")
        box.Visible = false
        box.Filled = false
        box.Thickness = 2
        box.Transparency = 1
        return box
    end

    -- Create text label
    local function createLabel()
        local text = Drawing.new("Text")
        text.Visible = false
        text.Center = true
        text.Outline = true
        text.OutlineColor = Color3.fromRGB(0,0,0)
        text.Size = 16
        text.Font = 2
        return text
    end

    -- Get model bounding-box corners
    local function getCorners(model)
        local cframe, size = model:GetBoundingBox()
        local half = size * 0.5
        local corners = {}
        for x = -1, 1, 2 do
            for y = -1, 1, 2 do
                for z = -1, 1, 2 do
                    local pos = cframe.Position + Vector3.new(half.X*x, half.Y*y, half.Z*z)
                    table.insert(corners, pos)
                end
            end
        end
        return corners
    end

    -- Clear all overlays each frame
    local function clearAll()
        for _, box in pairs(espBoxes3D) do
            for _, line in ipairs(box) do line.Visible = false end
        end
        for _, box in pairs(espBoxes2D) do box.Visible = false end
        for _, label in pairs(espLabels) do label.Visible = false end
    end

    -- Main render loop
    RunService.RenderStepped:Connect(function()
        -- Update normal colors (in case Values changed runtime)
        COLOR_NORMAL = {
            box2D = Values.ESP_Color,
            edges3D = Values.ESP_Color
        }

        clearAll()
        if not Values.ESP then return end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
                local isFriend = LocalPlayer:IsFriendsWith(player.UserId)
                local col2D = isFriend and COLOR_FRIEND or COLOR_NORMAL.box2D
                local col3D = isFriend and COLOR_FRIEND or COLOR_NORMAL.edges3D

                -- Determine on-screen bounding
                local corners = getCorners(player.Character)
                local minX, minY = math.huge, math.huge
                local maxX, maxY = -math.huge, -math.huge
                local anyOn, allOn = false, true
                local screenPoints = {}

                for i, worldPos in ipairs(corners) do
                    local sp, on = Camera:WorldToViewportPoint(worldPos)
                    if on then
                        anyOn = true
                        minX = math.min(minX, sp.X)
                        minY = math.min(minY, sp.Y)
                        maxX = math.max(maxX, sp.X)
                        maxY = math.max(maxY, sp.Y)
                        screenPoints[i] = Vector2.new(sp.X, sp.Y)
                    else
                        allOn = false
                    end
                end

                -- Draw 3D box
                if Values.ESP_Display == '3D' and allOn then
                    if not espBoxes3D[player] then espBoxes3D[player] = create3DBox() end
                    for idx, edge in ipairs(EDGES) do
                        local line = espBoxes3D[player][idx]
                        line.From = screenPoints[edge[1]]
                        line.To   = screenPoints[edge[2]]
                        line.Color = col3D
                        line.Visible = true
                    end
                -- Draw 2D box
                elseif Values.ESP_Display == '2D' and anyOn and maxX > minX and maxY > minY then
                    if not espBoxes2D[player] then espBoxes2D[player] = create2DBox() end
                    local box = espBoxes2D[player]
                    box.Position = Vector2.new(minX, minY)
                    box.Size     = Vector2.new(maxX-minX, maxY-minY)
                    box.Color    = col2D
                    box.Visible  = true
                end

                -- Draw Name and/or Health
                if (Values.ESP_Name or Values.ESP_Health) and anyOn then
                    if not espLabels[player] then espLabels[player] = createLabel() end
                    local label = espLabels[player]
                    -- Position label above head (using top corners avg)
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, head.Size.Y, 0))
                        if onScreen then
                            label.Position = Vector2.new(screenPos.X, screenPos.Y - 10)
                            local textParts = {}
                            if Values.ESP_Name then table.insert(textParts, player.Name) end
                            if Values.ESP_Health then
                                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    table.insert(textParts, math.floor(humanoid.Health).."/"..math.floor(humanoid.MaxHealth))
                                end
                            end
                            label.Text = table.concat(textParts, "   ")
                            label.Color = col2D
                            label.Visible = true
                        else
                            label.Visible = false
                        end
                    end
                end
            else
                -- Hide overlays
                if espBoxes3D[player] then for _, l in ipairs(espBoxes3D[player]) do l.Visible = false end end
                if espBoxes2D[player] then espBoxes2D[player].Visible = false end
                if espLabels[player] then espLabels[player].Visible = false end
            end
        end
    end)

    -- Cleanup on player leave
    Players.PlayerRemoving:Connect(function(p)
        if espBoxes3D[p] then for _, l in ipairs(espBoxes3D[p]) do l:Remove() end; espBoxes3D[p]=nil end
        if espBoxes2D[p] then espBoxes2D[p]:Remove(); espBoxes2D[p]=nil end
        if espLabels[p] then espLabels[p]:Remove(); espLabels[p]=nil end
    end)
end

function Aimbot_function()
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Team",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Team = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Friends",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Friends = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Wall check",
		Callback = function(self, Value: boolean)
			Values.Aimbot_WallCheck = Value
		end
	})
	Aimbot:Indent({Offset = 5}):SliderFloat({
		Label = "Smooth", 
		Minimum = 0.0, 
		Maximum = 1.0,
		Value = 0.2,
		Format = "%.2f",
		Callback = function(self, Value)
			Values.Aimbot_Smooth = Value
		end
	})
	Aimbot:Indent({Offset = 5}):SliderInt({
		Label = "FOV", 
		Minimum = 0, 
		Maximum = 200,
		Value = 50,
		Callback = function(self, Value)
			Values.Aimbot_FOV = Value
		end
	})
	local Row = Aimbot:Row({Spacing = 15})
	local Enabled = Row:Checkbox({
		Value = false,
		Label = "Enabled",
		Callback = function(self, Value: boolean)
			Values.Aimbot = Value
		end
	})
	Row:Keybind({
		Label = "Bind",
		Value = Enum.KeyCode.Q,
		Callback = function(self, KeyId)
			Enabled:Toggle()
		end,
	})
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local LocalPlayer = Players.LocalPlayer
	local Camera = workspace.CurrentCamera
	local Mouse = LocalPlayer:GetMouse()

	local lastTarget = nil

	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	rayParams.IgnoreWater = true

	local function canSee(headPos)
		local origin = Camera.CFrame.Position
		local dir = (headPos - origin)
		local result = Workspace:Raycast(origin, dir, rayParams)
		return result and headPos == result.Position or (not result)
	end

	local function getClosestTarget()
		local closestPlayer, closestDist = nil, Values.Aimbot_FOV
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
				-- Team filter
				if not Values.Aimbot_Team or player.Team ~= LocalPlayer.Team then
					-- Friend filter
					if not Values.Aimbot_Friends or not LocalPlayer:IsFriendsWith(player.UserId) then
						local head = player.Character:FindFirstChild("Head")
						if head then
							if Values.Aimbot_WallCheck then
								if not canSee(head.Position) then
									return
								end
							end
							local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
							if onScreen then
								local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
								if dist < closestDist then
									closestDist = dist
									closestPlayer = player
								end
							end
						end
					end
				end
			end
		end
		return closestPlayer
	end

	RunService.RenderStepped:Connect(function(delta)
		if not Values.Aimbot then return end
        local targetPlayer = getClosestTarget()
        if targetPlayer then
            local head = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head")
            if head then
                local targetPos = head.Position
                local smoothVal = Values.Aimbot_Smooth
                if targetPlayer ~= lastTarget then
                    smoothVal = Values.Aimbot_SwitchSmooth
                end
                lastTarget = targetPlayer

                local camCF = Camera.CFrame
                local dir = (targetPos - camCF.Position).Unit
                local newLook = camCF.LookVector:Lerp(dir, smoothVal)
                Camera.CFrame = CFrame.new(camCF.Position, camCF.Position + newLook)
            end
        else
            lastTarget = nil
        end
	end)
end

ESP_function()
Aimbot_function()

