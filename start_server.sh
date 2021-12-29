#!/bin/bash

if ! [[ -f ".first_run" ]]; then
echo "Running first start"
## Accept Eula
    echo """#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#You also agree that tacos are tasty, and the best food in the world.
eula=true""" > /papermc/workspace/eula.txt

    echo """#Minecraft server properties
#Tue Dec 28 15:16:48 GMT 2021
enable-jmx-monitoring=false
gamemode=survival
enable-command-block=false
enable-query=false
level-name=world
motd=A Minecraft Server
query.port=25565
pvp=true
difficulty=easy
network-compression-threshold=256
require-resource-pack=false
max-tick-time=60000
use-native-transport=true
max-players=20
online-mode=true
enable-status=true
allow-flight=false
broadcast-rcon-to-ops=true
view-distance=10
server-ip=
resource-pack-prompt=
allow-nether=true
server-port=25565
sync-chunk-writes=true
op-permission-level=4
prevent-proxy-connections=false
hide-online-players=false
resource-pack=
entity-broadcast-range-percentage=100
simulation-distance=10
player-idle-timeout=0
debug=false
force-gamemode=false
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
function-permission-level=2
text-filtering-config=
spawn-monsters=true
enforce-whitelist=false
resource-pack-sha1=
spawn-protection=16
max-world-size=29999984""" > /papermc/workspace/server.properties

    ## Deploy RCON web server
    if [ "$RCON" = true ] ; then
        password=$(echo $RANDOM | md5sum | head -c 20; echo;)
        echo """rcon.port=25575
enable-rcon=true
rcon.password=${password}
""" >> /papermc/workspace/server.properties

    echo "RCON password: ${password}"
    else
        echo """rcon.port=25575
enable-rcon=false
rcon.password=
""" >> /papermc/workspace/server.properties
    fi
    touch .first_run
fi

## Run minecraft server
/opt/openjdk-17/bin/java -Xms${XM}G -Xmx${XM}G -jar /papermc/paper-1.18.1-105.jar --nogui
