local AceGUI = LibStub("AceGUI-3.0")
local BW = BetterWho

print(BW)

local   window = AceGUI:Create("Window")
        window:SetTitle("BetterWho")
        window:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
        window:SetLayout("Flow")
        window:SetWidth(600)
        window:SetHeight(400)
        window:EnableResize(false)

local function DrawGroup1(container)
    -- local classes = {
    --     {name = "druid"},
    --     {name = "rogue"},
    --     {name = "mage"},
    --     {name = "warrior"},
    --     {name = "priest"},
    --     {name = "demonist"},
    --     {name = "paladin"},
    --     {name = "hunter"},
    --     {name = "shaman"},
    -- }

    -- local groups = {}

    -- for i = 1, #classes do
    --     local label = AceGUI:Create("Label")
    --     label:SetText(classes[i].name)
    --     local checkbox = AceGUI:Create("CheckBox")

    --     local group = AceGUI:Create("InlineGroup")
    --     group.AddChild(checkbox)
    --     group.AddChild(label)

    --     container.AddChild(group)
    --     tinsert(groups, {label, checkbox, group})
    -- end


    local   group = AceGUI:Create("SimpleGroup")
            group:SetLayout("Flow")

    local   checkbox = AceGUI:Create("CheckBox")
            group:AddChild(checkbox)

    local   label = AceGUI:Create("Label")
            label:SetText("Hello")
            label:SetFullWidth(true)
            group:AddChild(label)


            container:AddChild(group)
end

-- local function DrawGroup2(container)
--     return
-- end

local function SelectGroup(container, event, group)
    container:ReleaseChildren()
    print(container)
    if group == "tab1" then
        DrawGroup1(container)
    -- elseif group == "tab2" then
    --     DrawGroup2(container)
    end
end

local
tab = AceGUI:Create("TabGroup")
tab:SetLayout("Flow")
tab:SetFullWidth(true)
tab:SetFullHeight(true)
tab:SetTabs({
    { text = "Filters Tab", value = "tab1" },
    { text = "Results Tab", value = "tab2" }
})
tab:SetCallback("OnGroupSelected", SelectGroup)
tab:SelectTab("tab1")

-- Appends --
window:AddChild(tab)
