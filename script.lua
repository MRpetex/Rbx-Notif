local workspace = game.Workspace

local seaFolder = workspace:WaitForChild("SeaMonster")
local islandFolder = workspace:WaitForChild("Island")
local monsterFolder = workspace:WaitForChild("Monster")
local bossFolder = monsterFolder:WaitForChild("Boss")

-- 🔔 ALERT FUNCTION (F9 ONLY)
local function alert(msg)
    print("========== ALERT ==========")
    warn(msg)
    print("===========================")
end

-- 🔍 DETECT WHALE
local function detectWhale(child)
    if child.Name == "Whale Galleon Boss" and child:FindFirstChild("HumanoidRootPart") then
        alert("🐋 Whale Galleon Boss SPAWN!")
    end
end

-- 🔍 DETECT GALLEON
local function detectGalleon(child)
    if child.Name == "Galleon Boss" then
        alert("🚢 Galleon Boss SPAWN!")
    end
end

-- 🔍 DETECT KRAKEN GALLEON
local function detectKraken(child)
    if child.Name == "Kraken Galleon Boss" then
        alert("🐙 Kraken Galleon Boss SPAWN!")
    end
end

-- 🔍 DETECT SEADRAGON
local function detectSeaDragon(child)
    if string.find(child.Name, "SeaDragon") then
        alert("🐉 SeaDragon SPAWN!")
    end
end

-- 🔍 DETECT CRAB
local function detectCrab(child)
    if string.find(child.Name, "Eldritch") or string.find(child.Name, "Crab") then
        alert("🦀 ThirdSeaEldritch Crab SPAWN!")
    end
end

-- 🔍 DETECT DEMON
local function detectDemon(child)
    if child.Name == "Demon Island" then
        alert("🏝️ Demon Island SPAWN!")
    end
end

-- 🔍 DETECT ANGEL
local function detectAngel(child)
    if child.Name == "Angel Island" then
        alert("😇 Angel Island SPAWN!")
    end
end

-- 🔍 DETECT ANIMAL
local function detectAnimal(child)
    if child.Name == "Animal Island" then
        alert("🐾 Animal Island SPAWN!")
    end
end

-- 🔍 DETECT SABER
local function detectSaber(child)
    if child.Name == "Lord of Saber [Lv. 8500]" then
        alert("⚔️ Lord of Saber [Lv. 8500] SPAWN!")
    end
end

-- 🔍 CEK AWAL (ANTI MISS)
for _,v in pairs(seaFolder:GetChildren()) do
    detectWhale(v)
    detectGalleon(v)
    detectKraken(v)
    detectSeaDragon(v)
    detectCrab(v)
end

for _,v in pairs(islandFolder:GetChildren()) do
    detectDemon(v)
    detectAngel(v)
    detectAnimal(v)
end

for _,v in pairs(bossFolder:GetChildren()) do
    detectSaber(v)
end

-- 🚩 DETEKSI REALTIME
seaFolder.ChildAdded:Connect(function(child)
    detectWhale(child)
    detectGalleon(child)
    detectKraken(child)
    detectSeaDragon(child)
    detectCrab(child)
end)

islandFolder.ChildAdded:Connect(function(child)
    detectDemon(child)
    detectAngel(child)
    detectAnimal(child)
end)

bossFolder.ChildAdded:Connect(function(child)
    detectSaber(child)
end)
