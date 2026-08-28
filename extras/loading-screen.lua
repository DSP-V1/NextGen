local a = game:GetService("Players")
local b = game:GetService("TweenService")
local c = game:GetService("RunService")
local a = a.LocalPlayer;
local d = Color3.fromRGB(0, 0, 0)
local e = Color3.fromRGB(75, 0, 130)
local f = Color3.fromRGB(138, 43, 226)
local g = Color3.fromRGB(186, 85, 211)
local h = Color3.fromRGB(200, 180, 220)
local i = Color3.fromRGB(15, 10, 25)
local j = Instance.new("ScreenGui")
j.Name = "NextGenLoadingScreen";
j.IgnoreGuiInset = true;
j.ResetOnSpawn = false;
j.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
j.Parent = a:WaitForChild("PlayerGui")
local a = Instance.new("Frame")
a.Name = "Background";
a.Size = UDim2.new(1, 0, 1, 0)
a.Position = UDim2.new(0, 0, 0, 0)
a.BackgroundColor3 = d;
a.BorderSizePixel = 0;
a.Parent = j;
local d = Instance.new("Frame")
d.Name = "GridPattern";
d.Size = UDim2.new(1, 0, 1, 0)
d.BackgroundTransparency = 1;
d.ClipsDescendants = true;
d.Parent = a;
for a = 1, 40 do
	local b = Instance.new("Frame")
	b.Size = UDim2.new(1, 0, 0, 1)
	b.Position = UDim2.new(0, 0, a / 40, 0)
	b.BackgroundColor3 = i;
	b.BorderSizePixel = 0;
	b.Parent = d;
	local b = Instance.new("Frame")
	b.Size = UDim2.new(0, 1, 1, 0)
	b.Position = UDim2.new(a / 40, 0, 0, 0)
	b.BackgroundColor3 = i;
	b.BorderSizePixel = 0;
	b.Parent = d
end;
local d = Instance.new("Folder")
d.Name = "FloatingParticles";
d.Parent = a;
for a = 1, 25 do
	local a = Instance.new("Frame")
	a.Size = UDim2.new(0, math.random(3, 7), 0, math.random(3, 7))
	a.Position = UDim2.new(math.random(), 0, math.random(), 0)
	a.BackgroundColor3 = f;
	a.BackgroundTransparency = math.random(30, 80) / 100;
	a.Rotation = math.random(0, 360)
	a.BorderSizePixel = 0;
	a.Parent = d;
	local b = Instance.new("UICorner")
	b.CornerRadius = UDim.new(1, 0)
	b.Parent = a
end;
local i = Instance.new("Frame")
i.Name = "CenterContainer";
i.Size = UDim2.new(0.7, 0, 0.5, 0)
i.Position = UDim2.new(0.5, 0, 0.5, 0)
i.AnchorPoint = Vector2.new(0.5, 0.5)
i.BackgroundTransparency = 1;
i.Parent = a;
local k = Instance.new("TextLabel")
k.Name = "Title";
k.Size = UDim2.new(1, 0, 0.35, 0)
k.Position = UDim2.new(0, 0, 0.05, 0)
k.BackgroundTransparency = 1;
k.Text = "N E X T G E N";
k.TextColor3 = Color3.fromRGB(255, 255, 255)
k.Font = Enum.Font.GothamBlack;
k.TextScaled = true;
k.Parent = i;
local l = Instance.new("UITextSizeConstraint")
l.MaxTextSize = 120;
l.Parent = k;
local l = Instance.new("UIStroke")
l.Color = f;
l.Thickness = 3;
l.Transparency = 0.2;
l.Parent = k;
local k = Instance.new("TextLabel")
k.Name = "Subtitle";
k.Size = UDim2.new(1, 0, 0.1, 0)
k.Position = UDim2.new(0, 0, 0.45, 0)
k.BackgroundTransparency = 1;
k.Text = "INITIALIZING CORE SYSTEMS...";
k.TextColor3 = h;
k.Font = Enum.Font.Code;
k.TextScaled = true;
k.Parent = i;
local h = Instance.new("UITextSizeConstraint")
h.MaxTextSize = 22;
h.Parent = k;
local h = Instance.new("Frame")
h.Name = "DecorativeLineLeft";
h.Size = UDim2.new(0.3, 0, 0.008, 0)
h.Position = UDim2.new(0.05, 0, 0.6, 0)
h.BackgroundColor3 = f;
h.BorderSizePixel = 0;
h.Parent = i;
local m = Instance.new("UIGradient")
m.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0)
}
m.Parent = h;
local h = Instance.new("Frame")
h.Name = "DecorativeLineRight";
h.Size = UDim2.new(0.3, 0, 0.008, 0)
h.Position = UDim2.new(0.65, 0, 0.6, 0)
h.BackgroundColor3 = f;
h.BorderSizePixel = 0;
h.Parent = i;
local m = Instance.new("UIGradient")
m.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 1)
}
m.Parent = h;
local h = Instance.new("Frame")
h.Name = "LoadingBarContainer";
h.Size = UDim2.new(0.9, 0, 0.05, 0)
h.Position = UDim2.new(0.05, 0, 0.7, 0)
h.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
h.BorderSizePixel = 0;
h.ClipsDescendants = true;
h.Parent = i;
local m = Instance.new("UICorner")
m.CornerRadius = UDim.new(1, 0)
m.Parent = h;
local m = Instance.new("UIStroke")
m.Color = e;
m.Thickness = 2;
m.Transparency = 0.3;
m.Parent = h;
local m = Instance.new("Frame")
m.Name = "LoadingBarFill";
m.Size = UDim2.new(0, 0, 1, 0)
m.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
m.BorderSizePixel = 0;
m.Parent = h;
local h = Instance.new("UICorner")
h.CornerRadius = UDim.new(1, 0)
h.Parent = m;
local h = Instance.new("UIGradient")
h.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, e),
	ColorSequenceKeypoint.new(0.5, f),
	ColorSequenceKeypoint.new(1, g)
}
h.Parent = m;
local e = Instance.new("TextLabel")
e.Name = "PercentageText";
e.Size = UDim2.new(1, 0, 0.15, 0)
e.Position = UDim2.new(0, 0, 0.8, 0)
e.BackgroundTransparency = 1;
e.Text = "0%";
e.TextColor3 = g;
e.Font = Enum.Font.Code;
e.TextScaled = true;
e.Parent = i;
local f = Instance.new("UITextSizeConstraint")
f.MaxTextSize = 26;
f.Parent = e;
b:Create(l, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, - 1, true), {
	Transparency = 0.6,
	Thickness = 5
}):Play()
local f;
f = c.RenderStepped:Connect(function()
	for a, a in ipairs(d:GetChildren()) do
		a.Position = a.Position + UDim2.new(0, 0, - 0.0008, 0)
		a.Rotation = a.Rotation + 0.5;
		if a.Position.Y.Scale < - 0.1 then
			a.Position = UDim2.new(math.random(), 0, 1.1, 0)
		end
	end
end)
local d = 10;
local g = {
	"INITIALIZING CORE SYSTEMS...",
	"CONNECTING TO NEURAL NET...",
	"ALLOCATING VIRTUAL MEMORY...",
	"ESTABLISHING SECURE UPLINK...",
	"DECRYPTING GRAPHIC ASSETS...",
	"OPTIMIZING SHADERS...",
	"RENDERING WORLD GEOMETRY...",
	"FINALIZING ENGINE STATE..."
}
task.spawn(function()
	local h = tick()
	local i = 1;
	while true do
		local a = tick() - h;
		local a = math.clamp(a / d, 0, 1)
		b:Create(m, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(a, 0, 1, 0)
		}):Play()
		e.Text = tostring(math.floor(a * 100)) .. "%";
		local b = math.clamp(math.floor(a * # g) + 1, 1, # g)
		if b ~= i then
			i = b;
			k.Text = g[b]
		end;
		if a >= 1 then
			break
		end;
		c.RenderStepped:Wait()
	end;
	k.Text = "ACCESS GRANTED";
	e.Text = "100%";
	task.wait(0.5)
	if f then
		f:Disconnect()
	end;
	local c = TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	for a, a in ipairs(a:GetDescendants()) do
		if a:IsA("TextLabel") then
			b:Create(a, c, {
				TextTransparency = 1,
				TextStrokeTransparency = 1
			}):Play()
		elseif a:IsA("Frame") then
			b:Create(a, c, {
				BackgroundTransparency = 1
			}):Play()
		elseif a:IsA("UIStroke") then
			b:Create(a, c, {
				Transparency = 1
			}):Play()
		end
	end;
	local a = b:Create(a, c, {
		BackgroundTransparency = 1
	})
	a:Play()
	a.Completed:Wait()
	j:Destroy()
end)
