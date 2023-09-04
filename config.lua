Config = {}

-- Blip settings
Config.blipSprite = 645 -- The sprite used for the tracked player's blip (change to your desired sprite)
Config.blipScale = 1.0 -- The scale of the tracked player's blip
Config.blipColor = 47 -- The color of the tracked player's blip
Config.blipShortRange = false -- Set to true for short-range blips, false for long-range blips
Config.blipNotificationText = "A Warrant has been issued for your arrest. You may be tracked." -- Notification text for tracked players

-- Messages
Config.invalidPlayerIDMessage = "Invalid player ID." -- Message displayed for an invalid player ID
Config.usageMessage = "Usage: /track [playerID]" -- Usage message for the /track command
Config.untrackMessage = "All tracked blips have been removed." -- Message displayed when all tracked blips are removed
