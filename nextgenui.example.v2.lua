--[[
  Icons aren't fully intergrated into the UILib
  So Use this
  local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DSP-V1/NextGen/refs/heads/main/UILib/icons/UIIcons.lua"))()
  In order to get icons
  Two ways to use it
  local name_value = IconsV2.GetIcon("Icon")
  then using name_value to put in something
  nameofvalue = name_value
  or
  nameofvalue = IconsV2.GetIcon("icon")
  unless you wanna use any image link like i.imgur.com or use rbxassetid
]]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DSP-V1/NextGen/refs/heads/main/UILib/main_safe.luau"))()
local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DSP-V1/NextGen/refs/heads/main/UILib/icons/UIIcons.lua"))()
IconsV2.SetIconsType("lucide")
local componentsIcon = IconsV2.GetIcon("circle-plus")
local Window = Library:NewWindow({
  Title = "NextGenUI Library",
  Description = "by DSPV1 & T0XÏC | BETA",
  Icon = componentsIcon,
  ReopenButton = {
      ButtonIcon = IconsV2.GetIcon("airplay"),
      ButtonColorStroke = Color3.fromRGB(69,69,69),
  },
  Watermark = {
      Text = "NextGen UI",
      Position = "bottom-right", -- four positions bottom-right, bottom-left, top-right, top-left
      Size = 16, -- changes size of the text
      Opacity = 0.3, -- changes how visible the watermark will be
      Padding = 12, -- ideal padding
      Icon = false, -- icon is false but if icon = true use
      -- IconImage = "rbxassetid://1234567890",
      OnGui = true -- this depends on being on the UI or being off of it!
  }
})

-- create tab
local MainTab = Window:AddTab({
    Title = "Main",
    Border = true,
    Icon = componentsIcon
})

-- create new Icons
local componentsIcon = IconsV2.GetIcon("circle-plus")

-- create section
local compSection = MainTab:AddSection({
  Title = "| Components",
  Opened = true, -- when ui opens it will be open or closed
  Collapsible = true, -- makes the section closeable or unclosable
  Icon = componentsIcon
})

local Paragraph = compSection:AddParagraph({
  Title = "Paragraph",
  Content = "Hi Yes this paragraph"
})

--[[
local function createGradient(text, color1, color2)
    local function interpolate(c1, c2, t)
        return math.floor(c1 + (c2 - c1) * t)
    end
    local result = "<b>"
    local len = #text
    for i = 1, len do
        local t = (i - 1) / math.max(1, len - 1)
        local r = interpolate(color1[1], color2[1], t)
        local g = interpolate(color1[2], color2[2], t)
        local b = interpolate(color1[3], color2[3], t)
        local hex = string.format("#%02X%02X%02X", r, g, b)
        result = result .. '<font color="' .. hex .. '">' .. text:sub(i, i) .. '</font>'
    end
    return result .. "</b>"
end

this is the gradient but only works on paragraphs right now!
]]

compSection:AddToggle({
  Title = "Toggle",
  Description = "Press to toggle",
  iOS = true, -- ios makes it the pill shaped or if false makes it orginial shape
  Callback = function(value)
    print("toggle is " .. tostring(value))
  end
})

compSection:AddSlider({
  Title = "Slider",
  Description = "Drag me",
  Min = 16,
  Max = 100,
  Increment = 1,
  Default = 16,
  iOS = false,
  Callback = function(value)
    print("slider now at: " .. value)
  end
})

compSection:AddButton({
  Title = "Button",
  Description = "Click me",
  Callback = function()
    print("Button clicked")
  end
})

compSection:AddSpace() -- this is the space part you can even change how much space between by doing this AddSpace(499)

compSection:AddInput({
  Title = "Input (With Default)",
  Description = "With Default",
  PlaceHolder = "",
  Default = "Change",
  Callback = function(value)
    print("message now is: " .. value)
  end
})

compSection:AddInput({
  Title = "Input (With Placeholder)",
  Description = "With Placeholder",
  PlaceHolder = "Type Smt...",
  Default = "",
  Callback = function(value)
    print("message now is: " .. value)
  end
})

compSection:AddDropdown({
  Title = "ESP Options",
  Description = "Select which ESP to enable",
  Values = {"Players", "Chests", "NPCs", "Items"},
  Default = {"Players", "Chests"},
  Multi = false,
  Callback = function()
  end
})

compSection:AddDivider() -- divider in sections

compSection:AddDropdown({
  Title = "Fruits you likee?",
  Description = "Select fruits",
  Values = {"Apples", "Banana", "Kiwi", "Grapes"},
  Default = {"Apples", "Grapes"},
  Multi = true,
  Callback = function()
  end
})

MainTab:AddDividerTab() -- divider outside the section
