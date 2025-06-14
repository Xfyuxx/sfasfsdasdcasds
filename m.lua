--// 🛠️ GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "SultanUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 220)
Frame.Position = UDim2.new(0.5, -150, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

local function makeButton(text, posY, callback)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.MouseButton1Click:Connect(callback)
end

--// 🔄 Auto Climb & Jump
local autoClimb = false
makeButton("🔁 Toggle Auto Climb", 10, function()
	autoClimb = not autoClimb
	while autoClimb do
		task.wait(0.1)
		local h = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		if h and h.MoveDirection.Magnitude < 0.1 then
			h:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

--// 🚀 Teleport ke Puncak
makeButton("🚀 Teleport ke Puncak", 60, function()
	local char = game.Players.LocalPlayer.Character
	if char then
		char:MoveTo(Vector3.new(0, 9999, 0)) -- Ganti kalau koordinat beda
	end
end)

--// 💤 Anti-AFK
makeButton("🛡️ Aktifkan Anti-AFK", 110, function()
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
end)

--// ❌ Hapus GUI
makeButton("❌ Tutup GUI", 160, function()
	ScreenGui:Destroy()
end)
