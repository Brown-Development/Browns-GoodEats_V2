Citizen.CreateThread(function()
    for k in pairs(FOOD) do 
        GoodEats(k, function(source)
            local src = source 
            TriggerClientEvent('goodeats:client:Use', src, 'hunger', k)
        end)
    end
end)

Citizen.CreateThread(function()
    for k in pairs(DRINK) do 
        GoodEats(k, function(source)
            local src = source 
            TriggerClientEvent('goodeats:client:Use', src, 'thirst', k)
        end)
    end
end)

itemBox_Inventories = {
   ['qb-inventory'], 
   ['lj-inventory'],
   ['ps-inventory'] 
}

RegisterNetEvent('goodeats:remove', function(item)
    local src = source 
    local itemBox = false
    local xPlayer = GetPlayer(src)
    Remove(xPlayer, item)
    if CORE == 'qb' then 
        for k in pairs(itemBox_Inventories) do
            print(k)
            if GetResourceState(k) == 'started' then 
                itemBox = true 
                break
            end
        end
    end
    if itemBox then 
        TriggerClientEvent('inventory:client:ItemBox', src, FW.Shared.Items[item], "remove")
    end
end)