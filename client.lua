local trunk = false
local hood = false

RegisterCommand('trunk', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then -- проверяем, находится ли игрок в машине
        if not trunk then
            SetVehicleDoorOpen(vehicle, 5, false, false)
            trunk = true
        else
            SetVehicleDoorShut(vehicle, 5, false)
            trunk = false
        end
    else -- если игрок не находится в машине, то ищем ближайшую машину
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
