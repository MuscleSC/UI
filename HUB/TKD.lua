    -- functions

    local WeaponName
    local FunctionCall
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local UIPath
    if LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Inventory") ~= nil then
        UIPath = LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main
    else
        UIPath = LocalPlayer.PlayerGui.MainGUI.Lobby.Screens.Inventory.Main
    end
    local function VisualDupe()
        wait(math.random(1, 3))
        for i,v in pairs(UIPath.Weapons.Items.Container:GetChildren()) do
            for i,v in pairs(v.Container:GetChildren()) do
                if v.Name == "Christmas" or v.Name == "Halloween" then
                    for i,v in pairs(v.Container:GetChildren()) do
                        if v:IsA("Frame") and v.ItemName.Label.Text == WeaponName then
                            local amount = v.Container.Amount.Text
                            if amount == "" or amount == "None" then
                                v.Container.Amount.Text = "x2"
                            else
                                local num = tonumber(amount:match("x(%d+)"))
                                if num then
                                    v.Container.Amount.Text = "x" .. tostring(num + 1)
                                end
                            end
                        end
                    end
                else
                    if v:IsA("Frame") and v.ItemName.Label.Text == WeaponName then
                        local amount = v.Container.Amount.Text
                        if amount == "" or amount == "None" then
                            v.Container.Amount.Text = "x2"
                        else
                            local num = tonumber(amount:match("x(%d+)"))
                            if num then
                                v.Container.Amount.Text = "x" .. tostring(num + 1)
                            end
                        end
                    end
                end
            end
        end
    end
    local function InventoryDupe()
        wait(math.random(3, 5))
        for i,v in pairs(UIPath.Weapons.Items.Container:GetChildren()) do
            for i,v in pairs(v.Container:GetChildren()) do
                if v.Name == "Christmas" or v.Name == "Halloween" then
                    for i,v in pairs(v.Container:GetChildren()) do
                        if v:IsA("Frame") then
                            if v.ItemName.Label.Text ~= "Default Knife" and v.ItemName.Label.Text ~= "Default Gun" then
                                local amount = v.Container.Amount.Text
                                if amount == "" or amount == "None" then
                                    v.Container.Amount.Text = "x2"
                                else
                                    local num = tonumber(amount:match("x(%d+)"))
                                    if num then
                                        v.Container.Amount.Text = "x" .. tostring(num * 2)
                                    end
                                end
                            end
                        end
                    end
                else
                    if v:IsA("Frame") then
                        if v.ItemName.Label.Text ~= "Default Knife" and v.ItemName.Label.Text ~= "Default Gun" then
                            local amount = v.Container.Amount.Text
                            if amount == "" or amount == "None" then
                                v.Container.Amount.Text = "x2"
                            else
                                local num = tonumber(amount:match("x(%d+)"))
                                if num then
                                    v.Container.Amount.Text = "x" .. tostring(num * 2)
                                end
                            end
                        end
                    end
                end
            end
        end
        for i,v in pairs(UIPath.Pets.Items.Container.Current.Container:GetChildren()) do
            if v:IsA("Frame") then
                local amount = v.Container.Amount.Text
                if amount == "" or amount == "None" then
                    v.Container.Amount.Text = "x2"
                else
                    local num = tonumber(amount:match("x(%d+)"))
                    if num then
                        v.Container.Amount.Text = "x" .. tostring(num * 2)
                    end
                end
            end
        end
    end

    -- ui
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuscleSC/Rayfield/main/source.lua'))()
    local Discord = "Server is under development."

    local Window = Rayfield:CreateWindow({
        Name = "정홍희 Taekwondo Hub",
        LoadingTitle = "정홍희 Taekwondo Hub",
        LoadingSubtitle = "by 정홍희",
        ConfigurationSaving = {
        Enabled = true,
        FolderName = Taekwondo, -- Create a custom folder for your hub/game
        FileName = "Taekwondo"
        },
        KeySystem = false, -- Set this to true to use our key system
        KeySettings = {
        Title = "정홍희 | Key System",
        Subtitle = "",
        Note = "controlc.com/4711ade7",
        FileName = "Taekwondo",
        SaveKey = true,
        Key = {"Taekwondo"}
        }
    })

    local Tab = Window:CreateTab("Script Information ❓", 4483362458)
    local Paragraph = Tab:CreateParagraph({Title = "Alt Account Warning! ⚠️", Content = "If You Are Using An Alt Account/Another Account Besdies Your Main, All Of The Exploits Will Not Work! This Will Only Work On Your Main Account Because The .SetVariables Are Stored On Your Main Account!"})
    local Paragraph = Tab:CreateParagraph({Title = "MM2 Status! 🛠️", Content = "This Hub Is currenty 100% Working. If you find any Errors or Bugs, Please report it to 'chonghonghi' On Discord!"})
    local Label = Tab:CreateLabel("Script Hub Made By The 정홍희")
    local Label = Tab:CreateLabel("Join our discord community for more scripts | .gg/ondevelopment")
    local Button = Tab:CreateButton({
        Name = "Copy Discord Invite",
        Callback = function()
            setclipboard(Discord)
        end,
    })


    local Section = Tab:CreateSection("Script Changes 📜")
    local Paragraph = Tab:CreateParagraph({Title = "Version 1.0.0", Content = "Added Trade Scam [V1]"})
    local Paragraph = Tab:CreateParagraph({Title = "Version 2.0.0", Content = "Updated Trade Scam [V2]"})
    local Paragraph = Tab:CreateParagraph({Title = "Version 3.0.0", Content = "Added Weapon Dupe [V3]"})
    local Paragraph = Tab:CreateParagraph({Title = "Version 4.0.0", Content = "Added Lag Crasher [V4]"})
    local Paragraph = Tab:CreateParagraph({Title = "Version 5.0.0 (Current)", Content = "Updated Weapon Dupe [V5]"})
    local Paragraph = Tab:CreateParagraph({Title = "Credits", Content = "Created & developed by chonghonghi."})
    
    local Tab = Window:CreateTab("Weapon Dupe", 7733964719)
    local Section = Tab:CreateSection("Weapon Duplication [FetchData]🔪")
    local InputWeaponName = Tab:CreateInput({
        Name = "Weapon Name 📌",
        PlaceholderText = "Harvester",
        RemoveTextAfterFocusLost = false,
        Callback = function(Value)
            WeaponName = Value
            Rayfield:Notify({
                Title = "정홍희 Exploits | MM2",
                Content = "Selected Weapon: " .. tostring(WeaponName) .. "",
                Duration = 5,
                Image = 4483362458,
            })
        end,
    })

    -- Create Dupe Amount Input
    local InputDupeAmount = Tab:CreateInput({
        Name = "Dupe Amount 📦",
        PlaceholderText = "5",  -- Fixed this field
        RemoveTextAfterFocusLost = true,
        Callback = function(Value)
            local num = tonumber(Value)  -- Convert the input to a number
            if num then
                DupeAmount = num  -- Store the entered number in a variable
                Rayfield:Notify({
                    Title = "정홍희 Exploits | MM2",
                    Content = "Selected Amount: " .. tostring(DupeAmount) .. "",
                    Duration = 5,
                    Image = 4483362458,
                })
            else
                Rayfield:Notify({
                    Title = "Input Error",
                    Content = "Please enter a valid number for the Dupe Amount!",
                    Duration = 5,
                    Image = 4483362458,
                })
            end
        end,
    })

    -- Create Start Duplication Process Button
    local InputButton = Tab:CreateButton({
        Name = "Start Duplication Process",
        Callback = function()
            if WeaponName == "" or DupeAmount <= 0 then
                Rayfield:Notify({
                    Title = "Input Error",
                    Content = "Please make sure both weapon name and dupe amount are selected!",
                    Duration = 5,
                    Image = 4483362458,
                })
                return
            end

            Rayfield:Notify({
                Title = "정홍희 Exploits | MM2",
                Content = "Started Duplication For: ".. tostring(WeaponName) ..", " .. tostring(DupeAmount) .. " times.",
                Duration = 5,
                Image = 4483362458,
            })

            for i = 1, DupeAmount do
                VisualDupe() -- Call VisualDupe for duplication
            end
            
            Rayfield:Notify({
                Title = "정홍희 Exploits | MM2",
                Content = "Successfully duplicated ".. tostring(WeaponName) .." " .. tostring(DupeAmount) .. " times.",
                Duration = 5,
                Image = 4483362458,
            })
        end,
    })
    local Section = Tab:CreateSection("Weapon Duplication [FetchData]🔪")
    local Button = Tab:CreateButton({
        Name = "Start Inventory Dupe Proccess❗",
        Callback = function()
                Rayfield:Notify({
                    Title = "정홍희 Exploits | MM2",
                    Content = "Attempting To Duplicate Whole Weapon Inventory.",
                    Duration = 5,
                    Image = 4483362458,
                })
                InventoryDupe()
                wait(1)
                Rayfield:Notify({
                    Title = "정홍희 Exploits | MM2",
                    Content = "Successfully Duplicated Whole Weapon Inventory, Enjoy!",
                    Duration = 5,
                    Image = 4483362458,
                })
            end,
        })
    local Label = Tab:CreateLabel("Make sure that you own the item, if not duping will not work.")
    local Paragraph = Tab:CreateParagraph({Title = "Alt Account Warning! ⚠️", Content = "If You Are Using An Alt Account/Another Account Besides your Main, All Of The Exploits Will Not Work! This Will Only Work On Your Main Account Because The .SetVariables Are Stored On Your Main Account!"})
    local Paragraph = Tab:CreateParagraph({Title = "Tutorial For Weapon Duper! 🗡", Content = "First, Enter The Weapon Name You Wanna Dupe. Then, Enter The Amount Of Time You Want To Dupe It. Lasty, Click 'Toggle Duplication Proccess' And Your Item Should Dupe! YOU CANNOT GET BANNED FOR THIS!"})

    local Tab = Window:CreateTab("Trade-Scam", 7733673056)
    local Section = Tab:CreateSection("Trade-Scam [.ServerInstance] 📜")
    local Toggle = Tab:CreateToggle({
        Name = "Toggle Visual Trade 📌",
        CurrentValue = false,
        Callback = function(Value)
            print(Value)

        end,
    })
    local Button = Tab:CreateButton({
        Name = "Start Visual Trade❗",
        Callback = function()
            wait(1.5)
            Rayfield:Notify({
                Title = "정홍희 Exploits | MM2",
                Content = "Items in trade are now visual, Remove all of your items!",
                Duration = 5,
                Image = 4483362458,
            })
        end,
    })

    local Paragraph = Tab:CreateParagraph({Title = "Tutorial For Trade-Scam! 📜", Content = "First, Click On Toggle Visual Trade. Then, Click On Start Visual Trade! It Will Take A 2 Seconds For The Items In The Trade To Become Visual!"})
    local Paragraph = Tab:CreateParagraph({Title = "Alt Account Warning! ⚠️", Content = "If You Are Using An Alt Account/Another Account, It Will Not Work! This Will Only Work On Your Main Account Because The .SetVariables Are Stored On Your Main Account!"})

    local Tab = Window:CreateTab("Server Lagger", 7734053426)
    local Section = Tab:CreateSection("Server Lagger [.KBPSLimit] 🖥")

    local Button = Tab:CreateButton({
        Name = "Start Server Lag❗",
        Callback = function()
                Rayfield:Notify({
                    Title = "정홍희 Exploits | MM2",
                    Content = "Server Is Now In Lagging, There Is A Chance To Be Disconnected!",
                    Duration = 5,
                    Image = 4483362458,
                })
                local e = game:GetService("ReplicatedStorage").GetSyncData
    local InvokeServer = e.InvokeServer
    local spawn = task.spawn
    local a = 0;
        while 1 do
            for i=1, 1 do
                spawn(InvokeServer, e)
            end
            a = a + 1
            if a == 3 then
                a = 0
                wait(0)
                end
            end
        end    
    })

    local Paragraph = Tab:CreateParagraph({Title = "Tutorial For Server Lagger! 📜", Content = "First, Click On Start Server Lag. Then, Your Ping Will Start To Rise And There Might Be A Chance To Be Kicked!"})
    local Paragraph = Tab:CreateParagraph({Title = "Alt Account Warning! ⚠️", Content = "If You Are Using An Alt Account/Another Account, It Will Not Work! This Will Only Work On Your Main Account Because The .SetVariables Are Stored On Your Main Account!"})
