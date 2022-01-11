FROM openjdk:17.0.1-oraclelinux8

LABEL version="1.18.1-148" \
      description="PaperMC server. Paper is a high performance fork of the Spigot Minecraft Server that aims to fix gameplay and mechanics inconsistencies as well as to improve performance." \
      maintainer="hbermu"

RUN mkdir /papermc && \
    mkdir /papermc/workspace && \
    cd /papermc && \
    curl -L https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/148/downloads/paper-1.18.1-148.jar -o paper.jar  && \
    cd /papermc && \
    /bin/java -jar /papermc/paper.jar -v

COPY start_server.sh /papermc/start_server.sh

EXPOSE 25565
EXPOSE 25575
ENV XM=4
ENV RCON=false
WORKDIR /papermc/workspace

ENTRYPOINT ["sh","/papermc/start_server.sh"]
