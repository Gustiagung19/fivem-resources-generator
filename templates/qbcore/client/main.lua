-- Generate by FiveM Resource Generator (Gusti Agung)
QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("checkjob", function()
    QBCore.Functions.TriggerCallback('qb:getPlayerJob', function(job)
        print("Your job is: " .. job.name)
    end)
end)