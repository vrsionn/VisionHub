if getgenv().vision then warn("Vision Hub : Already executed!") return end
getgenv().vision = true

if not game:IsLoaded() then
    game.Loaded:Wait()
end


local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = game:GetService("MarketplaceService"):GetProductInfo(108186921752317).Name .. " | Vision Hub",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

    local AutoClick = false
    local AutoDaily = false
    local AutoSpin = false
    local selectedRebirthButton = nil
    local AutoRebirth = false
    local AutoUpgrades = false
    local AutoBuyWorlds = false
    local AutoBuyAuras = false
    local AutoBuyTapSkins = false
    local AutoBuyCandyMerchant = false
    local selectedEgg = nil
    local selectedEggAmount = nil
    local AutoHatch = false
    local AutoEquipBest = false
    local AutoClaimIndex = false
    local AutoTapPotion = false
    local AutoCrystalPotion = false
    local AutoRebirthPotion = false
    local AutoLuckPotion = false
    local AutoSecretLuckPotion = false
    local Overworld = workspace.Portals.Portals.Overworld:GetChildren()
    local OverworldTable = {}
    for i, v in pairs(Overworld) do
        table.insert(OverworldTable, v.Name)
    end

    local RebirthList = {
        ["1"] = 1,
        ["2"] = 2,
        ["4"] = 4,
        ["5"] = 5,
        ["6"] = 6,
        ["7"] = 7,
        ["8"] = 8,
        ["9"] = 9,
        ["10"] = 10,
        ["11"] = 11,
        ["12"] = 12,
        ["13"] = 13,
        ["14"] = 14,
        ["15"] = 15,
        ["16"] = 16,
        ["17"] = 17,
        ["18"] = 18,
        ["19"] = 19,
        ["20"] = 20,
        ["21"] = 21,

    }

    local EggAmountList = {
        ["1"] = "Single",
        ["3"] = "Triple",
        ["5"] = "Quintuple",
    }

    local EggList = {
        ["Basic Egg"] = "Basic",
        ["Golden Basic Egg"] = "GoldenBasic",
        ["Cactus Egg"] = "Cactus",
        ["Golden Cactus Egg"] = "GoldenCactus",
        ["Yeti Egg"] = "Yeti",
        ["Golden Yeti Egg"] = "GoldenYeti",
        ["Molten Egg"] = "Molten",
        ["Golden Molten Egg"] = "GoldenMolten",
        ["Coral Egg"] = "Coral",
        ["Golden Coral Egg"] = "GoldenCoral",
        ["Candy Egg"] = "Candy",
        ["Golden Candy Egg"] = "GoldenCandy",
        ["Crescent Egg"] = "Crescent",
        ["Golden Crescent Egg"] = "GoldenCrescent",
        ["100K Egg"] = "100K",
    }

local Tabs = {
    General = Window:AddTab('General'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local AutoFarmGroupBox = Tabs.General:AddLeftGroupbox('Auto Farm')
local AutoBuyGroupBox = Tabs.General:AddLeftGroupbox('Auto Buy')
local PetsGroupBox = Tabs.General:AddRightGroupbox('Pets')
local AutoUseGroupBox = Tabs.General:AddRightGroupbox('Auto Use')
local MiscGroupBox = Tabs.General:AddLeftGroupbox('Misc')

local VirtualUser = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

AutoFarmGroupBox:AddToggle('AutoClick', {
    Text = 'Auto Click',
    Default = false,
    Tooltip = 'Auto click as fast as possible.',

    Callback = function(Value)
        AutoClick = Value
        while AutoClick do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
            wait()
        end
        print('[cb] AutoClick was changed:', Value)
    end
})

AutoFarmGroupBox:AddToggle('AutoDaily', {
    Text = 'Auto Claim Daily',
    Default = false,
    Tooltip = 'Auto claim daily rewards.',

    Callback = function(Value)
        AutoDaily = Value
        while AutoDaily do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimDaily"):FireServer()
            wait()
        end
        print('[cb] AutoDaily was changed:', Value)
    end
})

AutoFarmGroupBox:AddToggle('AutoSpin', {
    Text = 'Auto Spin',
    Default = false,
    Tooltip = 'Auto spins wheel.',

    Callback = function(Value)
        AutoSpin = Value
        while AutoSpin do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SpinFunction"):InvokeServer()
            wait()
        end
        print('[cb] AutoSpin was changed:', Value)
    end
})

AutoBuyGroupBox:AddInput('RebirthButton', {
    Default = '--',
    Numeric = true,
    Finished = false,

    Text = 'Rebirth Button',
    Tooltip = 'Rebirth button for "Auto Rebirth"', 

    Placeholder = '--',

    Callback = function(Value)
        print('[cb] Rebirth Button changed:', Value)
        selectedRebirthButton = RebirthList[Value]
    end
})

AutoBuyGroupBox:AddToggle('AutoRebirth', {
    Text = 'Auto Rebirth',
    Default = false,
    Tooltip = 'Auto rebirth to selected button.',

    Callback = function(Value)
        AutoRebirth = Value
        while AutoRebirth do
            local args = {
                [1] = selectedRebirthButton
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):InvokeServer(unpack(args))
            wait()
        end
        print('[cb] AutoRebirth was changed:', Value)
    end
})

AutoBuyGroupBox:AddToggle('AutoUpgrades', {
    Text = 'Auto Upgrades',
    Default = false,
    Tooltip = 'Auto buy player upgrades.',

    Callback = function(Value)
        AutoUpgrades = Value
        while AutoUpgrades do
            local args = {
                [1] = "Overworld",
                [2] = "Spawn",
                [3] = "TapBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Spawn",
                [3] = "RebirthAmount"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Spawn",
                [3] = "CrystalBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Spawn",
                [3] = "Luck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Spawn",
                [3] = "HatchSpeed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Glacier",
                [3] = "TapBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Glacier",
                [3] = "RebirthAmount"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Glacier",
                [3] = "CrystalBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Glacier",
                [3] = "Luck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Glacier",
                [3] = "HatchSpeed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Aqua",
                [3] = "TapBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Aqua",
                [3] = "RebirthAmount"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Aqua",
                [3] = "CrystalBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Aqua",
                [3] = "Luck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Aqua",
                [3] = "HatchSpeed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Launch",
                [3] = "TapBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Launch",
                [3] = "RebirthAmount"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Launch",
                [3] = "CrystalBoost"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Launch",
                [3] = "Luck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
            local args = {
                [1] = "Overworld",
                [2] = "Launch",
                [3] = "HatchSpeed"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            wait()
        end
        print('[cb] AutoUpgrades was changed:', Value)
    end
})

AutoBuyGroupBox:AddToggle('AutoBuyWorlds', {
    Text = 'Auto Buy Worlds',
    Default = false,
    Tooltip = 'Auto buy worlds',

    Callback = function(Value)
        AutoBuyWorlds = Value
        while AutoBuyWorlds do
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Desert"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Glacier"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Volcano"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Aqua"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Candy"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
            local args = {
                [1] = false,
                [2] = "Overworld",
                [3] = "Launch"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Teleport"):InvokeServer(unpack(args))
            wait()
        end
        print('[cb] AutoBuyWorlds was changed:', Value)
    end
})

AutoBuyGroupBox:AddToggle('AutoBuyAuras', {
    Text = 'Auto Buy Auras',
    Default = false,
    Tooltip = 'Auto buys auras.',

    Callback = function(Value)
        AutoBuyAuras = Value
        while AutoBuyAuras do
            local args = {
                [1] = "Fire"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Sun"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Snow"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Moon"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Starry"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Celestial"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = "Power"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AuraPurchase"):FireServer(unpack(args))            
            wait()
        end
        print('[cb] AutoBuyAuras was changed:', Value)
    end
})

AutoBuyGroupBox:AddToggle('AutoBuyTapSkins', {
    Text = 'Auto Buy Tap Skins',
    Default = false,
    Tooltip = 'Auto buys tap skins.',

    Callback = function(Value)
        AutoBuyTapSkins = Value
        while AutoBuyTapSkins do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyTapSkin"):FireServer()
            wait()
        end
        print('[cb] AutoBuyTapSkins was changed:', Value)
    end
})

AutoBuyGroupBox:AddToggle('AutoBuyCandyMerchant', {
    Text = 'Auto Buy Candy Merchant',
    Default = false,
    Tooltip = 'Auto buys candy merchant items.',

    Callback = function(Value)
        AutoBuyCandyMerchant = Value
        while AutoBuyCandyMerchant do
            local args = {
                [1] = 0
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CandyMerchant"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = 1
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CandyMerchant"):FireServer(unpack(args))            
            wait()
            local args = {
                [1] = 2
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CandyMerchant"):FireServer(unpack(args))            
            wait()
        end
        print('[cb] AutoBuyCandyMerchant was changed:', Value)
    end
})

PetsGroupBox:AddDropdown('EggAmount', {
    Values = { "1", "3", "5" },
    Default = "..",
    Multi = false,

    Text = 'Egg Amount',
    Tooltip = 'Amount of eggs to hatch.',

    Callback = function(Value)
        print('[cb] selectedEggAmount changed:', Value)
        selectedEggAmount = EggAmountList[Value]
    end
})

PetsGroupBox:AddDropdown('Egg', {
    Values = { "Basic Egg", "Golden Basic Egg", "Cactus Egg", "Golden Cactus Egg", "Yeti Egg", "Golden Yeti Egg", "Molten Egg", "Golden Molten Egg", "Coral Egg", "Golden Coral Egg", "Candy Egg", "Golden Candy Egg", "Crescent Egg", "Golden Crescent Egg", "100K Egg", },
    Default = "..",
    Multi = false,

    Text = 'Egg',
    Tooltip = 'Type of egg to hatch.',

    Callback = function(Value)
        print('[cb] selectedEgg changed:', Value)
        selectedEgg = EggList[Value]
    end
})

PetsGroupBox:AddToggle('AutoHatch', {
    Text = 'Auto Hatch',
    Default = false,
    Tooltip = 'Auto hatch selected egg.',

    Callback = function(Value)
        AutoHatch = Value
        while AutoHatch do
            local args = {
                [1] = selectedEgg,
                [2] = selectedEggAmount
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Hatch"):InvokeServer(unpack(args))
            wait()
        end
        print('[cb] AutoHatch was changed:', Value)
    end
})

PetsGroupBox:AddToggle('AutoEquipBest', {
    Text = 'Auto Equip Best',
    Default = false,
    Tooltip = 'Auto equip best pets.',

    Callback = function(Value)
        AutoEquipBest = Value
        while AutoEquipBest do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EquipBest"):FireServer()
            wait()
        end
        print('[cb] AutoEquipBest was changed:', Value)
    end
})

PetsGroupBox:AddToggle('AutoClaimIndex', {
    Text = 'Auto Claim Index Rewards',
    Default = false, 
    Tooltip = 'Auto claims index milestones.',

    Callback = function(Value)
        AutoClaimIndex = Value
        while AutoClaimIndex do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimIndexReward"):InvokeServer()
            wait()
        end
        print('[cb] AutoClaimIndex was changed:', Value)
    end
})

AutoUseGroupBox:AddToggle('AutoTapPotion', {
    Text = 'Auto Taps Potion',
    Default = false,
    Tooltip = 'Auto use x2 taps potions.',

    Callback = function(Value)
        AutoTapPotion = Value
        while AutoTapPotion do
            local args = {
                [1] = "Taps"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseBoost"):FireServer(unpack(args))
            
            wait(1800)
        end
        print('[cb] AutoTapPotion was changed:', Value)
    end
})

AutoUseGroupBox:AddToggle('AutoCrystalPotion', {
    Text = 'Auto Crystal Potion',
    Default = false,
    Tooltip = 'Auto use x2 crystal potions.',

    Callback = function(Value)
        AutoCrystalPotion = Value
        while AutoCrystalPotion do
            local args = {
                [1] = "Crystal"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseBoost"):FireServer(unpack(args))
            
            wait(1800)
        end
        print('[cb] AutoCrystalPotion was changed:', Value)
    end
})

AutoUseGroupBox:AddToggle('AutoRebirthPotion', {
    Text = 'Auto Rebirth Potion',
    Default = false,
    Tooltip = 'Auto use x2 rebirth potions.',

    Callback = function(Value)
        AutoRebirthPotion = Value
        while AutoRebirthPotion do
            local args = {
                [1] = "Rebirths"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseBoost"):FireServer(unpack(args))
            
            wait(1800)
        end
        print('[cb] AutoRebirthPotion was changed:', Value)
    end
})

AutoUseGroupBox:AddToggle('AutoLuckPotion', {
    Text = 'Auto Luck Potion',
    Default = false,
    Tooltip = 'Auto use x2 luck potions.',

    Callback = function(Value)
        AutoLuckPotion = Value
        while AutoLuckPotion do
            local args = {
                [1] = "Luck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseBoost"):FireServer(unpack(args))
            
            wait(1800)
        end
        print('[cb] AutoLuckPotion was changed:', Value)
    end
})

AutoUseGroupBox:AddToggle('AutoSecretLuckPotion', {
    Text = 'Auto Secret Luck Potion',
    Default = false,
    Tooltip = 'Auto use x2 secret luck potions.',

    Callback = function(Value)
        AutoSecretLuckPotion = Value
        while AutoSecretLuckPotion do
            local args = {
                [1] = "SecretLuck"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseBoost"):FireServer(unpack(args))
            
            wait(1800)
        end
        print('[cb] AutoSecretLuckPotion was changed:', Value)
    end
})

MiscGroupBox:AddDropdown('Teleport', {
    Values = OverworldTable,
    Default = "--",
    Multi = false,

    Text = 'Use Portal',
    Tooltip = 'Use portal for selected world.',

    Callback = function(Value)
        print('[cb] Teleport was changed:', Value)
    end
})

Options.Teleport:OnChanged(function()
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    for i, v in pairs(Overworld) do
        if v.Name == Options.Teleport.Value then
            for i, v in pairs(v:GetChildren()) do
                if v:IsA("Part") and v.Name == "Touch" then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0) 
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1) 
                end
            end
        end
    end
end)

MiscGroupBox:AddSlider('WalkspeedSlider', {
    Text = 'Walkspeed Slider',
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        print('[cb] WalkspeedSlider was changed:', Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

MiscGroupBox:AddSlider('JumpPowerSlider', {
    Text = 'Jump Power Slider',
    Default = 7.2,
    Min = 7.2,
    Max = 150,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        print('[cb] JumpPowerSlider was changed:', Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
    end
})

MiscGroupBox:AddButton({
    Text = 'FPS Booster',
    Func = function()
        print('You clicked a sub button!')
        _G.Settings = {
            Players = {
                ["Ignore Me"] = true,
                ["Ignore Others"] = true
            },
            Meshes = {
                Destroy = false,
                LowDetail = true 
            },
            Images = {
                Invisible = true,
                LowDetail = false,
                Destroy = false,
            },
            ["No Particles"] = true,
            ["No Camera Effects"] = true,
            ["No Explosions"] = true,
            ["No Clothes"] = true,
            ["Low Water Graphics"] = true,
            ["No Shadows"] = true,
            ["Low Rendering"] = true,
            ["Low Quality Parts"] = true
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
    end,
    DoubleClick = true,
    Tooltip = 'FPS Booster, this cant be undone.'
})

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('Vision Hub')
SaveManager:SetFolder('Vision Hub/Egg Hatchers')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()