local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local sg = Instance.new("ScreenGui")
sg.IgnoreGuiInset = true
sg.DisplayOrder = 10000
sg.ResetOnSpawn = false
sg.Parent = playerGui

local float = Instance.new("TextButton")
float.Size = UDim2.new(0,70,0,70)
float.Position = UDim2.new(0.05,0,0.75,0)
float.BackgroundColor3 = Color3.fromRGB(139,92,246)
float.Text = "Ik"
float.TextColor3 = Color3.new(1,1,1)
float.TextScaled = true
float.Font = Enum.Font.GothamBlack
float.BorderSizePixel = 0
float.Parent = sg

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(1,0)
fc.Parent = float

local dragging = false
local dragStart, startPos
float.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = float.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        float.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

float.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local mf = Instance.new("Frame")
mf.Size = UDim2.new(0.92,0,0.88,0)
mf.Position = UDim2.new(0.04,0,0.06,0)
mf.BackgroundColor3 = Color3.fromRGB(26,13,46)
mf.BackgroundTransparency = 0.15
mf.BorderSizePixel = 3
mf.BorderColor3 = Color3.fromRGB(139,92,246)
mf.Visible = false
mf.Parent = sg

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0,18)
mc.Parent = mf

local glow = Instance.new("Frame")
glow.Size = UDim2.new(1,20,1,20)
glow.Position = UDim2.new(0,-10,0,-10)
glow.BackgroundColor3 = Color3.fromRGB(139,92,246)
glow.BackgroundTransparency = 0.5
glow.ZIndex = -1
glow.Parent = mf

TweenService:Create(glow, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    BackgroundTransparency = 0.3,
    Size = UDim2.new(1,40,1,40),
    Position = UDim2.new(0,-20,0,-20)
}):Play()

float.MouseButton1Click:Connect(function()
    mf.Visible = not mf.Visible
end)

print("Botao Ik carregado! Clique pra abrir UI.")
