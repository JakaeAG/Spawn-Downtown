--[[
    Editado por: JakeAG
	 Discord: JakeAG#9900
	 Servidor de Discord:https://discord.gg/FMZ4yBpd3f
       __       ___       __  ___  _______      ___        _______ 
      |  |     /   \     |  |/  / |   ____|    /   \      /  _____|
      |  |    /  ^  \    |  '  /  |  |__      /  ^  \    |  |  __  
.--.  |  |   /  /_\  \   |    <   |   __|    /  /_\  \   |  | |_ | 
|  `--'  |  /  _____  \  |  .  \  |  |____  /  _____  \  |  |__| | 
 \______/  /__/     \__\ |__|\__\ |_______|/__/     \__\  \______| ]]--

local vtrAutorized = {}
local vehiclesSpawned = {0,0,0,0,0,0}

local marker = createMarker( config[2][1],config[2][2],config[2][3]-1, "cylinder", 1.5, 16, 111, 231, 200)

function openPanel(thePlayer)
    if isElement(thePlayer) then
        if getElementType(thePlayer) == "player" then
            local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
          if exports.factions:isPlayerInFaction( thePlayer, 1 ) then
                triggerClientEvent(thePlayer, "TS:openVTR"..config[1][1], thePlayer, vehiclesSpawned)
            end
        end
    end
end
addEventHandler("onMarkerHit", marker, openPanel)

function functionVTR(thePlayer, args)
    if thePlayer then
        if args[1] == "spawnVtr" then
            if not isPedInVehicle(thePlayer) then
                local Quantidade = tonumber(config["Viaturas"][args[2]][3] or 0)
                local QuantidadeSpawnada = tonumber(vehiclesSpawned[args[2]] or 0)
                local calculated = Quantidade-QuantidadeSpawnada
                if tonumber(calculated) >= 1 then
                    exports.MCInfoBox:showBoxSide(thePlayer, "Coche sacado con éxito del estacionamiento!", "success")
                    veh = createVehicle(config["Viaturas"][args[2]][2], config[3][1],config[3][2],config[3][3])
                    warpPedIntoVehicle(thePlayer, veh)
                    vtrAutorized[veh] = true
					setElementRotation(veh, 0,0,-90)
                    vehiclesSpawned[tonumber(args[2])] = vehiclesSpawned[tonumber(args[2])]+1
                else
                    exports.MCInfoBox:showBoxSide(thePlayer, "Ya no tenemos este auto en el estacionamiento.!", "error")
                end
            else
                exports.MCInfoBox:showBoxSide(thePlayer, "Salga del vehículo para esto.!", "info")
            end
        elseif args[1] == "deleteVtr" then
            local veh = getPedOccupiedVehicle(thePlayer)
            if veh then
                if vtrAutorized[veh] == true then
                    destroyElement(veh)
                    vehiclesSpawned[tonumber(args[2])] = vehiclesSpawned[tonumber(args[2])]-1
                    exports.MCInfoBox:showBoxSide(thePlayer, "Coche guardado con éxito en el estacionamiento!", "success")
                else
                    exports.MCInfoBox:showBoxSide(thePlayer, "Coche guardado con éxito en el estacionamiento", "error")
                end
            else
                exports.MCInfoBox:showBoxSide(thePlayer, "sube al vehiculo!", "error")
            end
        end
    end
end
addEvent("TS:functionVTR"..config[1][1], true)
addEventHandler("TS:functionVTR"..config[1][1], root, functionVTR)

function exports.MCInfoBox:showBoxSide(thePlayer, msg, type)
    triggerClientEvent(thePlayer, "serverNotifys2", thePlayer, msg, type)
end