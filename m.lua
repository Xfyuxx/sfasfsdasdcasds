-- ✅ Finity UI Loader
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/fPPG7xRe"))()
local FinityWindow = Library.new(true, "👑 Climb & Jump Tower - Finity UI", UDim2.new(0, 500, 0, 400))
local Tab = FinityWindow:CreateTab("📜 Main Menu")
local Section = Tab:CreateSection("⚙️ Features")

-- 🔄 Auto Climb & Jump
local AutoClimb = false
Section:CreateToggle("🔁 Auto Climb & Jump", false, function(state)
	AutoClimb = state
	while AutoClimb do
		task.wait(0.1)
		local h = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		if h and h.MoveDirection.Magnitude < 0.1 then
			h:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- 🚀 Teleport ke Puncak
Section:CreateButton("🚀 Teleport ke Puncak", function()
	local char = game.Players.LocalPlayer.Character
	if char then
		char:MoveTo(Vector3.new(0, 9999, 0)) -- Ganti kalau koordinat beda
	end
end)

-- 💤 Anti-AFK
Section:CreateButton("🛡️ Aktifkan Anti-AFK", function()
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
	end)
end)

-- ❌ Tutup GUI
Section:CreateButton("❌ Hapus GUI", function()
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if v.Name:find("FinityUI") then
			v:Destroy()
		end
	end
end)
