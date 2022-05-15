local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
farm_weapon = Tunnel.getInterface("farm_weapon")

local servico = false
local selecionado = 0
local quantidade = 0
local porcentagem = 0
local criado = false
local selec = false

Citizen.CreateThread(function()
	while true do
		idle = 1000
		if not servico then			
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(config5.start[1],config5.start[2],config5.start[3])
			local distance = GetDistanceBetweenCoords(config5.start[1],config5.start[2],cdz,x,y,z,true)

			if distance <= 3 then
				idle = 5
				DrawMarker(23,config5.start[1],config5.start[2],config5.start[3]-0.97,0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 136, 96, 240, 180, 0, 0, 0, 0)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A COLETA DE PEÇAS DE ARMA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and farm_weapon.checkPermission() then						
						servico = true									
						
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
						TriggerEvent("Notify","importante","Vá até o próximo local e colete o pacote</b>.")
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		idle = 1000
		if servico then
			if selec == false then
				selecionado = math.random(#config5.locs)
				selec = true
			end

			local ped = PlayerPedId()			
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(config5.locs[selecionado].x,config5.locs[selecionado].y,config5.locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(config5.locs[selecionado].x,config5.locs[selecionado].y,cdz,x,y,z,true)			

			if criado == false then
				CriandoBlip(config5.locs,selecionado)					
				criado = true
			end	
			if distance <= 15 then
				idle = 5											
				DrawMarker(23,config5.locs[selecionado].x,config5.locs[selecionado].y,config5.locs[selecionado].z-0.90,0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 136, 96, 240, 180, 0, 0, 0, 0)
				if distance <= 1.5 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA COLETAR O PACOTE",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						farm_weapon.checkPayment() 
						porcentagem = math.random(1,100)

						if porcentagem >= config5.percentage[1] and porcentagem <= config5.percentage[2] then
							farm_weapon.MarcarOcorrencia()
						end
						RemoveBlip(blips)
						
						backentrega = selecionado
						while true do
							if backentrega == selecionado then
								selecionado = math.random(#config5.locs)
							else
								break
							end
						end							
						CriandoBlip(config5.locs,selecionado)
						TriggerEvent("Notify","importante","Vá até o próximo local e colete o <b>Pacote</b>.")
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		idle = 1000
		if servico then
			idle = 5
			if IsControlJustPressed(0,121) then
			TriggerEvent("Notify","importante","Vá até o próximo local e colete o <b>Pacote</b>.")
			elseif IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
				criado = false
				selec = false
			end
		end
		Citizen.Wait(idle)
	end
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(config5.locs[selecionado].x,config5.locs[selecionado].y,config5.locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de Pacote")
	EndTextCommandSetBlipName(blips)
end
