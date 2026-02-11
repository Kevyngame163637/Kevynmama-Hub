--// Kevynmama Hub v1.2 - Base que funciona (sem features pesadas ainda)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

print("[OK] Iniciando base que funciona...")

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

-- Janela Principal
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

-- Abas (simples por enquanto)
local tabs = {}

local mainTab = Instance.new("Frame")
mainTab.Size = UDim2.new(1, 0, 1, 0)
mainTab.BackgroundTransparency = 1
mainTab.Visible = false
mainTab.Parent = contentArea

local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(1, 0, 1, 0)
mainLabel.BackgroundTransparency = 1
mainLabel.Text = "Main\n\nUI carregou! Agora vamos adicionar as features."
mainLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
mainLabel.TextScaled = true
mainLabel.TextWrapped = true
mainLabel.Font = Enum.Font.Gotham
mainLabel.Parent = mainTab

table.insert(tabs, {name = "Main", content = mainTab})

local botTab = Instance.new("Frame")
botTab.Size = UDim2.new(1, 0, 1, 0)
botTab.BackgroundTransparency = 1
botTab.Visible = false
botTab.Parent = contentArea

local botLabel = Instance.new("TextLabel")
botLabel.Size = UDim2.new(1, 0, 1, 0)
botLabel.BackgroundTransparency = 1
botLabel.Text = "Bot\n\nFeatures em breve..."
botLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
botLabel.TextScaled = true
botLabel.TextWrapped = true
botLabel.Font = Enum.Font.Gotham
botLabel.Parent = botTab

table.insert(tabs, {name = "Bot", content = botTab})

local creditsTab = Instance.new("Frame")
creditsTab.Size = UDim2.new(1, 0, 1, 0)
creditsTab.BackgroundTransparency = 1
creditsTab.Visible = false
creditsTab.Parent = contentArea

local creditsLabel = Instance.new("TextLabel")
creditsLabel.Size = UDim2.new(1, 0, 1, 0)
creditsLabel.BackgroundTransparency = 1
creditsLabel.Text = "Créditos\nFeito por:\n• Kevynmama hub"
creditsLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
creditsLabel.TextScaled = true
creditsLabel.TextWrapped = true
creditsLabel.Font = Enum.Font.Gotham
creditsLabel.Parent = creditsTab

table.insert(tabs, {name = "Créditos", content = creditsTab})

-- Cria botões
local yOffset = 0
for i, tab in ipairs(tabs) do
    createTabButton(tab.name, yOffset, tab.content)
    yOffset = yOffset + 50
end

-- Abre Main
if #tabs > 0 then tabs[1].content.Visible = true end

-- Rainbow
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

print("[OK] Base carregada! Botão MENU no canto superior esquerdo. Clique ou Insert/E para abrir.")
