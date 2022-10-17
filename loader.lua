-- https://discord.gg/rHFUQksk5f

local game_table = {
    [9993529229] = "https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/Main.lua";
    [3101667897] = "https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/Legends%20of%20Speed.lua"
}
function joindisco()
    getgenv().InviteCode = "https://discord.gg/rHFUQksk5f"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaQLeak/Scripts/main/Discord-Auto-Join.lua"))()
end
coroutine.wrap(joindisco)()

loadstring(game:HttpGet(game_table[game.PlaceId]))()
