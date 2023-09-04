# codex-warranttrack
This script allows players in Grand Theft Auto V roleplay servers to track other players using blips on the map. It also adds a red pulsing ring around the tracked player's blip for added visibility.

## Features

- Use the `/track [playerid]` command to start tracking a player.
- Yellow GPS waypoint is set to the tracked player's location.
- A red pulsing ring appears around the tracked player's blip on the map.

## Configuration

To customize the script's behavior, you can modify the configuration values in the `config.lua` file:

- `enable_blips`: Enable or disable blips on the map.
- Blip settings (blip scale, color, etc.).
- `enable_tracking`: Enable or disable player tracking.
- Tracking settings (blip scale, red ring color, pulsing speed, etc.).

## Installation

1. Place the `codex-track` in your server's resources folder.
2. Ensure you have the `ND_Core` module imported correctly as per your server setup.
3. Add the resource to your `server.cfg` file.
4. ensure your_resource_name
5. Restart your server to apply the changes.

## Usage

In the game, press F1 or open the console.
Type /track [playerid] to start tracking a player by their ID.
A yellow GPS waypoint will be set to the tracked player's location.
A red pulsing ring will appear around the tracked player's blip on the map.
To stop tracking, type /track again.

## Issues and Support
If you encounter any issues or need assistance with this script, please feel free to create an issue on the GitHub repository.

Credits
This script was created by [TheStoicBear](https://github.com/TheStoicBear) and is provided under the MIT License.
