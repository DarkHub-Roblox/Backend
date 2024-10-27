getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Dark Hub",
   LoadingTitle = "Dark Hub",
   LoadingSubtitle = "by Stormzy Exploiting",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = true, -- Create a custom folder for your hub/game
      FileName = "Dark Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "VQbrRkkyY4", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Dark Hub",
      Subtitle = "Key System",
      Note = "Please complete the whitelist to gain access to Dark Hub.",
      FileName = "DarkHub_Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"test"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Home", nil) -- Title, Image
local Section = Tab:CreateSection("Main")

Rayfield:Notify({
   Title = "Script Execution",
   Content = "You executed the script!",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons

      Ignore = { -- Duplicate this table (or remove it) to add and remove buttons to the notification.
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },

},
})

local Button = Tab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
        print("test")
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local Tools = Window:CreateTab("Tools", nil) -- Title, Image
local Section = Tools:CreateSection("Guns")
local Button = Tools:CreateButton({
   Name = "RPG",
   Callback = function()
   print("hi")
   end,
})
local Section = Tools:CreateSection("Classes")
local Button = Tools:CreateButton({
   Name = "Nuke",
   Callback = function()
   game.ReplicatedStorage.RemoteEvent:FireServer("RunCommand", {playername = "System", command = ":nuke all"})
   end,
})
local Section = Tools:CreateSection("Food & Drinks")

local AdonisAdmin = Window:CreateTab("Adonis Admin", nil) -- Title, Image
local Section = AdonisAdmin:CreateSection("Main")

local Input = AdonisAdmin:CreateInput({
   Name = "Add Admin",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      game.ReplicatedStorage.RemoteEvent:FireServer("AddAdmin", {plr = game.Players[Text], level = 1500})
   end,
})

local Input = AdonisAdmin:CreateInput({
   Name = "Remove Admin",
   PlaceholderText = "Username",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      game.ReplicatedStorage.RemoteEvent:FireServer("AddAdmin", {plr = game.Players[Text], level = 0})
   end,
})

local Input = AdonisAdmin:CreateInput({
   Name = "Run Command",
   PlaceholderText = "Command",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      game.ReplicatedStorage.RemoteEvent:FireServer("RunCommand", {playername = "System", command = Text})
   end,
})

local Button = AdonisAdmin:CreateButton({
   Name = "Nuke",
   Callback = function()
   game.ReplicatedStorage.RemoteEvent:FireServer("RunCommand", {playername = "System", command = ":nuke all"})
   end,
})

local Button = AdonisAdmin:CreateButton({
   Name = "Remove Server Admin",
   Callback = function()
      for i,v in pairs(game.Players:GetPlayers()) do
          print(v)
          game.ReplicatedStorage.RemoteEvent:FireServer("AddAdmin", {plr = game.Players[v.Name], level = 0})
      end
   end,
})
