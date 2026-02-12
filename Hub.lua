--// Kevynmama Hub v3.0 - Ultimate Edition
--// Feito por: Kevyn Mal (Kevyngame163637) & Kaiozinhu12

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--=== [Configurações] ===--
local HUB_NAME = "Kevynmama Hub"
local HUB_VERSION = "v3.0"
local HUB_CREDITS = "Feito por: Kevyn Mal (Kevyngame163637) & Kaiozinhu12"
local HUB_GITHUB = "github.com/Kevyngame163637/Kevynmama-Hub"

--=== [UI Principal] ===--
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KevynmamaHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 10000
screenGui.Parent = playerGui

--=== [Botão Animado] ===--
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 65, 0, 55)
toggleBtn.Position = UDim2.new(0, 20, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.Text = "HUB"
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

-- Efeito de pulsar
coroutine.wrap(function()
    while true do
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true)
        local tween = TweenService:Create(toggleBtn, tweenInfo, {Size = UDim2.new(0, 70, 0, 60)})
        tween:Play()
        wait(1)
        tween = TweenService:Create(toggleBtn, tweenInfo, {Size = UDim2.new(0, 65, 0, 55)})
        tween:Play()
        wait(1)
    end
end)()

--=== [Janela Principal] ===--
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 700, 0, 420)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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
titleLabel.Text = HUB_NAME .. " " .. HUB_VERSION
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 22
titleLabel.Parent = mainFrame

-- Sidebar
local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0, 150, 1, -55)
sidebar.Position = UDim2.new(0, 10, 0, 55)
sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
contentFrame.Size = UDim2.new(1, -170, 1, -55)
contentFrame.Position = UDim2.new(0, 170, 0, 55)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local currentTab = nil

--=== [Funções Auxiliares] ===--
local function createTab(name, content)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(60, 60, 60)
    btnStroke.Thickness = 1.5
    btnStroke.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if currentTab then currentTab.Visible = false end
        content.Visible = true
        currentTab = content
        for _, b in ipairs(sidebar:GetChildren()) do
            if b:IsA("TextButton") then
                TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
            end
        end
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
    end)

    btn.MouseEnter:Connect(function()
        if btn ~= currentTab then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        end
    end)

    btn.MouseLeave:Connect(function()
        if btn ~= currentTab then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
        end
    end)

    return btn
end

--=== [Aba Home] ===--
local homeContent = Instance.new("ScrollingFrame")
homeContent.Size = UDim2.new(1, 0, 1, 0)
homeContent.BackgroundTransparency = 1
homeContent.Visible = true
homeContent.Parent = contentFrame

local homeTitle = Instance.new("TextLabel")
homeTitle.Size = UDim2.new(1, 0, 0, 30)
homeTitle.Text = "🏠 Bem-vindo ao " .. HUB_NAME .. " " .. HUB_VERSION
homeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
homeTitle.Font = Enum.Font.GothamBold
homeTitle.TextSize = 20
homeTitle.BackgroundTransparency = 1
homeTitle.Parent = homeContent

local homeUpdates = Instance.new("TextLabel")
homeUpdates.Size = UDim2.new(1, 0, 0, 100)
homeUpdates.Position = UDim2.new(0, 0, 0, 40)
homeUpdates.Text = [[
🔹 Atualizações da v3.0:
• Botão animado com efeito de pulsar
• Home com todas as informações
• Créditos atualizados
• UI moderna e otimizada
• Melhorias no Fly e Noclip
• ESP com nome e highlight
• Teleport para jogadores
• Invisibilidade (transparência)
• Efeitos visuais premium
]]
homeUpdates.TextColor3 = Color3.fromRGB(220, 220, 220)
homeUpdates.Font = Enum.Font.Gotham
homeUpdates.TextSize = 16
homeUpdates.TextWrapped = true
homeUpdates.TextYAlignment = Enum.TextYAlignment.Top
homeUpdates.BackgroundTransparency = 1
homeUpdates.Parent = homeContent

local homeCredits = Instance.new("TextLabel")
homeCredits.Size = UDim2.new(1, 0, 0, 60)
homeCredits.Position = UDim2.new(0, 0, 0, 150)
homeCredits.Text = "👨‍💻 " .. HUB_CREDITS .. "\n🌐 " .. HUB_GITHUB
homeCredits.TextColor3 = Color3.fromRGB(180, 180, 255)
homeCredits.Font = Enum.Font.Gotham
homeCredits.TextSize = 16
homeCredits.TextWrapped = true
homeCredits.BackgroundTransparency = 1
homeCredits.Parent = homeContent

local homeThanks = Instance.new("TextLabel")
homeThanks.Size = UDim2.new(1, 0, 0, 40)
homeThanks.Position = UDim2.new(0, 0, 0, 220)
homeThanks.Text = "Obrigado por usar o " .. HUB_NAME .. "!"
homeThanks.TextColor3 = Color3.fromRGB(100, 255, 100)
homeThanks.Font = Enum.Font.GothamBold
homeThanks.TextSize = 18
homeThanks.BackgroundTransparency = 1
homeThanks.Parent = homeContent

createTab("Home", homeContent)

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

local noclipCorner = Instance.new("UICorner")
noclipCorner.CornerRadius = UDim.new(0, 8)
noclipCorner.Parent = noclipBtn

local noclipOn = false
noclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipBtn.Text = "Noclip: " .. (noclipOn and "ON" or "OFF")
    TweenService:Create(noclipBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = noclipOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    }):Play()
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

local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 8)
flyCorner.Parent = flyBtn

local flyOn = false
local bv, bg
flyBtn.MouseButton1Click:Connect(function()
    flyOn = not flyOn
    flyBtn.Text = "Fly: " .. (flyOn and "ON" or "OFF")
    TweenService:Create(flyBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = flyOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    }):Play()

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

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 8)
espCorner.Parent = espBtn

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
    TweenService:Create(espBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = espOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    }):Play()

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

local teleportCorner = Instance.new("UICorner")
teleportCorner.CornerRadius = UDim.new(0, 8)
teleportCorner.Parent = teleportBtn

teleportBtn.MouseButton1Click:Connect(function()
    local target = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]
    if target and target.Character and player.Character then
        player.Character:MoveTo(target.Character.HumanoidRootPart.Position)
        teleportBtn.Text = "Teleportado para: " .. target.Name
        wait(2)
        teleportBtn.Text = "Teleport"
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

local invisCorner = Instance.new("UICorner")
invisCorner.CornerRadius = UDim.new(0, 8)
invisCorner.Parent = invisBtn

local invisOn = false
invisBtn.MouseButton1Click:Connect(function()
    invisOn = not invisOn
    invisBtn.Text = "Invis: " .. (invisOn and "ON" or "OFF")
    TweenService:Create(invisBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = invisOn and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
    }):Play()

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

local creditsTitle = Instance.new("TextLabel")
creditsTitle.Size = UDim2.new(1, 0, 0, 30)
creditsTitle.Text = "👨‍💻 Créditos"
creditsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsTitle.Font = Enum.Font.GothamBold
creditsTitle.TextSize = 20
creditsTitle.BackgroundTransparency = 1
creditsTitle.Parent = creditsContent

local creditsText = Instance.new("TextLabel")
creditsText.Size = UDim2.new(1, 0, 0, 100)
creditsText.Position = UDim2.new(0, 0, 0, 40)
creditsText.Text = [[
💻 Desenvolvedores:
• Kevyn Mal (Kevyngame163637)
• Kaiozinhu12

🌐 GitHub:
github.com/Kevyngame163637/Kevynmama-Hub

💙 Agradecimentos:
Obrigado por usar o Kevynmama Hub!
]]
creditsText.TextColor3 = Color3.fromRGB(180, 180, 255)
creditsText.Font = Enum.Font.Gotham
creditsText.TextSize = 16
creditsText.TextWrapped = true
creditsText.TextYAlignment = Enum.TextYAlignment.Top
creditsText.BackgroundTransparency = 1
creditsText.Parent = creditsContent

createTab("Créditos", creditsContent)

--=== [Toggle UI] ===--
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleBtn.Text = mainFrame.Visible and "X" or "HUB"
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

print("[OK] " .. HUB_NAME .. " " .. HUB_VERSION .. " carregado! Aperte 'HUB' para abrir.")
