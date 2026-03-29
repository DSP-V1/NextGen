local IconsSB = {
    ["Person"] = "rbxassetid://17428322363",
    ["Settings"] = "rbxassetid://7059346386",
    ["Shop"] = "rbxassetid://11807308307",
    ["Shop-2"] = "rbxassetid://9405933234"
    ["Alert"] = "rbxassetid://17616650762"
}

local function getIcon(name)
    return IconsSB[name] or IconsSB["Person"]
end

return {
    Icons = IconsSB,
    GetIcon = getIcon
}
