#!/bin/bash
ARGLIST=""
# Check for docker environment variables
if [ -n "$SCREEPS_PORT" ]; then
    ARGLIST+="--port $SCREEPS_PORT "
fi

if [ -n "$SCREEPS_HOST" ]; then
    ARGLIST+="--host $SCREEPS_HOST "
fi

if [ -n "$SCREEPS_PASS" ]; then
    ARGLIST+="--password $SCREEPS_PASS "
fi

if [ -n "$SCREEPS_CLI_PORT" ]; then
    ARGLIST+="--cli_port $SCREEPS_CLI_PORT "
fi

if [ -n "$SCREEPS_CLI_HOST" ]; then
    ARGLIST+="--cli_host $SCREEPS_CLI_HOST "
fi

# Initialize map, generate thumbnails, and authenticate with API Key
echo ${STEAM_API_KEY} | npx screeps init

# Move .screepsrc template
mv /world/.screepsrc-temp /world/.screepsrc

# Copy the mod configuration over for defaults
mv /world/mods.json-temp /world/mods.json

# Finally start the server
npx screeps start --steam_api_key $STEAM_API_KEY $ARGLIST