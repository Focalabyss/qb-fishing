QBCore = exports['qb-core']:GetCoreObject()

local canFish = false
local canFish2 = false
local canFish3 = false
local canFish4 = false
local canFish5 = false
local isFishing = false
local fishingRod

--- Method to perform fishing animation
--- @return nil
local fishAnimation = function()
    -- Remove Fishing Bait
    TriggerServerEvent('qb-fishing:server:RemoveBait')
    -- Throw Bait Animation
    local ped = PlayerPedId()
    RequestAnimDict('mini@tennis')
    while not HasAnimDictLoaded('mini@tennis') do Wait(0) end
    TaskPlayAnim(ped, 'mini@tennis', 'forehand_ts_md_far', 1.0, -1.0, 1.0, 48, 0, 0, 0, 0)
    while IsEntityPlayingAnim(ped, 'mini@tennis', 'forehand_ts_md_far', 3) do Wait(0) end
    -- Fish Animation
    RequestAnimDict('amb@world_human_stand_fishing@idle_a')
    while not HasAnimDictLoaded('amb@world_human_stand_fishing@idle_a') do Wait(0) end
    TaskPlayAnim(ped, 'amb@world_human_stand_fishing@idle_a', 'idle_c', 1.0, -1.0, 1.0, 10, 0, 0, 0, 0)
    Wait(math.random(Shared.CastTimeMin, Shared.CastTimeMax) * 1000)
    -- Minigame
    exports['ps-ui']:Circle(function(success)
        if success then
            if canFish then
                TriggerServerEvent('hud:server:RelieveStress', 2)
                TriggerServerEvent('qb-fishing:server:ReceiveFish')
            elseif canFish2 then
                TriggerServerEvent('hud:server:RelieveStress', 2)
                TriggerServerEvent('qb-fishing:server:ReceiveFish2')
            elseif canFish3 then
                TriggerServerEvent('hud:server:RelieveStress', 2)
                TriggerServerEvent('qb-fishing:server:ReceiveFish3')
            elseif canFish4 then
                TriggerServerEvent('hud:server:RelieveStress', 2)
                TriggerServerEvent('qb-fishing:server:ReceiveFish4')
            elseif canFish5 then
                local chance = math.random(1, 100)
                if chance >= 100 - Shared.Chance then
                    exports['ps-dispatch']:Poaching()
                end
                TriggerServerEvent('hud:server:RelieveStress', 2)
                TriggerServerEvent('qb-fishing:server:ReceiveIllegalFish')
            else
                QBCore.Functions.Notify('The fish got away!', 'error', 2500)
                TriggerServerEvent('hud:server:RelieveStress', 1)
            end
        end
    end, math.random(Shared.MinigameCirclesMin, Shared.MinigameCirclesMax), Shared.MinigameTime)
    -- Finishing up
    ClearPedTasks(ped)
    DeleteObject(fishingRod)
    isFishing = false
end

--- Method to create a fishing rod prop and return the object
--- @return fishingRod number - Entity number
local startFishing = function()
    -- Spam Prevent
    if isFishing then return end
    isFishing = true

    -- Load Fishing Rod Model
    local fishingRodHash = `prop_fishing_rod_01`
    if not IsModelValid(fishingRodHash) then return end
    if not HasModelLoaded(fishingRodHash) then RequestModel(fishingRodHash) end
    while not HasModelLoaded do Wait(0) end

    -- Create Object and attach on player ped
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local object = CreateObject(fishingRodHash, pedCoords, true, false, false)
    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(object)
    fishingRod = object
    fishAnimation()
end

RegisterNetEvent('qb-fishing:client:FishingRod', function()
    -- Check if player has fishingbait
    if canFish then
        local hasItem = QBCore.Functions.HasItem("fishingbait")
        if hasItem then
            -- Start Fishing
            startFishing()
        else
            QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        end
    elseif canFish2 then
        local hasItem = QBCore.Functions.HasItem("fishingbait")
        if hasItem then
            -- Start Fishing
            startFishing()
        else
            QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        end
    elseif canFish3 then
        local hasItem = QBCore.Functions.HasItem("fishingbait")
        if hasItem then
            -- Start Fishing
            startFishing()
        else
            QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        end
    elseif canFish4 then
        local hasItem = QBCore.Functions.HasItem("fishingbait")
        if hasItem then
            -- Start Fishing
            startFishing()
        else
            QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        end
    elseif canFish5 then
        local hasItem = QBCore.Functions.HasItem("fishingbait")
        if hasItem then
            -- Start Fishing
            startFishing()
        else
            QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        end
    else
        QBCore.Functions.Notify('You can\'t fish over here..', 'error', 2500)
    end
end)

CreateThread(function()
    -- Start with empty array (for ComboZone)
    local zones = {}
    local zones2 = {}
    local zones3 = {}
    local zones4 = {}
    local zones5 = {}

    -- Create individual fishing zones and add them to the array
    for k, v in pairs(Shared.FishingZones) do
        if v.lake then -- BoxZone
            zones[#zones+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = true,
            })
        elseif v.river then
            zones2[#zones2+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = true,
            })
        elseif v.dock then
            zones3[#zones3+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = true,
            })
        elseif v.ocean then
            zones4[#zones4+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = true,
            })
        elseif v.illegal then
            zones5[#zones5+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = true,
            })
        end
    end

    -- Create ComboZone
    local Lakes = ComboZone:Create(zones, {
        name = "Lakes", 
        debugPoly = false
    })
    local Rivers = ComboZone:Create(zones2, {
        name = "Rivers", 
        debugPoly = false
    })
    local Docks = ComboZone:Create(zones3, {
        name = "Docks", 
        debugPoly = false
    })
    local Ocean = ComboZone:Create(zones4, {
        name = "Ocean", 
        debugPoly = false
    })
    local Illegal = ComboZone:Create(zones5, {
        name = "Illegal", 
        debugPoly = false
    })

    -- Enter/Exit Fishing Zone
    Rivers:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            exports['qb-core']:DrawText('Fishing', 'left')
            canFish = true
        else
            exports['qb-core']:HideText()
            canFish = false
        end
    end)
    Lakes:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            exports['qb-core']:DrawText('Fishing', 'left')
            canFish2 = true
        else
            exports['qb-core']:HideText()
            canFish2 = false
        end
    end)
    Docks:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            --exports['qb-core']:DrawText('Fishing', 'left')
            canFish3 = true
        else
            --exports['qb-core']:HideText()
            canFish3 = false
        end
    end)
    Ocean:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            exports['qb-core']:DrawText('Fishing', 'left')
            canFish4 = true
        else
            exports['qb-core']:HideText()
            canFish4 = false
        end
    end)
    Illegal:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            exports['qb-core']:DrawText('Fishing', 'left')
            canFish5 = true
        else
            exports['qb-core']:HideText()
            canFish5 = false
        end
    end)
end)
