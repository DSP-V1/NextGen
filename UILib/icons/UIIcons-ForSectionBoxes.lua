local IconsSB = {
    ["Person"] = "rbxassetid://17428322363",
    ["Settings"] = "rbxassetid://7059346386",
    ["Shop"] = "rbxassetid://11807308307",
    ["Shop-2"] = "rbxassetid://9405933234",
    ["Alert"] = "rbxassetid://17616650762",
    ["Info"] = "rbxassetid://135453418174430",
    ["White-Discord"] = "rbxassetid://110769239384778"
}

local function getIcon(name)
    return IconsSB[name] or IconsSB["Person"]
end

return {
    Icons = IconsSB,
    GetIcon = getIcon
}
