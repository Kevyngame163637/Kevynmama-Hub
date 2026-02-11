--// Kevynmama Hub v1.2 - Com Features (Speed, Noclip, Fly, ESP)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
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
toggleBtn.Text = "MENU"
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

-- Janela Principal (centralizada)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
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
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Transparency = 0
uiStroke.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Rotation = 0
gradient.Parent = uiStroke

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 55)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Kevynmama Hub v1.2 🔥"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -70)
sidebar.Position = UDim2.new(0, 10, 0, 65)
sidebar.BackgroundTransparency = 1
sidebar.Parent = mainFrame

-- Conteúdo
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -70)
contentArea.Position = UDim2.new(0, 170, 0, 65)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Função aba
local function createTabButton(name, yPos, tabContent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = sidebar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        for _, child in ipairs(contentArea:GetChildren()) do
            if child:IsA("Frame") then child.Visible = false end
        end
        tabContent.Visible = true
        
        for _, b in ipairs(sidebar:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(40, 40, 40) end
        end
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    
    return btn
end

-- Abas
local tabs = {}

-- Aba Main
local mainTab = Instance.new("Frame")
mainTab.Size = UDim2.new(1, 0, 1, 0)
mainTab.BackgroundTransparency = 1
mainTab.Visible = false
mainTab.Parent = contentArea

local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(1, 0, 1, 0)
mainLabel.BackgroundTransparency = 1
mainLabel.Text = "Main\n\nUI carregou! Features na aba 'Bot'."
mainLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
mainLabel.TextScaled = true
mainLabel.TextWrapped = true
mainLabel.Font = Enum.Font.Gotham
mainLabel.Parent = mainTab

table.insert(tabs, {name = "Main", content = mainTab})

-- Aba Bot (com features)
local botTab = Instance.new("Frame")
botTab.Size = UDim2.new(1, 0, 1, 0)
botTab.BackgroundTransparency = 1
botTab.Visible = false
botTab.Parent = contentArea

-- Speed
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 10, 0, 10)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 16"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextScaled = true
speedLabel.Parent = botTab

local speedSlider = Instance.new("TextButton")
speedSlider.Size = UDim2.new(0.9, 0, 0, 30)
speedSlider.Position = UDim2.new(0.05, 0, 0, 50)
speedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedSlider.Text = ""
speedSlider.Parent = botTab

local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 8)
sliderCorner.Parent = speedSlider

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new(0.3, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = speedSlider

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 8)
fillCorner.Parent = sliderFill

local speed = 16
speedSlider.MouseButton1Down:Connect(function()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        local mousePos = UserInputService:GetMouseLocation()
        local rel = math.clamp((mousePos.X - speedSlider.AbsolutePosition.X) / speedSlider.AbsoluteSize.X, 0, 1)
        sliderFill.Size = UDim2.new(rel, 0, 1, 0)
        speed = 16 + math.floor(rel * 184)
        speedLabel.Text = "Speed: " .. speed
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speed
        end
    end)
    speedSlider.MouseButton1Up:Connect(function() conn:Disconnect() end)
    speedSlider.MouseLeave:Connect(function() conn:Disconnect() end)
end)

-- Noclip
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.9, 0, 0, 40)
noclipBtn.Position = UDim2.new(0.05, 0, 0, 100)
noclipBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
noclipBtn.Text = "Noclip: OFF"
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextScaled = true
noclipBtn.Parent = botTab

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
flyBtn.Size = UDim2.new(0.9, 0, 0, 40)
flyBtn.Position = UDim2.new(0.05, 0, 0, 160)
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
flyBtn.Text = "Fly: OFF"
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextScaled = true
flyBtn.Parent = botTab

local flyOn = false
local bv, bg
flyBtn.MouseButton1Click:Connect(function()
    flyOn = not flyOn
    flyBtn.Text = "Fly: " .. (flyOn and "ON" or "OFF")
    flyBtn.BackgroundColor3 = flyOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    if flyOn then
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(4000, 4000, 4000)
            bv.Parent = player.Character.HumanoidRootPart
            bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(4000, 4000, 4000)
            bg.CFrame = player.Character.HumanoidRootPart.CFrame
            bg.Parent = player.Character.HumanoidRootPart
        end
    else
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end)

-- ESP
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0.9, 0, 0, 40)
espBtn.Position = UDim2.new(0.05, 0, 0, 220)
espBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
espBtn.Text = "ESP: OFF"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.GothamBold
espBtn.TextScaled = true
espBtn.Parent = botTab

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
            if p \~= player and p.Character then addHighlight(p.Character) end
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

for _, p in ipairs(Players:GetPlayers()) do
    if p.Character and espOn then addHighlight(p.Character) end
    p.CharacterAdded:Connect(function(char)
        if espOn then addHighlight(char) end
    end)
end

table.insert(tabs, {name = "Bot", content = botTab})

-- Aba Créditos
local creditsTab = Instance.new("Frame")
creditsTab.Size = UDim2.new(1, 0, 1, 0)
creditsTab.BackgroundTransparency = 1
creditsTab.Visible = false
creditsTab.Parent = contentArea

local creditsTitle = Instance.new("TextLabel")
creditsTitle.Size = UDim2.new(1, 0, 0, 50)
creditsTitle.BackgroundTransparency = 1
creditsTitle.Text = "Créditos"
creditsTitle.TextColor3 = Color3.fromRGB(0, 255, 150)
creditsTitle.TextScaled = true
creditsTitle.Font = Enum.Font.GothamBlack
creditsTitle.Parent = creditsTab

local creditsText = Instance.new("TextLabel")
creditsText.Size = UDim2.new(1, 0, 1, -60)
creditsText.Position = UDim2.new(0, 0, 0, 60)
creditsText.BackgroundTransparency = 1
creditsText.Text = "Feito por:\n• Kevynmama hub\n\nObrigado por usar!"
creditsText.TextColor3 = Color3.fromRGB(180, 180, 255)
creditsText.TextScaled = true
creditsText.TextWrapped = true
creditsText.Font = Enum.Font.Gotham
creditsText.TextXAlignment = Enum.TextXAlignment.Left
creditsText.Parent = creditsTab

table.insert(tabs, {name = "Créditos", content = creditsTab})

-- Cria botões das abas
local yOffset = 0
for i, tab in ipairs(tabs) do
    createTabButton(tab.name, yOffset, tab.content)
    yOffset = yOffset + 50
end

-- Abre Main por padrão
if #tabs > 0 then tabs[1].content.Visible = true end

-- Rainbow animation
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

-- Toggle GUI
local opened = false
local function toggleGUI()
    opened = not opened
    if opened then
        mainFrame.Visible = true
        toggleBtn.Text = "X"
        toggleStroke.Color = Color3.fromRGB(0, 255, 0)
    else
        toggleBtn.Text = "MENU"
        toggleStroke.Color = Color3.fromRGB(255, 0, 0)
        mainFrame.Visible = false
    end
end

toggleBtn.MouseButton1Click:Connect(toggleGUI)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.E then
        toggleGUI()
    end
end)

print("[OK] UI completa carregada! Teste as features na aba Bot.")
