local addon, BW = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
print("YO LE RAP YO LE RAP")
frame:SetScript("OnEvent", function()
    print("-------------------------- PLAYER_LOGIN --------------------------")
end)
