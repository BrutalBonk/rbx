local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

local ESP = {}
ESP.__index = ESP

-- Default settings
ESP.Settings = {
    Box = true,
    Name = true,
    Health = true,
    Color = Color3.new(1, 1, 1),
    MaxDistance = 1000,
    UpdateRate = 0.2,
}

-- Pools and state
ESP._drawPool = { Box = {}, Name = {}, HealthBG = {}, HealthFill = {} }
ESP._active = false
ESP._lastUpdate = 0
ESP._states = {}

-- Pre-create/draw objects
local function create(type)
    if type == "Box" then
        local s = Drawing.new("Square")
        s.Thickness = 1; s.Filled = false; return s
    elseif type == "Name" then
        local t = Drawing.new("Text")
        t.Size = 14; t.Center = true; t.Outline = true; return t
    elseif type == "HealthBG" or type == "HealthFill" then
        local l = Drawing.new("Line")
        l.Thickness = 2; return l
    end
end

function ESP:_get(type)
    local pool = self._drawPool[type]
    if #pool > 0 then return table.remove(pool) end
    return create(type)
end

function ESP:_release(obj, type)
    obj.Visible = false
    table.insert(self._drawPool[type], obj)
end

-- Update single player ESP
function ESP:_updateOne(player)
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end

    local dist = (hrp.Position - Camera.CFrame.Position).Magnitude
    if dist > self.Settings.MaxDistance then return end

    local root2d, onScreen = Camera:WorldToViewportPoint(hrp.Position)
    if not onScreen then return end

    local head = char:FindFirstChild("Head")
    local head2d = head and Camera:WorldToViewportPoint(head.Position + Vector3.new(0, head.Size.Y/2, 0))
    head2d = head2d or root2d

    local height = math.abs(root2d.Y - head2d.Y) * 2
    local width = height * 0.65
    local topLeft = Vector2.new(root2d.X - width/2, head2d.Y)

    local state = self._states[player] or {}
    if not self._states[player] then self._states[player] = state end

    -- Box
    if self.Settings.Box then
        local box = state.box or self:_get("Box"); state.box = box
        box.Color = self.Settings.Color
        box.Size = Vector2.new(width, height)
        box.Position = topLeft
        box.Visible = true
    elseif state.box then
        self:_release(state.box, "Box"); state.box = nil
    end

    -- Name
    if self.Settings.Name then
        local name = state.name or self:_get("Name"); state.name = name
        name.Text = player.Name
        name.Position = Vector2.new(root2d.X, head2d.Y - 20)
        name.Color = self.Settings.Color
        name.Visible = true
    elseif state.name then
        self:_release(state.name, "Name"); state.name = nil
    end

    -- Health
    if self.Settings.Health then
        local bg = state.hbg or self:_get("HealthBG"); state.hbg = bg
        local fg = state.hfg or self:_get("HealthFill"); state.hfg = fg

        local ratio = hum.Health / hum.MaxHealth
        local y = topLeft.Y + height + 4
        local start = Vector2.new(topLeft.X, y)
        local finish = Vector2.new(topLeft.X + width, y)

        bg.From = start; bg.To = finish; bg.Color = Color3.new(0,0,0)
        bg.Visible = true

        fg.From = start; fg.To = Vector2.new(topLeft.X + width * ratio, y)
        fg.Color = Color3.new(1 - ratio, ratio, 0)
        fg.Visible = true

    elseif state.hbg or state.hfg then
        if state.hbg then self:_release(state.hbg, "HealthBG"); state.hbg = nil end
        if state.hfg then self:_release(state.hfg, "HealthFill"); state.hfg = nil end
    end
end

-- Main heartbeat
function ESP:_onHeartbeat(dt)
    if not self._active then return end
    self._lastUpdate = self._lastUpdate + dt
    if self._lastUpdate < self.Settings.UpdateRate then return end
    self._lastUpdate = 0

    for player, state in pairs(self._states) do
        if not Players:FindFirstChild(player.Name) then
            -- clean up
            if state.box then self:_release(state.box, "Box") end
            if state.name then self:_release(state.name, "Name") end
            if state.hbg then self:_release(state.hbg, "HealthBG") end
            if state.hfg then self:_release(state.hfg, "HealthFill") end
            self._states[player] = nil
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            self:_updateOne(player)
        end
    end
end

-- Public API
function ESP:Start(settings)
    for k, v in pairs(settings or {}) do self.Settings[k] = v end
    if not self._active then
        self._active = true
        RunService.Heartbeat:Connect(function(dt) self:_onHeartbeat(dt) end)
    end
end

function ESP:Stop()
    self._active = false
    -- release all
    for _, state in pairs(self._states) do
        if state.box then self:_release(state.box, "Box") end
        if state.name then self:_release(state.name, "Name") end
        if state.hbg then self:_release(state.hbg, "HealthBG") end
        if state.hfg then self:_release(state.hfg, "HealthFill") end
    end
    self._states = {}
end

return ESP
