# Initialize map, generate thumbnails, and authenticate with API Key
echo ${STEAM_API_KEY} | npx screeps init

# Move .screepsrc template
mv /world/.screepsrc-temp /world/.screeps-rc

# Update Steam API Key (again)
sed -i "s/{APIKEY}/${STEAM_API_KEY}" /world/.screepsrc

# Copy the mod configuration over for defaults
mv /world/mods.json-temp /world/mods.json

# Finally start the server
npx screeps start