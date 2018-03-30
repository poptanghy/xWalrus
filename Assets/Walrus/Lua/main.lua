require ("mobdebug").start()

CC = require("CC")
local CCUnity = require("CCUnity")

function main()
	CC.Print("Lua engine start")

    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
	math.randomseed(os.time())
	
	-- Append CCUnity to CC
	for k,v in pairs(CCUnity) do
		CC.Assert(CC[k] == nil, "LuaMain:Run CCUnity init error ["..CC.ToString(v).."]")
		CC[k] = v
	end

	CC:SendWeb()
end

xpcall(main, function(kMsg)
    local kMsg = debug.traceback(kMsg, 3)
    print(kMsg)
    return kMsg
end)