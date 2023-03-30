local moneyType = 'cash'

RegisterNetEvent('qb-fishing:server:SellFish', function(fish, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(fish) ~= 'string' or type(amount) ~= 'number' then return end

    -- Distance Exploit Check
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.SellLocation.xyz) > 5.0 then
        exports['qb-core']:ExploitBan(src, 'fishing-sell-fish')
        return
    end

    local item = Player.Functions.GetItemByName(fish)
    if not item then return end
    if not Shared.SellPrice[fish] then return end
    if item.amount >= amount then
        if exports['qb-inventory']:RemoveItem(Player.PlayerData.source, item.name, amount, false) then
            -- Item Box
            TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item.name], 'remove', amount)

            -- Wait to sync with animation
            Wait(3500)

            -- Give Cash
            Player.Functions.AddMoney(moneyType, amount * Shared.SellPrice[item.name])

            -- Log
            TriggerEvent('qb-log:server:CreateLog', 'fishing', 'Sale Fish', 'lightgreen', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received $"..amount * Shared.SellPrice[item.name].." for selling "..amount.."x "..QBCore.Shared.Items[item.name].label)

            -- Notification
            TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'You received $'..amount * Shared.SellPrice[item.name]..' for selling your '..QBCore.Shared.Items[item.name].label, 'success', 2500)
        end
    end
end)

RegisterNetEvent('qb-fishing:server:SellIllegalFish', function(fish, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(fish) ~= 'string' or type(amount) ~= 'number' then return end

    -- Distance Exploit Check
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.SellLocation.xyz) > 5.0 then
        exports['qb-core']:ExploitBan(src, 'fishing-sell-fish')
        return
    end

    local item = Player.Functions.GetItemByName(fish)
    if not item then return end
    if not Shared.IllegalPrice[fish] then return end
    if item.amount >= amount then
        if exports['qb-inventory']:RemoveItem(Player.PlayerData.source, item.name, amount, false) then
            -- Item Box
            TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item.name], 'remove', amount)

            -- Wait to sync with animation
            Wait(3500)

            -- Give Cash
            local info = {
                worth = 100
            }
            Player.Functions.AddItem('bands', amount * Shared.IllegalPrice[item.name], false, info)

            -- Log
            TriggerEvent('qb-log:server:CreateLog', 'fishing', 'Sale Fish', 'lightgreen', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received "..amount * Shared.IllegalPrice[item.name].." Bands for selling "..amount.."x "..QBCore.Shared.Items[item.name].label)

            -- Notification
            TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['bands'], 'add', amount * Shared.IllegalPrice[item.name])
            TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'You received '..amount * Shared.IllegalPrice[item.name]..' Bands for selling your '..QBCore.Shared.Items[item.name].label, 'success', 2500)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-fishing:server:CanSell', function(source, cb, fish, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(fish) ~= 'string' or type(amount) ~= 'number' then return end

    -- Distance Exploit Check
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.SellLocation.xyz) > 5.0 then
        exports['qb-core']:ExploitBan(src, 'fishing-can-sell')
        return
    end

    local item = Player.Functions.GetItemByName(fish)
    if not item then return end

    if item.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)
