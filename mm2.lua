local targetPlaceId = 142823291

if game.PlaceId ~= targetPlaceId then game.StarterGui:SetCore("SendNotification", { Title = "EUGENEv2 MM2 ESP Opensource"; Text = "You are not in the correct game! (Murder Mystery 2)\nPlease join Murder Mystery 2 to use this script!"; Duration = 5; }) return end

local EUGENE = loadstring(game:HttpGet("https://diser.me/EUGENE/library/ui-library.lua"))()

local Window = EUGENE.new("EUGENEv2 MM2 ESP Open Source", "https://rscripts.net/@EUGENE")

local Flags = { MurdererESP = true, SheriffESP = true, InnocentESP = true, SelfESP = false, }

local VisualsTab = Window:AddTab("Visuals", "Player highlights", "lucide-eye")

VisualsTab:AddSection("Outlines")

VisualsTab:AddToggle("Murderer", false, function(state) Flags.MurdererESP = state end, "MurdererESP")

VisualsTab:AddToggle("Sheriff", false, function(state) Flags.SheriffESP = state end, "SheriffESP")

VisualsTab:AddToggle("Innocent", false, function(state) Flags.InnocentESP = state end, "InnocentESP")

local SettingsTab = Window:AddTab("Settings", "Menu Settings", "lucide-settings") SettingsTab:AddSection("Self Highlight") SettingsTab:AddToggle("Self", false, function(state) Flags.SelfESP = state end, "SelfESP")

SettingsTab:AddSection("Theme Selection") local ThemeNames = {"Cosmos", "Aurora", "Obsidian", "Sunset"} SettingsTab:AddSelector("Menu Theme", ThemeNames, 1, function(index, value) Window:SetTheme(value) end, "Theme")

Window:AddConfigTab("EUGENEv2-Library/configs", Flags)

local CreditsTab = Window:AddTab("Credits", "Information", "lucide-heart") CreditsTab:AddSection("Made by EUGENE - rscripts.net/@EUGENE") CreditsTab:AddButton("Copy Credits", function() setclipboard("https://rscripts.net/@EUGENE") Window:Notify("Credits copied!", 3.5) end) CreditsTab:AddSection("EUGENEv2 UI Library") CreditsTab:AddButton("Copy UI Library", function() setclipboard("https://diser.me/EUGENE/library/") Window:Notify("UI Library copied!", 3.5) end) local highlights = {}

local function createHighlight(player, color) local char = player.Character if not char then return end

if highlights[player] then
    highlights[player]:Destroy()
end

local highlight = Instance.new("Highlight")
highlight.FillColor = color
highlight.OutlineColor = color
highlight.FillTransparency = 0
highlight.OutlineTransparency = 0
highlight.Parent = char
highlights[player] = highlight
end

local function removeHighlight(player) if highlights[player] then highlights[player]:Destroy() highlights[player] = nil end end

local function getRole(player) if not player.Character then return nil end

local hasKnife = false
local hasGun = false

local backpack = player:FindFirstChild("Backpack")
if backpack then
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local name = tool.Name:lower()
            if name:find("knife") or name:find("murderer") then 
                hasKnife = true 
            end
            if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
                hasGun = true 
            end
        end
    end
end

local charTool = player.Character:FindFirstChildOfClass("Tool")
if charTool then
    local name = charTool.Name:lower()
    if name:find("knife") or name:find("murderer") then 
        hasKnife = true 
    end
    if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
        hasGun = true 
    end
end

if hasKnife then return "Murderer" end
if hasGun then return "Sheriff" end
return "Innocent"
end

local function updateESP() for _, player in ipairs(game.Players:GetPlayers()) do if player == game.Players.LocalPlayer and not Flags.SelfESP then continue end

    local role = getRole(player)
    
    if Flags.MurdererESP and role == "Murderer" then
        createHighlight(player, Color3.fromRGB(255, 0, 0))
    elseif Flags.SheriffESP and role == "Sheriff" then
        createHighlight(player, Color3.fromRGB(0, 0, 255))
    elseif Flags.InnocentESP and role == "Innocent" then
        createHighlight(player, Color3.fromRGB(0, 255, 0))
    else
        removeHighlight(player)
    end
end
end

local function cleanupESP() for player, hl in pairs(highlights) do if hl then hl:Destroy() end end highlights = {} end

game:GetService("RunService").RenderStepped:Connect(updateESP)

game.Players.PlayerRemoving:Connect(function(player) removeHighlight(player) end)

for _, player in ipairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end

game.Players.PlayerAdded:Connect(function(player) if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end)

game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end)local targetPlaceId = 142823291

if game.PlaceId ~= targetPlaceId then game.StarterGui:SetCore("SendNotification", { Title = "EUGENEv2 MM2 ESP Opensource"; Text = "You are not in the correct game! (Murder Mystery 2)\nPlease join Murder Mystery 2 to use this script!"; Duration = 5; }) return end

local EUGENE = loadstring(game:HttpGet("https://diser.me/EUGENE/library/ui-library.lua"))()

local Window = EUGENE.new("EUGENEv2 MM2 ESP Open Source", "https://rscripts.net/@EUGENE")

local Flags = { MurdererESP = true, SheriffESP = true, InnocentESP = true, SelfESP = false, }

local VisualsTab = Window:AddTab("Visuals", "Player highlights", "lucide-eye")

VisualsTab:AddSection("Outlines")

VisualsTab:AddToggle("Murderer", false, function(state) Flags.MurdererESP = state end, "MurdererESP")

VisualsTab:AddToggle("Sheriff", false, function(state) Flags.SheriffESP = state end, "SheriffESP")

VisualsTab:AddToggle("Innocent", false, function(state) Flags.InnocentESP = state end, "InnocentESP")

local SettingsTab = Window:AddTab("Settings", "Menu Settings", "lucide-settings") SettingsTab:AddSection("Self Highlight") SettingsTab:AddToggle("Self", false, function(state) Flags.SelfESP = state end, "SelfESP")

SettingsTab:AddSection("Theme Selection") local ThemeNames = {"Cosmos", "Aurora", "Obsidian", "Sunset"} SettingsTab:AddSelector("Menu Theme", ThemeNames, 1, function(index, value) Window:SetTheme(value) end, "Theme")

Window:AddConfigTab("EUGENEv2-Library/configs", Flags)

local CreditsTab = Window:AddTab("Credits", "Information", "lucide-heart") CreditsTab:AddSection("Made by EUGENE - rscripts.net/@EUGENE") CreditsTab:AddButton("Copy Credits", function() setclipboard("https://rscripts.net/@EUGENE") Window:Notify("Credits copied!", 3.5) end) CreditsTab:AddSection("EUGENEv2 UI Library") CreditsTab:AddButton("Copy UI Library", function() setclipboard("https://diser.me/EUGENE/library/") Window:Notify("UI Library copied!", 3.5) end) local highlights = {}

local function createHighlight(player, color) local char = player.Character if not char then return end

if highlights[player] then
    highlights[player]:Destroy()
end

local highlight = Instance.new("Highlight")
highlight.FillColor = color
highlight.OutlineColor = color
highlight.FillTransparency = 0
highlight.OutlineTransparency = 0
highlight.Parent = char
highlights[player] = highlight
end

local function removeHighlight(player) if highlights[player] then highlights[player]:Destroy() highlights[player] = nil end end

local function getRole(player) if not player.Character then return nil end

local hasKnife = false
local hasGun = false

local backpack = player:FindFirstChild("Backpack")
if backpack then
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local name = tool.Name:lower()
            if name:find("knife") or name:find("murderer") then 
                hasKnife = true 
            end
            if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
                hasGun = true 
            end
        end
    end
end

local charTool = player.Character:FindFirstChildOfClass("Tool")
if charTool then
    local name = charTool.Name:lower()
    if name:find("knife") or name:find("murderer") then 
        hasKnife = true 
    end
    if name:find("gun") or name:find("revolver") or name:find("sheriff") then 
        hasGun = true 
    end
end

if hasKnife then return "Murderer" end
if hasGun then return "Sheriff" end
return "Innocent"
end

local function updateESP() for _, player in ipairs(game.Players:GetPlayers()) do if player == game.Players.LocalPlayer and not Flags.SelfESP then continue end

    local role = getRole(player)
    
    if Flags.MurdererESP and role == "Murderer" then
        createHighlight(player, Color3.fromRGB(255, 0, 0))
    elseif Flags.SheriffESP and role == "Sheriff" then
        createHighlight(player, Color3.fromRGB(0, 0, 255))
    elseif Flags.InnocentESP and role == "Innocent" then
        createHighlight(player, Color3.fromRGB(0, 255, 0))
    else
        removeHighlight(player)
    end
end
end

local function cleanupESP() for player, hl in pairs(highlights) do if hl then hl:Destroy() end end highlights = {} end

game:GetService("RunService").RenderStepped:Connect(updateESP)

game.Players.PlayerRemoving:Connect(function(player) removeHighlight(player) end)

for _, player in ipairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end

game.Players.PlayerAdded:Connect(function(player) if player ~= game.Players.LocalPlayer then player.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end) end end)

game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) updateESP() end)
