-- 🔰 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- 🪟 Create UI Window
local Window = Rayfield:CreateWindow({
	Name = "🗼 Climb & Jump - GG SULTAN UI",
	LoadingTitle = "GG SULTAN MODE",
	LoadingSubtitle = "by Keenn & ChatGPT 😎",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "TowerSultanSettings"
	},
})

-- 🎮 Main Tab
local MainTab = Window:CreateTab("🎮 Main", 4483362458)

-- ⛰️ Auto Climb & Jump
MainTab:CreateToggle({
	Name = "Auto Climb & Jump",
	CurrentValue = false,
	Callback = function(Value)
		_G.AutoClimb = Value
		while _G.AutoClimb do
			task.wait(0.1)
			local h = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			if h and h.MoveDirection.Magnitude < 0.1 then
				h:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end,
})

-- 🚀 Teleport ke Puncak
MainTab:CreateButton({
	Name = "Teleport ke Puncak",
	Callback = function()
		local char = game.Players.LocalPlayer.Character
		if char then
			char:MoveTo(Vector3.new(0, 9999, 0)) -- Ganti Y sesuai map kalau perlu
		end
	end,
})

-- 🛡️ Anti-AFK
MainTab:CreateButton({
	Name = "Aktifkan Anti-AFK",
	Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			task.wait(1)
			vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		end)
	end,
})

-- 📊 Stats Tracker
MainTab:CreateParagraph({
	Title = "📊 Live Stats",
	Content = "Wins & Coins tampil di bawah!"
})

local statsLabel = MainTab:CreateParagraph({
	Title = "🎯 Current Status",
	Content = "Loading..."
})

task.spawn(function()
	while true do
		task.wait(1)
		local stats = game.Players.LocalPlayer:FindFirstChild("leaderstats")
		if stats then
			local coins = stats:FindFirstChild("Coins")
			local wins = stats:FindFirstChild("Wins")
			statsLabel:Set("🪙 Coins: " .. (coins and coins.Value or "?") ..
			              "\n🏆 Wins: " .. (wins and wins.Value or "?"))
		end
	end
end)

-- 🧰 Toggle UI Visibility with RightShift
local UIS = game:GetService("UserInputService")
local UIVisible = true

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.RightShift and not gameProcessed then
		UIVisible = not UIVisible
		for _, gui in pairs(game.CoreGui:GetChildren()) do
			if gui.Name:find("Rayfield") then
				gui.Enabled = UIVisible
			end
		end
	end
end)
