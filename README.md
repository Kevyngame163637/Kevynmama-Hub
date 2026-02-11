--// Kevynmama Hub - UI RGB com ABAS + Creditos como aba separada (VERSÃO CORRIGIDA) ✅

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Espera PlayerGui com retry
local playerGui
for i = 1, 20 do
    playerGui = player:FindFirstChild("PlayerGui")
    if playerGui then break end
    task.wait(0.2)
end

if not playerGui then
    print("[ERRO] PlayerGui NÃO encontrado após espera. Executor ou jogo bloqueando.")
    return
end

print("[OK] PlayerGui encontrado. Criando UI...")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KevynmamaHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 10000  -- Por cima de tudo
screenGui.Parent = playerGui

-- Botão Toggle MOVÍVEL
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
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

-- Janela Principal (já com tamanho real, só invisível)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 400)  -- Tamanho inicial correto
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false  -- Começa escondida
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
titleLabel.Text = "Kevynmama Hub 🔥"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Sidebar (abas à esquerda)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -70)
sidebar.Position = UDim2.new(0, 10, 0, 65)
sidebar.BackgroundTransparency = 1
sidebar.Parent = mainFrame

-- Área de conteúdo
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -70)
contentArea.Position = UDim2.new(0, 170, 0, 65)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Função para criar botão de aba
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
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        tabContent.Visible = true
        
        for _, b in ipairs(sidebar:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    
    return btn
end

-- Cria as abas
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
mainLabel.Text = "Main / Principal\n\nAqui vai o conteúdo principal do hub!\nAdicione seus scripts favoritos 😎"
mainLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
mainLabel.TextScaled = true
mainLabel.TextWrapped = true
mainLabel.Font = Enum.Font.Gotham
mainLabel.Parent = mainTab

table.insert(tabs, {name = "Main", content = mainTab})

-- Aba Home
local homeTab = Instance.new("Frame")
homeTab.Size = UDim2.new(1, 0, 1, 0)
homeTab.BackgroundTransparency = 1
homeTab.Visible = false
homeTab.Parent = contentArea

local homeLabel = Instance.new("TextLabel")
homeLabel.Size = UDim2.new(1, 0, 1, 0)
homeLabel.BackgroundTransparency = 1
homeLabel.Text = "Home\n\nBem-vindo ao Kevynmama Hub!\nAtualizações e novidades aqui 🔥"
homeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
homeLabel.TextScaled = true
homeLabel.TextWrapped = true
homeLabel.Font = Enum.Font.Gotham
homeLabel.Parent = homeTab

table.insert(tabs, {name = "Home", content = homeTab})

-- Aba Scripts Locais
local scriptsTab = Instance.new("Frame")
scriptsTab.Size = UDim2.new(1, 0, 1, 0)
scriptsTab.BackgroundTransparency = 1
scriptsTab.Visible = false
scriptsTab.Parent = contentArea

local scriptsLabel = Instance.new("TextLabel")
scriptsLabel.Size = UDim2.new(1, 0, 1, 0)
scriptsLabel.BackgroundTransparency = 1
scriptsLabel.Text = "Scripts Locais\n\nColoque aqui seus scripts, toggles, etc!\nEx: Fly, Speed, Noclip, Infinite Jump..."
scriptsLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
scriptsLabel.TextScaled = true
scriptsLabel.TextWrapped = true
scriptsLabel.Font = Enum.Font.Gotham
scriptsLabel.Parent = scriptsTab

table.insert(tabs, {name = "Scripts Locais", content = scriptsTab})

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
creditsText.Text = "Feito por:\n• Kevynmama hub\n\nBorda RGB animada\nBotão arrastável\nJanela arrastável pelo título\nTeclas: INSERT ou E\n\nObrigado por usar!\nAproveite o hub 🔥"
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

-- Abre a primeira aba por padrão
if #tabs > 0 then
    tabs[1].content.Visible = true
end

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

local rainbowConn = RunService.Heartbeat:Connect(function()
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
        TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Size = UDim2.new(0, 55, 0, 50)}):Play()
    else
        toggleBtn.Text = "MENU"
        toggleStroke.Color = Color3.fromRGB(255, 0, 0)
        TweenService:Create(toggleBtn, TweenInfo.new(0.3), {Size = UDim2.new(0, 65, 0, 55)}):Play()
        task.delay(0.3, function()
            mainFrame.Visible = false
        end)
    end
end

-- Clique no botão toggle
local wasToggleDragged = false
toggleBtn.MouseButton1Click:Connect(function()
    if wasToggleDragged then
        wasToggleDragged = false
        return
    end
    toggleGUI()
end)

-- Arrasto (janela + botão)
local frameDragging, frameDragStart, frameStartPos = false, nil, nil
local toggleDragging, toggleDragStart, toggleStartPos = false, nil, nil
local toggleDragDistance = 0

titleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        frameDragging = true
        frameDragStart = input.Position
        frameStartPos = mainFrame.Position
    end
end)

toggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        toggleDragging = true
        toggleDragStart = input.Position
        toggleStartPos = toggleBtn.Position
        toggleDragDistance = 0
    end
end)

UserInputService.InputChanged:Connect(function(input)
    local absSize = screenGui.AbsoluteSize
    
    if frameDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - frameDragStart
        mainFrame.Position = UDim2.new(0.5 + (delta.X / absSize.X), 0, 0.5 + (delta.Y / absSize.Y), 0)
    end
    
    if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - toggleDragStart
        toggleDragDistance = delta.Magnitude
        toggleBtn.Position = UDim2.new(0, toggleStartPos.X.Offset + delta.X, 0, toggleStartPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if frameDragging then frameDragging = false end
        
        if toggleDragging then
            toggleDragging = false
            if toggleDragDistance > 10 then wasToggleDragged = true end
            
            local absSize = screenGui.AbsoluteSize
            local btnSize = toggleBtn.AbsoluteSize
            local newX = math.clamp(toggleBtn.Position.X.Offset, 5, absSize.X - btnSize.X - 5)
            local newY = math.clamp(toggleBtn.Position.Y.Offset, 5, absSize.Y - btnSize.Y - 5)
            toggleBtn.Position = UDim2.new(0, newX, 0, newY)
            toggleDragDistance = 0
        end
    end
end)

-- Teclas de atalho
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.E then
        toggleGUI()
    end
end)

print("✅ Kevynmama Hub carregado! Botão MENU no canto superior esquerdo. Clique ou aperte INSERT/E.")
