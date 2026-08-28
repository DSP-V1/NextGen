local aa = game:GetService("Players")
local ab = game:GetService("CoreGui")
local ac = game:GetService("TweenService")
local ad = game:GetService("UserInputService")
local ae = game:GetService("RunService")
local af = game:GetService("VirtualUser")

local ag = aa.LocalPlayer
local ah = ag:WaitForChild("PlayerGui")

local ai = true
local aj = os.time()
local ak = 0
local al = false

local am = Instance.new("ScreenGui")
am.Name = "NextGen_AntiAFK"
am.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
am.ResetOnSpawn = false

if getgenv then
	am.Parent = ab
else
	am.Parent = ah
end

local an = Instance.new("Frame")
an.Name = "MainFrame"
an.Size = UDim2.new(0, 300, 0, 180)
an.Position = UDim2.new(0.5, -150, 0.4, -90)
an.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
an.BorderSizePixel = 0
an.Active = true
an.Draggable = true
an.ClipsDescendants = true
an.Parent = am

local ao = Instance.new("UICorner")
ao.CornerRadius = UDim.new(0, 10)
ao.Parent = an

local ap = Instance.new("UIStroke")
ap.Thickness = 2
ap.Color = Color3.fromRGB(138, 43, 226)
ap.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ap.Parent = an

local aq = Instance.new("Frame")
aq.Name = "TitleBar"
aq.Size = UDim2.new(1, 0, 0, 35)
aq.BackgroundColor3 = Color3.fromRGB(35, 20, 55)
aq.BorderSizePixel = 0
aq.Parent = an

local ar = Instance.new("UICorner")
ar.CornerRadius = UDim.new(0, 10)
ar.Parent = aq

local as = Instance.new("TextLabel")
as.Name = "TitleLabel"
as.Size = UDim2.new(1, -70, 1, 0)
as.Position = UDim2.new(0, 10, 0, 0)
as.BackgroundTransparency = 1
as.Text = "NextGen Anti-AFK"
as.TextColor3 = Color3.fromRGB(255, 255, 255)
as.TextSize = 14
as.Font = Enum.Font.GothamBold
as.TextXAlignment = Enum.TextXAlignment.Left
as.Parent = aq

local at = Instance.new("Frame")
at.Name = "ContentFrame"
at.Size = UDim2.new(1, 0, 1, -35)
at.Position = UDim2.new(0, 0, 0, 35)
at.BackgroundTransparency = 1
at.Parent = an

local au = Instance.new("TextLabel")
au.Name = "StatusLabel"
au.Size = UDim2.new(1, 0, 0, 30)
au.Position = UDim2.new(0, 0, 0, 10)
au.BackgroundTransparency = 1
au.Text = "STATUS: ACTIVE"
au.TextColor3 = Color3.fromRGB(186, 85, 211)
au.TextSize = 16
au.Font = Enum.Font.GothamSemibold
au.Parent = at

local av = Instance.new("TextLabel")
av.Name = "TimerLabel"
av.Size = UDim2.new(1, 0, 0, 20)
av.Position = UDim2.new(0, 0, 0, 40)
av.BackgroundTransparency = 1
av.Text = "Uptime: 00:00:00"
av.TextColor3 = Color3.fromRGB(220, 200, 240)
av.TextSize = 14
av.Font = Enum.Font.Gotham
av.Parent = at

local aw = Instance.new("TextLabel")
aw.Name = "CounterLabel"
aw.Size = UDim2.new(1, 0, 0, 20)
aw.Position = UDim2.new(0, 0, 0, 60)
aw.BackgroundTransparency = 1
aw.Text = "Prevented Kicks: 0"
aw.TextColor3 = Color3.fromRGB(220, 200, 240)
aw.TextSize = 14
aw.Font = Enum.Font.Gotham
aw.Parent = at

local ax = Instance.new("TextButton")
ax.Name = "ToggleButton"
ax.Size = UDim2.new(0, 200, 0, 35)
ax.Position = UDim2.new(0.5, -100, 1, -45)
ax.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ax.Text = "DISABLE"
ax.TextColor3 = Color3.fromRGB(255, 255, 255)
ax.Font = Enum.Font.GothamBold
ax.TextSize = 14
ax.Parent = at

local ay = Instance.new("UICorner")
ay.CornerRadius = UDim.new(0, 6)
ay.Parent = ax

local az = Instance.new("TextButton")
az.Name = "MinimizeButton"
az.Size = UDim2.new(0, 30, 0, 30)
az.Position = UDim2.new(1, -65, 0, 2)
az.BackgroundTransparency = 1
az.Text = "-"
az.TextColor3 = Color3.fromRGB(255, 255, 255)
az.TextSize = 20
az.Font = Enum.Font.GothamBold
az.Parent = aq

local ba = Instance.new("TextButton")
ba.Name = "CloseButton"
ba.Size = UDim2.new(0, 30, 0, 30)
ba.Position = UDim2.new(1, -35, 0, 2)
ba.BackgroundTransparency = 1
ba.Text = "×"
ba.TextColor3 = Color3.fromRGB(255, 255, 255)
ba.TextSize = 24
ba.Font = Enum.Font.Gotham
ba.Parent = aq

local bb = Instance.new("Frame")
bb.Size = UDim2.new(1, -20, 0, 1)
bb.Position = UDim2.new(0, 10, 0, 34)
bb.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
bb.BorderSizePixel = 0
bb.Parent = an

local function bc(bd)
	local be = math.floor(bd / 3600)
	local bf = math.floor((bd % 3600) / 60)
	local bg = bd % 60
	return string.format("%02d:%02d:%02d", be, bf, bg)
end

local function bh()
	local bi = os.time()
	local bj = bi - aj
	av.Text = "Uptime: " .. bc(bj)
	aw.Text = "Prevented Kicks: " .. tostring(ak)
end

local function bk()
	ai = not ai
	if ai then
		ax.Text = "DISABLE"
		ax.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
		au.Text = "STATUS: ACTIVE"
		au.TextColor3 = Color3.fromRGB(186, 85, 211)
	else
		ax.Text = "ENABLE"
		ax.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
		au.Text = "STATUS: DISABLED"
		au.TextColor3 = Color3.fromRGB(150, 120, 170)
	end
end

ax.MouseButton1Click:Connect(bk)

az.MouseButton1Click:Connect(function()
	al = not al
	local bl = al and UDim2.new(0, 300, 0, 35) or UDim2.new(0, 300, 0, 180)
	ac:Create(an, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = bl}):Play()
	az.Text = al and "+" or "-"
end)

ba.MouseButton1Click:Connect(function()
	am:Destroy()
end)

ag.Idled:Connect(function()
	if ai then
		af:CaptureController()
		af:ClickButton2(Vector2.new())
		ak = ak + 1
		local bm = ac:Create(an, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {BackgroundColor3 = Color3.fromRGB(50, 20, 80)})
		bm:Play()
	end
end)

task.spawn(function()
	while task.wait(1) do
		bh()
	end
end)

task.spawn(function()
	pcall(function()
		for _, bn in pairs(getconnections(ag.Idled)) do
			bn:Disable()
		end
	end)
end)
