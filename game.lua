local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local indexCategories = {"basic", "big", "huge", "shiny", "inverted"}

local DataService = nil
pcall(function()
    DataService = require(ReplicatedStorage.Packages.DataService).client
end)
if not DataService then
    DataService = { get = function(key) return 1 end }
end

local function safeFindRemote(path)
    local current = ReplicatedStorage
    for _, name in ipairs(path) do
        current = current:FindFirstChild(name)
        if not current then return nil end
    end
    return current
end

local zonesRF = safeFindRemote({
    "Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes", "ZonesService", "RemoteFunction"
})

local rollRE = safeFindRemote({
    "Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes", "RollService", "RemoteEvent"
})

local rebirthRF = safeFindRemote({
    "Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes", "RebirthService", "RemoteFunction"
})

local indexRF = safeFindRemote({
    "Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes", "IndexService", "RemoteFunction"
})

local inventoryRF = safeFindRemote({
    "Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes", "InventoryService", "RemoteFunction"
})

local states = {
    autoCollect = false,
    collectRadius = 50,
    autoRoll = false,
    autoRebirth = false,
    rebirthDelay = 15,
    autoBuyNewZone = false,
    autoTeleportToNewZone = false,
    autoClaimIndex = false,
    autoEquipBest = false,
    antiAFK = false,
    speedHackEnabled = false,
    walkSpeedValue = 32,
}

local antiAfkConnection = nil
local function startAntiAfk()
    if antiAfkConnection then return end
    antiAfkConnection = LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
local function stopAntiAfk()
    if antiAfkConnection then
        antiAfkConnection:Disconnect()
        antiAfkConnection = nil
    end
end

local speedHackConnection = nil
local function setWalkSpeed(speed)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speed
    end
end
local function startSpeedHack()
    setWalkSpeed(states.walkSpeedValue)
    if speedHackConnection then return end
    speedHackConnection = LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if states.speedHackEnabled and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = states.walkSpeedValue
        end
    end)
end
local function stopSpeedHack()
    if speedHackConnection then
        speedHackConnection:Disconnect()
        speedHackConnection = nil
    end
    setWalkSpeed(16)
end

local function getHRP()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getAllLootWithTouchInterest()
    local lootFolder = workspace:FindFirstChild("Loot")
    if not lootFolder then return {} end
    local loots = {}
    local hrp = getHRP()
    local hrpPos = hrp and hrp.Position or Vector3.new()
    for _, obj in pairs(lootFolder:GetChildren()) do
        local touchPart = nil
        if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
            touchPart = obj
        elseif obj:FindFirstChild("Primary") and obj.Primary:IsA("BasePart") and obj.Primary:FindFirstChild("TouchInterest") then
            touchPart = obj.Primary
        else
            for _, child in pairs(obj:GetChildren()) do
                if child:IsA("BasePart") and child:FindFirstChild("TouchInterest") then
                    touchPart = child
                    break
                end
            end
        end
        if touchPart then
            local dist = hrpPos and (hrpPos - touchPart.Position).Magnitude or 0
            table.insert(loots, {TouchPart = touchPart, Distance = dist})
        end
    end
    table.sort(loots, function(a,b) return a.Distance < b.Distance end)
    return loots
end

local function collectAllInRange()
    local hrp = getHRP()
    if not hrp then return end
    for _, loot in ipairs(getAllLootWithTouchInterest()) do
        if loot.Distance <= states.collectRadius then
            pcall(function()
                firetouchinterest(hrp, loot.TouchPart, 0)
                task.wait(0.05)
                firetouchinterest(hrp, loot.TouchPart, 1)
            end)
            task.wait(0.05)
        end
    end
end

local function doRoll()
    if rollRE then pcall(function() rollRE:FireServer("requestRoll") end) end
end

local function doRebirth()
    if rebirthRF then pcall(function() rebirthRF:InvokeServer("requestRebirth") end) end
end

local function getMaxZone()
    local success, result = pcall(function()
        return DataService:get("maxZone")
    end)
    return success and result or 1
end

local function doBuyZone()
    if not zonesRF then return false end
    pcall(function()
        zonesRF:InvokeServer("requestPurchaseZone")
    end)
    return true
end

local function claimIndexReward(category)
    if indexRF then pcall(function() indexRF:InvokeServer("requestClaimReward", category) end) end
end

local function doEquipBest()
    if inventoryRF then pcall(function() inventoryRF:InvokeServer("requestEquipBest") end) end
end

local gui = Instance.new("ScreenGui")
gui.Name = "CryoHubGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = PlayerGui

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local mainPanel = Instance.new("Frame")
mainPanel.Size = UDim2.new(0, 420, 0, 520)
mainPanel.Position = UDim2.new(0.5, -210, 0.5, -260)
mainPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainPanel.BackgroundTransparency = 0
mainPanel.BorderSizePixel = 0
mainPanel.Active = true
mainPanel.Draggable = false
mainPanel.Visible = false
mainPanel.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainPanel

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(60, 60, 80)
mainStroke.Thickness = 1.5
mainStroke.Parent = mainPanel

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = mainPanel

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0, 10)
headerFix.Position = UDim2.new(0, 0, 1, -10)
headerFix.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
headerFix.BorderSizePixel = 0
headerFix.Parent = header

-- ==================== ПЕРЕМЕЩЕНИЕ (100% РАБОЧЕЕ) ====================
local isDragging = false
local dragStartMouse = nil
local dragStartFrame = nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStartMouse = Vector2.new(input.Position.X, input.Position.Y)
        dragStartFrame = mainPanel.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not isDragging then return end
    if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
    
    local currentMouse = Vector2.new(input.Position.X, input.Position.Y)
    local delta = currentMouse - dragStartMouse
    
    mainPanel.Position = UDim2.new(0, dragStartFrame.X.Offset + delta.X, 0, dragStartFrame.Y.Offset + delta.Y)
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
        dragStartMouse = nil
        dragStartFrame = nil
    end
end)
-- ==================== КОНЕЦ ПЕРЕМЕЩЕНИЯ ====================

local headerLogo = Instance.new("ImageLabel")
headerLogo.Size = UDim2.new(0, 32, 0, 32)
headerLogo.Position = UDim2.new(0, 12, 0, 9)
headerLogo.BackgroundTransparency = 1
headerLogo.Image = "rbxassetid://119085437225835"
headerLogo.ScaleType = Enum.ScaleType.Fit
headerLogo.Parent = header

local headerTitle = Instance.new("TextLabel")
headerTitle.Size = UDim2.new(0, 200, 0, 30)
headerTitle.Position = UDim2.new(0, 50, 0, 10)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = "Cryo Hub"
headerTitle.Font = Enum.Font.GothamBlack
headerTitle.TextSize = 22
headerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBlack
closeBtn.TextSize = 24
closeBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
closeBtn.Parent = header

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -75, 0, 10)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.Text = "−"
minimizeBtn.Font = Enum.Font.GothamBlack
minimizeBtn.TextSize = 24
minimizeBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
minimizeBtn.Parent = header

local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
tabContainer.BackgroundTransparency = 0
tabContainer.BorderSizePixel = 0
tabContainer.Parent = mainPanel

local tabFix = Instance.new("Frame")
tabFix.Size = UDim2.new(0, 10, 1, 0)
tabFix.Position = UDim2.new(1, -10, 0, 0)
tabFix.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
tabFix.BorderSizePixel = 0
tabFix.Parent = tabContainer

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -100, 1, -50)
contentArea.Position = UDim2.new(0, 100, 0, 50)
contentArea.BackgroundTransparency = 1
contentArea.BorderSizePixel = 0
contentArea.Parent = mainPanel

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -20)
scrollFrame.Position = UDim2.new(0, 10, 0, 10)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 3
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.Parent = contentArea

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Padding = UDim.new(0, 8)
scrollLayout.Parent = scrollFrame

scrollLayout.Changed:Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scrollLayout.AbsoluteContentSize.Y + 20)
end)

local function createSection(text)
    local section = Instance.new("TextLabel")
    section.Size = UDim2.new(1, -10, 0, 25)
    section.BackgroundTransparency = 1
    section.Text = text
    section.Font = Enum.Font.GothamBold
    section.TextSize = 14
    section.TextColor3 = Color3.fromRGB(100, 150, 255)
    section.TextXAlignment = Enum.TextXAlignment.Left
    section.LayoutOrder = #scrollFrame:GetChildren()
    section.Parent = scrollFrame
    return section
end

local function createToggle(text, stateKey, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.LayoutOrder = #scrollFrame:GetChildren()
    frame.Parent = scrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 15
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleBg = Instance.new("Frame")
    toggleBg.Size = UDim2.new(0, 44, 0, 24)
    toggleBg.Position = UDim2.new(1, -56, 0.5, -12)
    toggleBg.BackgroundColor3 = states[stateKey] and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(50, 50, 55)
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = frame
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleBg
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Size = UDim2.new(0, 18, 0, 18)
    toggleCircle.Position = states[stateKey] and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.BorderSizePixel = 0
    toggleCircle.Parent = toggleBg
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = frame
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(frame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 30)}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        states[stateKey] = not states[stateKey]
        
        TweenService:Create(toggleBg, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = states[stateKey] and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(50, 50, 55)
        }):Play()
        
        TweenService:Create(toggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = states[stateKey] and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
        }):Play()
        
        if callback then
            callback(states[stateKey])
        end
    end)
    
    return frame
end

local function createSlider(text, stateKey, min, max, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 60)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.LayoutOrder = #scrollFrame:GetChildren()
    frame.Parent = scrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. states[stateKey]
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -30, 0, 6)
    track.Position = UDim2.new(0, 15, 0, 38)
    track.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    track.BorderSizePixel = 0
    track.Parent = frame
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = track
    
    local fill = Instance.new("Frame")
    local percent = (states[stateKey] - min) / (max - min)
    fill.Size = UDim2.new(percent, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    fill.BorderSizePixel = 0
    fill.Parent = track
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 14, 0, 14)
    handle.Position = UDim2.new(percent, -7, 0.5, -7)
    handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    handle.BorderSizePixel = 0
    handle.Parent = track
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(1, 0)
    handleCorner.Parent = handle
    
    local dragging = false
    
    local function updateSlider(inputX)
        local trackPos = track.AbsolutePosition.X
        local trackSize = track.AbsoluteSize.X
        local relativeX = math.clamp((inputX - trackPos) / trackSize, 0, 1)
        local value = math.floor(min + (relativeX * (max - min)))
        
        states[stateKey] = value
        label.Text = text .. ": " .. value
        
        fill.Size = UDim2.new(relativeX, 0, 1, 0)
        handle.Position = UDim2.new(relativeX, -7, 0.5, -7)
        
        if callback then
            callback(value)
        end
    end
    
    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local inputPos = input.Position.X
            local trackStart = track.AbsolutePosition.X
            local trackEnd = trackStart + track.AbsoluteSize.X
            if inputPos >= trackStart and inputPos <= trackEnd then
                dragging = true
                updateSlider(inputPos)
            end
        end
    end
    
    track.InputBegan:Connect(onInputBegan)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input.Position.X)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    return frame
end

local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    btn.BackgroundTransparency = 0
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.Font = Enum.Font.GothamBlack
    btn.TextSize = 15
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.LayoutOrder = #scrollFrame:GetChildren()
    btn.Parent = scrollFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 170, 255)}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 150, 255)}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 130, 235)}):Play()
        task.wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(120, 170, 255)}):Play()
        if callback then callback() end
    end)
    
    return btn
end

local function createLabel(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextColor3 = Color3.fromRGB(180, 180, 180)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.LayoutOrder = #scrollFrame:GetChildren()
    label.Parent = scrollFrame
    return label
end

local tabs = {}
local currentTab = nil

local function createTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, 0, 0, 40)
    tabBtn.Position = UDim2.new(0, 0, 0, #tabs * 42)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 13
    tabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    tabBtn.Parent = tabContainer
    
    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0, 20)
    indicator.Position = UDim2.new(0, 0, 0.5, -10)
    indicator.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    indicator.BackgroundTransparency = 1
    indicator.BorderSizePixel = 0
    indicator.Parent = tabBtn
    
    table.insert(tabs, {btn = tabBtn, indicator = indicator, name = name})
    
    tabBtn.MouseEnter:Connect(function()
        if currentTab ~= name then
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
    end)
    
    tabBtn.MouseLeave:Connect(function()
        if currentTab ~= name then
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end
    end)
    
    return tabBtn, indicator
end

local function clearContent()
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child:IsA("GuiObject") and child ~= scrollLayout then
            child:Destroy()
        end
    end
end

local function activateTab(tabData)
    for _, t in ipairs(tabs) do
        TweenService:Create(t.btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        TweenService:Create(t.indicator, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    end
    
    currentTab = tabData.name
    TweenService:Create(tabData.btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    TweenService:Create(tabData.indicator, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    
    clearContent()
end

local function fillAutoTab()
    createSection("Auto Collect")
    createToggle("Auto Collect", "autoCollect", function(s)
        if s then
            task.spawn(function()
                while states.autoCollect do
                    collectAllInRange()
                    task.wait(0.1)
                end
            end)
        end
    end)
    createSlider("Radius", "collectRadius", 10, 100, function(v)
        states.collectRadius = v
    end)
    
    createSection("Auto Roll")
    createToggle("Auto Roll", "autoRoll", function(s)
        if s then
            task.spawn(function()
                while states.autoRoll do
                    doRoll()
                    task.wait(0.1)
                end
            end)
        end
    end)
    
    createSection("Auto Rebirth")
    createToggle("Auto Rebirth", "autoRebirth", function(s)
        if s then
            task.spawn(function()
                while states.autoRebirth do
                    doRebirth()
                    task.wait(states.rebirthDelay)
                end
            end)
        end
    end)
    createSlider("Rebirth Delay", "rebirthDelay", 5, 60, function(v)
        states.rebirthDelay = v
    end)
    
    createSection("Auto Zone")
    createToggle("Auto Buy New Zone", "autoBuyNewZone", function(s) end)
    
    createSection("Auto Index")
    createToggle("Auto Claim Index", "autoClaimIndex", function(s)
        if s then
            task.spawn(function()
                while states.autoClaimIndex do
                    for _, cat in ipairs(indexCategories) do
                        claimIndexReward(cat)
                        task.wait(0.1)
                    end
                    task.wait(1)
                end
            end)
        end
    end)
    
    createSection("Auto Equip")
    createToggle("Auto Equip Best", "autoEquipBest", function(s)
        if s then
            task.spawn(function()
                while states.autoEquipBest do
                    doEquipBest()
                    task.wait(0.5)
                end
            end)
        end
    end)
end

local function fillMiscTab()
    createSection("Player")
    createToggle("Anti AFK", "antiAFK", function(s)
        if s then startAntiAfk() else stopAntiAfk() end
    end)
    createToggle("Speed Hack", "speedHackEnabled", function(s)
        if s then
            startSpeedHack()
            setWalkSpeed(states.walkSpeedValue)
        else
            stopSpeedHack()
        end
    end)
    createSlider("Walk Speed", "walkSpeedValue", 16, 250, function(v)
        states.walkSpeedValue = v
        if states.speedHackEnabled then setWalkSpeed(v) end
    end)
end

local function fillCreditsTab()
    createLabel("")
    createLabel("UI: Tora")
    createLabel("Creator: Powder")
    createLabel("")
    createLabel("Thanks For Using My Script!")
end

local autoTabBtn, autoIndicator = createTab("Auto")
local miscTabBtn, miscIndicator = createTab("Misc")
local creditsTabBtn, creditsIndicator = createTab("Credits")

local autoTabData = {btn = autoTabBtn, indicator = autoIndicator, name = "Auto"}
local miscTabData = {btn = miscTabBtn, indicator = miscIndicator, name = "Misc"}
local creditsTabData = {btn = creditsTabBtn, indicator = creditsIndicator, name = "Credits"}

tabs[1] = autoTabData
tabs[2] = miscTabData
tabs[3] = creditsTabData

autoTabBtn.MouseButton1Click:Connect(function()
    activateTab(autoTabData)
    fillAutoTab()
end)

miscTabBtn.MouseButton1Click:Connect(function()
    activateTab(miscTabData)
    fillMiscTab()
end)

creditsTabBtn.MouseButton1Click:Connect(function()
    activateTab(creditsTabData)
    fillCreditsTab()
end)

activateTab(autoTabData)
fillAutoTab()

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

minimizeBtn.MouseEnter:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)

local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        contentArea.Visible = false
        tabContainer.Visible = false
        TweenService:Create(mainPanel, TweenInfo.new(0.3), {Size = UDim2.new(0, 420, 0, 50)}):Play()
    else
        contentArea.Visible = true
        tabContainer.Visible = true
        TweenService:Create(mainPanel, TweenInfo.new(0.3), {Size = UDim2.new(0, 420, 0, 520)}):Play()
    end
end)

local floatingBtn = Instance.new("ImageButton")
floatingBtn.Name = "CryoHubFloat"
floatingBtn.Size = UDim2.new(0, 55, 0, 55)
floatingBtn.Position = UDim2.new(0, 20, 0.5, -27)
floatingBtn.BackgroundTransparency = 1
floatingBtn.Image = "rbxassetid://9751678226"
floatingBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
floatingBtn.ScaleType = Enum.ScaleType.Fit
floatingBtn.Active = true
floatingBtn.Draggable = true
floatingBtn.Parent = gui

local floatCorner = Instance.new("UICorner")
floatCorner.CornerRadius = UDim.new(1, 0)
floatCorner.Parent = floatingBtn

local floatStroke = Instance.new("UIStroke")
floatStroke.Color = Color3.fromRGB(100, 150, 255)
floatStroke.Thickness = 2
floatStroke.Parent = floatingBtn

local floatGlow = Instance.new("ImageLabel")
floatGlow.Size = UDim2.new(1.4, 0, 1.4, 0)
floatGlow.Position = UDim2.new(-0.2, 0, -0.2, 0)
floatGlow.BackgroundTransparency = 1
floatGlow.Image = "rbxassetid://108226463288168"
floatGlow.ImageTransparency = 0.7
floatGlow.ImageColor3 = Color3.fromRGB(100, 150, 255)
floatGlow.ZIndex = -1
floatGlow.Parent = floatingBtn

local isOpen = false

local function toggleGui()
    isOpen = not isOpen
    if isOpen then
        mainPanel.Visible = true
        mainPanel.Size = UDim2.new(0, 0, 0, 0)
        mainPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(mainPanel, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 420, 0, 520),
            Position = UDim2.new(0.5, -210, 0.5, -260)
        }):Play()
    else
        TweenService:Create(mainPanel, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        task.wait(0.3)
        mainPanel.Visible = false
        mainPanel.Size = UDim2.new(0, 420, 0, 520)
        mainPanel.Position = UDim2.new(0.5, -210, 0.5, -260)
    end
end

floatingBtn.MouseButton1Click:Connect(toggleGui)

if not isMobile then
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.K then
            toggleGui()
        end
    end)
end

task.spawn(function()
    while true do
        if states.autoBuyNewZone and LocalPlayer and LocalPlayer.Character then
            doBuyZone()
        end
        task.wait(0.5)
    end
end)

print("Cryo Hub loaded by Powder!")
