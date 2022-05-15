local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

tvRP = Tunnel.getInterface("vrp")
vRPserver = Tunnel.getInterface("vrp")

src = Tunnel.getInterface("tela-morte")
vCLIENT = {}
Tunnel.bindInterface("tela-morte",vCLIENT)

--=====================================================
local nocauteado = false
local deathtimer = 300


RegisterCommand('reviver',function(source,args)
	local ped = PlayerPedId()
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	deathtimer = 300
	nocauteado = false
	ClearPedBloodDamage(ped)
	SetEntityInvincible(ped,false)
	vRP.killGod(ped)
	SetEntityHealth(ped,400)
	SetPedArmour(ped,0)
	Citizen.Wait(1000)
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SendNUIMessage({
		setDisplay = false,
		setDisplayDead = false,
		deathtimer = deathtimer,
		reviver = true,
	})
end)

Citizen.CreateThread(function()
	while true do
			local diniz = 1000
			if GetEntityHealth(PlayerPedId()) <= 101 then
				if not nocauteado then
					diniz = 5
					deathtimer = 300
					nocauteado = true
				end

				if deathtimer > 0 then
					SetPedToRagdoll(ped,1000,1000,0,0,0,0)
					BlockWeaponWheelThisFrame()
					SetEntityHealth(ped,101)
					TransitionToBlurred(1000)
					SendNUIMessage({
						setDisplay = true,
						setDisplayDead = false,
						deathtimer = deathtimer
					})
				else
					SetNuiFocus(true,true)
					TransitionToBlurred(1000)
					SendNUIMessage({
						setDisplay = false,
						setDisplayDead = true,
						deathtimer = deathtimer
					})
				end
			end
			Citizen.Wait(diniz)
	end
end)
--============================================================================================
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if nocauteado and deathtimer > 0 then
			deathtimer = deathtimer - 1
		end
	end
end)
--============================================================================================
local hospital = vector3(300.18+0.0001,-579.04+0.0001,43.27+0.0001) -- 300.18,-579.04,43.27
local heading = 82.58

RegisterNUICallback('ButtonRevive',function()
	local ped = PlayerPedId()
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	TriggerServerEvent("clearInventory")
	deathtimer = 300
	nocauteado = false
	ClearPedBloodDamage(ped)
	SetEntityInvincible(ped,false)
	DoScreenFadeOut(1000)
	vRP.killGod(ped)
	SetEntityHealth(ped,400)
	SetPedArmour(ped,0)
	Citizen.Wait(1000)
	SetEntityCoords(ped, hospital.x, hospital.y, hospital.z + 0.20,1,0,0,1)
	SetEntityHeading(ped, heading)
	FreezeEntityPosition(ped,true)
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SetTimeout(5000,function()
			FreezeEntityPosition(ped,false)
			Citizen.Wait(1000)
			DoScreenFadeIn(1000)
	end)
end)

