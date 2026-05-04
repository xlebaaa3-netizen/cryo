local CryoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xlebaaa3-netizen/UIMAIN/refs/heads/main/CRYOLIB"))()

-- ═══════════════════════════════════════════
--  C R Y O   H U B
-- ═══════════════════════════════════════════

-- [[ STATE MANAGEMENT ]]
local states = {
    autoCollect = false,
    collectRadius = 50,
    autoRoll = false,
    autoRebirth = false,
    rebirthDelay = 15,
    autoEquipBest = false,
    autoBuyZone = false,
    autoClaimIndex = false,
    autoCollectRecipe = false,
    walkSpeedValue = 32,
    antiAFK = false
}

-- [[ REMOTE UTILITIES ]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local basePath = {"Packages", "_Index", "leifstout_networker@0.3.1", "networker", "_remotes"}

local function navigatePath(root, path)
    local current = root
    for _, name in ipairs(path) do
        current = current:FindFirstChild(name)
        if not current then return nil end
    end
    return current
end

local remotesFolder = navigatePath(ReplicatedStorage, basePath)

local function getRemote(name, remoteType)
    if not remotesFolder then return nil end
    local folder = remotesFolder:FindFirstChild(name)
    if not folder then return nil end
    return folder:FindFirstChild(remoteType)
end

local rollRE      = getRemote("RollService", "RemoteEvent")
local rebirthRF   = getRemote("RebirthService", "RemoteFunction")
local codeRF      = getRemote("CodeService", "RemoteFunction")
local indexRF     = getRemote("IndexService", "RemoteFunction")
local inventoryRF = getRemote("InventoryService", "RemoteFunction")
local zonesRF     = getRemote("ZonesService", "RemoteFunction")

-- ═══════════════════════════════════════════
--  WINDOW SETUP
-- ═══════════════════════════════════════════
local win = CryoLib:CreateWindow("Cryo Hub")

-- ═══════════════════════════════════════════
--  TAB: MAIN
-- ═══════════════════════════════════════════
local mainTab = win:CreateTab("Main")

mainTab:CreateLabel("Main")

mainTab:CreateToggle("Auto Collect", function(state)
    states.autoCollect = state
    task.spawn(function()
        while states.autoCollect do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local lootFolder = workspace:FindFirstChild("Loot")
            
            if hrp and lootFolder then
                -- Проходим по каждой модели в папке Loot
                for _, lootObject in ipairs(lootFolder:GetChildren()) do
                    if not states.autoCollect then break end
                    
                    -- Ищем MeshPart или BasePart с TouchInterest внутри объекта
                    local touchPart = nil
                    
                    -- Сначала ищем прямой MeshPart/BasePart с TouchInterest
                    for _, child in ipairs(lootObject:GetChildren()) do
                        if (child:IsA("MeshPart") or child:IsA("BasePart")) and child:FindFirstChild("TouchInterest") then
                            touchPart = child
                            break
                        end
                    end
                    
                    -- Если не нашли, ищем глубже (на случай вложенности)
                    if not touchPart then
                        local function findTouchPart(parent)
                            for _, child in ipairs(parent:GetChildren()) do
                                if (child:IsA("MeshPart") or child:IsA("BasePart")) and child:FindFirstChild("TouchInterest") then
                                    return child
                                end
                                if child:IsA("Model") or child:IsA("Folder") then
                                    local found = findTouchPart(child)
                                    if found then return found end
                                end
                            end
                            return nil
                        end
                        touchPart = findTouchPart(lootObject)
                    end
                    
                    -- Если нашли часть с TouchInterest - собираем
                    if touchPart then
                        local distance = (hrp.Position - touchPart.Position).Magnitude
                        if distance <= states.collectRadius then
                            pcall(function()
                                firetouchinterest(hrp, touchPart, 0)
                                task.wait()
                                firetouchinterest(hrp, touchPart, 1)
                            end)
                            task.wait(0.05)
                        end
                    end
                end
            end
            task.wait(0.2)
        end
    end)
end)

mainTab:CreateSlider("Collect Radius", 10, 200, states.collectRadius, function(value)
    states.collectRadius = value
end)

mainTab:CreateToggle("Auto Roll", function(state)
    states.autoRoll = state
    task.spawn(function()
        while states.autoRoll do
            if rollRE then rollRE:FireServer("requestRoll") end
            task.wait(0.1)
        end
    end)
end)

mainTab:CreateToggle("Auto Rebirth", function(state)
    states.autoRebirth = state
    task.spawn(function()
        while states.autoRebirth do
            if rebirthRF then rebirthRF:InvokeServer("requestRebirth") end
            task.wait(states.rebirthDelay)
        end
    end)
end)

mainTab:CreateSlider("Rebirth Delay (sec)", 5, 60, states.rebirthDelay, function(value)
    states.rebirthDelay = value
end)

mainTab:CreateLabel("Other")

mainTab:CreateToggle("Auto Equip Best", function(state)
    states.autoEquipBest = state
    task.spawn(function()
        while states.autoEquipBest do
            if inventoryRF then inventoryRF:InvokeServer("requestEquipBest") end
            task.wait(5)
        end
    end)
end)

mainTab:CreateToggle("Auto Buy Zone", function(state)
    states.autoBuyZone = state
    task.spawn(function()
        while states.autoBuyZone do
            if zonesRF then zonesRF:InvokeServer("requestPurchaseZone") end
            task.wait(2)
        end
    end)
end)

mainTab:CreateToggle("Auto Claim Index", function(state)
    states.autoClaimIndex = state
    task.spawn(function()
        while states.autoClaimIndex do
            for _, category in ipairs({"basic", "big", "huge", "shiny", "inverted"}) do
                if indexRF then indexRF:InvokeServer("requestClaimReward", category) end
                task.wait(0.2)
            end
            task.wait(10)
        end
    end)
end)

mainTab:CreateToggle("Auto Collect Recipe", function(state)
    states.autoCollectRecipe = state
    task.spawn(function()
        while states.autoCollectRecipe do
            local zones = workspace:FindFirstChild("Zones")
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            
            if zones and hrp then
                local originalCFrame = hrp.CFrame
                for i = 1, 25 do
                    if not states.autoCollectRecipe then break end
                    local zone = zones:FindFirstChild(tostring(i))
                    local recipe = zone and zone:FindFirstChild("Recipe")
                    local part = recipe and (recipe:FindFirstChild("MeshPart") or recipe:FindFirstChild("Part") or recipe)
                    
                    if part and part:IsA("BasePart") then
                        hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.3)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        task.wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        task.wait(0.3)
                    end
                end
                hrp.CFrame = originalCFrame
            end
            task.wait(30)
        end
    end)
end)

-- ═══════════════════════════════════════════
--  TAB: MISC
-- ═══════════════════════════════════════════
local miscTab = win:CreateTab("Misc")

miscTab:CreateLabel("Player")

miscTab:CreateSlider("WalkSpeed", 32, 300, states.walkSpeedValue, function(value)
    states.walkSpeedValue = value
end)

miscTab:CreateToggle("Anti Afk", function(state)
    states.antiAFK = state
    if state and not _G.AntiAfkActive then
        _G.AntiAfkActive = true
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            if states.antiAFK then
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end
        end)
    end
end)

miscTab:CreateLabel("Other")

miscTab:CreateButton("Redeem All Codes", function()
    if not codeRF then return end
    local codes = {"2muchluck", "test", "gullible"}
    for _, code in ipairs(codes) do
        pcall(function()
            codeRF:InvokeServer("redeem", code)
        end)
        task.wait(0.5)
    end
end)

-- ═══════════════════════════════════════════
--  TAB: CREDITS
-- ═══════════════════════════════════════════
local creditsTab = win:CreateTab("Credits")
creditsTab:CreateLabel("Creator: Powder")
creditsTab:CreateLabel("UI: Lu4ikk1")
creditsTab:CreateLabel("Thanks for using Cryo Hub!")

-- ═══════════════════════════════════════════
--  BACKGROUND SYSTEMS
-- ═══════════════════════════════════════════
task.spawn(function()
    while task.wait() do
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local humanoid = char and char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = states.walkSpeedValue
            end
        end)
    end
end)
