-- ==================== SPLASH SCREEN ====================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Создаём ScreenGui для сплеша
local splashGui = Instance.new("ScreenGui")
splashGui.Name = "CryoHubSplash"
splashGui.ResetOnSpawn = false
splashGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
splashGui.DisplayOrder = 999
splashGui.Parent = PlayerGui

-- Размытый фон (Blur)
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

-- Фон (тёмный полупрозрачный)
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.ZIndex = 1
bg.Parent = splashGui

-- Контейнер для логотипа и текста
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 350, 0, 400)
container.Position = UDim2.new(0.5, -175, 0.5, -200)
container.BackgroundTransparency = 1
container.ZIndex = 2
container.Parent = splashGui

-- Логотип (Decal)
local decal = Instance.new("ImageLabel")
decal.Size = UDim2.new(0, 280, 0, 280)
decal.Position = UDim2.new(0.5, -140, 0, 0)
decal.BackgroundTransparency = 1
decal.Image = "rbxassetid://119085437225835"
decal.ImageTransparency = 1
decal.ImageColor3 = Color3.fromRGB(255, 255, 255)
decal.ScaleType = Enum.ScaleType.Fit
decal.ZIndex = 3
decal.Parent = container

-- Glow эффект вокруг логотипа
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1.4, 0, 1.4, 0)
glow.Position = UDim2.new(-0.2, 0, -0.2, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://108226463288168"
glow.ImageTransparency = 1
glow.ImageColor3 = Color3.fromRGB(100, 150, 255)
glow.ScaleType = Enum.ScaleType.Stretch
glow.ZIndex = 2
glow.Parent = decal

-- Текст "Cryo Hub"
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 50)
titleText.Position = UDim2.new(0, 0, 0, 290)
titleText.BackgroundTransparency = 1
titleText.Text = "Cryo Hub"
titleText.Font = Enum.Font.GothamBlack
titleText.TextSize = 42
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextTransparency = 1
titleText.TextStrokeTransparency = 1
titleText.TextStrokeColor3 = Color3.fromRGB(100, 150, 255)
titleText.ZIndex = 3
titleText.Parent = container

-- Текст "by Powder"
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0, 30)
subText.Position = UDim2.new(0, 0, 0, 340)
subText.BackgroundTransparency = 1
subText.Text = "by Powder"
subText.Font = Enum.Font.GothamBold
subText.TextSize = 22
subText.TextColor3 = Color3.fromRGB(180, 180, 180)
subText.TextTransparency = 1
subText.ZIndex = 3
subText.Parent = container

-- Полоса загрузки (прогресс бар)
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 200, 0, 4)
barBg.Position = UDim2.new(0.5, -100, 0, 380)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BackgroundTransparency = 1
barBg.BorderSizePixel = 0
barBg.ZIndex = 3
barBg.Parent = container

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
barFill.BackgroundTransparency = 1
barFill.BorderSizePixel = 0
barFill.ZIndex = 4
barFill.Parent = barBg

-- ========== АНИМАЦИЯ ПОЯВЛЕНИЯ ==========

-- 1. Фон появляется
TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.3
}):Play()

-- 2. Blur увеличивается
TweenService:Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = 20
}):Play()

task.wait(0.3)

-- 3. Логотип плавно появляется (scale + fade)
decal.Size = UDim2.new(0, 200, 0, 200)
decal.Position = UDim2.new(0.5, -100, 0, 40)

TweenService:Create(decal, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    ImageTransparency = 0,
    Size = UDim2.new(0, 280, 0, 280),
    Position = UDim2.new(0.5, -140, 0, 0)
}):Play()

task.wait(0.2)

-- 4. Glow появляется
TweenService:Create(glow, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ImageTransparency = 0.7
}):Play()

task.wait(0.4)

-- 5. Текст появляется
TweenService:Create(titleText, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0,
    TextStrokeTransparency = 0.8
}):Play()

task.wait(0.2)

TweenService:Create(subText, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

task.wait(0.2)

-- 6. Прогресс бар
TweenService:Create(barBg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
}):Play()

TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
}):Play()

task.wait(0.3)

-- Анимация заполнения бара
TweenService:Create(barFill, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(1, 0, 1, 0)
}):Play()

task.wait(2)

-- ========== АНИМАЦИЯ ИСЧЕЗНОВЕНИЯ ==========

-- Текст исчезает
TweenService:Create(subText, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    TextTransparency = 1
}):Play()

TweenService:Create(titleText, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    TextTransparency = 1,
    TextStrokeTransparency = 1
}):Play()

TweenService:Create(barBg, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1
}):Play()

task.wait(0.2)

-- Логотип улетает вверх
TweenService:Create(decal, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
    ImageTransparency = 1,
    Position = UDim2.new(0.5, -140, 0, -100)
}):Play()

TweenService:Create(glow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    ImageTransparency = 1
}):Play()

task.wait(0.3)

-- Фон исчезает
TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 1
}):Play()

-- Blur убирается
TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    Size = 0
}):Play()

task.wait(1)

-- Чистим
blur:Destroy()
splashGui:Destroy()

-- ==================== ПОДКЛЮЧАЕМ TORA LIBRARY ====================
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()

-- ==================== ПЕРЕМЕННЫЕ ====================
local autoCollect = false
local collectRadius = 50

local autoRoll = false

local autoRebirth = false
local rebirthDelay = 15

local autoBuyZone = false
local autoTeleportToNewZone = true

local autoClaimIndex = false

local autoEquipBest = false

local antiAFK = false
local speedHackEnabled = false
local walkSpeedValue = 32

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

-- Список всех категорий индекса
local indexCategories = {"basic", "big", "huge", "shiny", "inverted"}

-- ==================== DataService ====================
local DataService = nil
pcall(function()
    DataService = require(ReplicatedStorage.Packages.DataService).client
end)
if not DataService then
    DataService = { get = function() return 1 end }
end

-- ==================== REMOTE FUNCTION ====================
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

-- ==================== АНТИ АФК ====================
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

-- ==================== SPEED HACK ====================
local speedHackConnection = nil

local function setWalkSpeed(speed)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = speed
    end
end

local function startSpeedHack()
    setWalkSpeed(walkSpeedValue)
    if speedHackConnection then return end
    speedHackConnection = LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if speedHackEnabled and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = walkSpeedValue
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

-- ==================== AUTO COLLECT ====================
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
        if loot.Distance <= collectRadius then
            pcall(function()
                firetouchinterest(hrp, loot.TouchPart, 0)
                task.wait(0.05)
                firetouchinterest(hrp, loot.TouchPart, 1)
            end)
            task.wait(0.05)
        end
    end
end

-- ==================== AUTO ROLL ====================
local function doRoll()
    if rollRE then pcall(function() rollRE:FireServer("requestRoll") end) end
end

-- ==================== AUTO REBIRTH ====================
local function doRebirth()
    if rebirthRF then pcall(function() rebirthRF:InvokeServer("requestRebirth") end) end
end

-- ==================== AUTO ZONE ====================
local lastZone = 1

local function getMaxZone()
    return DataService:get("maxZone") or 1
end

local function teleportToZone()
    if not zonesRF then return end
    pcall(function() zonesRF:InvokeServer("requestTeleportZone", getMaxZone()) end)
end

local function doBuyZone()
    if not zonesRF then return end
    pcall(function() zonesRF:InvokeServer("requestPurchaseZone") end)
end

-- Телепорт вверх и вперёд на 300 шагов
local function smartTeleport()
    local hrp = getHRP()
    if not hrp then return end
    
    local lookVector = hrp.CFrame.LookVector
    lookVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
    
    local newPos = hrp.Position + Vector3.new(0, 50, 0) + (lookVector * 300)
    hrp.CFrame = CFrame.new(newPos)
end

-- ==================== AUTO CLAIM INDEX ====================
local function claimIndexReward(category)
    if indexRF then pcall(function() indexRF:InvokeServer("requestClaimReward", category) end) end
end

-- ==================== AUTO EQUIP BEST ====================
local function doEquipBest()
    if inventoryRF then pcall(function() inventoryRF:InvokeServer("requestEquipBest") end) end
end

-- ==================== UI ====================
local mainWindow = library:CreateWindow("Cryo Hub")
local autoFolder = mainWindow:AddFolder("Auto")

-- Auto Collect
autoFolder:AddToggle({
    text = "Auto Collect",
    flag = "autoCollect",
    callback = function(s)
        autoCollect = s
        if autoCollect then
            task.spawn(function() 
                while autoCollect do 
                    collectAllInRange() 
                    task.wait(0.1) 
                end 
            end)
        end
    end
})
autoFolder:AddSlider({
    text = "Radius",
    flag = "collectRadius",
    min = 10, max = 100, value = 50,
    callback = function(v) collectRadius = v end
})

-- Auto Roll
autoFolder:AddToggle({
    text = "Auto Roll",
    flag = "autoRoll",
    callback = function(s)
        autoRoll = s
        if autoRoll then
            task.spawn(function() 
                while autoRoll do 
                    doRoll() 
                    task.wait(0.1) 
                end 
            end)
        end
    end
})

-- Auto Rebirth
autoFolder:AddToggle({
    text = "Auto Rebirth",
    flag = "autoRebirth",
    callback = function(s)
        autoRebirth = s
        if autoRebirth then
            task.spawn(function() 
                while autoRebirth do 
                    doRebirth() 
                    task.wait(rebirthDelay) 
                end 
            end)
        end
    end
})
autoFolder:AddSlider({
    text = "Rebirth Delay",
    flag = "rebirthDelay",
    min = 5, max = 60, value = 15,
    callback = function(v) rebirthDelay = v end
})

-- Auto Zone - покупка работает ПОСТОЯННО
task.spawn(function()
    while true do
        local currentZone = getMaxZone()
        doBuyZone()
        
        if currentZone > lastZone then
            lastZone = currentZone
            task.wait(0.3)
            smartTeleport()
        end
        
        task.wait(0.5)
    end
end)

autoFolder:AddToggle({
    text = "Auto Teleport Zone",
    flag = "autoTeleportZone",
    callback = function(s)
        autoTeleportToNewZone = s
        if autoTeleportToNewZone then
            task.spawn(function()
                while autoTeleportToNewZone do
                    teleportToZone()
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- Auto Claim Index
autoFolder:AddToggle({
    text = "Auto Claim Index",
    flag = "autoClaimIndex",
    callback = function(s)
        autoClaimIndex = s
        if autoClaimIndex then
            task.spawn(function()
                while autoClaimIndex do
                    for _, cat in ipairs(indexCategories) do
                        claimIndexReward(cat)
                        task.wait(0.1)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

-- Auto Equip Best
autoFolder:AddToggle({
    text = "Auto Equip Best",
    flag = "autoEquipBest",
    callback = function(s)
        autoEquipBest = s
        if autoEquipBest then
            task.spawn(function() 
                while autoEquipBest do 
                    doEquipBest() 
                    task.wait(0.5) 
                end 
            end)
        end
    end
})

-- Вкладка Misc
local miscFolder = mainWindow:AddFolder("Misc")

miscFolder:AddToggle({
    text = "Anti AFK",
    flag = "antiAFK",
    callback = function(s)
        antiAFK = s
        if antiAFK then startAntiAfk() else stopAntiAfk() end
    end
})

miscFolder:AddToggle({
    text = "Speed Hack",
    flag = "speedHack",
    callback = function(s)
        speedHackEnabled = s
        if speedHackEnabled then
            startSpeedHack()
            setWalkSpeed(walkSpeedValue)
        else
            stopSpeedHack()
        end
    end
})

miscFolder:AddSlider({
    text = "Walk Speed",
    flag = "walkSpeedValue",
    min = 16, max = 250, value = 32,
    callback = function(v)
        walkSpeedValue = v
        if speedHackEnabled then setWalkSpeed(v) end
    end
})

-- ==================== CREDITS ====================
local creditsFolder = mainWindow:AddFolder("Credits")

creditsFolder:AddLabel({text = "UI: Tora"})
creditsFolder:AddLabel({text = "Creator: Powder"})
creditsFolder:AddLabel({text = "Thanks For Using My Script!"})

library:Init()
print("✅ Cryo Hub loaded by Powder!")
