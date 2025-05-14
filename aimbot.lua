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
local ConfigTab = Window:CreateTab({
	Name = 'Config'
})

if not isfolder then
    warn("Config system requires isfolder/writefile/readfile support")
else
    if not isfolder("UA_Configs") then makefolder("UA_Configs") end
end

local Values = {
	ESP = false,
	ESP_Color = Color3.fromRGB(255,255,255),
	ESP_FColor = Color3.fromRGB(0,255,0),
	ESP_TColor = Color3.fromRGB(0,255,0),
	ESP_Name = false,
	ESP_Health = false,
	ESP_RangeEnabled = false,
	ESP_Team = false,
	ESP_Alive = true,
	ESP_Boxes = true,
	ESP_TextSize = 6,
	ESP_TextColor = Color3.fromRGB(255, 0, 0),
	ESP_Thickness = 2,
	ESP_Range = 1000000,
	Aimbot = false,
    Aimbot_Team = false,
    Aimbot_Friends = false,
	Aimbot_WallCheck = false,
	Aimbot_Alive = true,
    Aimbot_Smooth = 0.2,      -- 0 (instant) to 1 (very slow)
    Aimbot_FOV = 100,         -- Field of view radius in pixels
	Aimbot_SwitchSmooth = 0.05, -- smoothing when switching targets
	Aimbot_NearRange = 500,
	Aimbot_Rules = {
		Near = true, -- By distance
		Part = 'Head'
	}
}

local a = {
	C1, C2, C3, C4, S1, S2, N, H, T, A, L, T, R, D, B, E
}

local function getConfigList()
    local files = listfiles("UA_Configs")
    local list = {}
    for _, path in ipairs(files) do
        local name = path:match("UA_Configs/(.+)%.json$")
        if name then table.insert(list, name) end
    end
    return list
end
local function saveConfig(name)
	local HttpService = game:GetService("HttpService")
    local data = HttpService:JSONEncode(Values)
    writefile("UA_Configs/"..name..".json", data)
    return true
end
local function loadConfig(name)
	local HttpService = game:GetService("HttpService")
    local path = "UA_Configs/"..name..".json"
    if not isfile(path) then return false end
    local raw = readfile(path)
    local ok, data = pcall(HttpService.JSONDecode, HttpService, raw)
    if not ok then return false end
    for k,v in pairs(data) do
        if Values[k] ~= nil then
            Values[k] = v
        end
		print(k, v)
    end
    return true
end

local configDropdown = ConfigTab:Combo({
    Label = "Select config",
    Selected = "None",
    Items = getConfigList(),
    Callback = function(self, value)
        currentSelection = value
    end
})

local CurrentName = 'n/a'
local nameBox = ConfigTab:InputText({
    Label = "Config name",
    Placeholder = "Enter name",
    Callback = function(self, value)
        CurrentName = value
    end
})

local row = ConfigTab:Row({Spacing = 10})
row:Button({
    Text = "Save",
    Callback = function()
        local name = CurrentName
        if name and name ~= "" then
            saveConfig(name)
            configDropdown.Items = getConfigList()
            nameBox.Value = ""
        end
    end
})
row:Button({
    Text = "Load",
    Callback = function()
        if currentSelection then
            loadConfig(currentSelection)
        end
    end
})
row:Button({
    Text = "Delete",
    Callback = function()
        if currentSelection then
            delfile("UA_Configs/"..currentSelection..".json")
            configDropdown.Items = getConfigList()
            currentSelection = nil
        end
    end
})


local function ESP_function()
    a.C1 = ESP:Indent({Offset=5}):DragColor3({
        Value = Color3.fromRGB(255,255,255),
        Label = "ESP Color",
        Callback = function(Color, Value)
            Values.ESP_Color = Value
        end
    })
    a.C2 = ESP:Indent({Offset=5}):DragColor3({
        Value = Color3.fromRGB(0,255,0),
        Label = "Friends Color",
        Callback = function(Color, Value)
            Values.ESP_FColor = Value
        end
    })
    a.C3 = ESP:Indent({Offset=5}):DragColor3({
        Value = Color3.fromRGB(0,255,0),
        Label = "Team Color",
        Callback = function(Color, Value)
            Values.ESP_TColor = Value
        end
    })
	a.C4 = ESP:Indent({Offset=5}):DragColor3({
        Value = Color3.fromRGB(255, 255, 255),
        Label = "Text Color",
        Callback = function(Color, Value)
            Values.ESP_TextColor = Value
        end
    })

	a.S1 = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Text size",
        Value = 6,
        Minimum = 0,
        Maximum = 30,
        Callback = function(self, Value)
            Values.ESP_TextSize = Value
        end
    })
	a.S2 = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Thickness",
        Value = 2,
        Minimum = 1,
        Maximum = 5,
        Callback = function(self, Value)
            Values.ESP_Thickness = Value
        end
    })

	ESP:Separator()

    a.N = ESP:Indent({Offset=5}):Checkbox({
        Value = false,
        Label = "Name",
        Callback = function(self, Value: boolean)
            Values.ESP_Name = Value
        end
    })
    a.H = ESP:Indent({Offset=5}):Checkbox({
        Value = false,
        Label = "Health",
        Callback = function(self, Value: boolean)
            Values.ESP_Health = Value
        end
    })
    a.T = ESP:Indent({Offset=5}):Checkbox({
        Value = false,
        Label = "Show team",
        Callback = function(self, Value: boolean)
            Values.ESP_Team = Value
        end
    })
	a.A = ESP:Indent({Offset = 5}):Checkbox({
		Value = true,
		Label = "Alive only",
		Callback = function(self, Value: boolean)
			Values.ESP_Alive = Value
		end
	})
    a.L = ESP:Indent({Offset = 5}):Checkbox({
        Value = false,
        Label = "Limit distance",
        Callback = function(self, Value: boolean)
			if Value then
				Values.ESP_Range = 200
			else
				Values.ESP_Range = 1000000
			end
            Values.ESP_RangeEnabled = Value
        end
    })
	a.T = ESP:Indent({Offset=5}):Checkbox({
        Value = false,
        Label = "Tracers",
        Callback = function(self, Value: boolean)
            Values.ESP_Tracers = Value
        end
    })
    local Range = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Range",
        Value = 200,
        Minimum = 10,
        Maximum = 5000,
        Callback = function(self, Value)
            Values.ESP_Range = Value
        end
    })
	a.R = Range
    a.D = ESP:Combo({
        Label = "Display",
        Selected = "3D",
        Items = { "3D", "2D", },
        Callback = function(Combo, Value)
            Values.ESP_Display = Value
        end
    })

	a.B = ESP:Checkbox({
        Value = true,
        Label = "Box",
        Callback = function(self, Value: boolean)
            Values.ESP_Boxes = Value
        end
    })

    a.E = ESP:Checkbox({
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

    local espBoxes3D = {}
    local espBoxes2D = {}
    local espLabels   = {}
    local espTracers  = {}

    local EDGES = {
        {1,2},{2,4},{4,3},{3,1},
        {5,6},{6,8},{8,7},{7,5},
        {1,5},{2,6},{3,7},{4,8}
    }

    local function create3DBox()
        local box = {}
        for i = 1, #EDGES do
            local line = Drawing.new("Line")
            line.Visible = false
            line.Thickness = Values.ESP_Thickness
            line.Transparency = 1
            table.insert(box, line)
        end
        return box
    end

    local function create2DBox()
        local box = Drawing.new("Square")
        box.Visible = false
        box.Filled = false
        box.Thickness = Values.ESP_Thickness
        box.Transparency = 1
        return box
    end

    local function createLabel()
        local text = Drawing.new("Text")
        text.Visible = false
        text.Center = true
        text.Outline = true
        text.OutlineColor = Color3.fromRGB(0,0,0)
        text.Size = 10 + Values.ESP_TextSize
        text.Font = 2
        return text
    end

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

    local function clearAll()
        for _, box in pairs(espBoxes3D) do for _, line in ipairs(box) do line.Visible = false end end
        for _, box in pairs(espBoxes2D) do box.Visible = false end
        for _, label in pairs(espLabels)   do label.Visible = false end
        for _, tracer in pairs(espTracers)  do tracer.Visible = false end
    end

    RunService.RenderStepped:Connect(function()
        Range:SetDisabled(not Values.ESP_RangeEnabled)
        if not Values.ESP_RangeEnabled then
            Values.ESP_Range = math.huge
        end

        local COLOR_FRIEND = Values.ESP_FColor
        local COLOR_TEAM   = if Values.ESP_Team then Values.ESP_TColor else Values.ESP_Color
        local COLOR_NORMAL = { box2D = Values.ESP_Color, edges3D = Values.ESP_Color }

        clearAll()
        if not Values.ESP then return end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character.PrimaryPart then
                local dist = (Camera.CFrame.Position - player.Character.PrimaryPart.Position).Magnitude
                if dist > Values.ESP_Range then continue end
				if Values.ESP_Alive then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					if not humanoid or humanoid.Health <= 0 then
						continue
					end
				end

                local isFriend = LocalPlayer:IsFriendsWith(player.UserId)
                local isTeam   = (player.Team == LocalPlayer.Team)

                local col2D = isFriend and COLOR_FRIEND or isTeam and COLOR_TEAM or COLOR_NORMAL.box2D
                local col3D = isFriend and COLOR_FRIEND or isTeam and COLOR_TEAM or COLOR_NORMAL.edges3D

                -- Draw Tracer
                if Values.ESP_Tracers then
                    if not espTracers[player] then
                        local line = Drawing.new("Line")
                        line.Thickness    = Values.ESP_Thickness
                        line.Transparency = 1
                        line.Visible      = false
                        espTracers[player] = line
                    end
                    local tracer = espTracers[player]
                    local from = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    local worldPos, onScreen = Camera:WorldToViewportPoint(player.Character.PrimaryPart.Position)
                    local to   = Vector2.new(worldPos.X, worldPos.Y)
                    tracer.From       = from
                    tracer.To         = to
                    tracer.Color      = col2D
                    tracer.Visible    = onScreen
					tracer.Thickness = Values.ESP_Thickness
                end

                -- Draw 3D or 2D boxes
                local corners = getCorners(player.Character)
                local minX, minY = math.huge, math.huge
                local maxX, maxY = -math.huge, -math.huge
                local anyOn, allOn, screenPoints = false, true, {}
                for i, corner in ipairs(corners) do
                    local sp, on = Camera:WorldToViewportPoint(corner)
                    if on then
                        anyOn = true
                        minX, minY = math.min(minX, sp.X), math.min(minY, sp.Y)
                        maxX, maxY = math.max(maxX, sp.X), math.max(maxY, sp.Y)
                        screenPoints[i] = Vector2.new(sp.X, sp.Y)
                    else allOn = false end
                end
                if Values.ESP_Display == "3D" and allOn then
                    if not espBoxes3D[player] then espBoxes3D[player] = create3DBox() end
                    for idx, edge in ipairs(EDGES) do
                        local line = espBoxes3D[player][idx]
                        line.From = screenPoints[edge[1]]
                        line.To   = screenPoints[edge[2]]
						line.Thickness = Values.ESP_Thickness
                        line.Color= col3D
                        line.Visible = Values.ESP_Boxes
                    end
                elseif Values.ESP_Display == "2D" and anyOn and maxX>minX and maxY>minY then
                    if not espBoxes2D[player] then espBoxes2D[player] = create2DBox() end
                    local box = espBoxes2D[player]
                    box.Position = Vector2.new(minX, minY)
                    box.Size     = Vector2.new(maxX-minX, maxY-minY)
                    box.Color    = col2D
					box.Thickness = Values.ESP_Thickness
                    box.Visible  = Values.ESP_Boxes
                end

                -- Draw Name/Health labels
                if (Values.ESP_Name or Values.ESP_Health) and anyOn then
                    if not espLabels[player] then espLabels[player] = createLabel() end
                    local label = espLabels[player]
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local sp, on = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, head.Size.Y, 0))
                        if on then
                            label.Position = Vector2.new(sp.X, sp.Y - 30 - Values.ESP_TextSize)
                            local parts = {}
                            if Values.ESP_Name then table.insert(parts, player.Name) end
                            if Values.ESP_Health then
                                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                                if hum then table.insert(parts, math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)) end
                            end
                            label.Text  = table.concat(parts, "  \n")
							label.Size = 10 + Values.ESP_TextSize
                            label.Color = Values.ESP_TextColor
                            label.Visible = true
                        else label.Visible = false end
                    end
                end
            else
                -- hide old overlays
                if espBoxes3D[player] then for _, l in ipairs(espBoxes3D[player]) do l.Visible=false end end
                if espBoxes2D[player] then espBoxes2D[player].Visible = false end
                if espLabels[player] then espLabels[player].Visible = false end
                if espTracers[player] then espTracers[player].Visible = false end
            end
        end
    end)

    Players.PlayerRemoving:Connect(function(p)
        if espBoxes3D[p] then for _, l in ipairs(espBoxes3D[p]) do l:Remove() end; espBoxes3D[p]=nil end
        if espBoxes2D[p] then espBoxes2D[p]:Remove(); espBoxes2D[p]=nil end
        if espLabels[p]   then espLabels[p]:Remove();   espLabels[p]=nil end
        if espTracers[p]  then espTracers[p]:Remove();  espTracers[p]=nil end
    end)
end

function Aimbot_function()
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Not Aim team",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Team = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Not Aim friends",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Friends = Value
		end
	})
	Aimbot:Separator()
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Aim at nearest",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Rules.Near = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = true,
		Label = "Alive only",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Alive = Value
		end
	})
	local Range = Aimbot:Indent({Offset = 5}):SliderInt({
		Label = "Range",
		Value = 500,
		Minimum = 10,
		Maximum = 1000,
		Callback = function(self, Value)
			Values.Aimbot_NearRange = Value
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
	Aimbot:Combo({
		Label = "Aim at",
		Selected = "Head",
		Items = {
			"Head",
			"Torso",
			"Any",
		},
		Callback = function(self, Value)
			if Value == 'Head' then
				Values.Aimbot_Rules.Part = 1
			elseif Value == 'Torso' then
				Values.Aimbot_Rules.Part = 2
			else
				Values.Aimbot_Rules.Part = 3
			end
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
	local Players         = game:GetService("Players")
	local RunService      = game:GetService("RunService")
	local LocalPlayer     = Players.LocalPlayer
	local Camera          = workspace.CurrentCamera
	local Part
	


	-- State
	local lastTarget      = nil

	-- Raycast setup
	local rayParams       = RaycastParams.new()
	rayParams.FilterDescendantsInstances = { LocalPlayer.Character }
	rayParams.FilterType              = Enum.RaycastFilterType.Blacklist
	rayParams.IgnoreWater             = true

	-- Utility: can we see the head?
	local function canSee(headPart)
		local origin   = Camera.CFrame.Position
		local direction= (headPart.Position - origin).Unit * (headPart.Position - origin).Magnitude
		local result   = workspace:Raycast(origin, direction, rayParams)
		if not result then
			return true
		end
		return headPart:IsDescendantOf(result.Instance.Parent)
	end

	-- Find best target under FOV, distance & team/friend filters
	local function getClosestTarget()
		local camPos      = Camera.CFrame.Position
		local mousePos2D  = Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)
		local bestPlayer, bestDist = nil, Values.Aimbot_FOV

		-- Try to reuse lastTarget if still valid
		if lastTarget
		and lastTarget.Character
		and lastTarget.Character:FindFirstChild(Part)
		and lastTarget.Character.PrimaryPart
		then
			local head = lastTarget.Character[Part]
			local worldDist = (head.Position - camPos).Magnitude

			if (not Values.Aimbot_Rules.Near or worldDist <= Values.Aimbot_NearRange)
			and (not Values.Aimbot_WallCheck or canSee(head))
			then
				local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
				if onScreen then
					local fovDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos2D).Magnitude
					if fovDist <= bestDist then
						-- still valid lock
						return lastTarget
					end
				end
			end

			lastTarget = nil
		end

		-- Search all players
		for _, player in ipairs(Players:GetPlayers()) do
			if player == LocalPlayer then continue end
			if not player.Character or not player.Character.PrimaryPart then continue end
			if Values.Aimbot_Team and player.Team == LocalPlayer.Team then continue end
			if Values.Aimbot_Friends and LocalPlayer:IsFriendsWith(player.UserId) then continue end

			local head = player.Character:FindFirstChild(Part)
			if not head then continue end

			local worldDist = (head.Position - camPos).Magnitude
			if Values.Aimbot_Rules.Near and worldDist > Values.Aimbot_NearRange then continue end
			if Values.Aimbot_WallCheck and not canSee(head) then continue end

			local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
			if not onScreen then continue end

			local fovDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos2D).Magnitude
			if fovDist < bestDist then
				bestDist   = fovDist
				bestPlayer = player
			end
		end

		return bestPlayer
	end

	-- Main loop
	RunService.RenderStepped:Connect(function()
		if Values.Aimbot_Rules.Part == 1 then
			Part = 'Head'
		elseif Values.Aimbot_Rules.Part == 2 then
			Part = 'HumanoidRootPart'
		else
			Part = 'Head'
		end
		Range:SetDisabled(not Values.Aimbot_Rules.Near)
		if not Values.Aimbot then
			lastTarget = nil
			return
		end

		local target = getClosestTarget()
		if target then
			
			local head = target.Character[Part]
			local Can = true

			local smooth = (target == lastTarget)
				and Values.Aimbot_SwitchSmooth
				or Values.Aimbot_Smooth

			lastTarget = target

			-- Lerp camera
			if Values.Aimbot_Alive then
				Can = (target.Character.Humanoid.Health >= 1)
			end
			if Can then
				local camCF  = Camera.CFrame
				local dir    = (head.Position - camCF.Position).Unit
				local look   = camCF.LookVector:Lerp(dir, Values.Aimbot_Smooth)
				Camera.CFrame = CFrame.new(camCF.Position, camCF.Position + look)
			end
		else
			lastTarget = nil
		end
	end)
end

ESP_function()
Aimbot_function()
