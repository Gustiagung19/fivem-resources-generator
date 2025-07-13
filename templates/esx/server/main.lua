-- Generate by FiveM Resource Generator (Gusti Agung)
ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb({
            job = xPlayer.getJob()
        })
    else
        cb({})
    end
end)