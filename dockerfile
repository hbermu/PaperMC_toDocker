FROM openjdk:17-alpine

LABEL version="$MINECRAFT_VERSION-$PAPER_VERSION" \
      description="PaperMC server. Paper is a high performance fork of the Spigot Minecraft Server that aims to fix gameplay and mechanics inconsistencies as well as to improve performance." \
      maintainer="hbermu"

RUN mkdir /papermc && \
    mkdir /papermc/workspace && \
    cd /papermc && \
    wget https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/132/downloads/paper-1.18.1-132.jar -O paper.jar
RUN cd /papermc && \
    /opt/openjdk-17/bin/java -jar /papermc/paper.jar -v

COPY start_server.sh /papermc/start_server.sh

EXPOSE 25565
EXPOSE 25575
ENV XM=4
ENV RCON=false
WORKDIR /papermc/workspace

ENTRYPOINT ["sh","/papermc/start_server.sh"]
