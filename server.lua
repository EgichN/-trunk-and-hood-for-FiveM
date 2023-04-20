RegisterServerEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    TriggerClientEvent('chat:addMessage', -1, { args = { '^1Server', 'Script loaded!' } })
end)
