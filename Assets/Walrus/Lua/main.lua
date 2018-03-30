require ("mobdebug").start()

local CC = require("CC")
function main()
	CC.Print("Lua engine start")

    _G.collectgarbage("setpause", 100)
    _G.collectgarbage("setstepmul", 5000)
	_G.math.randomseed(_G.os.time())
	
	-- Append CCUnity to CC
	--[[for k,v in _G.pairs(CCUnity) do
		CC.Assert(CC[k] == nil, "LuaMain:Run CCUnity init error ["..CC.ToString(v).."]")
		CC[k] = v
	end]]
end

_G.xpcall(main, function(kMsg)
    local kMsg = _G.debug.traceback(kMsg, 3)
    _G.print(kMsg)
    return kMsg
end)