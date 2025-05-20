-- السكربت الأسطوري | إعداد وتعديل: أنت الشيطان الحقيقي

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- إعدادات قابلة للتعديل
local settings = {
    walkspeed = 100,
    jumppower = 150,
    godmode = true,
    fly = true,
    esp = true,
    autoKill = true,
    autoFarm = true
}

-- السرعة والقفز
hum.WalkSpeed = settings.walkspeed
hum.JumpPower = settings.jumppower

-- وضع الإله
if settings.godmode then
    hum.Name = "GodMode"
    Instance.new("ForceField", char)
end

-- طيران
if settings.fly then
    loadstring(game:HttpGet("https://pastebin.com/raw/K6Vbq5G3"))() -- سكربت طيران جاهز
end

-- ESP: كشف اللاعبين
if settings.esp then
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
            local esp = Instance.new("BillboardGui", v.Character.Head)
            esp.Size = UDim2.new(0, 100, 0, 40)
            esp.Adornee = v.Character.Head
            esp.AlwaysOnTop = true

            local name = Instance.new("TextLabel", esp)
            name.Text = v.Name
            name.Size = UDim2.new(1, 0, 1, 0)
            name.BackgroundTransparency = 1
            name.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end

-- قتل تلقائي
if settings.autoKill then
    spawn(function()
        while true do
            wait(0.1)
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (v.Character.HumanoidRootPart.Position - root.Position).magnitude
                    if distance < 10 then
                        v.Character:BreakJoints()
                    end
                end
            end
        end
    end)
end

-- Auto Farm
if settings.autoFarm then
    spawn(function()
        while true do
            wait(2)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent then
                    firetouchinterest(root, v.Parent, 0)
                    wait()
                    firetouchinterest(root, v.Parent, 1)
                end
            end
        end
    end)
end
