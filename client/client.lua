local currentBlips = {}

-- Listen for the 'addBlip' event from the server
RegisterNetEvent('codex:trackPlayer')
AddEventHandler('codex:trackPlayer', function(targetID)
    local playerIdx = GetPlayerFromServerId(targetID)
    if playerIdx and playerIdx ~= -1 then
        local ped = GetPlayerPed(playerIdx)

        -- Ensure the ped exists and is valid
        if ped and ped ~= 0 then
            local blip = AddBlipForEntity(ped)

            SetBlipSprite(blip, Config.blipSprite)
            SetBlipScale(blip, Config.blipScale)
            SetBlipColour(blip, Config.blipColor)
            SetBlipAsShortRange(blip, Config.blipShortRange)

            -- Customize the blip name to display the player's ID
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Wanted: " .. targetID)
            EndTextCommandSetBlipName(blip)

            -- Store the blip for future reference
            currentBlips[targetID] = blip

            -- Notification for tracking
            SetNotificationTextEntry("STRING")
            AddTextComponentString(Config.blipNotificationText)
            SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
            DrawNotification(false, true)
        end
    else
        TriggerEvent("chatMessage", "^1Invalid player ID.")
    end
end)

-- Listen for the 'removeBlips' event from the server to remove all blips
RegisterNetEvent('codex:untrackAll')
AddEventHandler('codex:untrackAll', function()
    for targetID, blip in pairs(currentBlips) do
        if blip and DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
        currentBlips[targetID] = nil
    end

    -- Notification for untracking
    SetNotificationTextEntry("STRING")
    AddTextComponentString(Config.untrackMessage)
    SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
    DrawNotification(false, false)
end)

-- Remove any blips associated with players when they disconnect
AddEventHandler('playerDropped', function(playerId)
    local blip = currentBlips[playerId]
    if blip and DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
    currentBlips[playerId] = nil
end)
