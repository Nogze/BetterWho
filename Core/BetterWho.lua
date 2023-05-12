local addon, _ns = ...

LibStub("AceConsole-3.0")
BetterWho = LibStub("AceAddon-3.0"):NewAddon("BetterWho", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0")

function BetterWho:whoListUpdateHandler()
    local count, _ = C_FriendList.GetNumWhoResults()
    local playersList = {}

    for i = 1, count do
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

BetterWho:RegisterEvent("WHO_LIST_UPDATE", "whoListUpdateHandler")
