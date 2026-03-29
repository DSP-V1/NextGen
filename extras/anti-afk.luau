local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local AntiAfkEnabled = true
local StartTime = os.time()
local PreventionCount = 0

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiAFK_Pro_v3"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

if getgenv then
    ScreenGui.Parent = CoreGui
else
    ScreenGui.Parent = PlayerGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 180)
MainFrame.Position = UDim2.new(0.5, -150, 0.4, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner_Main = Instance.new("UICorner")
UICorner_Main.CornerRadius = UDim.new(0, 10)
UICorner_Main.Parent = MainFrame

local UIStroke_Main = Instance.new("UIStroke")
UIStroke_Main.Thickness = 2
UIStroke_Main.Color = Color3.fromRGB(45, 45, 45)
UIStroke_Main.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_Main.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local UICorner_Title = Instance.new("UICorner")
UICorner_Title.CornerRadius = UDim.new(0, 10)
UICorner_Title.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -10, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ANTIAFK SYSTEM PRO"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -35)
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 10)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "STATUS: ACTIVE"
StatusLabel.TextColor3 = Color3.fromRGB(85, 255, 127)
StatusLabel.TextSize = 16
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.Parent = ContentFrame

local TimerLabel = Instance.new("TextLabel")
TimerLabel.Name = "TimerLabel"
TimerLabel.Size = UDim2.new(1, 0, 0, 20)
TimerLabel.Position = UDim2.new(0, 0, 0, 40)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "Uptime: 00:00:00"
TimerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TimerLabel.TextSize = 14
TimerLabel.Font = Enum.Font.Gotham
TimerLabel.Parent = ContentFrame

local CounterLabel = Instance.new("TextLabel")
CounterLabel.Name = "CounterLabel"
CounterLabel.Size = UDim2.new(1, 0, 0, 20)
CounterLabel.Position = UDim2.new(0, 0, 0, 60)
CounterLabel.BackgroundTransparency = 1
CounterLabel.Text = "Prevented Kicks: 0"
CounterLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CounterLabel.TextSize = 14
CounterLabel.Font = Enum.Font.Gotham
CounterLabel.Parent = ContentFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 200, 0, 35)
ToggleButton.Position = UDim2.new(0.5, -100, 1, -45)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
ToggleButton.Text = "DISABLE"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.Parent = ContentFrame

local UICorner_Button = Instance.new("UICorner")
UICorner_Button.CornerRadius = UDim.new(0, 6)
UICorner_Button.Parent = ToggleButton

local LogFrame = Instance.new("ScrollingFrame")
LogFrame.Name = "LogFrame"
LogFrame.Size = UDim2.new(0, 280, 0, 0)
LogFrame.Position = UDim2.new(0.5, -140, 1, 10)
LogFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LogFrame.BorderSizePixel = 0
LogFrame.ScrollBarThickness = 2
LogFrame.Visible = false
LogFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = LogFrame

local function FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local mins = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    return string.format("%02d:%02d:%02d", hours, mins, secs)
end

local function UpdateUI()
    local CurrentTime = os.time()
    local Elapsed = CurrentTime - StartTime
    TimerLabel.Text = "Uptime: " .. FormatTime(Elapsed)
    CounterLabel.Text = "Prevented Kicks: " .. tostring(PreventionCount)
end

local function ToggleState()
    AntiAfkEnabled = not AntiAfkEnabled
    if AntiAfkEnabled then
        ToggleButton.Text = "DISABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
        StatusLabel.Text = "STATUS: ACTIVE"
        StatusLabel.TextColor3 = Color3.fromRGB(85, 255, 127)
    else
        ToggleButton.Text = "ENABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
        StatusLabel.Text = "STATUS: DISABLED"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 65, 65)
    end
end

ToggleButton.MouseButton1Click:Connect(ToggleState)

Player.Idled:Connect(function()
    if AntiAfkEnabled then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        PreventionCount = PreventionCount + 1
        
        local FlashTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {BackgroundColor3 = Color3.fromRGB(40, 60, 40)})
        FlashTween:Play()
    end
end)

task.spawn(function()
    while task.wait(1) do
        UpdateUI()
    end
end)

local Dragging = false
local DragInput
local DragStart
local StartPos

local function UpdateDrag(input)
    local Delta = input.Position - DragStart
    MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        UpdateDrag(input)
    end
end)

local function CreateShadow()
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.Parent = MainFrame
end

CreateShadow()

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 2)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 24
CloseButton.Font = Enum.Font.Gotham
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180))
})
Gradient.Rotation = 90
Gradient.Parent = MainFrame

local DecorativeLine = Instance.new("Frame")
DecorativeLine.Size = UDim2.new(1, -20, 0, 1)
DecorativeLine.Position = UDim2.new(0, 10, 0, 34)
DecorativeLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DecorativeLine.BorderSizePixel = 0
DecorativeLine.Parent = MainFrame

local function AnimateIn()
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.ClipsDescendants = true
    local Tween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 180)})
    Tween:Play()
end

AnimateIn()

local function PreventKickDirect()
    pcall(function()
        local Player = game:GetService("Players").LocalPlayer
        for _, connection in pairs(getconnections(Player.Idled)) do
            connection:Disable()
        end
    end)
end

task.spawn(PreventKickDirect)

local b1 = Instance.new("Frame")
b1.Size = UDim2.new(0, 5, 0, 5)
b1.Transparency = 1
b1.Parent = MainFrame

local b2 = Instance.new("Frame")
b2.Size = UDim2.new(0, 5, 0, 5)
b2.Transparency = 1
b2.Parent = MainFrame

local b3 = Instance.new("Frame")
b3.Size = UDim2.new(0, 5, 0, 5)
b3.Transparency = 1
b3.Parent = MainFrame

local b4 = Instance.new("Frame")
b4.Size = UDim2.new(0, 5, 0, 5)
b4.Transparency = 1
b4.Parent = MainFrame

local b5 = Instance.new("Frame")
b5.Size = UDim2.new(0, 5, 0, 5)
b5.Transparency = 1
b5.Parent = MainFrame

local b6 = Instance.new("Frame")
b6.Size = UDim2.new(0, 5, 0, 5)
b6.Transparency = 1
b6.Parent = MainFrame

local b7 = Instance.new("Frame")
b7.Size = UDim2.new(0, 5, 0, 5)
b7.Transparency = 1
b7.Parent = MainFrame

local b8 = Instance.new("Frame")
b8.Size = UDim2.new(0, 5, 0, 5)
b8.Transparency = 1
b8.Parent = MainFrame

local b9 = Instance.new("Frame")
b9.Size = UDim2.new(0, 5, 0, 5)
b9.Transparency = 1
b9.Parent = MainFrame

local b10 = Instance.new("Frame")
b10.Size = UDim2.new(0, 5, 0, 5)
b10.Transparency = 1
b10.Parent = MainFrame

local b11 = Instance.new("Frame")
b11.Size = UDim2.new(0, 5, 0, 5)
b11.Transparency = 1
b11.Parent = MainFrame

local b12 = Instance.new("Frame")
b12.Size = UDim2.new(0, 5, 0, 5)
b12.Transparency = 1
b12.Parent = MainFrame

local b13 = Instance.new("Frame")
b13.Size = UDim2.new(0, 5, 0, 5)
b13.Transparency = 1
b13.Parent = MainFrame

local b14 = Instance.new("Frame")
b14.Size = UDim2.new(0, 5, 0, 5)
b14.Transparency = 1
b14.Parent = MainFrame

local b15 = Instance.new("Frame")
b15.Size = UDim2.new(0, 5, 0, 5)
b15.Transparency = 1
b15.Parent = MainFrame

local b16 = Instance.new("Frame")
b16.Size = UDim2.new(0, 5, 0, 5)
b16.Transparency = 1
b16.Parent = MainFrame

local b17 = Instance.new("Frame")
b17.Size = UDim2.new(0, 5, 0, 5)
b17.Transparency = 1
b17.Parent = MainFrame

local b18 = Instance.new("Frame")
b18.Size = UDim2.new(0, 5, 0, 5)
b18.Transparency = 1
b18.Parent = MainFrame

local b19 = Instance.new("Frame")
b19.Size = UDim2.new(0, 5, 0, 5)
b19.Transparency = 1
b19.Parent = MainFrame

local b20 = Instance.new("Frame")
b20.Size = UDim2.new(0, 5, 0, 5)
b20.Transparency = 1
b20.Parent = MainFrame

local b21 = Instance.new("Frame")
b21.Size = UDim2.new(0, 5, 0, 5)
b21.Transparency = 1
b21.Parent = MainFrame

local b22 = Instance.new("Frame")
b22.Size = UDim2.new(0, 5, 0, 5)
b22.Transparency = 1
b22.Parent = MainFrame

local b23 = Instance.new("Frame")
b23.Size = UDim2.new(0, 5, 0, 5)
b23.Transparency = 1
b23.Parent = MainFrame

local b24 = Instance.new("Frame")
b24.Size = UDim2.new(0, 5, 0, 5)
b24.Transparency = 1
b24.Parent = MainFrame

local b25 = Instance.new("Frame")
b25.Size = UDim2.new(0, 5, 0, 5)
b25.Transparency = 1
b25.Parent = MainFrame

local b26 = Instance.new("Frame")
b26.Size = UDim2.new(0, 5, 0, 5)
b26.Transparency = 1
b26.Parent = MainFrame

local b27 = Instance.new("Frame")
b27.Size = UDim2.new(0, 5, 0, 5)
b27.Transparency = 1
b27.Parent = MainFrame

local b28 = Instance.new("Frame")
b28.Size = UDim2.new(0, 5, 0, 5)
b28.Transparency = 1
b28.Parent = MainFrame

local b29 = Instance.new("Frame")
b29.Size = UDim2.new(0, 5, 0, 5)
b29.Transparency = 1
b29.Parent = MainFrame

local b30 = Instance.new("Frame")
b30.Size = UDim2.new(0, 5, 0, 5)
b30.Transparency = 1
b30.Parent = MainFrame

local b31 = Instance.new("Frame")
b31.Size = UDim2.new(0, 5, 0, 5)
b31.Transparency = 1
b31.Parent = MainFrame

local b32 = Instance.new("Frame")
b32.Size = UDim2.new(0, 5, 0, 5)
b32.Transparency = 1
b32.Parent = MainFrame

local b33 = Instance.new("Frame")
b33.Size = UDim2.new(0, 5, 0, 5)
b33.Transparency = 1
b33.Parent = MainFrame

local b34 = Instance.new("Frame")
b34.Size = UDim2.new(0, 5, 0, 5)
b34.Transparency = 1
b34.Parent = MainFrame

local b35 = Instance.new("Frame")
b35.Size = UDim2.new(0, 5, 0, 5)
b35.Transparency = 1
b35.Parent = MainFrame

local b36 = Instance.new("Frame")
b36.Size = UDim2.new(0, 5, 0, 5)
b36.Transparency = 1
b36.Parent = MainFrame

local b37 = Instance.new("Frame")
b37.Size = UDim2.new(0, 5, 0, 5)
b37.Transparency = 1
b37.Parent = MainFrame

local b38 = Instance.new("Frame")
b38.Size = UDim2.new(0, 5, 0, 5)
b38.Transparency = 1
b38.Parent = MainFrame

local b39 = Instance.new("Frame")
b39.Size = UDim2.new(0, 5, 0, 5)
b39.Transparency = 1
b39.Parent = MainFrame

local b40 = Instance.new("Frame")
b40.Size = UDim2.new(0, 5, 0, 5)
b40.Transparency = 1
b40.Parent = MainFrame

local b41 = Instance.new("Frame")
b41.Size = UDim2.new(0, 5, 0, 5)
b41.Transparency = 1
b41.Parent = MainFrame

local b42 = Instance.new("Frame")
b42.Size = UDim2.new(0, 5, 0, 5)
b42.Transparency = 1
b42.Parent = MainFrame

local b43 = Instance.new("Frame")
b43.Size = UDim2.new(0, 5, 0, 5)
b43.Transparency = 1
b43.Parent = MainFrame

local b44 = Instance.new("Frame")
b44.Size = UDim2.new(0, 5, 0, 5)
b44.Transparency = 1
b44.Parent = MainFrame

local b45 = Instance.new("Frame")
b45.Size = UDim2.new(0, 5, 0, 5)
b45.Transparency = 1
b45.Parent = MainFrame

local b46 = Instance.new("Frame")
b46.Size = UDim2.new(0, 5, 0, 5)
b46.Transparency = 1
b46.Parent = MainFrame

local b47 = Instance.new("Frame")
b47.Size = UDim2.new(0, 5, 0, 5)
b47.Transparency = 1
b47.Parent = MainFrame

local b48 = Instance.new("Frame")
b48.Size = UDim2.new(0, 5, 0, 5)
b48.Transparency = 1
b48.Parent = MainFrame

local b49 = Instance.new("Frame")
b49.Size = UDim2.new(0, 5, 0, 5)
b49.Transparency = 1
b49.Parent = MainFrame

local b50 = Instance.new("Frame")
b50.Size = UDim2.new(0, 5, 0, 5)
b50.Transparency = 1
b50.Parent = MainFrame

local function HeartbeatAction()
    if AntiAfkEnabled then
        local Success, Error = pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end

RunService.Heartbeat:Connect(function()
    if math.random(1, 1000) == 500 then
        HeartbeatAction()
    end
end)
