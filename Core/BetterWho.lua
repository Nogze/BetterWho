local addon, _ns = ...

LibStub("AceConsole-3.0")
BetterWho = LibStub("AceAddon-3.0"):NewAddon("BetterWho", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")

local BW = BetterWho

function BW:OnInitialize()
    BW:Print("Yo")
end

function BW:whoListUpdateHandler()
    local count, _ = C_FriendList.GetNumWhoResults()
    local playersList = {}

    for i = 1 , count do
        local player = C_FriendList.GetWhoInfo(i)
        local data = {
            name = player.fullName,
            level = player.level,
            area = player.area,
            class = player.classStr,
            race = player.raceStr
        }
        table.insert(playersList, data)
    end

    for i = 1, #playersList do
        local player = playersList[i]
        local name = player.name
        local level = player.level
        local class = player.class
        local race = player.race
        local area = player.area
        print(string.format("Name: %s | Level: %s | Class: %s | Race: %s | Area: %s", name, level, class, race, area))
    end
end

BW:RegisterEvent("WHO_LIST_UPDATE", "whoListUpdateHandler")

-- local BWFrame = CreateFrame("Frame", addon, UIParent)

-- BW.addonFrame = BWFrame
-- BW.playersList = {}

-- function BW:init()
--     self.chat_msg_addon_frame = CreateFrame("Frame")
--     self.chat_msg_addon_frame:RegisterEvent("WHO_LIST_UPDATE")
--     self.chat_msg_addon_frame:SetScript("OnEvent", function(...)
--         self.onWhoUpdate(self, ...)
--     end)
-- end

-- function BW:onWhoUpdate(...)
--         local count, _ = C_FriendList.GetNumWhoResults()
--         self.playersList = {}

--         for i = 1 , count do
--             local player = C_FriendList.GetWhoInfo(i)
--             local data = {
--                 name = player.fullName,
--                 level = player.level,
--                 area = player.area,
--                 class = player.classStr,
--                 race = player.raceStr
--             }
--             table.insert(self.playersList, data)
--         end

--         self:printPlayersList()
-- end

-- function BW:printPlayersList()
--     for i = 1, #self.playersList do
--         local player = self.playersList[i]
--         local name = player.name
--         local level = player.level
--         local class = player.class
--         local race = player.race
--         local area = player.area
--         print(string.format("Name: %s | Level: %s | Class: %s | Race: %s | Area: %s", name, level, class, race, area))
--     end
-- end

-- function BW:onLogin(callback)
--     local frame = CreateFrame("Frame")
--     frame:RegisterEvent("PLAYER_LOGIN")
--     frame:SetScript("OnEvent", function(event, ...)
--         callback(event, ...)
--     end)
-- end


-- BW:init()
-- BW:onLogin(function(event)
--     print("Hello world!", event)
-- end)
