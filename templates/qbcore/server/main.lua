-- Generate by FiveM Resource Generator (Gusti Agung)
QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb:getPlayerJob', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        cb(Player.PlayerData.job)
    else
        cb({})
    end
end)