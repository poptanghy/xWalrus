local _G = _G
local CC = require("CC")

local LC_CS = {}
function LC_CS.ServerWeb(kString)
    local tVal = CC.Json:Decode(kString)
    CC.Print(tVal.message)
    CC.Print(CC.Table:ToString(tVal))
end


CCUnity = {Json = LC_Json, CS = LC_CS}
--[[function CCUnity:SendWeb(kURL, tVal, kCallBack, kCallBack2) 
    tVal.appKey = tVal.appKey or Player.appKey
    tVal.uid = tVal.uid or Player.uid
    function LF_CallBack(tVal)
        Print("Web >> "..kURL..Table:ToString(tVal))
        if kCallBack then
            if kCallBack2 then
                CC.UIMgr:Do(kCallBack, kCallBack2, tVal)
            else
                kCallBack(tVal)
            end
        else
            Message(tVal.success and {Tip = tVal.message} or {Text = tVal.message})
        end
    end
    Print("ClientW << "..kURL..Table:ToString(tVal))
    kk.ql.httpPost(require("config").webHost .. kURL, tVal, LF_CallBack)
end]]

function CCUnity:SendWeb()
    local tVal = {
        action = "tourist",
        appVersion  = "1.0.1",
        bindProxy = "",
        clientId = "",
        machine = "4a0848e1-7627-44eb-bf64-acf6f0635f7b",
        name = "",
        pwd = "",
        spreadFrom = "kokoweb"
    }
    local kJson = CC.Json:Encode(tVal)
    local kURL = [[http://192.168.17.222:8081/appbms/app/login/login1.htm]]
    CS.CCS.Net.SendWeb(kURL, kJson)
end

return CCUnity