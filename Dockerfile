FROM node:12

COPY scripts/installMods.sh installMods.sh
COPY scripts/resetData.sh resetData.sh

WORKDIR /world

RUN apt update
RUN apt install -y netcat python2.7 make g++

RUN npm install screeps 
RUN npm install screepsmod-mongo screepsmod-auth screepsmod-admin-utils screepsmod-map-tool

COPY config/mods.json mods.json-temp
COPY config/.screepsrc .screepsrc-temp
COPY config/config.yml config.yml

COPY scripts/startup.sh startup.sh

CMD ["bash", "/world/startup.sh"]
