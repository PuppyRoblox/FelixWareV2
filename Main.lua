local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()
local win = SolarisLib:New({
    Name = "FelixWare V2";
    FolderToSave = "FelixWare_UI";
})

-- Preload
local vartable = {
    ["ESP_Enabled"] = false;
    ["Cases_Enabled"] = false;
    ["Cases_Case"] = "";

    ["Dev_Varabials"] = {
        ["Cases Ava"] = {
            "Weeb",
            "New Years Knife",
            "Halloween 2022",
            "Golden Case",
            "Kitter",
            "Militia",
            "Modern",
            "Hapax",
            "Twitch",
            "Imaginem",
            "Tournament",
            "Glove",
            "Karambit",
            "Independence",
            "Remastered",
            "Vortax",
            "SCR",
            "Case Hardened",
            "Hiato",
            "Banana",
        },
        ["IMade"] = 0;
        ["IDestroy"] = 0;
        ["IRemotes"] = 0;
    }
}

local SecureFolder = Instance.new("Folder", game:GetService("CoreGui"));
SecureFolder.Name = "Felixware_Secure"

local HighlightFolder = Instance.new("Folder", SecureFolder);
HighlightFolder.Name = game:GetService("HttpService"):GenerateGUID(true);


local FrameRendered = game:GetService("RunService").RenderStepped;
local PhysicsRendered = game:GetService("RunService").Heartbeat;

-- Functions
local function removeESP()
    for _,i in pairs(HighlightFolder:GetChildren()) do

        i:Destroy()
        vartable["Dev_Varabials"]["IDestroy"] = vartable["Dev_Varabials"]["IDestroy"] + 1

    end
end

local Visuals = win:Tab("Visuals")
local Cases = win:Tab("Cases")

local Info = win:Tab("Infomation")

local highlight_esp = Visuals:Section("HighlightESP")

highlight_esp:Toggle(
    "Enable",
    vartable["ESP_Enabled"],
    "Toggle",
    function(state)
        vartable["ESP_Enabled"] = state

        while true do
            FrameRendered:Wait()

            if not vartable["ESP_Enabled"] then removeESP() return end

            for _,i in pairs(HighlightFolder:GetChildren()) do
    
                i:Destroy()
                vartable["Dev_Varabials"]["IDestroy"] = vartable["Dev_Varabials"]["IDestroy"] + 1

            end

            for _,v in pairs(game.Players:GetPlayers()) do

                if v ~= game.Players.LocalPlayer then

                    if workspace:FindFirstChild(v.Name) then
                        local char = workspace:FindFirstChild(v.Name)
    
                        local newHighlight = Instance.new("Highlight", HighlightFolder);
                        newHighlight.Name = v.Name;
                        newHighlight.FillTransparency = 1;
                        
                        if v.Team == game.Players.LocalPlayer.Team then
                            newHighlight.OutlineColor = Color3.fromRGB(0, 255, 21)
                        else
                            newHighlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                        end
                        
                        newHighlight.Enabled = true;
                        newHighlight.Adornee = char;
                        vartable["Dev_Varabials"]["IMade"] = vartable["Dev_Varabials"]["IMade"] + 1
    
                    end

                end

            end

        end
    end
)

local MainSettings_Cases = Cases:Section("Main Settings")

MainSettings_Cases:Toggle(
    "Enable",
    vartable["Cases_Enabled"],
    "Toggle",
    function(state)
        vartable["Cases_Enabled"] = state
        while true do
            PhysicsRendered:Wait();

            if vartable["Cases_Enabled"] == false then return end
            if vartable["Cases_Case"] == "" then return end

            local Command = "OpenCase"
            local Case = vartable["Cases_Case"]
            
            -- RemoteElimination
            local RemoteLocation = game:GetService("ReplicatedStorage").COMMUNICATION:GetChildren()
            local currentRemotePosition = math.huge;
            for _,v in pairs(RemoteLocation) do
                if v:IsA("RemoteEvent") and v.Name == "NETWORK" then
                    if currentRemotePosition > _ then
                        currentRemotePosition = _
                    end
                end
            end

            if currentRemotePosition < math.huge then
                vartable["Dev_Varabials"]["IRemotes"] = vartable["Dev_Varabials"]["IRemotes"] + 1
                RemoteLocation[currentRemotePosition]:FireServer(Command, Case);
            end

        end
    end
)

MainSettings_Cases:Dropdown(
    "Case",
    vartable["Dev_Varabials"]["Cases Ava"],
    "Weeb",
    "Dropdown",
    function(t)
        vartable["Cases_Case"] = t;
    end
)
local ClientInfo_Info = Info:Section("Client Info")
local fps_info = ClientInfo_Info:Label("FPS: N/A")
local ping_info = ClientInfo_Info:Label("PING: N/A")
local userid_info = ClientInfo_Info:Label("UserID: "..game.Players.LocalPlayer.UserId)
local ClientID_info = ClientInfo_Info:Label("ClientID: "..game:GetService("RbxAnalyticsService"):GetClientId())

local GameInfo_Info = Info:Section("Game Info")
local serverid_info = GameInfo_Info:Label("ServerID: "..game.JobId)
local gameid_info = GameInfo_Info:Label("GameID: "..game.PlaceId)

local ScriptInfo_Info = Info:Section("Script Info")
local version_info = ScriptInfo_Info:Label("V2.2.0a")
local seucreid_info = ScriptInfo_Info:Label("SecureID: "..HighlightFolder.Name)
local remotesfired_info = ScriptInfo_Info:Label("RemotesFired: 0")
local idestroy_info = ScriptInfo_Info:Label("Instances Deleted: 0")
local imade_info = ScriptInfo_Info:Label("Instances Made: 0")

local CreatorInfo_Info = Info:Section("Creator Info")
CreatorInfo_Info:Label("Made by Deducted#1625")


while true do
    wait(1)
    remotesfired_info:Set("RemotesFired: "..vartable["Dev_Varabials"]["IRemotes"])
    idestroy_info:Set("Instances Deleted: "..vartable["Dev_Varabials"]["IDestroy"])
    imade_info:Set("Instances Made: "..vartable["Dev_Varabials"]["IMade"])
end
