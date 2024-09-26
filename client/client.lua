local currentBlips = {}


-- Register the /track command
RegisterCommand('track', function(source, args, rawCommand)
    if #args == 1 then
        local targetID = tonumber(args[1])
        
        if targetID then
            -- Check if the player has permission to use /track
            if IsPlayerAceAllowed(source, "codex:warrant.track") then
                -- Show a blip for the tracked player
                local playerIdx = GetPlayerFromServerId(targetID)
                local ped = GetPlayerPed(playerIdx)
                local blip = AddBlipForEntity(ped)
                
                SetBlipSprite(blip, Config.blipSprite)
                SetBlipScale(blip, Config.blipScale)
                SetBlipColour(blip, Config.blipColor)
                SetBlipAsShortRange(blip, Config.blipShortRange)
                
                -- Customize the blip name to display the player's ID
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Wanted: " .. targetID)
                EndTextCommandSetBlipName(blip)
                
                table.insert(currentBlips, blip)
                
                -- Notify the tracked player using a GTA V native notification with the custom image
                SetNotificationTextEntry("STRING")
                AddTextComponentString(Config.blipNotificationText)
                SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
                DrawNotification(false, true, 1)
            else
                -- Show a notification to the source player for lack of permission
                TriggerClientEvent("chatMessage", source, "^1You don't have permission to use /track.")
            end
        else
            -- Show a notification to the source player for an invalid player ID
            SetNotificationTextEntry("STRING")
            AddTextComponentString(Config.invalidPlayerIDMessage)
            SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
            DrawNotification(false, false, 1)
        end
    else
        -- Show a notification to the source player for incorrect usage
        SetNotificationTextEntry("STRING")
        AddTextComponentString(Config.usageMessage)
        SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
        DrawNotification(false, false, 1)
    end
end, false)

RegisterCommand('untrack', function(source, args, rawCommand)
    -- Check if the player has permission to use /untrack
    if IsPlayerAceAllowed(source, "codex:warrant.untrack") then
        for i = #currentBlips, 1, -1 do
            local b = currentBlips[i]
            if b and DoesBlipExist(b) then
                RemoveBlip(b)
            end
            table.remove(currentBlips, i)
        end

        -- Show a notification to the source player for removing all tracked blips
        SetNotificationTextEntry("STRING")
        AddTextComponentString(Config.untrackMessage)
        SetNotificationMessage("CHAR_CALL911", "CHAR_CALL911", true, 1, "Tracker Notification", "")
        DrawNotification(false, false, 1)
    else
        -- Show a notification to the source player for lack of permission
        TriggerClientEvent("chatMessage", source, "^1You don't have permission to use /untrack.")
    end
end, false)


-- Remove any existing blips when a player disconnects
AddEventHandler("playerDropped", function()
    for i = #currentBlips, 1, -1 do
        local b = currentBlips[i]
        if b and DoesBlipExist(b) then
            RemoveBlip(b)
        end
        table.remove(currentBlips, i)
    end
end)


