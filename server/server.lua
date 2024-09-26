
RegisterCommand('track', function(source, args, rawCommand)
    local targetID = tonumber(args[1])

    if targetID then
        -- Check if the player has permission to use /track
        if IsPlayerAceAllowed(source, "codex:warrant.track") then
            -- Trigger the client event to add a blip on the specified player's client
            TriggerClientEvent('codex:trackPlayer', source, targetID)
        else
            TriggerClientEvent("chatMessage", source, "^1You don't have permission to use /track.")
        end
    else
        TriggerClientEvent("chatMessage", source, "^1Invalid player ID.")
    end
end, false)

RegisterCommand('untrack', function(source, args, rawCommand)
    -- Check if the player has permission to use /untrack
    if IsPlayerAceAllowed(source, "codex:warrant.untrack") then
        -- Trigger the client event to remove all blips
        TriggerClientEvent('codex:untrackAll', source)
    else
        TriggerClientEvent("chatMessage", source, "^1You don't have permission to use /untrack.")
    end
end, false)
