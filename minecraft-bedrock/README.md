# Minecraft Bedrock Server
Run a Minecraft dedicated server in a container.

## Introduction
This Docker image packages a specific version of Minecraft Bedrock server and allows it to be configured by environment variables.

## Usage

```bash
docker run -d -e EULA=TRUE -p 19132:19132/udp --name minecraft petercb/minecraft-bedrock-server
```

## Environment Variables

### Container Specific

- `EULA` (defaults to FALSE) : must be set to `TRUE` to accept the [Minecraft End User License Agreement](https://minecraft.net/terms)

### Server Properties

- `SERVER_NAME`
- `SERVER_PORT`
- `GAMEMODE`
- `DIFFICULTY`
- `LEVEL_TYPE`
- `ALLOW_CHEATS`
- `MAX_PLAYERS`
- `ONLINE_MODE`
- `WHITE_LIST`
- `VIEW_DISTANCE`
- `TICK_DISTANCE`
- `PLAYER_IDLE_TIMEOUT`
- `MAX_THREADS`
- `LEVEL_NAME`
- `LEVEL_SEED`
- `DEFAULT_PLAYER_PERMISSION_LEVEL`
- `TEXTUREPACK_REQUIRED`

See [here](https://minecraft.gamepedia.com/Server.properties#Bedrock_Edition_3) for description of what each of the above do

## Volumes

`/bedrock/worlds` : the location where world data is stored

## Credits

This work is inspired by [itzg/docker-minecraft-bedrock-server](https://github.com/itzg/docker-minecraft-bedrock-server) and heavily borrows from that work.
