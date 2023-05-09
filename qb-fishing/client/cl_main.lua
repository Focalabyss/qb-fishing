QBCore = exports['qb-core']:GetCoreObject()

local canFish = false
local canFish2 = false
local canFish3 = false
local canFish4 = false
local canFish5 = false
local isFishing = false
local fishingRod
local anchorActive = false

--- Method to perform fishing animation
--- @return nil
local fishAnimation = function()
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
                local hasItem = QBCore.Functions.HasItem("cornbait")
                local hasItem2 = QBCore.Functions.HasItem("worms")
                local hasItem3 = QBCore.Functions.HasItem("fishingbait")
                if hasItem then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish', 1)
                elseif hasItem2 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish', 2)
                elseif hasItem3 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish', 3)
                else
                    QBCore.Functions.Notify("You don't have the right bait!", "error")
                end
            elseif canFish2 then
                local hasItem = QBCore.Functions.HasItem("fishingbait")
                local hasItem2 = QBCore.Functions.HasItem("cornbait")
                local hasItem3 = QBCore.Functions.HasItem("worms")
                if hasItem then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish2', 1)
                elseif hasItem2 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish2', 2)
                elseif hasItem3 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish2', 3)
                else
                    QBCore.Functions.Notify("You don't have the right bait!", "error")
                end
            elseif canFish3 then
                local hasItem = QBCore.Functions.HasItem("fishingbait")
                local hasItem2 = QBCore.Functions.HasItem("cornbait")
                local hasItem3 = QBCore.Functions.HasItem("smallchunks")
                if hasItem then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish3', 1)
                elseif hasItem2 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish3', 2)
                elseif hasItem3 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish3', 3)
                else
                    QBCore.Functions.Notify("You don't have the right bait!", "error")
                end
            elseif canFish4 then
                local hasItem = QBCore.Functions.HasItem("smallchunks")
                local hasItem2 = QBCore.Functions.HasItem("fishingbait")
                local hasItem3 = QBCore.Functions.HasItem("sharkbait")
                if hasItem then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish4', 1)
                elseif hasItem2 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish4', 2)
                elseif hasItem3 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveFish4', 3)
                else
                    QBCore.Functions.Notify("You don't have the right bait!", "error")
                end
            elseif canFish5 then
                local chance = math.random(1, 100)
                local hasItem = QBCore.Functions.HasItem("smallchunks")
                local hasItem2 = QBCore.Functions.HasItem("plankton")
                local hasItem3 = QBCore.Functions.HasItem("sharkbait")
                if chance >= 100 - Shared.Chance then
                    exports['ps-dispatch']:Poaching()
                end
                if hasItem then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveIllegalFish', 1)
                elseif hasItem2 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveIllegalFish', 2)
                elseif hasItem3 then
                    TriggerServerEvent('hud:server:RelieveStress', 2)
                    TriggerServerEvent('qb-fishing:server:ReceiveIllegalFish', 3)
                else
                    QBCore.Functions.Notify("You don't have the right bait!", "error")
                end
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
        --local hasItem = QBCore.Functions.HasItem("fishingbait")
        --if hasItem then
            -- Start Fishing
            startFishing()
        --else
        --    QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        --end
    elseif canFish2 then
        --local hasItem = QBCore.Functions.HasItem("fishingbait")
        --if hasItem then
            -- Start Fishing
            startFishing()
        --else
        --    QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        --end
    elseif canFish3 then
        --local hasItem = QBCore.Functions.HasItem("fishingbait")
        --if hasItem then
            -- Start Fishing
            startFishing()
        --else
        --    QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        --end
    elseif canFish4 then
        --local hasItem = QBCore.Functions.HasItem("fishingbait")
        --if hasItem then
            -- Start Fishing
            startFishing()
        --else
        --    QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        --end
    elseif canFish5 then
        --local hasItem = QBCore.Functions.HasItem("smallchunks")
        --if hasItem then
            -- Start Fishing
            startFishing()
        --else
        --    QBCore.Functions.Notify('You need both a fishing rod and bait to start fishing..', 'error', 2500)
        --end
    else
        QBCore.Functions.Notify('You can\'t fish over here..', 'error', 2500)
    end
end)

RegisterNetEvent('qb-fishing:useAnchor', function()
    local ped = PlayerPedId()
    local currVeh = GetVehiclePedIsIn(ped, false)
    if IsPedInAnyVehicle(ped, false) then 
        if currVeh ~= 0 then
            local vehModel = GetEntityModel(currVeh)
            if vehModel ~= nil and vehModel ~= 0 then
                if DoesEntityExist(currVeh) then
                    if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then 
                        QBCore.Functions.Progressbar('anchor', 'Anchor is setting up', 5000, false, true, {
                            disableMovement = true, --
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() 
                            if IsBoatAnchoredAndFrozen(currVeh) then 
                                QBCore.Functions.Notify('Anchor pulled', 'success') 
                                SetBoatAnchor(currVeh, false)
                                SetBoatFrozenWhenAnchored(currVeh, false)
                                SetForcedBoatLocationWhenAnchored(currVeh, false)
                                anchorActive = false
                            elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                                SetEntityAsMissionEntity(currVeh,false,true) 
                                QBCore.Functions.Notify('Anchor has been thrown!', 'success') 
                                SetBoatAnchor(currVeh, true)
                                SetBoatFrozenWhenAnchored(currVeh, true)
                                SetForcedBoatLocationWhenAnchored(currVeh, true)
                                anchorActive = true
                            end
                        end, function() -- Cancel
                            QBCore.Functions.Notify('You have cancelled the anchor.', 'error')
                            anchorActive = false
                        end)
                    end
                end
            end
        end
    else
        QBCore.Functions.Notify('You must be inside of boat to use this command!', 'error')
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
                debugGrid = false,
            })
        elseif v.river then
            zones2[#zones2+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
            })
        elseif v.dock then
            zones3[#zones3+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
            })
        elseif v.ocean then
            zones4[#zones4+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
            })
        elseif v.illegal then
            zones5[#zones5+1] = PolyZone:Create(v.points, {
                name = v.name,
                minZ = v.minZ,
                maxZ = v.maxZ,
                debugGrid = false,
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

