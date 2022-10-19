

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
    ["Kill_All"] = false;

    ["Trigger Bot"] = false;
    ["Delay"] = 0;

    ["Damage Increaser"] = false;
    ["Mulit"] = 1;

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

local SecureID_v1 = game:GetService("HttpService"):GenerateGUID(false);


local FrameRendered = game:GetService("RunService").RenderStepped;
local PhysicsRendered = game:GetService("RunService").Heartbeat;
local UserHandler = game:GetService("VirtualUser");
local Mouse = game.Players.LocalPlayer:GetMouse();

-- Functions
local function removeESP()
    for _,i in pairs(HighlightFolder:GetChildren()) do

        i:Destroy()
        vartable["Dev_Varabials"]["IDestroy"] = vartable["Dev_Varabials"]["IDestroy"] + 1

    end
end

local function trigger()
    wait(vartable["Delay"] / 1000)
    UserHandler:ClickButton1(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end

local Rage = win:Tab("Rage")
local Legit = win:Tab("Legit")
local Visuals = win:Tab("Visuals")
local Cases = win:Tab("Cases")

local Info = win:Tab("Infomation")

local TriggerBot = Legit:Section("Trigger Bot")
local DamageMulitplier = Legit:Section("Damage Increaser")
local Aimbot = Legit:Section("Aimbot")
local KillAll = Rage:Section("Kill All")
local highlight_esp = Visuals:Section("HighlightESP")

local game_metatable = getrawmetatable(game)
local namecall_o = game_metatable.__namecall
local fireserver_o

setreadonly(game_metatable, false)

fireserver_o = hookfunction(game:GetService("ReplicatedStorage").Events.EEED.FireServer, newcclosure(function(self, method, ...)
    local arguments = {...}


    if vartable["Damage Increaser"] then
        arguments[12] = arguments[12] * vartable["Mulit"]
    end

    local script = getcallingscript()
    return fireserver_o(self, arguments)
 end))

DamageMulitplier:Toggle(
    "Enable",
    vartable["Damage Increaser"],
    "Toggle",
    function(state)
        vartable["Damage Increaser"] = state
    end
)

DamageMulitplier:Slider(
    "Times",
    1,
    100,
    1,
    0.25,
    "Slider",
    function(state)
        vartable["Mulit"] = state
    end
)

--[[

TriggerBot:Toggle(
    "Enable",
    vartable["Trigger Bot"],
    "Toggle",
    function(state)
        vartable["Trigger Bot"] = state

        while true do
            FrameRendered:Wait()
            if not vartable["Trigger Bot"] then return end

            for _,v in pairs(game.Players:GetPlayers()) do
                if v.Character and v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then

                    if Mouse.Target.Parent == v.Character then
                        coroutine.wrap(trigger)()
                    end

                end
            end

        end

    end
)

TriggerBot:Slider(
    "Delay in ms",
    0,
    1000,
    0,
    1,
    "Slider",
    function(state)
        vartable["Delay"] = state
    end
)

]]--

KillAll:Toggle(
    "Enable",
    vartable["Kill_All"],
    "Toggle",
    function(state)
        vartable["Kill_All"] = state
        while true do
            PhysicsRendered:Wait(3);

            if not vartable["Kill_All"] then return end

            pcall(function()
                for _,v in pairs(game.Players:GetPlayers()) do

                    if v.Character and v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
    
                        if v.Character:FindFirstChild("Head") then
                            local ohInstance1 = v.Character.Head
                            local ohVector32 = Vector3.new(-874.1176147460938, 982.31982421875, 94.69325256347656)
                            local ohString3 = "AWP"
                            local ohNumber4 = 8192
                            local ohInstance5 = game.Players.LocalPlayer.Character.Gun
                            local ohNil6 = nil
                            local ohNil7 = nil
                            local ohNumber8 = 1
                            local ohNil9 = nil
                            local ohBoolean10 = false
                            local ohVector311 = Vector3.new(-870.7688598632812, 987.1755981445312, 107.55976104736328)
                            local ohNumber12 = 100
                            local ohVector313 = Vector3.new(0, 1, 0)
                            local ohBoolean14 = true
    
                            game:GetService("ReplicatedStorage").Events.EEED:FireServer(ohInstance1, ohVector32, ohString3, ohNumber4, ohInstance5, ohNil6, ohNil7, ohNumber8, ohNil9, ohBoolean10, ohVector311, ohNumber12, ohVector313, ohBoolean14)
                        end
    
                    end
    
                end
            end)

        end
    end
)

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
ClientInfo_Info:Label("UserID: "..game.Players.LocalPlayer.UserId)
ClientInfo_Info:Label("ClientID: "..game:GetService("RbxAnalyticsService"):GetClientId())

local GameInfo_Info = Info:Section("Game Info")
GameInfo_Info:Label("ServerID: "..game.JobId)
GameInfo_Info:Label("GameID: "..game.PlaceId)

local ScriptInfo_Info = Info:Section("Script Info")
ScriptInfo_Info:Label("V2.2.2a")
ScriptInfo_Info:Label("SecureID: "..SecureID_v1)
local remotesfired_info = ScriptInfo_Info:Label("RemotesFired: 0")
local idestroy_info = ScriptInfo_Info:Label("Instances Deleted: 0")
local imade_info = ScriptInfo_Info:Label("Instances Made: 0")

local CreatorInfo_Info = Info:Section("Creator Info")
CreatorInfo_Info:Label("Made by Deducted#1625")


while true do
    PhysicsRendered:Wait(0.01)
    remotesfired_info:Set("RemotesFired: "..vartable["Dev_Varabials"]["IRemotes"])
    idestroy_info:Set("Instances Deleted: "..vartable["Dev_Varabials"]["IDestroy"])
    imade_info:Set("Instances Made: "..vartable["Dev_Varabials"]["IMade"])
    fps_info:Set("FPS: "..workspace:GetRealPhysicsFPS())
    ping_info:Set("Ping: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
end
