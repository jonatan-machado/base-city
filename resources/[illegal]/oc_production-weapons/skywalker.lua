----------------------------------------------------------------------------------------------------------
--[   Esse script foi desenvolvido pela equipe da Ziraflix Dev Group, por favor mantenha os créditos   ]--
--[                     Contato: contato@ziraflix.com   Discord: discord.gg/6p3M3Cz                    ]--
----------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
oC = {}
Tunnel.bindInterface("oc_production-weapons",oC)

-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("produzir-weapon")
AddEventHandler("produzir-weapon",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
        if item == config.weapons[1] then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config.gweapon1[1])*config.gweapon1[2] <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.getInventoryItemAmount(user_id,config.weapon1[1]) >= config.weapon1[2] then
                    if vRP.getInventoryItemAmount(user_id,config.weapon1[3]) >= config.weapon1[4] then
                        if vRP.getInventoryItemAmount(user_id,config.weapon1[5]) >= config.weapon1[6] then
                            if vRP.getInventoryItemAmount(user_id,config.weapon1[7]) >= config.weapon1[8] then
                                if vRP.tryGetInventoryItem(user_id,config.weapon1[1],config.weapon1[2]) and vRP.tryGetInventoryItem(user_id,config.weapon1[3],config.weapon1[4]) and vRP.tryGetInventoryItem(user_id,config.weapon1[5],config.weapon1[6]) and vRP.tryGetInventoryItem(user_id,config.weapon1[7],config.weapon1[8]) then
                                    TriggerClientEvent("fechar-nui-weapons",source)
                                    TriggerClientEvent("progress",source,config.time,"Montando "..config.weapons[1].."")
                                    vRPclient._playAnim(source,false,{{config.anim[1],config.anim[2]}},true)

                                    SetTimeout(config.time,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,config.gweapon1[1],config.gweapon1[2])
                                        TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..config.weapons[1].."</b>.")
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon1[7].."</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon1[6].."x "..config.weapon1[5].."</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon1[4].."x "..config.weapon1[3].."</b>.")
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon1[1].."</b> na mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
            end
        elseif item == config.weapons[2] then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config.gweapon2[1])*config.gweapon2[2] <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.getInventoryItemAmount(user_id,config.weapon2[1]) >= config.weapon2[2] then
                    if vRP.getInventoryItemAmount(user_id,config.weapon2[3]) >= config.weapon2[4] then
                        if vRP.getInventoryItemAmount(user_id,config.weapon2[5]) >= config.weapon2[6] then
                            if vRP.getInventoryItemAmount(user_id,config.weapon2[7]) >= config.weapon2[8] then
                                if vRP.tryGetInventoryItem(user_id,config.weapon2[1],config.weapon2[2]) and vRP.tryGetInventoryItem(user_id,config.weapon2[3],config.weapon2[4]) and vRP.tryGetInventoryItem(user_id,config.weapon2[5],config.weapon2[6]) and vRP.tryGetInventoryItem(user_id,config.weapon2[7],config.weapon2[8]) then
                                    TriggerClientEvent("fechar-nui-weapons",source)

                                    TriggerClientEvent("progress",source,config.time,"Montando "..config.weapons[2].."")
                                    vRPclient._playAnim(source,false,{{config.anim[1],config.anim[2]}},true)

                                    SetTimeout(config.time,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,config.gweapon2[1],config.gweapon2[2])
                                        TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..config.weapons[2].."</b>.")
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon2[7].."</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon2[6].."x "..config.weapon1[5].."</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon2[4].."x "..config.weapon1[3].."</b>.")
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon2[1].."</b> na mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
            end
        elseif item == config.weapons[3] then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config.gweapon3[1])*config.gweapon3[2] <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.getInventoryItemAmount(user_id,config.weapon3[1]) >= config.weapon3[2] then
                    if vRP.getInventoryItemAmount(user_id,config.weapon3[3]) >= config.weapon3[4] then
                        if vRP.getInventoryItemAmount(user_id,config.weapon3[5]) >= config.weapon3[6] then
                            if vRP.getInventoryItemAmount(user_id,config.weapon3[7]) >= config.weapon3[8] then
                                if vRP.tryGetInventoryItem(user_id,config.weapon3[1],config.weapon3[2]) and vRP.tryGetInventoryItem(user_id,config.weapon3[3],config.weapon3[4]) and vRP.tryGetInventoryItem(user_id,config.weapon3[5],config.weapon3[6]) and vRP.tryGetInventoryItem(user_id,config.weapon3[7],config.weapon3[8]) then
                                    TriggerClientEvent("fechar-nui-weapons",source)

                                    TriggerClientEvent("progress",source,config.time,"Montando "..config.weapons[3].."")
                                    vRPclient._playAnim(source,false,{{config.anim[1],config.anim[2]}},true)

                                    SetTimeout(config.time,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,config.gweapon3[1],config.gweapon3[2])
                                        TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..config.weapons[3].."</b>.")
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon3[7].."</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon3[6].."x "..config.weapon3[5].."</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon3[4].."x "..config.weapon3[3].."</b>.")
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon3[1].."</b> na mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
            end
        elseif item == config.weapons[4] then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config.gweapon4[1])*config.gweapon4[2] <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.getInventoryItemAmount(user_id,config.weapon4[1]) >= config.weapon4[2] then
                    if vRP.getInventoryItemAmount(user_id,config.weapon4[3]) >= config.weapon4[4] then
                        if vRP.getInventoryItemAmount(user_id,config.weapon4[5]) >= config.weapon4[6] then
                            if vRP.getInventoryItemAmount(user_id,config.weapon4[7]) >= config.weapon4[8] then
                                if vRP.tryGetInventoryItem(user_id,config.weapon4[1],config.weapon4[2]) and vRP.tryGetInventoryItem(user_id,config.weapon4[3],config.weapon4[4]) and vRP.tryGetInventoryItem(user_id,config.weapon4[5],config.weapon4[6]) and vRP.tryGetInventoryItem(user_id,config.weapon4[7],config.weapon4[8]) then
                                    TriggerClientEvent("fechar-nui-weapons",source)

                                    TriggerClientEvent("progress",source,config.time,"Montando "..config.weapons[4].."")
                                    vRPclient._playAnim(source,false,{{config.anim[1],config.anim[2]}},true)

                                    SetTimeout(config.time,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,config.gweapon4[1],config.gweapon4[2])
                                        TriggerClientEvent("Notify",source,"sucesso","Você montou um <b>"..config.weapons[4].."</b>.")
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon4[7].."</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon4[6].."x "..config.weapon4[5].."</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon4[4].."x "..config.weapon4[3].."</b>.")
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon4[1].."</b> na mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
            end
        elseif item == config.weapons[5] then
            if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config.gweapon5[1])*config.gweapon5[2] <= vRP.getInventoryMaxWeight(user_id) then
                if vRP.getInventoryItemAmount(user_id,config.weapon5[1]) >= config.weapon5[2] then
                    if vRP.getInventoryItemAmount(user_id,config.weapon5[3]) >= config.weapon5[4] then
                        if vRP.getInventoryItemAmount(user_id,config.weapon5[5]) >= config.weapon5[6] then
                            if vRP.getInventoryItemAmount(user_id,config.weapon5[7]) >= config.weapon5[8] then
                                if vRP.tryGetInventoryItem(user_id,config.weapon5[1],config.weapon5[2]) and vRP.tryGetInventoryItem(user_id,config.weapon5[3],config.weapon5[4]) and vRP.tryGetInventoryItem(user_id,config.weapon5[5],config.weapon5[6]) and vRP.tryGetInventoryItem(user_id,config.weapon5[7],config.weapon5[8]) then
                                    TriggerClientEvent("fechar-nui-weapons",source)

                                    TriggerClientEvent("progress",source,config.time,"Montando "..config.weapons[5].."")
                                    vRPclient._playAnim(source,false,{{config.anim[1],config.anim[2]}},true)

                                    SetTimeout(config.time,function()
                                        vRPclient._stopAnim(source,false)
                                        vRP.giveInventoryItem(user_id,config.gweapon5[1],config.gweapon5[2])
                                        TriggerClientEvent("Notify",source,"sucesso","Você montou uma <b>"..config.weapons[5].."</b>.")
                                    end)
                                end
                            else
                                TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon5[7].."</b> na mochila.")
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon5[6].."x "..config.weapon5[5].."</b>.")
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Você precisa de <b>"..config.weapon5[4].."x "..config.weapon5[3].."</b>.")
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem <b>"..config.weapon5[1].."</b> na mochila.")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
            end 
        end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO DE PERMISSÃO ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
function oC.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    for k,v in pairs(config.permissionMachine) do
        if vRP.hasPermission(user_id, v) then return true end
    end
    return false
end