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
local arrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()

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
local currentTime = 12
local adonisCommand = "nil"
local adonisPlayer = "nil"
local noclipEnabled = false
local versionActive = true

-- Window Creation
local Window = arrayField:CreateWindow({
	Name = "Dark Hub",
	LoadingTitle = "Dark Hub",
	LoadingSubtitle = "by Stormzy Exploiting",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = true,
		FileName = "Configuration"
	},
	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},
	KeySystem = false,
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", 
		SaveKey = true,
		GrabKeyFromSite = false,
		Actions = {
			[1] = {
				Text = 'Click here to copy the key link <--',
				OnPress = function()
					print('Pressed')
				end,
			}
		},
		Key = {"Hello"}
	}
})

local homeTab = Window:CreateTab("Home", 4370319235)
local characterTab = Window:CreateTab("Character", 4370319235)

local playerSpeedSlider = characterTab:CreateSlider({
	Name = "Player Speed",
	Range = {0, 300},
	Increment = 1,
	Suffix = "player speed",
	CurrentValue = 16,
	Flag = "Slider1",
	Callback = function(Value)
		if versionActive == true then
			localPlayer.Character.Humanoid.WalkSpeed = Value
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local jumpPowerSlider = characterTab:CreateSlider({
	Name = "Jump Power",
	Range = {0, 350},
	Increment = 1,
	Suffix = "jump power",
	CurrentValue = 50,
	Flag = "Slider1",
	Callback = function(Value)
		if versionActive == true then
			localPlayer.Character.Humanoid.JumpPower = Value
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local flightSpeedSlider = characterTab:CreateSlider({
	Name = "Flight Speed",
	Range = {1, 25},
	Increment = 1,
	Suffix = "flight speed",
	CurrentValue = 3,
	Flag = "Slider1",
	Callback = function(Value)
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":flyspeed me", Player = game.Players[localPlayer.Name], Args = Value})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local fieldOfViewSlider = characterTab:CreateSlider({
	Name = "Field of View",
	Range = {45, 120},
	Increment = 1,
	Suffix = "field of view",
	CurrentValue = 70,
	Flag = "Slider1",
	Callback = function(Value)
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":fov me", Player = game.Players[localPlayer.Name], Args = Value})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local noclipToggle = characterTab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if versionActive == true then
			if Value == true then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":noclip me", Player = game.Players[localPlayer.Name], Args = ""})
			elseif Value == false then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":clip me", Player = game.Players[localPlayer.Name], Args = ""})
			end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local flightToggle = characterTab:CreateToggle({
	Name = "Flight",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if versionActive == true then
			if Value == true then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":fly me", Player = game.Players[localPlayer.Name], Args = "3 true"})
			elseif Value == false then
				flightSpeedSlider:Set(3) -- The new slider integer value
                replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":unfly me", Player = game.Players[localPlayer.Name], Args = "3 true"})
			end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local refreshButton = characterTab:CreateButton({
	Name = "Refresh",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":ref me", Player = game.Players[localPlayer.Name], Args = ""})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local respawnButton = characterTab:CreateButton({
	Name = "Respawn",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":res me", Player = game.Players[localPlayer.Name], Args = ""})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local respawnButton = characterTab:CreateButton({
	Name = "Invulnerability",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":god me", Player = game.Players[localPlayer.Name], Args = ""})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local respawnButton = characterTab:CreateButton({
	Name = "Fling",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":fling me", Player = game.Players[localPlayer.Name], Args = ""})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local extrasensoryPerceptionToggle = characterTab:CreateToggle({
	Name = "Extrasensory Perception",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if versionActive == true then
			if Value == true then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":esp all", Player = game.Players[localPlayer.Name], Args = ""})
			elseif Value == false then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":unesp all", Player = game.Players[localPlayer.Name], Args = ""})
			end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local invisibilityButton = characterTab:CreateToggle({
	Name = "Invisibility",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if versionActive == true then
			if Value == true then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":invisible me", Player = game.Players[localPlayer.Name], Args = ""})
			elseif Value == false then
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":visible me", Player = game.Players[localPlayer.Name], Args = ""})
			end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local nightAndDayButton = characterTab:CreateButton({
	Name = "Night and Day",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
			if currentTime == 12 then
				currentTime = 24
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":time", Player = game.Players[localPlayer.Name], Args = currentTime})
			else
				currentTime = 12
				replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":time", Player = game.Players[localPlayer.Name], Args = currentTime})
			end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local hardcoreTab = Window:CreateTab("Hardcore Scripts", 4370319235)

local nukeButton = hardcoreTab:CreateButton({
	Name = "Nuke Script",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("AddAdmin", {Player = v, Level = 0})
            end
			replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = ":nuke me", Player = game.Players[localPlayer.Name], Args = ""})
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                    v.Material = "CorrodedMetal"
                    Instance.new("Fire").Parent = v
                end
            end
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

local adonisEssentialsTab = Window:CreateTab("Adonis Essentials", 4370319235)

local targetUsernameInput = adonisEssentialsTab:CreateInput({
    Name = "Target Username",
    PlaceholderText = "Username",
    NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
    CharacterLimit = false, --max character limit. Remove or set to false
    OnEnter = false, -- Will callback only if the user pressed ENTER while being focused on the the box.
    RemoveTextAfterFocusLost = false, -- Speaks for itself.
    Callback = function(Text)
        adonisPlayer = Text
    end,
 })

 local commandInput = adonisEssentialsTab:CreateInput({
    Name = "Command",
    PlaceholderText = "Command",
    NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
    CharacterLimit = false, --max character limit. Remove or set to false
    OnEnter = false, -- Will callback only if the user pressed ENTER while being focused on the the box.
    RemoveTextAfterFocusLost = false, -- Speaks for itself.
    Callback = function(Text)
        adonisCommand = Text
    end,
 })

local executeButton = adonisEssentialsTab:CreateButton({
	Name = "Execute",
	Interact = 'Click',
	Callback = function()
		if versionActive == true then
            if string.find(adonisCommand, "nuke") then
                return error()
            end
            replicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommandAsPlayer", {Command = adonisCommand, Player = game.Players[adonisPlayer], Args = ""})
		elseif versionActive == false then
			return error("DarkHub | DarkHub is currently patched... please visit our Communications Server for more information.")
		end
	end,
})

nukeButton:Lock("This feature isn't available at the moment. ")
if localPlayer.Name ~= "TimoClipz" or localPlayer.DisplayName ~= "fufu" then
    executeButton:Lock("This feature isn't available at the moment. ")
end
