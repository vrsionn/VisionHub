if not game:IsLoaded() then
    game.Loaded:Wait()
end

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = game:GetService("MarketplaceService"):GetProductInfo(116257860860954).Name .. " | Vision Hub",
    Center = true,
    AutoShow = true,
    Resizable = true,
	ShowCustomCursor = false,
    NotifySide = "Left",
    TabPadding = 8,
    MenuFadeTime = 0.2
})

    local AutoTrain = false
    local AutoWins = false
    local AutoFreeGifts = false
    local AutoDaily = false
    local AutoOPPet = false
    local AutoRebirth = false
    local AutoSuperRebirth = false
    local AutoEquipBestDumbell = false
    local AutoEquipTrail = false
    local AutoEquipAura = false
    local AutoDisablePopUps = false
    local selectedEggAmount = nil
    local selectedArea = nil
    local AutoHatch = false
    local AutoEquipBest = false
    local AutoEvolve = false
    local eggs = game:GetService("ReplicatedStorage").Pets:GetChildren()
    local eggsTable = {}
    for i, v in pairs(eggs) do
        table.insert(eggsTable, v.Name)
    end
    local areas = game:GetService("ReplicatedStorage").Config.AreaData:GetChildren()
    local areasTable = {}
    for i, v in pairs(areas) do
        table.insert(areasTable, v.Name)
    end
    local trails = game:GetService("ReplicatedStorage").Trails:GetChildren()
    local trailsTable = {}
    for i, v in pairs(trails) do
        table.insert(trailsTable, v.Name)
    end
    local auras = game:GetService("ReplicatedStorage").Auras:GetChildren()
    local aurasTable = {}
    for i, v in pairs(auras) do
        table.insert(aurasTable, v.Name)
    end

local Tabs = {
    General = Window:AddTab('General'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local AutoFarmGroupBox = Tabs.General:AddLeftGroupbox('Auto Farm')
local AutoBuyGroupBox = Tabs.General:AddLeftGroupbox('Auto Buy')
local PetsGroupBox = Tabs.General:AddRightGroupbox('Pets')
local AutoUseGroupBox = Tabs.General:AddRightGroupbox('Auto Use')
local MiscGroupBox = Tabs.General:AddLeftGroupbox('Misc')
local TeleportGroupBox = Tabs.General:AddRightGroupbox('Teleports')

local VirtualUser = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

AutoFarmGroupBox:AddToggle('AutoTrain', {
    Text = 'Auto Train',
    Default = false,
    Tooltip = 'Auto trains as fast as possible.',
    DisabledTooltip = 'I am disabled!',
    Disabled = false,
    Visible = true,
    Risky = false,

    Callback = function(Value)
        AutoTrain = Value
        print('[cb] AutoTrain was changed:', Value)
        while AutoTrain do
            local args = {[1] = {["!"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
})

AutoFarmGroupBox:AddToggle('AutoWins', {
    Text = 'Auto Win',
    Default = false,
    Tooltip = 'Auto wins as fast as possible.',

    Callback = function(Value)
        AutoWins = Value
        print('[cb] AutoWins was changed:', Value)
        while AutoWins do
            local args = {[1] = {["$"] = {[1] = {[1] = 4,["n"] = 1}},["#"] = {[1] = {[1] = true,["n"] = 1}},["\30"] = {[1] = {[1] = true,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
})

AutoFarmGroupBox:AddToggle('AutoDaily', {
    Text = 'Auto Claim Gifts',
    Default = false,
    Tooltip = 'Auto claims gifts.',

    Callback = function(Value)
        AutoFreeGifts = Value
        print('[cb] AutoFreeGifts was changed:', Value)
        while AutoFreeGifts do
            local args = {[1] = {["%"] = {[1] = {[1] = 1,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 2,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 3,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 4,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 5,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 6,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 7,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 8,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 9,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 10,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 11,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["%"] = {[1] = {[1] = 12,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

AutoFarmGroupBox:AddToggle('AutoDaily', {
    Text = 'Auto Claim Daily',
    Default = false,
    Tooltip = 'Auto claims daily rewards.',

    Callback = function(Value)
        AutoDaily = Value
        print('[cb] AutoDaily was changed:', Value)
        while AutoDaily do
            local args = {[1] = {["'"] = {[1] = {[1] = 1,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 2,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 3,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 4,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 5,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 6,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 7,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 8,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 9,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 10,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 11,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            local args = {[1] = {["'"] = {[1] = {[1] = 12,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

AutoFarmGroupBox:AddToggle('AutoOPPet', {
    Text = 'Auto Claim OP Pet',
    Default = false,
    Tooltip = 'Auto claims op pet.',

    Callback = function(Value)
        AutoOPPet = Value
        print('[cb] AutoOPPet was changed:', Value)
        while AutoOPPet do
            local args = {[1] = {["\16"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))            
            task.wait(1)
        end
    end
})

AutoBuyGroupBox:AddToggle('AutoRebirth', {
    Text = 'Auto Rebirth',
    Default = false,
    Tooltip = 'Auto rebirths as fast as possible.',

    Callback = function(Value)
        AutoRebirth = Value
        print('[cb] AutoRebirth was changed:', Value)
        while AutoRebirth do
            local args = {[1] = {["\21"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
})

AutoBuyGroupBox:AddToggle('AutoSuperRebirth', {
    Text = 'Auto Super Rebirth',
    Default = false,
    Tooltip = 'Auto super rebirths as fast as possible.',

    Callback = function(Value)
        AutoSuperRebirth = Value
        print('[cb] AutoSuperRebirth was changed:', Value)
        while AutoSuperRebirth do
            local args = {[1] = {["\22"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(0.1)
        end
    end
})

PetsGroupBox:AddDropdown('EggAmount', {
    Values = { "1", "2","3","8",},
    Default = "..",
    Multi = false,

    Text = 'Egg Amount',
    Tooltip = 'Amount of eggs to hatch.',
    DisabledTooltip = 'I am disabled!',

    Callback = function(Value)
        print('[cb] selectedEggAmount changed:', Value)
    end,

    Disabled = false,
	Visible = true,
})

PetsGroupBox:AddDropdown('Egg', {
    Values = eggsTable,
    Default = "..",
    Multi = false,

    Text = 'Egg',
    Tooltip = 'Type of egg to hatch.',

    Callback = function(Value)
        print('[cb] selectedEgg changed:', Value)
    end
})

PetsGroupBox:AddToggle('AutoHatch', {
    Text = 'Auto Hatch',
    Default = false,
    Tooltip = 'Auto hatch selected egg.',

    Callback = function(Value)
        AutoHatch = Value
        print('[cb] AutoHatch was changed:', Value)
        while AutoHatch do
            local args = {[1] = {},[2] = {[" "] = {[1] = {[1] = "\4",[2] = Options.Egg.Value,[3] = tonumber(Options.EggAmount.Value),}}}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait()
        end
    end
})

PetsGroupBox:AddToggle('AutoEquipBest', {
    Text = 'Auto Equip Best',
    Default = false,
    Tooltip = 'Auto equips best pets.',

    Callback = function(Value)
        AutoEquipBest = Value
        print('[cb] AutoEquipBest was changed:', Value)
        while AutoEquipBest do
            local args = {[1] = {["\29"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

PetsGroupBox:AddToggle('AutoEvolve', {
    Text = 'Auto Evolve Pets',
    Default = false,
    Tooltip = 'Auto evolves pets.',

    Callback = function(Value)
        AutoEvolve = Value
        print('[cb] AutoEvolve was changed:', Value)
        while AutoEvolve do
            local args = {[1] = {["\24"] = {[1] = {["n"] = 0}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

MiscGroupBox:AddDropdown('SelectedTrail', {
	Values = trailsTable,
	Default = "--",
	Multi = false,

	Text = 'Select Trail',
	Tooltip = 'Trail to auto equip.',
	DisabledTooltip = 'I am disabled!',

	Searchable = true,

	Callback = function(Value)
		print('[cb] SelectedTrail got changed. New value:', Value)
	end,

	Disabled = false,
	Visible = true,
})

MiscGroupBox:AddToggle('AutoEquipTrail', {
    Text = 'Auto Equip Selected Trail',
    Default = false,
    Tooltip = 'Auto equips selected trail.',

    Callback = function(Value)
        AutoEquipTrail = Value
        print('[cb] AutoEquipTrail was changed:', Value)
        while AutoEquipTrail do
            local args = {[1] = {["\5"] = {[1] = {[1] = Options.SelectedTrail.Value,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

MiscGroupBox:AddDropdown('SelectedAura', {
	Values = aurasTable,
	Default = "--",
	Multi = false,

	Text = 'Select Aura',
	Tooltip = 'Aura to auto equip.',
	DisabledTooltip = 'I am disabled!',

	Searchable = true,

	Callback = function(Value)
		print('[cb] SelectedAura got changed. New value:', Value)
	end,

	Disabled = false,
	Visible = true,
})

MiscGroupBox:AddToggle('AutoEquipAura', {
    Text = 'Auto Equip Selected Aura',
    Default = false,
    Tooltip = 'Auto equips selected aura.',

    Callback = function(Value)
        AutoEquipAura = Value
        print('[cb] AutoEquipAura was changed:', Value)
        while AutoEquipAura do
            local args = {[1] = {["\13"] = {[1] = {[1] = Options.SelectedAura.Value,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

MiscGroupBox:AddToggle('AutoEquipBestDumbell', {
    Text = 'Auto Equip Best Dumbell',
    Default = false,
    Tooltip = 'Auto equips best dumbell.',

    Callback = function(Value)
        AutoEquipBestDumbell = Value
        print('[cb] AutoEquipBestDumbell was changed:', Value)
        while AutoEquipBestDumbell do
            local args = {[1] = {["\""] = {[1] = {[1] = "OP Dumbbell x130k",["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
            task.wait(1)
        end
    end
})

MiscGroupBox:AddToggle('AutoDisablePopUps', {
    Text = 'Auto Disables Pop Ups',
    Default = false,
    Tooltip = 'Auto disables annoying pop ups.',

    Callback = function(Value)
        AutoDisablePopUps = Value
        print('[cb] AutoDisablePopUps was changed:', Value)

        if AutoDisablePopUps then
            task.spawn(function()
                while AutoDisablePopUps do
                    game:GetService("Players").LocalPlayer.PlayerGui.StatIncrease.Enabled = false
                    game:GetService("Players").LocalPlayer.PlayerGui.ScreenEffects.Enabled = false
                    task.wait()
                end
                game:GetService("Players").LocalPlayer.PlayerGui.StatIncrease.Enabled = true
                game:GetService("Players").LocalPlayer.PlayerGui.ScreenEffects.Enabled = true
            end)
        else
            game:GetService("Players").LocalPlayer.PlayerGui.StatIncrease.Enabled = false
            game:GetService("Players").LocalPlayer.PlayerGui.ScreenEffects.Enabled = false
        end
    end
})


TeleportGroupBox:AddDropdown('TeleportArea', {
    Values = areasTable,
    Default = "..",
    Multi = false,

    Text = 'Area',
    Tooltip = 'Area to teleport to.',

    Callback = function(Value)
        print('[cb] selectedArea changed:', Value)
    end
})

local TeleportToArea = TeleportGroupBox:AddButton({
    Text = 'Teleport To Area',
    Func = function()
        local args = {[1] = {["\n"] = {[1] = {[1] = Options.TeleportArea.Value,["n"] = 1}}},[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("ReliableRedEvent"):FireServer(unpack(args))
    end,
    DoubleClick = false,
    Tooltip = 'Teleports to selected area.'
})

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('vision Hub')
SaveManager:SetFolder('vision Hub/Egg Hatchers')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
