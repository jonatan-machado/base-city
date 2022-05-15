local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRPclient = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
farm_weapon = {}

Tunnel.bindInterface("farm_weapon",farm_weapon)

local idgens = Tools.newIDGenerator()
local blips = {}
local qtd = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
function farm_weapon.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return (vRP.hasPermission(user_id,config5.permission))
end

function farm_weapon.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config5.itens[1])*qtd <= vRP.getInventoryMaxWeight(user_id) then
			qtd = math.random(config5.qtd[1],config5.qtd[2])
			vRP.giveInventoryItem(user_id,config5.itens[1],qtd)
			TriggerClientEvent("Notify",source,"sucesso","Você coletou "..qtd.." de <b>"..config5.itens[1].."</b>.")
			if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config5.itens[2])*qtd <= vRP.getInventoryMaxWeight(user_id) then
				qtd = math.random(config5.qtd[1],config5.qtd[2])
				vRP.giveInventoryItem(user_id,config5.itens[2],qtd)
				TriggerClientEvent("Notify",source,"sucesso","Você coletou "..qtd.." de <b>"..config5.itens[2].."</b>.")
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(config5.itens[3])*qtd <= vRP.getInventoryMaxWeight(user_id) then
					qtd = math.random(config5.qtd[1],config5.qtd[2])
					vRP.giveInventoryItem(user_id,config5.itens[3],qtd)
					TriggerClientEvent("Notify",source,"sucesso","Você coletou "..qtd.." de <b>"..config5.itens[3].."</b>.")
				else
					TriggerClientEvent("Notify",source,"negado","Você está sem espaço na sua mochila.")
					return false
				end
			else
				TriggerClientEvent("Notify",source,"negado","Você está sem espaço na sua mochila.")
				return false
			end			
		else
			TriggerClientEvent("Notify",source,"negado","Você está sem espaço na sua mochila.")
			return false
		end
		return true
	end
end

local blips = {}
function farm_weapon.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local soldado = vRP.getUsersByPermission(config5.ppermission)
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,10,84,"Ocorrência",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Recebemos uma denuncia de coleta de pacotes suspeito, verifique o ocorrido.")
					SetTimeout(20000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end
