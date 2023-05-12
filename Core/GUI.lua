local addon, _ns = ...
local AceGUI = LibStub("AceGUI-3.0")

local window

local classes = {{
    name = "Warrior",
    x1 = 0,
    x2 = 0.25,
    y1 = 0,
    y2 = 0.25
}, {
    name = "Paladin",
    x1 = 0,
    x2 = 0.25,
    y1 = 0.5,
    y2 = 0.75
}, {
    name = "Hunter",
    x1 = 0,
    x2 = 0.25,
    y1 = 0.25,
    y2 = 0.5
}, {
    name = "Rogue",
    x1 = 0.5,
    y1 = 0,
    x2 = 0.75,
    y2 = 0.25
}, {
    name = "Priest",
    x1 = 0.5,
    x2 = 0.75,
    y1 = 0.25,
    y2 = 0.5
}, {
    name = "Shaman",
    x1 = 0.25,
    x2 = 0.5,
    y1 = 0.25,
    y2 = 0.5
}, {
    name = "Mage",
    x1 = 0.25,
    x2 = 0.5,
    y1 = 0,
    y2 = 0.25
}, {
    name = "Warlock",
    x1 = 0.75,
    x2 = 1,
    y1 = 0.25,
    y2 = 0.5
}, {
    name = "Druid",
    x1 = 0.75,
    x2 = 1,
    y1 = 0,
    y2 = 0.25
}}

local function GenerateNumberList(min, max, step)
    local valuesList = {}
    local target
    local i
    local incremental

    if step == 1 or step == nil then
        step = 1
        i = min
        target = max
        incremental = true
    elseif step == -1 then
        i = max
        target = min
        incremental = false
    end

    while (incremental and i <= target) or (not incremental and i >= target) do
        tinsert(valuesList, i)
        i = i + step
    end

    return valuesList
end

local function RenderTab1(container)
    local spacer = AceGUI:Create("Label")
    spacer:SetText(" ")
    spacer:SetHeight(50)
    spacer:SetFullWidth(true)

    local minLvlContainer = AceGUI:Create("SimpleGroup")
    minLvlContainer:SetLayout("Flow")
    minLvlContainer:SetFullWidth(true)
    minLvlContainer:SetRelativeWidth(0.5)
    container:AddChild(minLvlContainer)

    local maxLvlContainer = AceGUI:Create("SimpleGroup")
    maxLvlContainer:SetLayout("Flow")
    maxLvlContainer:SetFullWidth(true)
    maxLvlContainer:SetRelativeWidth(0.5)
    container:AddChild(maxLvlContainer)

    local minLvlDropdown = AceGUI:Create("Dropdown")
    minLvlDropdown:SetLabel("Min lvl.")
    minLvlDropdown:SetList(GenerateNumberList(1, 60, 1))
    minLvlDropdown:SetValue(1)
    minLvlDropdown:SetCallback("OnValueChanged", function(key)
    end)
    minLvlContainer:AddChild(minLvlDropdown)

    local maxLvlDropdown = AceGUI:Create("Dropdown")
    maxLvlDropdown:SetLabel("Max lvl.")
    maxLvlDropdown:SetList(GenerateNumberList(1, 60, -1))
    maxLvlDropdown:SetValue(1)
    maxLvlDropdown:SetCallback("OnValueChanged", function(key)
    end)
    maxLvlContainer:AddChild(maxLvlDropdown)

    container:AddChild(spacer)

    local roleHeading = AceGUI:Create("Heading")
    roleHeading:SetText("Roles")
    roleHeading:SetFullWidth(true)
    container:AddChild(roleHeading)

    local roleGroup = AceGUI:Create("SimpleGroup")
    roleGroup:SetPoint("CENTER")
    roleGroup:SetLayout("Flow")
    roleGroup:SetFullWidth(true)
    container:AddChild(roleGroup)

    local ddRoleIcon = AceGUI:Create("CheckBox")
    ddRoleIcon:SetType("checkbox")
    ddRoleIcon:ToggleChecked()
    ddRoleIcon:SetLabel("DPS")
    ddRoleIcon:SetImage("Interface\\LFGFrame\\UI-LFG-ICON-ROLES", 0.25, 0.5, 0.25, 0.5)
    ddRoleIcon:SetWidth(32)
    ddRoleIcon:SetHeight(32)
    ddRoleIcon:SetRelativeWidth(0.33)
    roleGroup:AddChild(ddRoleIcon)

    local tankRoleIcon = AceGUI:Create("CheckBox")
    tankRoleIcon:SetType("checkbox")
    tankRoleIcon:ToggleChecked()
    tankRoleIcon:SetLabel("Tank")
    tankRoleIcon:SetImage("Interface\\LFGFrame\\UI-LFG-ICON-ROLES", 0.25, 0, 0.25, 0.5)
    tankRoleIcon:SetWidth(32)
    tankRoleIcon:SetHeight(32)
    tankRoleIcon:SetRelativeWidth(0.33)
    roleGroup:AddChild(tankRoleIcon)

    local healerRoleIcon = AceGUI:Create("CheckBox")
    healerRoleIcon:SetType("checkbox")
    healerRoleIcon:ToggleChecked()
    healerRoleIcon:SetLabel("Healer")
    healerRoleIcon:SetImage("Interface\\LFGFrame\\UI-LFG-ICON-ROLES", 0.25, 0.5, 0.25, 0)
    healerRoleIcon:SetWidth(32)
    healerRoleIcon:SetHeight(32)
    healerRoleIcon:SetRelativeWidth(0.33)
    roleGroup:AddChild(healerRoleIcon)

    container:AddChild(spacer)

    local classHeading = AceGUI:Create("Heading")
    classHeading:SetText("Classes")
    classHeading:SetFullWidth(true)
    container:AddChild(classHeading)

    local classGroup = AceGUI:Create("SimpleGroup")
    classGroup:SetLayout("Flow")
    classGroup:SetFullWidth(true)
    container:AddChild(classGroup)

    for _, class in ipairs(classes) do
        local classIcon = AceGUI:Create("CheckBox")
        classIcon:SetRelativeWidth(0.33)
        classIcon:SetLabel(class.name)
        classIcon:SetImage("Interface\\TargetingFrame\\UI-Classes-Circles", class.x1, class.x2, class.y1, class.y2)
        classIcon:ToggleChecked()
        classGroup:AddChild(classIcon)
    end

    container:AddChild(spacer)
    container:AddChild(spacer)

    local searchButton = AceGUI:Create("Button")
    searchButton:SetPoint("CENTER", 50)
    searchButton:SetText("Search")
    searchButton:SetFullWidth(true)
    container:AddChild(searchButton)
end

-- local function RenderTab2(container)
--     return
-- end

local function SelectGroup(container, event, group)
    container:ReleaseChildren()
    if group == "tab1" then
        RenderTab1(container)
        -- elseif group == "tab2" then
        --     RenderTab2(container)
    end
end

local function RenderWindow()
    window = AceGUI:Create("Window")
    window:SetPoint("BOTTOMRIGHT", 0, 200)
    window:SetTitle("BetterWho")
    window:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
    end)
    window:SetLayout("Flow")
    window:SetWidth(300)
    window:SetHeight(400)
    window:EnableResize(false)
end

local function RenderTabs()
    local tab = AceGUI:Create("TabGroup")
    tab:SetLayout("Flow")
    tab:SetFullWidth(true)
    tab:SetFullHeight(true)
    tab:SetTabs({{
        text = "Filters Tab",
        value = "tab1"
    }, {
        text = "Results Tab",
        value = "tab2",
        disabled = true
    }})
    tab:SetCallback("OnGroupSelected", SelectGroup)
    tab:SelectTab("tab1")

    window:AddChild(tab)
end

RenderWindow()
RenderTabs()
