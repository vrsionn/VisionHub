local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()

local Window = Library:CreateWindow{
    Title = game:GetService("MarketplaceService"):GetProductInfo(85896571713843).Name,
    SubTitle = "by vrsion",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Resize = true,
    MinSize = Vector2.new(470, 380),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl,
}

local selectedDice = nil
local selectedDifficulty = nil
local AutoRollDice = false
local AutoPetMatch = false
local AutoCartEscape = false
local AutoStartRobotClaw = false
local AutoPlayRobotClaw = false
local AutoGameEgg = false
local dice = game:GetService("ReplicatedStorage").Assets.Minigames.Dice:GetChildren()
    local diceTable = {}
    for i, v in pairs(dice) do
        table.insert(diceTable, v.Name)
    end
local difficulty = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Minigame.Frame.Main.Buttons:GetChildren()
    local difficultyTable = {}
    for i, v in pairs(difficulty) do
        table.insert(difficultyTable, v.Name)
    end

local Tabs = {
    Info = Window:CreateTab{ Title = "Info", Icon = "rbxassetid://81233184473110" },
    Main = Window:CreateTab{ Title = "Main", Icon = "rbxassetid://105783201761273" },
    Settings = Window:CreateTab{ Title = "Settings", Icon = "rbxassetid://104980967698899" },
}

local Options = Library.Options

Tabs.Info:CreateParagraph("Aligned Paragraph", {
    Title = "Purpose",
    Content = "will be updated after every update while strelizia is down\npair this script with strelizia script\nalways keyless and open source\nvrsion made it nigga join strelizia",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center,
})
Tabs.Info:CreateButton{
    Title = "Strelizia Discord",
    Description = "copies strelizia discord invite to clipboard",
    Callback = setclipboard("discord.gg/strelizia"),
}

local selectedDiceDropdown = Tabs.Main:CreateDropdown("selectedDice", {
    Title = "Dice To Use",
    Description = "which dice to use for auto dice (im retarded and cant get multi to work, wait for strelizia)",
    Values = diceTable,
    Multi = false,
    Default = {"Dice"},
})

selectedDiceDropdown:OnChanged(function(Value)
    print("selectedDiceDropdown changed:", Value)
end)

local AutoRollDiceToggle = Tabs.Main:CreateToggle("AutoRollDice", {
    Title = "Auto Roll Dice",
    Default = false,
})

AutoRollDiceToggle:OnChanged(function()
    print("AutoRollDiceToggle changed:", Options.AutoRollDice.Value)
    AutoRollDice = Options.AutoRollDice.Value
    while AutoRollDice do
        task.wait(1)
        local args = {[1] = "RollDice",[2] = selectedDiceDropdown.Value}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer(unpack(args))        
        task.wait(1)
        local args = {[1] = "ClaimTile"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end
end)

local selectedDifficultyDropdown = Tabs.Main:CreateDropdown("selectedDifficulty", {
    Title = "Difficulty To Use",
    Description = "which difficulty to use for auto minigames (im not making a separate diffulty for each idc)",
    Values = difficultyTable,
    Multi = false,
    Default = {"Easy"},
})

selectedDifficultyDropdown:OnChanged(function(Value)
    print("selectedDifficultyDropdown changed:", Value)
end)

local AutoPetMatchToggle = Tabs.Main:CreateToggle("AutoPetMatch", {
    Title = "Auto Pet Match",
    Default = false,
})

AutoPetMatchToggle:OnChanged(function()
    print("AutoPetMatchToggle changed:", Options.AutoPetMatch.Value)
    AutoPetMatch = Options.AutoPetMatch.Value
    while AutoPetMatch do
        task.wait(1)
        local args = {[1] = "SkipMinigameCooldown",[2] = "Pet Match"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(3)
        local args = {[1] = "StartMinigame",[2] = "Pet Match",[3] = selectedDifficultyDropdown.Value}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(1)
        local args = {[1] = "FinishMinigame"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(1)
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:GetChildren()) do
            if v.Name == "Prompt" then
             v.Visible = false
         end
     end
        task.wait(1)
    end
end)

local AutoCartEscapeToggle = Tabs.Main:CreateToggle("AutoCartEscape", {
    Title = "Auto Cart Escape",
    Default = false,
})

AutoCartEscapeToggle:OnChanged(function()
    print("AutoCartEscapeToggle changed:", Options.AutoCartEscape.Value)
    AutoCartEscape = Options.AutoCartEscape.Value
    while AutoCartEscape do
        task.wait(1)
        local args = {[1] = "SkipMinigameCooldown",[2] = "Cart Escape"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(1)
        local args = {[1] = "StartMinigame",[2] = "Cart Escape",[3] = selectedDifficultyDropdown.Value}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(0.25)
        local args = {[1] = "FinishMinigame"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(0.25)
            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:GetChildren()) do
                   if v.Name == "Prompt" then
                    v.Visible = false
                end
            end
            task.wait(0.25)
        end
end)

local AutoStartRobotClawToggle = Tabs.Main:CreateToggle("AutoStartRobotClaw", {
    Title = "Auto START Robot Claw",
    Default = false,
})

AutoStartRobotClawToggle:OnChanged(function()
    print("AutoRobotClawToggle changed:", Options.AutoStartRobotClaw.Value)
    AutoStartRobotClaw = Options.AutoStartRobotClaw.Value
    while AutoStartRobotClaw do
        task.wait(2)
        local args = {[1] = "SkipMinigameCooldown",[2] = "Robot Claw"}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(2)
        local args = {[1] = "StartMinigame",[2] = "Robot Claw",[3] = selectedDifficultyDropdown.Value}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
        task.wait(0.25)
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:GetChildren()) do
            if v.Name == "Prompt" then
             v.Visible = false
         end
     end
        task.wait(0.25)
    end
end)

local AutoPlayRobotClawToggle = Tabs.Main:CreateToggle("AutoPlayRobotClaw", {
    Title = "Auto PLAY Robot Claw",
    Default = false,
})

AutoPlayRobotClawToggle:OnChanged(function()
    print("AutoRobotClawToggle changed:", Options.AutoPlayRobotClaw.Value)
    AutoPlayRobotClaw = Options.AutoPlayRobotClaw.Value
    while AutoPlayRobotClaw do
        for _, item in pairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):GetChildren()) do
            if item:IsA("Instance") and item.Name:match("^ClawItem") then
                local cleanId = item.Name:gsub("^ClawItem", "")
                local args = {[1] = "GrabMinigameItem",[2] = cleanId}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
                task.wait(0.25)
            end
        end
        task.wait(0.25)
    end
end)

local AutoGameEggToggle = Tabs.Main:CreateToggle("AutoGameEgg", {
    Title = "Auto Open Game Egg",
    Default = false,
})

AutoGameEggToggle:OnChanged(function()
    print("AutoGameEggToggle changed:", Options.AutoGameEgg.Value)
    AutoGameEgg = Options.AutoGameEgg.Value
    while AutoGameEgg do
        task.wait(0.35)
        local args = {[1] = "HatchEgg",[2] = "Game Egg",[3] = 6}game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
    end
end)

SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
Library:Notify{ Title = "the script", Content = "ts loaded nigga", Duration = 8 }
SaveManager:LoadAutoloadConfig()
