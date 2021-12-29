FROM openjdk:17-alpine

LABEL version="1.18.1-105" \
      description="PaperMC server. Paper is a high performance fork of the Spigot Minecraft Server that aims to fix gameplay and mechanics inconsistencies as well as to improve performance." \
      maintainer="hbermu"

RUN mkdir /papermc && \
    mkdir /papermc/workspace && \
    cd /papermc && \
    wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/110/downloads/paper-1.18.1-110.jar

COPY start_server.sh /papermc/start_server.sh

EXPOSE 25565
EXPOSE 25575
ENV XM=4
ENV RCON=false
WORKDIR /papermc/workspace

ENTRYPOINT ["sh","/papermc/start_server.sh"]
