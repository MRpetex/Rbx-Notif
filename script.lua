local workspace = game.Workspace
local players = game:GetService("Players")
local runService = game:GetService("RunService")

local localPlayer = players.LocalPlayer

local seaFolder = workspace:WaitForChild("SeaMonster")
local islandFolder = workspace:WaitForChild("Island")
local monsterFolder = workspace:WaitForChild("Monster")
local bossFolder = monsterFolder:WaitForChild("Boss")

-- 🔔 ALERT FUNCTION
local function alert(msg)
    print("========== ALERT ==========")
    warn(msg)
    print("===========================")
end

-- 👁️ ESP FUNCTION
local function createESP(obj)
    if not obj or not obj:FindFirstChild("HumanoidRootPart") then return end
    if obj:FindFirstChild("ESP_Added") then return end

    -- tag biar ga double
    local tag = Instance.new("BoolValue")
    tag.Name = "ESP_Added"
    tag.Parent = obj

    -- 🔲 Highlight putih
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255,255,255)
    highlight.OutlineColor = Color3.fromRGB(255,255,255)
    highlight.FillTransparency = 0.5
    highlight.Parent = obj

    -- 🏷️ Billboard GUI (Nama + Jarak)
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0,200,0,50)
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0,3,0)
    billboard.Parent = obj:FindFirstChild("HumanoidRootPart")

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.TextStrokeTransparency = 0
    text.TextScaled = true
    text.Font = Enum.Font.SourceSansBold
    text.Parent = billboard

    -- 🔄 Update jarak realtime
    runService.RenderStepped:Connect(function()
        if obj and obj.Parent and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (localPlayer.Character.HumanoidRootPart.Position - obj.HumanoidRootPart.Position).Magnitude
            text.Text = obj.Name .. " [" .. math.floor(dist) .. " Stud]"
        end
    end)
end

-- 🔍 DETECTION FUNCTION UMUM
local function detect(child)
    -- SEA MONSTER
    if child.Name == "Whale Galleon Boss" then
        alert("🐋 Whale Galleon Boss SPAWN!")
        createESP(child)
    elseif child.Name == "Galleon Boss" then
        alert("🚢 Galleon Boss SPAWN!")
        createESP(child)
    elseif child.Name == "Kraken Galleon Boss" then
        alert("🐙 Kraken Galleon Boss SPAWN!")
        createESP(child)
    elseif child.Name == "Shark Galleon Boss" then
        alert("🦈 Shark Galleon Boss SPAWN!")
        createESP(child)
    elseif child.Name == "Ghost Galleon Boss" then
        alert("👻 Ghost Galleon Boss SPAWN!")
        createESP(child)
    elseif string.find(child.Name, "SeaDragon") then
        alert("🐉 SeaDragon SPAWN!")
        createESP(child)
    elseif string.find(child.Name, "Eldritch") or string.find(child.Name, "Crab") then
        alert("🦀 ThirdSeaEldritch Crab SPAWN!")
        createESP(child)
    end

    -- ISLAND
    if child.Name == "Demon Island" then
        alert("🏝️ Demon Island SPAWN!")
        createESP(child)
    elseif child.Name == "Angel Island" then
        alert("😇 Angel Island SPAWN!")
        createESP(child)
    elseif child.Name == "Animal Island" then
        alert("🐾 Animal Island SPAWN!")
        createESP(child)
    elseif child.Name == "Fish Island" then
        alert("🐟 Fish Island SPAWN!")
        createESP(child)
    elseif child.Name == "SeaKing Island" then
        alert("🐟 SeaKing Island SPAWN!")
        createESP(child)
    end

    -- BOSS
    if child.Name == "Lord of Saber [Lv. 8500]" then
        alert("⚔️ Lord of Saber SPAWN!")
        createESP(child)
    end
end

-- 🔍 CEK AWAL
for _,v in pairs(seaFolder:GetChildren()) do detect(v) end
for _,v in pairs(islandFolder:GetChildren()) do detect(v) end
for _,v in pairs(bossFolder:GetChildren()) do detect(v) end

-- 🚩 REALTIME
seaFolder.ChildAdded:Connect(detect)
islandFolder.ChildAdded:Connect(detect)
bossFolder.ChildAdded:Connect(detect)
