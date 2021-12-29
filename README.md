# PaperMC to Docker!
Now [PaperMC](https://papermc.io/) in docker for your easy use.

# Run
```
docker run -p 25565:25565 hbermu/papermc:latest
```

# Personalize
## Allocate Ram
You can use the environment variable `XM` to define the number of Gb to use (default: 4): `-e XM=8`

## Persistent world
If you dont want to lose your world, mount a volume in path: `/papermc/workspace`

## Change Setting
Run for the first time the server with a volumen and then edit de config files you want:
- server.properties
- paper.yml
- spigot.yml
- bukkit.yml
- ...

# To do
- Deploy with plugins
- Add rcon server console
- Auto update with latest version
