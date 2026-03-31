local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

local Settings = {
    LowResTerrain = true,
    DisableParticles = true,
    ForcePlastic = true,
    RemoveClouds = true,
    DestroyTextures = true,
    MinimalLighting = true,
    ThrottledPhysics = true,
    NoShadows = true
}

local function ApplyBasePartOptimization(Part)
    Part.CastShadow = false
    Part.ReceiveShadows = false
    Part.Reflectance = 0
    Part.Material = Enum.Material.Plastic
end

local function HandleMeshPart(Mesh)
    Mesh.RenderFidelity = Enum.RenderFidelity.Performance
    Mesh.CollisionFidelity = Enum.CollisionFidelity.Box
    ApplyBasePartOptimization(Mesh)
end

local function HandleUnion(Union)
    Union.RenderFidelity = Enum.RenderFidelity.Performance
    Union.CollisionFidelity = Enum.CollisionFidelity.Box
    ApplyBasePartOptimization(Union)
end

local function HandleTruss(Truss)
    Truss.Material = Enum.Material.Plastic
    Truss.CastShadow = false
end

local function HandleWedge(Wedge)
    Wedge.Material = Enum.Material.Plastic
    Wedge.CastShadow = false
end

local function HandleCornerWedge(CWedge)
    CWedge.Material = Enum.Material.Plastic
    CWedge.CastShadow = false
end

local function DisableParticleEmitter(Emitter)
    Emitter.Enabled = false
    Emitter.Rate = 0
end

local function DisableExplosion(Explosion)
    Explosion.Visible = false
    Explosion.BlastPressure = 0
end

local function DisableFire(Fire)
    Fire.Enabled = false
    Fire.Size = 0
end

local function DisableSmoke(Smoke)
    Smoke.Enabled = false
    Smoke.Size = 0
end

local function DisableSparkles(Sparkles)
    Sparkles.Enabled = false
end

local function DisableTrail(Trail)
    Trail.Enabled = false
end

local function DisableBeam(Beam)
    Beam.Enabled = false
end

local function ClearDecal(Decal)
    Decal.Transparency = 1
end

local function ClearTexture(Texture)
    Texture.Transparency = 1
end

local function StripLight(Light)
    Light.Shadows = false
    Light.Brightness = 0.5
end

local function OptimizeTerrain()
    local Terrain = Workspace:FindFirstChildOfClass("Terrain")
    if Terrain then
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
        Terrain.Decoration = false
    end
end

local function GlobalLightingStrip()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 1
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Lighting.ExposureCompensation = 0
end

local function KillPostProcessing()
    for _, Effect in pairs(Lighting:GetChildren()) do
        if Effect:IsA("BloomEffect") or Effect:IsA("BlurEffect") or Effect:IsA("ColorCorrectionEffect") or Effect:IsA("SunRaysEffect") or Effect:IsA("DepthOfFieldEffect") then
            Effect.Enabled = false
        end
    end
end

local function KillAtmosphere()
    for _, Atm in pairs(Lighting:GetChildren()) do
        if Atm:IsA("Atmosphere") or Atm:IsA("Clouds") or Atm:IsA("Sky") then
            Atm:Destroy()
        end
    end
end

local function OptimizeObject(Obj)
    if Obj:IsA("MeshPart") then
        HandleMeshPart(Obj)
    elseif Obj:IsA("UnionOperation") then
        HandleUnion(Obj)
    elseif Obj:IsA("Part") then
        ApplyBasePartOptimization(Obj)
    elseif Obj:IsA("TrussPart") then
        HandleTruss(Obj)
    elseif Obj:IsA("WedgePart") then
        HandleWedge(Obj)
    elseif Obj:IsA("CornerWedgePart") then
        HandleCornerWedge(Obj)
    elseif Obj:IsA("Decal") then
        ClearDecal(Obj)
    elseif Obj:IsA("Texture") then
        ClearTexture(Obj)
    elseif Obj:IsA("ParticleEmitter") then
        DisableParticleEmitter(Obj)
    elseif Obj:IsA("Trail") then
        DisableTrail(Obj)
    elseif Obj:IsA("Beam") then
        DisableBeam(Obj)
    elseif Obj:IsA("Fire") then
        DisableFire(Obj)
    elseif Obj:IsA("Smoke") then
        DisableSmoke(Obj)
    elseif Obj:IsA("Sparkles") then
        DisableSparkles(Obj)
    elseif Obj:IsA("Explosion") then
        DisableExplosion(Obj)
    elseif Obj:IsA("Light") then
        StripLight(Obj)
    end
end

local function BatchOptimize(Folder)
    for _, Item in pairs(Folder:GetDescendants()) do
        OptimizeObject(Item)
    end
end

local function RecursiveCleaner()
    BatchOptimize(Workspace)
    BatchOptimize(Lighting)
end

local function CharacterBypass(Char)
    for _, v in pairs(Char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CastShadow = false
        end
    end
end

local function InitialSetup()
    settings().Rendering.QualityLevel = 1
    GlobalLightingStrip()
    KillPostProcessing()
    KillAtmosphere()
    OptimizeTerrain()
    RecursiveCleaner()
end

InitialSetup()

Workspace.DescendantAdded:Connect(function(NewObj)
    task.wait(0.1)
    OptimizeObject(NewObj)
end)

Players.PlayerAdded:Connect(function(Plr)
    Plr.CharacterAdded:Connect(function(Char)
        CharacterBypass(Char)
    end)
end)

for _, Plr in pairs(Players:GetPlayers()) do
    if Plr.Character then
        CharacterBypass(Plr.Character)
    end
    Plr.CharacterAdded:Connect(function(Char)
        CharacterBypass(Char)
    end)
end

local function SetCoreGuiPerformance()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
end

SetCoreGuiPerformance()

local function PhysicsThrottler()
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Enabled
    settings().Physics.AllowSleep = true
end

PhysicsThrottler()

local function ForceRenderSettings()
    local RenderSettings = settings().Rendering
    RenderSettings.EditQualityLevel = Enum.EditQualityLevel.Level01
end

ForceRenderSettings()

local function CleanupGarbage()
    for _, v in pairs(Workspace:GetChildren()) do
        if v:IsA("Folder") and (v.Name:lower():find("effect") or v.Name:lower():find("particle")) then
            v:ClearAllChildren()
        end
    end
end

task.spawn(function()
    while task.wait(30) do
        CleanupGarbage()
        RecursiveCleaner()
    end
end)

local function HighIntensityStrip_1()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SurfaceAppearance") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_2()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("MeshPart") then
            v.TextureID = ""
        end
    end
end

local function HighIntensityStrip_3()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SpecialMesh") then
            v.TextureId = ""
        end
    end
end

local function HighIntensityStrip_4()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        end
    end
end

local function HighIntensityStrip_5()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_6()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("CylinderHandleAdornment") or v:IsA("BoxHandleAdornment") or v:IsA("SphereHandleAdornment") then
            v.Visible = false
        end
    end
end

local function HighIntensityStrip_7()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CastShadow = false
        end
    end
end

local function HighIntensityStrip_8()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Beam") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_9()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Trail") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_10()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_11()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Explosion") then
            v.Visible = false
        end
    end
end

local function HighIntensityStrip_12()
    for _, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("PostEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_13()
    local Terrain = Workspace:FindFirstChildOfClass("Terrain")
    if Terrain then
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
    end
end

local function HighIntensityStrip_14()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Decal") then
            v.Transparency = 1
        end
    end
end

local function HighIntensityStrip_15()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Texture") then
            v.Transparency = 1
        end
    end
end

local function HighIntensityStrip_16()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_17()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Tool") then
            for _, x in pairs(v:GetDescendants()) do
                if x:IsA("BasePart") then
                    x.CastShadow = false
                end
            end
        end
    end
end

local function HighIntensityStrip_18()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BackpackItem") then
            for _, x in pairs(v:GetDescendants()) do
                if x:IsA("BasePart") then
                    x.Material = Enum.Material.Plastic
                end
            end
        end
    end
end

local function HighIntensityStrip_19()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Accessory") then
            for _, x in pairs(v:GetDescendants()) do
                if x:IsA("BasePart") then
                    x.CastShadow = false
                end
            end
        end
    end
end

local function HighIntensityStrip_20()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("CharacterMesh") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_21()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Clouds") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_22()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SunRaysEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_23()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_24()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BlurEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_25()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ColorCorrectionEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_26()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_27()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_28()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end
end

local function HighIntensityStrip_29()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ForceField") then
            v.Visible = false
        end
    end
end

local function HighIntensityStrip_30()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SelectionBox") or v:IsA("SelectionPartLasso") then
            v.Visible = false
        end
    end
end

local function HighIntensityStrip_31()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SurfaceGui") then
            for _, x in pairs(v:GetDescendants()) do
                if x:IsA("ImageLabel") then
                    x.Image = ""
                end
            end
        end
    end
end

local function HighIntensityStrip_32()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BillboardGui") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_33()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CollisionFidelity = Enum.CollisionFidelity.Box
        end
    end
end

local function HighIntensityStrip_34()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("MeshPart") then
            v.RenderFidelity = Enum.RenderFidelity.Performance
        end
    end
end

local function HighIntensityStrip_35()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("UnionOperation") then
            v.RenderFidelity = Enum.RenderFidelity.Performance
        end
    end
end

local function HighIntensityStrip_36()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency < 1 then
            v.Reflectance = 0
        end
    end
end

local function HighIntensityStrip_37()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanTouch = false
            v.CanQuery = false
        end
    end
end

local function HighIntensityStrip_38()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_39()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Fire") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_40()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Smoke") then
            v.Enabled = false
        end
    end
end

local function HighIntensityStrip_41()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("PointLight") then
            v.Shadows = false
        end
    end
end

local function HighIntensityStrip_42()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SpotLight") then
            v.Shadows = false
        end
    end
end

local function HighIntensityStrip_43()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("SurfaceLight") then
            v.Shadows = false
        end
    end
end

local function HighIntensityStrip_44()
    Lighting.GlobalShadows = false
end

local function HighIntensityStrip_45()
    Lighting.Brightness = 2
end

local function HighIntensityStrip_46()
    Lighting.EnvironmentDiffuseScale = 0
end

local function HighIntensityStrip_47()
    Lighting.EnvironmentSpecularScale = 0
end

local function HighIntensityStrip_48()
    Lighting.ClockTime = 12
end

local function HighIntensityStrip_49()
    Lighting.GeographicLatitude = 41.733
end

local function HighIntensityStrip_50()
    Workspace.StreamingEnabled = true
end

local function HighIntensityStrip_51()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CastShadow = false
        end
    end
end

local function RunFullSuite()
    HighIntensityStrip_1()
    HighIntensityStrip_2()
    HighIntensityStrip_3()
    HighIntensityStrip_4()
    HighIntensityStrip_5()
    HighIntensityStrip_6()
    HighIntensityStrip_7()
    HighIntensityStrip_8()
    HighIntensityStrip_9()
    HighIntensityStrip_10()
    HighIntensityStrip_11()
    HighIntensityStrip_12()
    HighIntensityStrip_13()
    HighIntensityStrip_14()
    HighIntensityStrip_15()
    HighIntensityStrip_16()
    HighIntensityStrip_17()
    HighIntensityStrip_18()
    HighIntensityStrip_19()
    HighIntensityStrip_20()
    HighIntensityStrip_21()
    HighIntensityStrip_22()
    HighIntensityStrip_23()
    HighIntensityStrip_24()
    HighIntensityStrip_25()
    HighIntensityStrip_26()
    HighIntensityStrip_27()
    HighIntensityStrip_28()
    HighIntensityStrip_29()
    HighIntensityStrip_30()
    HighIntensityStrip_31()
    HighIntensityStrip_32()
    HighIntensityStrip_33()
    HighIntensityStrip_34()
    HighIntensityStrip_35()
    HighIntensityStrip_36()
    HighIntensityStrip_37()
    HighIntensityStrip_38()
    HighIntensityStrip_39()
    HighIntensityStrip_40()
    HighIntensityStrip_41()
    HighIntensityStrip_42()
    HighIntensityStrip_43()
    HighIntensityStrip_44()
    HighIntensityStrip_45()
    HighIntensityStrip_46()
    HighIntensityStrip_47()
    HighIntensityStrip_48()
    HighIntensityStrip_49()
    HighIntensityStrip_50()
    HighIntensityStrip_51()
end

RunFullSuite()

local function FinalOptimizationLoop()
    while true do
        RunFullSuite()
        task.wait(60)
    end
end

task.spawn(FinalOptimizationLoop)