local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local WHITELIST_URL = "https://raw.githubusercontent.com/indianscammer67plsmoney/ravenz/main/whitelist.txt"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/indianscammer67plsmoney/ravenz/main/main.lua"

local data = game:HttpGet(WHITELIST_URL)

if not string.find(data, tostring(lp.UserId)) then
    lp:Kick("Not Whitelisted | Join Discord")
    return
end

loadstring(game:HttpGet(MAIN_SCRIPT))()
