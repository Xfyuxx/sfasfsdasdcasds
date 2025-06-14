-- UI Loader
local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Librarys/refs/heads/main/Finity%20UI%20Lib"))()
local UI = Finity.new(true)
UI.ChangeToggleKey(Enum.KeyCode.RightShift) -- Bisa toggle pake tombol

local Category = UI:Category("🔥 Climb & Jump Tower")
local Main = Category:Sector("⚙️ Auto Farm Tools")
local Tele = Category:Sector("🚀 Teleports")
local Util = Category:Sector("🧩 Utilities")

-- 🧠 Auto Climb
Main:Cheat("Toggle", "🔁 Auto Climb & Jump", function(state)
    _G.AutoClimb = state
    while _G.AutoClimb do
        task.wait(0.1)
        local hum = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if hum and hum.MoveDirection.Magnitude < 0.1 then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- 🐦 Auto Pet Collector (misal ada pet/wings button trigger)
Main:Cheat("Toggle", "🐣 Auto Collect Pets/Wings", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do
        task.wait(0.5)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") and v.Parent:IsA("Part") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)

-- 🚀 Teleport to top
Tele:Cheat("Button", "🚀 Teleport ke Puncak", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 9999, 0)) -- Ubah posisi sesuai map
end)

-- 🧭 Teleport ke checkpoint
Tele:Cheat("Button", "🧱 Ke Checkpoint Bawah", function()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 10, 0))
end)

-- 💤 Anti-AFK
Util:Cheat("Button", "🛡️ Anti AFK", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- ❌ Hapus GUI
Util:Cheat("Button", "❌ Tutup GUI", function()
    for _, v in pairs(game.CoreGui:GetChildren()) do
        if v.Name:find("FinityUI") then
            v:Destroy()
        end
    end
end)
