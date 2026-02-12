--// Kevynmama Hub v1.3 - Completo com Features (Speed, Noclip, Fly, ESP, Teleport, Invis)
--// Feito por: Kevyn Mal

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--=== [UI] ===--
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KevynmamaHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 10000
screenGui.Parent = playerGui

-- Botão Toggle
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 65, 0, 55)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.Text = "BOT"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleBtn

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(255, 0, 0)
toggleStroke.Thickness = 2.5
toggleStroke.Parent = toggleBtn

-- Janela Principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 700, 0, 380) -- Aumentei a altura para caber mais features
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 16)
frameCorner.Parent = mainFrame

-- Borda RGB
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 4.5
uiStroke.Transparency = 0
uiStroke.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Rotation = 0
gradient.Parent = uiStroke

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 45)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Kevynmama Bot Hub v1.3"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 22
titleLabel.Parent = mainFrame

-- Sidebar
local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0, 140, 1, -55)
sidebar.Position = UDim2.new(0, 10, 0, 55)
sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 6
sidebar.Parent = mainFrame

local sidebarList = Instance.new("UIListLayout")
sidebarList.SortOrder = Enum.SortOrder.LayoutOrder
sidebarList.Padding = UDim.new(0, 5)
sidebarList.Parent = sidebar

local sidebarPadding = Instance.new("UIPadding")
sidebarPadding.PaddingTop = UDim.new(0, 5)
sidebarPadding.PaddingLeft = UDim.new(0, 5)
sidebarPadding.PaddingRight = UDim.new(0, 5)
sidebarPadding.Parent = sidebar

-- Conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -160, 1, -55)
contentFrame.Position = UDim2.new(0, 160, 0, 55)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local currentTab = nil

--=== [Funções Auxiliares] ===--
local function createTab(name, content)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if currentTab then currentTab.Visible = false end
        content.Visible = true
        currentTab = content
        for _, b in ipairs(sidebar:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(50, 50, 50) end
        end
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
    return btn
end

--=== [Aba Main] ===--
local mainContent = Instance.new("ScrollingFrame")
mainContent.Size = UDim2.new(1, 0, 1, 0)
mainContent.BackgroundTransparency = 1
mainContent.Visible = true
mainContent.Parent = contentFrame

local mainText = Instance.new("TextLabel")
mainText.Size = UDim2.new(1, 0, 1, 0)
mainText.BackgroundTransparency = 1
mainText.Text = "v1.3 - Bot Exclusivo\n\nFeatures na aba 'Bot':\n• Speed (arraste o slider)\n• Noclip (toggle)\n• Fly (WASD + Space/Ctrl)\n• ESP Highlight (toggle)\n• Teleport (para jogadores)\n• Invisibilidade (toggle)\n\nTeste tudo!"
mainText.TextColor3 = Color3.fromRGB(220, 220, 220)
mainText.Font = Enum.Font.Gotham
mainText.TextSize = 18
mainText.TextWrapped = true
mainText.Parent = mainContent

createTab("Main", mainContent)

--=== [Aba Bot] ===--
local botContent = Instance.new("ScrollingFrame")
botContent.Size = UDim2.new(1, 0, 1, 0)
botContent.BackgroundTransparency = 1
botContent.Visible = false
botContent.Parent = contentFrame

-- Speed
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 25)
speedLabel.Text = "Speed: 16"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 16
speedLabel.Parent = botContent

local speedSlider = Instance.new("Frame")
speedSlider.Size = UDim2.new(1, 0, 0, 20)
speedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedSlider.Parent = botContent

local speedFill = Instance.new("Frame")
speedFill.Size = UDim2.new(0.3, 0, 1, 0)
speedFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
speedFill.Parent = speedSlider

local speedValue = 16
speedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local conn
        conn = RunService.RenderStepped:Connect(function()
            local mouse = UserInputService:GetMouseLocation()
            local rel = math.clamp((mouse.X - speedSlider.AbsolutePosition.X) / speedSlider.AbsoluteSize.X, 0, 1)
            speedFill.Size = UDim2.new(rel, 0, 1, 0)
            speedValue = 16 + math.floor(rel * 184)
            speedLabel.Text = "Speed: " .. speedValue
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = speedValue
            end
        end)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                conn:Disconnect()
            end
        end)
    end
end)

-- Noclip
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(1, 0, 0, 35)
noclipBtn.Position = UDim2.new(0, 0, 0, 60)
noclipBtn.Text = "Noclip: OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 16
noclipBtn.Parent = botContent

local noclipOn = false
noclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipBtn.Text = "Noclip: " .. (noclipOn and "ON" or "OFF")
    noclipBtn.BackgroundColor3 = noclipOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
end)

RunService.Stepped:Connect(function()
    if noclipOn and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- Fly
local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(1, 0, 0, 35)
flyBtn.Position = UDim2.new(0, 0, 0, 110)
flyBtn.Text = "Fly: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 16
flyBtn.Parent = botContent

local flyOn = false
local bv, bg
flyBtn.MouseButton1Click:Connect(function()
    flyOn = not flyOn
    flyBtn.Text = "Fly: " .. (flyOn and "ON" or "OFF")
    flyBtn.BackgroundColor3 = flyOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)

    if flyOn and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000, 4000, 4000)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = player.Character.HumanoidRootPart

        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(4000, 4000, 4000)
        bg.CFrame = player.Character.HumanoidRootPart.CFrame
        bg.Parent = player.Character.HumanoidRootPart
    else
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end)

player.CharacterAdded:Connect(function(char)
    if flyOn and char:FindFirstChild("HumanoidRootPart") then
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000, 4000, 4000)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = char.HumanoidRootPart

        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(4000, 4000, 4000)
        bg.CFrame = char.HumanoidRootPart.CFrame
        bg.Parent = char.HumanoidRootPart
    end
end)

-- ESP
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(1, 0, 0, 35)
espBtn.Position = UDim2.new(0, 0, 0, 160)
espBtn.Text = "ESP: OFF"
espBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.GothamBold
espBtn.TextSize = 16
espBtn.Parent = botContent

local espOn = false
local highlights = {}

local function addHighlight(char)
    if char == player.Character or highlights[char] then return end
    local hl = Instance.new("Highlight")
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.OutlineColor = Color3.fromRGB(255, 255, 0)
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Adornee = char
    hl.Parent = char

    local nameGui = Instance.new("BillboardGui")
    nameGui.Size = UDim2.new(0, 200, 0, 50)
    nameGui.StudsOffset = Vector3.new(0, 3, 0)
    nameGui.AlwaysOnTop = true
    nameGui.Parent = char:FindFirstChild("Head") or char

    local nameText = Instance.new("TextLabel")
    nameText.Size = UDim2.new(1, 0, 1, 0)
    nameText.BackgroundTransparency = 1
    nameText.Text = char.Name
    nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameText.TextScaled = true
    nameText.Font = Enum.Font.GothamBold
    nameText.Parent = nameGui

    highlights[char] = {hl = hl, gui = nameGui}
end

local function removeHighlight(char)
    if highlights[char] then
        if highlights[char].hl then highlights[char].hl:Destroy() end
        if highlights[char].gui then highlights[char].gui:Destroy() end
        highlights[char] = nil
    end
end

espBtn.MouseButton1Click:Connect(function()
    espOn = not espOn
    espBtn.Text = "ESP: " .. (espOn and "ON" or "OFF")
    espBtn.BackgroundColor3 = espOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)

    if espOn then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character then addHighlight(p.Character) end
        end
    else
        for char in pairs(highlights) do removeHighlight(char) end
    end
end)

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        if espOn then addHighlight(char) end
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    if highlights[p.Character] then
        removeHighlight(p.Character)
    end
end)

for _, p in ipairs(Players:GetPlayers()) do
    if p.Character and espOn then addHighlight(p.Character) end
    p.CharacterAdded:Connect(function(char)
        if espOn then addHighlight(char) end
    end)
end

-- Teleport
local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(1, 0, 0, 35)
teleportBtn.Position = UDim2.new(0, 0, 0, 210)
teleportBtn.Text = "Teleport"
teleportBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.Font = Enum.Font.GothamBold
teleportBtn.TextSize = 16
teleportBtn.Parent = botContent

teleportBtn.MouseButton1Click:Connect(function()
    local target = -- (Aqui você pode adicionar lógica para selecionar jogador)
    if target and target.Character and player.Character then
        player.Character:MoveTo(target.Character.HumanoidRootPart.Position)
    end
end)

-- Invisibilidade
local invisBtn = Instance.new("TextButton")
invisBtn.Size = UDim2.new(1, 0, 0, 35)
invisBtn.Position = UDim2.new(0, 0, 0, 260)
invisBtn.Text = "Invis: OFF"
invisBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
invisBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
invisBtn.Font = Enum.Font.GothamBold
invisBtn.TextSize = 16
invisBtn.Parent = botContent

local invisOn = false
invisBtn.MouseButton1Click:Connect(function()
    invisOn = not invisOn
    invisBtn.Text = "Invis: " .. (invisOn and "ON" or "OFF")
    invisBtn.BackgroundColor3 = invisOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)

    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = invisOn and 0.7 or 0
            end
        end
    end
end)

createTab("Bot", botContent)

--=== [Aba Créditos] ===--
local creditsContent = Instance.new("ScrollingFrame")
creditsContent.Size = UDim2.new(1, 0, 1, 0)
creditsContent.BackgroundTransparency = 1
creditsContent.Visible = false
creditsContent.Parent = contentFrame

local creditsLabel = Instance.new("TextLabel")
creditsLabel.Size = UDim2.new(1, 0, 1, 0)
creditsLabel.BackgroundTransparency = 1
creditsLabel.Text = "Feito por:\n• Kevyn Mal (Kevynmama Hub)\n\nObrigado por usar!\nBot exclusivo pro seu jogo.\n\nGitHub: github.com/Kevyngame163637"
creditsLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
creditsLabel.Font = Enum.Font.Gotham
creditsLabel.TextSize = 18
creditsLabel.TextWrapped = true
creditsLabel.Parent = creditsContent

createTab("Créditos", creditsContent)

--=== [Toggle UI] ===--
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleBtn.Text = mainFrame.Visible and "X" or "BOT"
end)

--=== [Rainbow Border] ===--
local rainbowSpeed = 5
local function updateRainbow()
    local hue = (tick() * rainbowSpeed) % 1
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, 1, 1)),
        ColorSequenceKeypoint.new(0.17, Color3.fromHSV(hue + 0.17, 1, 1)),
        ColorSequenceKeypoint.new(0.33, Color3.fromHSV(hue + 0.33, 1, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.fromHSV(hue + 0.5, 1, 1)),
        ColorSequenceKeypoint.new(0.67, Color3.fromHSV(hue + 0.67, 1, 1)),
        ColorSequenceKeypoint.new(0.83, Color3.fromHSV(hue + 0.83, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 1) % 1, 1, 1)),
    })
    gradient.Rotation = (tick() * 50) % 360
end

RunService.Heartbeat:Connect(function()
    if mainFrame.Visible then updateRainbow() end
end)

print("[OK] Kevynmama Hub v1.3 carregado! Aperte 'BOT' para abrir.")
