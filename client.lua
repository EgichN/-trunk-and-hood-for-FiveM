local trunk = false
local hood = false

RegisterCommand('trunk', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then -- check if the player is in the car
        if not trunk then
            SetVehicleDoorOpen(vehicle, 5, false, false)
            trunk = true
        else
            SetVehicleDoorShut(vehicle, 5, false)
            trunk = false
        end
    else -- if the player is not in the car, then we are looking for the nearest car
        local closestVehicle = GetClosestVehicle(GetEntityCoords(playerPed), 3.0, 0, 71)
        if closestVehicle ~= 0 then
            if not trunk then
                SetVehicleDoorOpen(closestVehicle, 5, false, false)
                trunk = true
            else
                SetVehicleDoorShut(closestVehicle, 5, false)
                trunk = false
            end
        else
            TriggerEvent('chat:addMessage', { args = { '^1Error', 'No vehicles nearby!' } })
        end
    end
end)

RegisterCommand('hood', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        if not hood then
            SetVehicleDoorOpen(vehicle, 4, false, false)
            hood = true
        else
            SetVehicleDoorShut(vehicle, 4, false)
            hood = false
        end
    else
        local closestVehicle = GetClosestVehicle(GetEntityCoords(playerPed), 3.0, 0, 71)
        if closestVehicle ~= 0 then
            if not hood then
                SetVehicleDoorOpen(closestVehicle, 4, false, false)
                hood = true
            else
                SetVehicleDoorShut(closestVehicle, 4, false)
                hood = false
            end
        else
            TriggerEvent('chat:addMessage', { args = { '^1Error', 'No vehicles nearby!' } })
        end
    end
end)
