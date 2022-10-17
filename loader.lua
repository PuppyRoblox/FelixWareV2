-- https://discord.gg/rHFUQksk5f

local request = http and http.request or fluxus and fuxus.request or syn and syn.request or request or http_request

local game_table = {
    [9993529229] = "https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/Main.lua";
    [3101667897] = "https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/Legends%20of%20Speed.lua";
    [92604236] = "https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/High%20School%20Life.lua";
}

request({
    Url = "http://127.0.0.1:6463/rpc?v=1",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    Body = game:GetService("HttpService"):JSONEncode({
        cmd = "INVITE_BROWSER",
        args = {
            code = "rHFUQksk5f"
        },
        nonce = game:GetService("HttpService"):GenerateGUID(false)
    }),
 })

loadstring(game:HttpGet(game_table[game.PlaceId]))()
