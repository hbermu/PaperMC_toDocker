#!/bin/bash

if ! [[ -f "/papermc/workspace/eula.txt" ]]; then
echo "Running first start"
## Accept Eula
    echo """#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#You also agree that tacos are tasty, and the best food in the world.
eula=true""" > /papermc/workspace/eula.txt
fi

## Run minecraft server
/opt/openjdk-17/bin/java -Xms${XM}G -Xmx${XM}G -jar /papermc/paper-1.18.1-105.jar --nogui
