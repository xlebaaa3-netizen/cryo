local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local VALID_KEY = "Cryo#NN@22S22A1sSD2"
local GET_KEY_LINK = "https://link-center.net/5474340/nQ72sFSOHNzl"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/xlebaaa3-netizen/cryo/refs/heads/main/game.lua"

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "CryoKeySystem"
keyGui.ResetOnSpawn = false
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keyGui.DisplayOrder = 999
keyGui.Parent = PlayerGui

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.ZIndex = 1
bg.Parent = keyGui

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 400, 0, 500)
panel.Position = UDim2.new(0.5, -200, 0.5, -250)
panel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
panel.BackgroundTransparency = 1
panel.BorderSizePixel = 0
panel.ZIndex = 2
panel.Parent = keyGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = panel

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(60, 60, 80)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 1
mainStroke.Parent = panel

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 120, 0, 120)
logo.Position = UDim2.new(0.5, -60, 0, 30)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://90751491079279"
logo.ImageTransparency = 1
logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
logo.ScaleType = Enum.ScaleType.Fit
logo.ZIndex = 3
logo.Parent = panel

local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1.5, 0, 1.5, 0)
glow.Position = UDim2.new(-0.25, 0, -0.25, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://108226463288168"
glow.ImageTransparency = 1
glow.ImageColor3 = Color3.fromRGB(100, 150, 255)
glow.ZIndex = 2
glow.Parent = logo

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 160)
title.BackgroundTransparency = 1
title.Text = "Cryo Hub"
title.Font = Enum.Font.GothamBlack
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextTransparency = 1
title.ZIndex = 3
title.Parent = panel

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Position = UDim2.new(0, 0, 0, 200)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Key System"
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 18
subtitle.TextColor3 = Color3.fromRGB(100, 150, 255)
subtitle.TextTransparency = 1
subtitle.ZIndex = 3
subtitle.Parent = panel

local inputBg = Instance.new("Frame")
inputBg.Size = UDim2.new(0, 320, 0, 45)
inputBg.Position = UDim2.new(0.5, -160, 0, 250)
inputBg.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
inputBg.BackgroundTransparency = 1
inputBg.BorderSizePixel = 0
inputBg.ZIndex = 3
inputBg.Parent = panel

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = inputBg

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(60, 60, 80)
inputStroke.Thickness = 1
inputStroke.Transparency = 1
inputStroke.Parent = inputBg

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 1, 0)
keyInput.Position = UDim2.new(0, 10, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.Text = ""
keyInput.PlaceholderText = "Enter your key..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyInput.Font = Enum.Font.GothamBold
keyInput.TextSize = 16
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextTransparency = 1
keyInput.ClearTextOnFocus = false
keyInput.ZIndex = 4
keyInput.Parent = inputBg

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0, 320, 0, 45)
submitBtn.Position = UDim2.new(0.5, -160, 0, 310)
submitBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
submitBtn.BackgroundTransparency = 1
submitBtn.BorderSizePixel = 0
submitBtn.Text = "Submit"
submitBtn.Font = Enum.Font.GothamBlack
submitBtn.TextSize = 18
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.TextTransparency = 1
submitBtn.ZIndex = 3
submitBtn.Parent = panel

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 8)
submitCorner.Parent = submitBtn

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0, 320, 0, 35)
getKeyBtn.Position = UDim2.new(0.5, -160, 0, 365)
getKeyBtn.BackgroundTransparency = 1
getKeyBtn.Text = "Get Key"
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 14
getKeyBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
getKeyBtn.TextTransparency = 1
getKeyBtn.ZIndex = 3
getKeyBtn.Parent = panel

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 0, 415)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
statusLabel.TextTransparency = 1
statusLabel.ZIndex = 3
statusLabel.Parent = panel

TweenService:Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 25}):Play()
TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

task.wait(0.2)

TweenService:Create(panel, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(mainStroke, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()

task.wait(0.1)

TweenService:Create(logo, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.6}):Play()

task.wait(0.2)

TweenService:Create(title, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

task.wait(0.1)

TweenService:Create(subtitle, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

task.wait(0.2)

TweenService:Create(inputBg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(inputStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()
TweenService:Create(keyInput, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

task.wait(0.1)

TweenService:Create(submitBtn, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(getKeyBtn, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

local function showStatus(text, color)
    statusLabel.TextColor3 = color or Color3.fromRGB(255, 80, 80)
    statusLabel.Text = text
    TweenService:Create(statusLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
end

local function hideStatus()
    TweenService:Create(statusLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
end

local function closeKeySystem()
    TweenService:Create(submitBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(getKeyBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    TweenService:Create(inputBg, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
    TweenService:Create(keyInput, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    TweenService:Create(statusLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    TweenService:Create(title, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    TweenService:Create(subtitle, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    TweenService:Create(logo, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {ImageTransparency = 1, Position = UDim2.new(0.5, -60, 0, -50)}):Play()
    TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
    
    task.wait(0.3)
    
    TweenService:Create(mainStroke, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Transparency = 1}):Play()
    TweenService:Create(panel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {BackgroundTransparency = 1, Size = UDim2.new(0, 300, 0, 400)}):Play()
    TweenService:Create(bg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
    TweenService:Create(blur, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = 0}):Play()
    
    task.wait(0.6)
    
    blur:Destroy()
    keyGui:Destroy()
end

local function loadMainScript()
    showStatus("Loading...", Color3.fromRGB(100, 255, 100))
    task.wait(0.5)
    
    closeKeySystem()
    task.wait(0.3)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet(MAIN_SCRIPT, true))()
    end)
    
    if not success then
        warn("Cryo Hub Error: " .. tostring(err))
    end
end

submitBtn.MouseEnter:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(120, 170, 255)}):Play()
end)

submitBtn.MouseLeave:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(100, 150, 255)}):Play()
end)

submitBtn.MouseButton1Click:Connect(function()
    local key = keyInput.Text:gsub("%s+", "")
    
    if key == "" then
        showStatus("Please enter a key!")
        task.wait(2)
        hideStatus()
        return
    end
    
    if key == VALID_KEY then
        showStatus("Valid key! Loading...", Color3.fromRGB(100, 255, 100))
        task.wait(1)
        loadMainScript()
    else
        showStatus("Invalid key!")
        task.wait(2)
        hideStatus()
    end
end)

getKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(getKeyBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
end)

getKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(getKeyBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)

getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(GET_KEY_LINK)
    end)
    
    showStatus("Link copied to clipboard!", Color3.fromRGB(100, 255, 100))
    task.wait(2)
    hideStatus()
end)

keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitBtn.MouseButton1Click:Fire()
    end
end)

print("Cryo Hub Key System loaded")
