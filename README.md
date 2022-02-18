### Docker Container for Screeps
---

It's yet another docker container, this time nothing special just a learning project that ended up being useful.

Generate a Steam API Key (https://steamcommunity.com/dev/apikey)

Enter your Steam API Key into the environment variable for screeps service in docker-compose.yml

Run the stack with

`docker-compose up -d`

Setup the database by resetting once

`docker exec <screeps container> resetData.sh`

Access the server via a Screeps client, pointing at the docker host

