local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
local win = SolarisLib:New({
    Name = "FelixWare V2";
    FolderToSave = "FelixWare_UI";
})

-- Preload
local vartable = {
    ["Orb AutoFarm"] = false;
    ["Hoop AutoFarm"] = false;
    ["Auto Rebirth"] = false;

    ["Dev_Varabials"] = {
        
        ["IOrbsCollected"] = 0;
        ["IHoopsCollected"] = 0;
        ["IMoved"] = 0;
    };

    ["Debug Vars"] = {

    };

    ["Debug Labels"] = {

    };
}

local SecureFolder = Instance.new("Folder", game:GetService("CoreGui"));
SecureFolder.Name = "Felixware_Secure"

local FrameRendered = game:GetService("RunService").RenderStepped;
local PhysicsRendered = game:GetService("RunService").Heartbeat;

local Autofarm = win:Tab("AutoFarm")


local Info = win:Tab("Infomation")

local OrbAutofarm = Autofarm:Section("Orb AutoFarm")
OrbAutofarm:Toggle(
    "Enable",
    vartable["Orb AutoFarm"],
    "Toggle",
    function(state)
        vartable["Orb AutoFarm"] = state

        while true do
            FrameRendered:Wait()

            if not vartable["Orb AutoFarm"] then return end

            local PlayerArea = game:GetService("Players").LocalPlayer:FindFirstChild("currentMap").Value
            
            for _,v in pairs(workspace:FindFirstChild("orbFolder"):FindFirstChild(PlayerArea):GetChildren()) do

                if v.Name ~= "Gem" then
                    v.outerOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    v.innerOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    vartable["Dev_Varabials"]["IOrbsCollected"] += 1
                    vartable["Dev_Varabials"]["IMoved"] += 1
                else
                    v.outerGem.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    v.innerGem.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    vartable["Dev_Varabials"]["IMoved"] += 1
                end

            end

        end
    end
)

local HoopAutofarm = Autofarm:Section("Hoop AutoFarm")
HoopAutofarm:Toggle(
    "Enable",
    vartable["Hoop AutoFarm"],
    "Toggle",
    function(state)
        vartable["Hoop AutoFarm"] = state

        while true do
            FrameRendered:Wait()

            if not vartable["Hoop AutoFarm"] then return end
            
            for _,v in pairs(workspace:FindFirstChild("Hoops"):GetChildren()) do

                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                vartable["Dev_Varabials"]["IHoopsCollected"] += 1
                vartable["Dev_Varabials"]["IMoved"] += 1

            end

        end
    end
)

local AutoRebirth = Autofarm:Section("Auto Rebirth")
AutoRebirth:Toggle(
    "Enable",
    vartable["Auto Rebirth"],
    "Toggle",
    function(state)
        vartable["Auto Rebirth"] = state

        while true do
            FrameRendered:Wait()

            if not vartable["Auto Rebirth"] then return end

            pcall(function()
                local currentPlayerLevel = tonumber(game.Players.LocalPlayer.PlayerGui.gameGui.statsFrame.levelLabel.Text)
                local levelNeededToRebirth = game.Players.LocalPlayer.PlayerGui.gameGui.rebirthMenu.neededLabel.amountLabel.Text
                levelNeededToRebirth = string.split(levelNeededToRebirth, "_")[1]
                levelNeededToRebirth = tonumber(levelNeededToRebirth)
                if levelNeededToRebirth == currentPlayerLevel then
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                end
            end)

        end
    end
)

local ClientInfo_Info = Info:Section("Client Info")
local fps_info = ClientInfo_Info:Label("FPS: N/A")
local ping_info = ClientInfo_Info:Label("PING: N/A")
ClientInfo_Info:Label("UserID: "..game.Players.LocalPlayer.UserId)
ClientInfo_Info:Label("ClientID: "..game:GetService("RbxAnalyticsService"):GetClientId())

local GameInfo_Info = Info:Section("Game Info")
GameInfo_Info:Label("ServerID: "..game.JobId)
GameInfo_Info:Label("GameID: "..game.PlaceId)

local ScriptInfo_Info = Info:Section("Script Info")
ScriptInfo_Info:Label("V2.2.2a")
ScriptInfo_Info:Label("SecureID: N/A")
local remotesfired_info = ScriptInfo_Info:Label("RemotesFired: 0")
local idestroy_info = ScriptInfo_Info:Label("Instances Deleted: 0")
local imade_info = ScriptInfo_Info:Label("0")

local CreatorInfo_Info = Info:Section("Creator Info")
CreatorInfo_Info:Label("Made by Deducted#1625")


while true do
    PhysicsRendered:Wait(0.01)
    remotesfired_info:Set("Items Moved: "..vartable["Dev_Varabials"]["IMoved"])
    idestroy_info:Set("Hoops Collected: "..vartable["Dev_Varabials"]["IHoopsCollected"])
    imade_info:Set("Orbs Collected: "..vartable["Dev_Varabials"]["IOrbsCollected"])
    fps_info:Set("FPS: "..workspace:GetRealPhysicsFPS())
    ping_info:Set("Ping: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
end
