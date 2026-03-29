local a = game:GetService("Players")
local b = game:GetService("TweenService")
local c = game:GetService("RunService")
local d = a.LocalPlayer
local e = Instance.new("ScreenGui")
e.Name = "NextGenLoadingScreen"
e.IgnoreGuiInset = true
e.ResetOnSpawn = false
e.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
e.Parent = d:WaitForChild("PlayerGui")
local f = Instance.new("Frame")
f.Name = "Background"
f.Size = UDim2.new(1, 0, 1, 0)
f.Position = UDim2.new(0, 0, 0, 0)
f.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
f.BorderSizePixel = 0
f.Parent = e
local g = Instance.new("Frame")
g.Name = "GridPattern"
g.Size = UDim2.new(1, 0, 1, 0)
g.BackgroundTransparency = 1
g.ClipsDescendants = true
g.Parent = f
for h = 1, 40 do
    local i = Instance.new("Frame")
    i.Size = UDim2.new(1, 0, 0, 1)
    i.Position = UDim2.new(0, 0, h / 40, 0)
    i.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    i.BorderSizePixel = 0
    i.Parent = g
    local j = Instance.new("Frame")
    j.Size = UDim2.new(0, 1, 1, 0)
    j.Position = UDim2.new(h / 40, 0, 0, 0)
    j.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    j.BorderSizePixel = 0
    j.Parent = g
end
local k = Instance.new("Frame")
k.Name = "CenterContainer"
k.Size = UDim2.new(0.7, 0, 0.5, 0)
k.Position = UDim2.new(0.5, 0, 0.5, 0)
k.AnchorPoint = Vector2.new(0.5, 0.5)
k.BackgroundTransparency = 1
k.Parent = f
local l = Instance.new("TextLabel")
l.Name = "Title"
l.Size = UDim2.new(1, 0, 0.35, 0)
l.Position = UDim2.new(0, 0, 0.05, 0)
l.BackgroundTransparency = 1
l.Text = "N E X T G E N"
l.TextColor3 = Color3.fromRGB(255, 255, 255)
l.Font = Enum.Font.GothamBlack
l.TextScaled = true
l.Parent = k
local m = Instance.new("UITextSizeConstraint")
m.MaxTextSize = 120
m.Parent = l
local n = Instance.new("UIStroke")
n.Color = Color3.fromRGB(0, 255, 255)
n.Thickness = 3
n.Transparency = 0.2
n.Parent = l
local o = Instance.new("TextLabel")
o.Name = "TitleGlitch"
o.Size = UDim2.new(1, 0, 1, 0)
o.Position = UDim2.new(0.01, 0, 0.01, 0)
o.BackgroundTransparency = 1
o.Text = "N E X T G E N"
o.TextColor3 = Color3.fromRGB(255, 0, 128)
o.Font = Enum.Font.GothamBlack
o.TextScaled = true
o.TextTransparency = 0.5
o.ZIndex = 0
o.Parent = l
local p = Instance.new("TextLabel")
p.Name = "TitleGlitch2"
p.Size = UDim2.new(1, 0, 1, 0)
p.Position = UDim2.new(-0.01, 0, -0.01, 0)
p.BackgroundTransparency = 1
p.Text = "N E X T G E N"
p.TextColor3 = Color3.fromRGB(0, 255, 255)
p.Font = Enum.Font.GothamBlack
p.TextScaled = true
p.TextTransparency = 0.5
p.ZIndex = 0
p.Parent = l
local q = Instance.new("TextLabel")
q.Name = "Subtitle"
q.Size = UDim2.new(1, 0, 0.1, 0)
q.Position = UDim2.new(0, 0, 0.45, 0)
q.BackgroundTransparency = 1
q.Text = "INITIALIZING CORE SYSTEMS"
q.TextColor3 = Color3.fromRGB(180, 180, 220)
q.Font = Enum.Font.Code
q.TextScaled = true
q.Parent = k
local r = Instance.new("UITextSizeConstraint")
r.MaxTextSize = 25
r.Parent = q
local s = Instance.new("Frame")
s.Name = "LoadingBarContainer"
s.Size = UDim2.new(0.9, 0, 0.06, 0)
s.Position = UDim2.new(0.05, 0, 0.7, 0)
s.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
s.BorderSizePixel = 0
s.ClipsDescendants = true
s.Parent = k
local t = Instance.new("UICorner")
t.CornerRadius = UDim.new(1, 0)
t.Parent = s
local u = Instance.new("UIStroke")
u.Color = Color3.fromRGB(0, 255, 255)
u.Thickness = 2
u.Transparency = 0.4
u.Parent = s
local v = Instance.new("Frame")
v.Name = "LoadingBarFill"
v.Size = UDim2.new(0, 0, 1, 0)
v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v.BorderSizePixel = 0
v.Parent = s
local w = Instance.new("UICorner")
w.CornerRadius = UDim.new(1, 0)
w.Parent = v
local x = Instance.new("UIGradient")
x.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 43, 226)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))}
x.Parent = v
local y = Instance.new("Frame")
y.Name = "GlowEffect"
y.Size = UDim2.new(1, 0, 1, 0)
y.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
y.BackgroundTransparency = 0.5
y.BorderSizePixel = 0
y.Parent = v
local z = Instance.new("UIGradient")
z.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)}
z.Parent = y
local aa = Instance.new("TextLabel")
aa.Name = "PercentageText"
aa.Size = UDim2.new(1, 0, 0.15, 0)
aa.Position = UDim2.new(0, 0, 0.8, 0)
aa.BackgroundTransparency = 1
aa.Text = "0%"
aa.TextColor3 = Color3.fromRGB(0, 255, 255)
aa.Font = Enum.Font.Code
aa.TextScaled = true
aa.Parent = k
local ab = Instance.new("UITextSizeConstraint")
ab.MaxTextSize = 28
ab.Parent = aa
local ac = Instance.new("Frame")
ac.Name = "DecorativeLineLeft"
ac.Size = UDim2.new(0.3, 0, 0.01, 0)
ac.Position = UDim2.new(0.05, 0, 0.6, 0)
ac.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ac.BorderSizePixel = 0
ac.Parent = k
local ad = Instance.new("UIGradient")
ad.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)}
ad.Parent = ac
local ae = Instance.new("Frame")
ae.Name = "DecorativeLineRight"
ae.Size = UDim2.new(0.3, 0, 0.01, 0)
ae.Position = UDim2.new(0.65, 0, 0.6, 0)
ae.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ae.BorderSizePixel = 0
ae.Parent = k
local af = Instance.new("UIGradient")
af.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}
af.Parent = ae
local ag = Instance.new("Frame")
ag.Name = "Scanline"
ag.Size = UDim2.new(1, 0, 0.02, 0)
ag.Position = UDim2.new(0, 0, -0.02, 0)
ag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ag.BackgroundTransparency = 0.8
ag.BorderSizePixel = 0
ag.Parent = f
local ah = Instance.new("UIGradient")
ah.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)}
ah.Parent = ag
local ai = Instance.new("Folder")
ai.Name = "FloatingParticles"
ai.Parent = f
for aj = 1, 20 do
    local ak = Instance.new("Frame")
    ak.Size = UDim2.new(0, math.random(3, 8), 0, math.random(3, 8))
    ak.Position = UDim2.new(math.random(), 0, math.random(), 0)
    ak.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    ak.BackgroundTransparency = math.random(20, 80) / 100
    ak.Rotation = math.random(0, 360)
    ak.BorderSizePixel = 0
    ak.Parent = ai
    local al = Instance.new("UICorner")
    al.CornerRadius = UDim.new(1, 0)
    al.Parent = ak
end
b:Create(ag, TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Position = UDim2.new(0, 0, 1, 0)}):Play()
local am = 0
c.RenderStepped:Connect(function(an)
    am = am + an
    o.Position = UDim2.new(0.01 + math.sin(am * 20) * 0.005, 0, 0.01 + math.cos(am * 15) * 0.005, 0)
    p.Position = UDim2.new(-0.01 + math.cos(am * 18) * 0.005, 0, -0.01 + math.sin(am * 22) * 0.005, 0)
    z.Offset = Vector2.new((am * 0.5) % 1, 0)
    for ao, ap in pairs(ai:GetChildren()) do
        ap.Position = ap.Position + UDim2.new(0, 0, -0.001, 0)
        ap.Rotation = ap.Rotation + 1
        if ap.Position.Y.Scale < -0.1 then
            ap.Position = UDim2.new(math.random(), 0, 1.1, 0)
        end
    end
end)
local aq = 0
local ar = {"INITIALIZING CORE SYSTEMS...", "CONNECTING TO NEURAL NET...", "ALLOCATING VIRTUAL MEMORY...", "ESTABLISHING UPLINK...", "DECRYPTING ASSETS...", "RENDERING GEOMETRY...", "LOADING NEXTGEN ENGINE...", "SYSTEMS NOMINAL."}
local as = 1
local at = tick()
local au
au = c.RenderStepped:Connect(function()
    if tick() - at > 1.2 then
        at = tick()
        as = as + 1
        if as > #ar then as = #ar end
        q.Text = ar[as]
    end
    if aq < 100 then
        aq = aq + math.random(5, 20) / 100
        if aq > 100 then aq = 100 end
        local av = aq / 100
        b:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(av, 0, 1, 0)}):Play()
        aa.Text = tostring(math.floor(aq)) .. "%"
    else
        au:Disconnect()
        q.Text = "ACCESS GRANTED"
        aa.Text = "100%"
        task.wait(1)
        local aw = b:Create(f, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
        for ax, ay in pairs(f:GetDescendants()) do
            if ay:IsA("TextLabel") then
                b:Create(ay, TweenInfo.new(1), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
            elseif ay:IsA("Frame") then
                b:Create(ay, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
            elseif ay:IsA("UIStroke") then
                b:Create(ay, TweenInfo.new(1), {Transparency = 1}):Play()
            end
        end
        aw:Play()
        aw.Completed:Wait()
        e:Destroy()
    end
end)
