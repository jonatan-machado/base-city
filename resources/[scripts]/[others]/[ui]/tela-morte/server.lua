local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vCLIENT = Tunnel.getInterface("tela-morte")
src = {}
Tunnel.bindInterface("tela-morte",src)

local god = "https://discord.com/api/webhooks/851209381726781481/_2BFre27XA4NeKI1OZOFYnQ5HeVfV7nNjmuOILQltUvvzA1ptB6GNvY6IGaqm0_rcIPj"

function src.reviver(source,args)
	local user_id = vRP.getUserId(source)
	print("teste")
	if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id, "mindmaster.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,400)
				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(god,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CUROU ID:]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		else
			vRPclient.killGod(source)
			vRPclient.setHealth(source,400)
			vRPclient.setArmour(source,100)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
			local identity = vRP.getUserIdentity(user_id)
			SendWebhookMessage(god,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CUROU ID:]: Ele mesmo "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)