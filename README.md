# Screeps Docker Container
This project contains a Docker container and all necessary configuration for running the [Screeps](https://screeps.com/) MMO strategy game server in a Docker environment.

An prebuilt image is provided at [registry.demannu.dev]().

The prebuilt image includes a few default mods:
* screepsmod-auth for authentication
* screepsmod-admin-utils for admin utilities
* screepsmod-map-tool for game map generation and configuration
* screepsmod-mongo for persistent db integration

## How to Build and Run

### Build
The process is a simple docker workflow from [Dockerfile](./Dockerfile)

```
docker build -t image_name:image_tag .
```

### Run Variables
| Variable         | Required | Description                                                    | Default   |
| ---------------- | -------- | -------------------------------------------------------------- | --------- |
| STEAM_API_KEY    | Y        | Personal Steam API Key (https://steamcommunity.com/dev/apikey) | null      |
| SCREEPS_PASS     | N        | Server password for client connections                         | null      |
| SCREEPS_PORT     | N        | Server port                                                    | 21025     |
| SCREEPS_HOST     | N        | Server interface                                               | 0.0.0.0   |
| SCREEPS_CLI_PORT | N        | Server admin port                                              | 21026     |
| SCREEPS_CLI_HOST | N        | Server admin interface                                         | localhost |

### Run Volumes
| Container Path      | Required | Description          |
| ------------------- | -------- | -------------------- |
| /world/logs         | N        | Default log location |
| /world/assets       | Y        | Map Data             |
| /world/node_modules | N        | Package and mod data |


Please ensure you have access to the necessary environment variables and database, as specified in the docker-compose.yml file.

## Customizing Server

### MOTD, Resource Limits, General Config
[config.yml](./config/config.yml) : Screeps runtime configuration, see [screeps-launcher](https://github.com/screepers/screeps-launcher/blob/master/config.sample.yml) config for additional options

### Mods
There are 2 ways to handle mods in the image:
* [config.yml](./config/config.yml) to have the server attempt to automatically install mods from the workshop
* [installMods.sh](./scripts/installMods.sh) to manually install mods direct from npm packages.

## Resetting Server Data

If you ever need to clear all data from the server and restart, type:

`docker exec <screeps container> /resetData.sh`. This will erase all game data.

## Connecting to the Server

Once the stack is up and running, connect using a Screeps client. Point your client to the docker host IP (localhost if running locally) and use port `21025` for game and `21026` for CLI.

Please note, any changes to the configuration files in `./config/` would require a container restart to take effect.

That's it! You now have your private Screeps server running inside a Docker container. Happy gaming!