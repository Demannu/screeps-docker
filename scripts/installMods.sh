#!/bin/bash

for mod in "$@"
do
    cd /world
    npm install $mod
done