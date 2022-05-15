local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
PdeF = {}

local carroForteLog = "https://discord.com/api/webhooks/971243268564201512/AXIrm6I0oZAukB0nj8hNal1QhneKOWA0700onchh5i0t-bxv7tV2mcQqGslKyvNl3q1A"

RegisterServerEvent("pagamento")
AddEventHandler("pagamento",function(value)
  local source = source
  local user_id = vRP.getUserId(source)
  local payWork = parseInt(value)
  local bankValue = vRP.getBankMoney(user_id)
  local identity = vRP.getUserIdentity(user_id)
  vRP.setBankMoney(user_id,bankValue+payWork)
  TriggerClientEvent("Notify","sucesso","você ganhou $"..payWork)
  PerformHttpRequest(carroForteLog, function(err, text, headers) end, 'POST', json.encode({
    embeds = {
      { 	------------------------------------------------------------
        title = "REGISTRO DE GANHO NO CARRO FORTE:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
        thumbnail = {
        url = "https://i.imgur.com/BVNL6Bs.png"
        }, 
        fields = {
          { 
            name = "**QUEM GANHOU:**", 
            value = "**"..identity.name.." "..identity.firstname.."** ID: [**"..user_id.."**] ".."** VALOR: [**"..payWork.."**] "
          }
        }, 
        footer = { 
          text = "Castiel - "..os.date("%d/%m/%Y |: %H:%M:%S"), 
          icon_url = "https://i.imgur.com/BVNL6Bs.png" 
        },
        color = 16431885 
      }
    }
  }), { ['Content-Type'] = 'application/json' })
end)