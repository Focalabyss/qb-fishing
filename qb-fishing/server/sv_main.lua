QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('anchor', function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('qb-fishing:useAnchor', src)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if fish == 1 then
        Player.Functions.AddItem('trout', 1)
        Player.Functions.RemoveItem('cornbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['cornbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['trout'], 'add', 1)
    elseif fish == 2 then
        Player.Functions.AddItem('salmon', 1)
        Player.Functions.RemoveItem('worms')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['worms'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['salmon'], 'add', 1)
    else
        Player.Functions.AddItem('smallmouth', 1)
        Player.Functions.RemoveItem('fishingbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['smallmouth'], 'add', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish2', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if fish == 1 then
        Player.Functions.AddItem('laketrout', 1)
        Player.Functions.RemoveItem('fishingbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['laketrout'], 'add', 1)
    elseif fish == 2 then
        Player.Functions.AddItem('catfish', 1)
        Player.Functions.RemoveItem('cornbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['cornbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['catfish'], 'add', 1)
    else
        Player.Functions.AddItem('goldfish', 1)
        Player.Functions.RemoveItem('worms')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['worms'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['goldfish'], 'add', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish3', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if fish == 1 then
        Player.Functions.AddItem('largemouthbass', 1)
        Player.Functions.RemoveItem('fishingbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['largemouthbass'], 'add', 1)
    elseif fish == 2 then
        Player.Functions.AddItem('catfish', 1)
        Player.Functions.RemoveItem('cornbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['cornbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['catfish'], 'add', 1)
    else
        Player.Functions.AddItem('bluefish', 1)
        Player.Functions.RemoveItem('smallchunks')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['smallchunks'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['bluefish'], 'add', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveFish4', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if fish == 1 then
        Player.Functions.AddItem('stripedbass', 1)
        Player.Functions.RemoveItem('smallchunks')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['smallchunks'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['stripedbass'], 'add', 1)
    elseif fish == 2 then
        Player.Functions.AddItem('flounder', 1)
        Player.Functions.RemoveItem('fishingbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['flounder'], 'add', 1)
    else
        Player.Functions.AddItem('mackerel', 1)
        Player.Functions.RemoveItem('sharkbait')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['sharkbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['mackerel'], 'add', 1)
    end
end)

RegisterNetEvent('qb-fishing:server:ReceiveIllegalFish', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if fish == 1 then
        Player.Functions.AddItem('stingray', 1)
        Player.Functions.RemoveItem('smallchunks', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['smallchunks'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['stingray'], 'add', 1)
    elseif fish == 2 then
        Player.Functions.AddItem('dolphin', 1)
        Player.Functions.RemoveItem('plankton', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['plankton'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['dolphin'], 'add', 1)
    else
        Player.Functions.AddItem('shark', 1)
        Player.Functions.RemoveItem('sharkbait', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['sharkbait'], 'remove', 1)
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['shark'], 'add', 1)
    end
end)

QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.GetItemByName('fishingrod') then return end
    TriggerClientEvent('qb-fishing:client:FishingRod', src)
end)
