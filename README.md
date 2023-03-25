# Credits
I based and used some code from Lionh34rt's qb-fishing script. I was bored of the Fish anywhere catch anything fishing scripts that didn't make too much sense. So I modified it to work with PolyZones. So now if you go to a particular zone you can target certain fish depending on what you feel like catching. Also Illegal fishing is something that I had implemented myself with exotic fish such as Stingray and Whales that pay in dirty money that needs to be washed. Be careful though PD/Rangers have a chance of being called for "Possible Poaching" calls (doesn't give exact locations don't worry) using ps-dispatch.
# Description
* Fishing script for QBCore
# Dependencies
* QBCore Framework
* Project Sloth ps-ui
* Project Sloth ps-dispatch (for Dispatch calls only)
* PolyZone
# Installation
* Install all the dependencies
* Add the items to your qb-core > shared > items.lua
## Items for qb-core > shared > items.lua
```
-- Fishing
['fishingrod'] 					 = {['name'] = 'fishingrod', 					['label'] = 'Fishing Rod', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,		['combinable'] = nil,   ['description'] = 'With this I can catch the fish..'},
['fishingbait'] 				 = {['name'] = 'fishingbait', 					['label'] = 'Fishing Bait', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'fishingbait.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'With this I can lure the fishessss..'},
['catfish'] 			 		 = {['name'] = 'catfish', 						['label'] = 'Catfish', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'catfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['trout'] 						 = {['name'] = 'fish', 							['label'] = 'Fish', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['laketrout'] 						 = {['name'] = 'fish2', 						['label'] = 'Fish', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fish2.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['goldfish'] 					 = {['name'] = 'goldfish', 						['label'] = 'Goldfish', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'goldfish.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['largemouthbass'] 				 = {['name'] = 'largemouthbass', 				['label'] = 'Largemouth Bass', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'largemouthbass.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['redfish'] 					 = {['name'] = 'redfish', 						['label'] = 'Redfish', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'redfish.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['salmon'] 						 = {['name'] = 'salmon', 						['label'] = 'Salmon', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'salmon.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['stingray'] 					 = {['name'] = 'stingray', 						['label'] = 'Stingray', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'stingray.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['stripedbass'] 				 = {['name'] = 'stripedbass', 					['label'] = 'Striped Bass', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'stripedbass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['whale'] 			 			 = {['name'] = 'whale', 						['label'] = 'Whale', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'whale.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
['whale2'] 						 = {['name'] = 'whale2', 						['label'] = 'Whale', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'whale2.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'A Fish'},
--Illegal Fishing Reward
['bands'] 				 	 	 = {['name'] = 'bands', 			  	  		['label'] = 'Band of Cash', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'bands.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Money?'},
```
* Create a new shop in qb-shops with the snippet below (optional)
```
-- My Fishing Shop
["fishing"] = {
    ["label"] = "The Lion Fish",
    ["coords"] = vector4(-1597.9, 5201.15, 4.39, 69.79),
    ["ped"] = 's_m_m_migrant_01',
    ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
    ["radius"] = 1.5,
    ["targetIcon"] = "fas fa-fish-fins",
    ["targetLabel"] = "Open Fishing Store",
    ["products"] = Config.Products["fishing"],
    ["showblip"] = true,
    ["blipsprite"] = 68,
    ["blipscale"] = 0.8,
    ["blipcolor"] = 38
},

-- Config.Products:
["fishing"] = {
    [1] = {
        name = 'fishingrod',
        price = 100,
        amount = 100,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'fishingbait',
        price = 1,
        amount = 5000,
        info = {},
        type = 'item',
        slot = 2,
    }
},
```
## Add this to your ps-dispatch/client/cl_extraalerts.lua
```
local function Poaching()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "poaching", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-13",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = 'Possible Poaching', -- message
        job = { "police" } -- jobs that will get the alerts
    })
end

exports('Poaching', Poaching)
```
## This gets added to your ps-dispatch/server/sv_dispatchcodes.lua
```
["poaching"] =  {displayCode = '10-60', description = "Possible Poaching", radius = 120.0, recipientList = {'police'}, blipSprite = 469, blipColour = 52, blipScale = 0, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset", offset = "true", blipflash = "false"},
```
### This is the export
```
exports['ps-dispatch']:Poaching()
```
## Add .png files from the images folder to your qb-inventory/html/images folder
# Thank You Lionh34rt!
# Original Repo Link: https://github.com/Lionh34rt/qb-fishing
