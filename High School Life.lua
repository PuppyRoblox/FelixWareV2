local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
local win = SolarisLib:New({
    Name = "FelixWare V2";
    FolderToSave = "FelixWare_UI";
})

local vartable = {

    ["Dev_Varabials"] = {
        ["Teams"] = {
            "Freshman",
            "Junior",
            "Senior",
            "Teahcer",
            "Cheerleader",
            "Athlete",
            "Police",
            "Principal",
            "Sophomore"
        },
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

local Client = win:Tab("Client")

local Info = win:Tab("Infomation")

local Team_Client = Client:Section("Team")

Team_Client:Dropdown(
    "Change",
    vartable["Dev_Varabials"]["Teams"],
    "Freshman",
    "Dropdown",
    function(t)
        game:GetService("ReplicatedStorage").Remotes.ChangeTeam:InvokeServer(t)
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

local CreatorInfo_Info = Info:Section("Creator Info")
CreatorInfo_Info:Label("Made by Deducted#1625")


while true do
    PhysicsRendered:Wait(0.01)
    fps_info:Set("FPS: "..workspace:GetRealPhysicsFPS())
    ping_info:Set("Ping: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
end
