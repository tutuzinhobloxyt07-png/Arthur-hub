-- ARTHUR HUB - interface demonstrativa para Roblox Studio
-- Uso: coloque este LocalScript em StarterPlayer > StarterPlayerScripts
-- Feito para testar no seu próprio jogo. Não é um exploit universal para Delta Executor.

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ArthurHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(280, 300)
frame.Position = UDim2.new(0, 24, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 22, 38)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(90, 110, 255)
stroke.Thickness = 2
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -44, 0, 42)
title.Position = UDim2.fromOffset(12, 4)
title.BackgroundTransparency = 1
title.Text = "ARTHUR HUB"
title.TextColor3 = Color3.fromRGB(140, 170, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -36, 0, 8)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(180, 55, 75)
close.Font = Enum.Font.GothamBold
close.TextSize = 15
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 7)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -24, 0, 24)
speedLabel.Position = UDim2.fromOffset(12, 55)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Velocidade (16 = padrão)"
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 14
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(1, -24, 0, 34)
speedBox.Position = UDim2.fromOffset(12, 82)
speedBox.BackgroundColor3 = Color3.fromRGB(35, 39, 62)
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.PlaceholderText = "Digite a velocidade"
speedBox.Text = "16"
speedBox.ClearTextOnFocus = false
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 15
speedBox.Parent = frame
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 7)

local function makeButton(text, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -24, 0, 36)
    b.Position = UDim2.fromOffset(12, y)
    b.BackgroundColor3 = Color3.fromRGB(54, 68, 130)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)
    return b
end

local applySpeed = makeButton("Aplicar velocidade", 126)
applySpeed.MouseButton1Click:Connect(function()
    local amount = tonumber(speedBox.Text)
    if not amount then
        applySpeed.Text = "Digite um número válido"
        task.wait(1.2)
        applySpeed.Text = "Aplicar velocidade"
        return
    end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = math.clamp(amount, 0, 100)
        applySpeed.Text = "Velocidade aplicada!"
        task.wait(1)
        applySpeed.Text = "Aplicar velocidade"
    end
end)

local flyButton = makeButton("Fly — demonstração", 170)
flyButton.MouseButton1Click:Connect(function()
    flyButton.Text = "Fly precisa ser programado no seu jogo"
    task.wait(1.5)
    flyButton.Text = "Fly — demonstração"
end)

local espButton = makeButton("ESP — demonstração", 214)
espButton.MouseButton1Click:Connect(function()
    espButton.Text = "ESP precisa ser programado no seu jogo"
    task.wait(1.5)
    espButton.Text = "ESP — demonstração"
end)

local minimize = makeButton("Minimizar / Restaurar", 258)
minimize.MouseButton1Click:Connect(function()
    local hidden = speedLabel.Visible
    speedLabel.Visible = not hidden
    speedBox.Visible = not hidden
    applySpeed.Visible = not hidden
    flyButton.Visible = not hidden
    espButton.Visible = not hidden
    frame.Size = hidden and UDim2.fromOffset(280, 50) or UDim2.fromOffset(280, 300)
end)
