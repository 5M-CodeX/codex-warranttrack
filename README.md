# CodeX Warrant Tracker

![SugarTank (1)](https://github.com/5M-CodeX/codex-warranttrack/assets/112611821/a454478b-01d8-423e-b6e3-27b688b3fc27)

The CodeX Warrant Tracker System is a resource for FiveM servers that allows players to track other players using blips and notifications. This resource is designed to enhance the gameplay experience on your server.

## Features

- Track other players using blips on the minimap.
- Send notifications to tracked players when they are being tracked.
- Customizable configuration to tailor the system to your server's needs.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Tracking a Player](#tracking-a-player)
  - [Untracking All Players](#untracking-all-players)
- [Configuration](#configuration)

## Installation

1. Download the resource files from this repository.

2. Place the `tracking` folder into your FiveM server's `resources` directory.

3. Add `start tracking` to your server.cfg file to ensure the resource is loaded when the server starts.

4. Configure the settings in the `config.lua` file located in the `tracking` folder to your preferences (see the [Configuration](#configuration) section for details).

## Usage

### Tracking a Player

To track a player, use the following in-game command:
`/track [playerID]`
Replace `[playerID]` with the ID of the player you want to track. This command will create a blip on the minimap for the tracked player and send them a notification.

- **Ace Permissions Integration:** Only players with the Ace permission `codex:warrant.track` are allowed to use this command.

### Untracking All Players

To remove all tracked blips, use the following in-game command:
`/untrack`

This command will remove all blips created by the `/track` command.

- **Ace Permissions Integration:** Only players with the Ace permission `codex:warrant.untrack` are allowed to use this command.

## Configuration

You can customize the behavior of the tracking system by editing the `config.lua` file located in the `tracking` folder. Here are some of the key configuration options:

```lua
Config = {}

-- Blip settings
Config.blipSprite = 459  -- The sprite ID of the blip to use for tracked players.
Config.blipScale = 1.0   -- The scale of the blip.
Config.blipColor = 1     -- The color of the blip.
Config.blipShortRange = true  -- Set to true to make blips short-range.
Config.blipNotificationText = "A Warrant has been issued for your arrest. You may be tracked."

-- Messages
Config.invalidPlayerIDMessage = "Invalid player ID."
Config.usageMessage = "Usage: /track [playerID]"
Config.untrackMessage = "All tracked blips have been removed."
```
Feel free to adjust these settings to fit your server's requirements.
