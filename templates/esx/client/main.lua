-- Generate by FiveM Resource Generator (Gusti Agung)
ESX = exports["es_extended"]:getSharedObject()

RegisterCommand("checkjob", function()
    ESX.TriggerServerCallback('esx:getPlayerData', function(data)
        local job = data.job.name
        print("Your job is: " .. job)
    end)
end)