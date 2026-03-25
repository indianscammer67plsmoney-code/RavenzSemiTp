loadstring([[
pcall(function()

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- WHITELIST (Pastebin raw link)
local WHITELIST_URL = "https://pastebin.com/raw/XXXXXXXX"
local MAIN_SCRIPT = "https://pastebin.com/raw/MAINSCRIPT"

-- CHECK WHITELIST
local data = game:HttpGet(WHITELIST_URL)
if not string.find(data, tostring(lp.UserId)) then
    lp:Kick("Not Whitelisted | Verify in Discord")
    return
end

-- LOADING UI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "RavenzLoader"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,320,0,220)
frame.Position = UDim2.new(0.5,-160,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(40,0,80) -- DARK DARK PURPLE
stroke.Thickness = 3

-- LOGO
local logo = Instance.new("ImageLabel", frame)
logo.Size = UDim2.new(0.8,0,0,80)
logo.Position = UDim2.new(0.1,0,0.08,0)
logo.BackgroundTransparency = 1
logo.Image = getcustomasset("ravenz.png")
logo.ScaleType = Enum.ScaleType.Fit

-- LOADING TEXT
local txt = Instance.new("TextLabel", frame)
txt.Size = UDim2.new(1,0,0,40)
txt.Position = UDim2.new(0,0,0.55,0)
txt.Text = "Loading..."
txt.BackgroundTransparency = 1
txt.TextColor3 = Color3.fromRGB(200,200,200)
txt.Font = Enum.Font.Arcade
txt.TextScaled = true

-- BAR BG
local barBG = Instance.new("Frame", frame)
barBG.Size = UDim2.new(0.8,0,0,20)
barBG.Position = UDim2.new(0.1,0,0.75,0)
barBG.BackgroundColor3 = Color3.fromRGB(55,55,55)
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,10)

-- BAR
local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(60,0,120)
Instance.new("UICorner", bar).CornerRadius = UDim.new(0,10)

for i = 1,100 do
    bar.Size = UDim2.new(i/100,0,1,0)
    task.wait(0.01)
end

gui:Destroy()

-- LOAD MAIN SCRIPT
loadstring(game:HttpGet(MAIN_SCRIPT))()

end)
]])()
