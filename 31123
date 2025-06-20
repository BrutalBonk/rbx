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
local ConfigTab, configDropdown, nameBox, row
local ESP = Window:CreateTab({
	Name = 'ESP'
})

local Aimbot = Window:CreateTab({
	Name = 'Aimbot'
})
local AA = Window:CreateTab({
	Name = 'AntiAim'
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
	Aimbot_Predict = false,
	Aimbot_PredictPower = 1,
	Aimbot_Alive = true,
    Aimbot_Smooth = 0.8,      -- 0 (instant) to 1 (very slow)
    Aimbot_FOV = 100,         -- Field of view radius in pixels
	Aimbot_SwitchSmooth = 0.05, -- smoothing when switching targets
	Aimbot_NearRange = 500,
	Aimbot_KeyId = Enum.KeyCode.Q,
	Aimbot_Rules = {
		Near = true, -- By distance
		Part = 'Head'
	},
	AA = false,
	AA_Hidden = false,
}

local a = {
	C1, C2, C3, C4, S1, S2, N, H, T, A, L, T, R, D, B, E
}

local IDs = {

}

function Popup(Name, Label, Id)
	if IDs[Id] then
		return
	end
	local ModalWindow = Window:PopupModal({
		Title = Name
	})

	ModalWindow:Label({
		Text = Label,
		TextWrapped = true
	})
	ModalWindow:Separator()
	ModalWindow:Checkbox({
		Value = false,
		Label = "Don't remember",
		Callback = function(self, Value)
			IDs[Id] = Value
		end
	})

	local Row = ModalWindow:Row({
		Expanded = true
	})
	Row:Button({
		Text = "Okay",
		Callback = function()
			ModalWindow:ClosePopup()
		end,
	})
end
function ESP_function(ESP)
    a.C1 = ESP:Indent({Offset=5}):DragColor3({
        Value = Values.ESP_Color,
        Label = "ESP Color",
        Callback = function(Color, Value)
            Values.ESP_Color = Value
        end
    })
    a.C2 = ESP:Indent({Offset=5}):DragColor3({
        Value = Values.ESP_FColor,
        Label = "Friends Color",
        Callback = function(Color, Value)
            Values.ESP_FColor = Value
        end
    })
    a.C3 = ESP:Indent({Offset=5}):DragColor3({
        Value = Values.ESP_TColor,
        Label = "Team Color",
        Callback = function(Color, Value)
            Values.ESP_TColor = Value
        end
    })
	a.C4 = ESP:Indent({Offset=5}):DragColor3({
        Value = Values.ESP_TextColor,
        Label = "Text Color",
        Callback = function(Color, Value)
            Values.ESP_TextColor = Value
        end
    })

	a.S1 = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Text size",
        Value = Values.ESP_TextSize,
        Minimum = 0,
        Maximum = 30,
        Callback = function(self, Value)
            Values.ESP_TextSize = Value
        end
    })
	a.S2 = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Thickness",
        Value = Values.ESP_Thickness,
        Minimum = 1,
        Maximum = 5,
        Callback = function(self, Value)
            Values.ESP_Thickness = Value
        end
    })

	ESP:Separator()

    a.N = ESP:Indent({Offset=5}):Checkbox({
        Value = Values.ESP_Name,
        Label = "Name",
        Callback = function(self, Value: boolean)
            Values.ESP_Name = Value
        end
    })
    a.H = ESP:Indent({Offset=5}):Checkbox({
        Value = Values.ESP_Health,
        Label = "Health",
        Callback = function(self, Value: boolean)
            Values.ESP_Health = Value
        end
    })
    a.T = ESP:Indent({Offset=5}):Checkbox({
        Value = Values.ESP_Team,
        Label = "Show team",
        Callback = function(self, Value: boolean)
            Values.ESP_Team = Value
        end
    })
	a.A = ESP:Indent({Offset = 5}):Checkbox({
		Value = Values.ESP_Alive,
		Label = "Alive only",
		Callback = function(self, Value: boolean)
			Values.ESP_Alive = Value
		end
	})
    a.L = ESP:Indent({Offset = 5}):Checkbox({
        Value = Values.ESP_RangeEnabled,
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
        Value = Values.ESP_Tracers,
        Label = "Tracers",
        Callback = function(self, Value: boolean)
            Values.ESP_Tracers = Value
        end
    })
    local Range = ESP:Indent({Offset = 5}):SliderInt({
        Label = "Range",
        Value = Values.ESP_Range,
        Minimum = 10,
        Maximum = 5000,
        Callback = function(self, Value)
            Values.ESP_Range = Value
        end
    })
	a.R = Range
    a.D = ESP:Combo({
        Label = "Display",
        Selected = Values.ESP_Display,
        Items = { "3D", "2D", },
        Callback = function(Combo, Value)
            Values.ESP_Display = Value
        end
    })

	a.B = ESP:Checkbox({
        Value = Values.ESP_Boxes,
        Label = "Box",
        Callback = function(self, Value: boolean)
            Values.ESP_Boxes = Value
        end
    })

    a.E = ESP:Checkbox({
        Value = Values.ESP,
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

function Aimbot_function(Aimbot)
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = Values.Aimbot_Team,
		Label = "Aim team",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Team = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = Values.Aimbot_Friends,
		Label = "Aim friends",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Friends = Value
		end
	})
	Aimbot:Separator()
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = Values.Aimbot_Rules.Near,
		Label = "Aim at nearest",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Rules.Near = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = Values.Aimbot_Alive,
		Label = "Alive only",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Alive = Value
		end
	})
	Aimbot:Indent({Offset = 5}):Checkbox({
		Value = Values.Aimbot_Predict,
		Label = "Auto-predict",
		Callback = function(self, Value: boolean)
			Values.Aimbot_Predict = Value
		end
	})
	Aimbot:Indent({Offset = 5}):SliderInt({
		Label = "Predict Power", 
		Minimum = 1, 
		Maximum = 5,
		Value = Values.Aimbot_PredictPower,
		Callback = function(self, Value)
			Values.Aimbot_PredictPower = Value
		end
	})
	local Range = Aimbot:Indent({Offset = 5}):SliderInt({
		Label = "Range",
		Value = Values.Aimbot_NearRange,
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
		Value = Values.Aimbot_Smooth,
		Format = "%.2f",
		Callback = function(self, Value)
			Values.Aimbot_Smooth = Value
		end
	})
	Aimbot:Indent({Offset = 5}):SliderInt({
		Label = "FOV", 
		Minimum = 0, 
		Maximum = 200,
		Value = Values.Aimbot_FOV,
		Callback = function(self, Value)
			Values.Aimbot_FOV = Value
		end
	})
	Aimbot:Combo({
		Label = "Aim at",
		Selected = if Values.Aimbot_Rules.Part == 1 then
				'Head'
			elseif Values.Aimbot_Rules.Part == 2 then
				'Torso'
			else
				'Any',
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
		Value = Values.Aimbot,
		Label = "Enabled",
		Callback = function(self, Value: boolean)
			Values.Aimbot = Value
		end
	})
	Row:Keybind({
		Label = "Bind",
		Value = Values.Aimbot_KeyId,
		Callback = function(self, KeyId)
			Values.Aimbot_KeyId = KeyId
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
		if target and target.Character then
			local character = target.Character
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local targetPart = character:FindFirstChild(Part)

			--local success, message = pcall(function()
				if humanoid and targetPart then
				-- If alive mode is enabled, check health
				if Values.Aimbot_Alive and humanoid.Health <= 0 then
					return
				end

				local smooth = Values.Aimbot_Smooth
				if target == lastTarget then
					smooth = Values.Aimbot_Smooth
				end
				lastTarget = target

				local camCF = Camera.CFrame

				-- Target movement prediction using MoveDirection
				local moveDirection = humanoid.MoveDirection
				local walkSpeed = humanoid.WalkSpeed or 16
				local predictionTime = 0.1 -- you can expose this to settings
				local predictedOffset = (moveDirection * walkSpeed * predictionTime * (1 - smooth)) * Values.Aimbot_PredictPower
				local predictedPosition = targetPart.Position + predictedOffset

				-- Lerp camera toward predicted target
				local direction = (predictedPosition - camCF.Position).Unit
				local newLook = camCF.LookVector:Lerp(direction, smooth)
				Camera.CFrame = CFrame.new(camCF.Position, camCF.Position + newLook)
			end
			--end)
		else
			lastTarget = nil
		end
	end)



end

function AA_function(AA)
	AA:Indent({Offset = 5}):Checkbox({
		Value = false,
		Label = "Hide Real rotation",
		Callback = function(self, Value: boolean)
			Values.AA_Hidden = Value
			if Value then
				Popup('Warning', "That's function hides your real rotation when you first person. Script rotates you at last direction", 1)
			end
		end
	})
	AA:Checkbox({
		Value = false,
		Label = "Enabled",
		Callback = function(self, Value: boolean)
			Values.AA = Value
		end
	})
	local RunService = game:GetService("RunService")

	task.spawn(function()
		local lastLook = Vector3.new(0, 0, 1)
		RunService.Heartbeat:Connect(function()
			local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			local hrp = char:WaitForChild("HumanoidRootPart")
			local humanoid = char:WaitForChild("Humanoid")
			
			if Values.AA and humanoid.Sit == false then
				if Values.AA_Hidden then
					local md = humanoid.MoveDirection

					if md.Magnitude > 0 then
						lastLook = Vector3.new(md.X, 0, md.Z).Unit
					end

					local pos = hrp.Position
					hrp.CFrame = CFrame.lookAt(pos, pos + lastLook)
				end
			end
		end)
	end)
end


local HttpService = game:GetService("HttpService")

local function getConfigList()
    local files = listfiles("UA_Configs")
    local list = {}
    for _, path in ipairs(files) do
        local name = path:match("UA_Configs/(.+)%.lua$")
        if name then table.insert(list, name) end
    end
    return list
end

-- Save current Values to file
local function serializeValue(v, indent)
    indent = indent or 0
    local t = type(v)
    -- strings, numbers, booleans as before
    if t == "string" then
        return ("%q"):format(v)
    elseif t == "number" or t == "boolean" then
        return tostring(v)
    -- Color3
    elseif typeof(v) == "Color3" then
        local r, g, b = v.R * 255, v.G * 255, v.B * 255
        return ("Color3.fromRGB(%d, %d, %d)"):format(r, g, b)
    -- EnumItem support!
    elseif typeof(v) == "EnumItem" then
        -- this yields e.g. "Enum.KeyCode.Q"
        return tostring(v)
    -- tables (recursively)
    elseif t == "table" then
        local parts = {"{\n"}
        for key, val in pairs(v) do
            local keyRep = type(key) == "string"
                            and ("[%q]"):format(key)
                            or ("[" .. key .. "]")
            local valRep = serializeValue(val, indent + 1)
            parts[#parts+1] = string.rep("    ", indent+1)
                             .. keyRep .. " = " .. valRep .. ",\n"
        end
        parts[#parts+1] = string.rep("    ", indent) .. "}"
        return table.concat(parts)
    else
        error("Cannot serialize type: " .. t)
    end
end


local function saveConfig(name)
    -- Build a Lua chunk that returns your Values table
    local body = "return " .. serializeValue(Values, 0)
    writefile("UA_Configs/" .. name .. ".lua", body)
    return true
end

local function setupConfigTab()
    configDropdown = ConfigTab:Combo({
        Label    = "Select config",
        Selected = "None",
        Items    = getConfigList(),
        Callback = function(_, value)
            currentSelection = value
        end,
    })

    nameBox = ConfigTab:InputText({
        Label       = "Config name",
        Placeholder = "Enter name",
    })

    local row = ConfigTab:Row({ Spacing = 10 })
    row:Button({
        Text = "Save",
        Callback = function()
            local name = nameBox.Value
            if name and name ~= "" then
                saveConfig(name)
                configDropdown.Items = getConfigList()
                nameBox:SetValue("")
            end
        end,
    })
    row:Button({
        Text = "Load",
        Callback = function()
            if currentSelection then
                loadConfig(currentSelection)
            end
        end,
    })
    row:Button({
        Text = "Delete",
        Callback = function()
            if currentSelection then
                delfile("UA_Configs/" .. currentSelection .. ".lua")
                configDropdown.Items = getConfigList()
                currentSelection = nil
            end
        end,
    })
end

-- 2) Builds—or rebuilds—the whole GUI
function buildWindow()
    -- if there's an old window, close it
    if Window and Window.Close then
        Window:Close()
    end

    Window = ReGui:TabsWindow({
        Title    = "Universal aimbot",
        Size     = UDim2.new(0, 350, 0, 350),
        Position = UDim2.new(0.5, 0, 0, 70),
    })

    local ESPTab    = Window:CreateTab({ Name = 'ESP' })
    local AimbotTab = Window:CreateTab({ Name = 'Aimbot' })
    local AATab     = Window:CreateTab({ Name = 'AntiAim' })
    ConfigTab       = Window:CreateTab({ Name = 'Config' })

    ESP_function(ESPTab)
    Aimbot_function(AimbotTab)
    AA_function(AATab)
    setupConfigTab()
end

-- 3) loadConfig simply updates Values and then rebuilds
function loadConfig(name)
    local path = "UA_Configs/" .. name .. ".lua"
    if not isfile(path) then return false end

    local chunk = readfile(path)
    local ok, loaded = pcall(loadstring(chunk))
    if not ok or type(loaded) ~= "table" then
        warn("Failed to load config:", loaded)
        return false
    end

    -- merge loaded into Values
    for k, v in pairs(loaded) do
        if Values[k] ~= nil then
            Values[k] = v
        end
    end

    -- rebuild GUI so all sliders/checkboxes pick up the new Values
    buildWindow()
    return true
end

-- 4) kick things off
buildWindow()
