# Docker Container for MusicIP
MusicIP Mixer is a tool to generate playlists based on the tracks sound profiles rather than based on their tags. You provide a track, an artist or an album as input an it will build a playlist of songs that sounds like your input. This is a great way to rediscover forgotten music from your collection. This tool is a great complement to Logitech Media Server.

For more information regarding MusicIP, please refer to [Spicefly's web site](https://www.spicefly.com) who has created an extensive documentation.

## Usage
You will find below examples of how to start the container.
### docker
```
docker run -d \
  --name=musicip \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Toronto \
  -p 10002:10002 \
  -v <path to music>:/music \
  -v <path to data>:/config \
  --restart unless-stopped \
  ptoulouse/musicip
```
### docker-compose
```
version: '3'
services:
  musicip:
    image: ptoulouse/musicip
    container_name: musicip
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Toronto
    ports:
      - 10002:10002
    volumes:
      - <path to music>:/music
      - <path to data>:/config
    restart: unless-stopped
```
## Parameters
|**Parameter**                |**Description**                                   |
|-----------------------------|--------------------------------------------------|
| -p 10002:10002              | Port used to access MusicIP WebUI and API.       |
| -e PUID=1000                | MusicIP will run with that user ID.              |
| -e PGID=1000                | MusicIP will run with that group ID.             |
| -e TZ=America/Toronto       | Specify your timezone.                           |
| -v \<path to music\>:/music | Specify where your music files resides.          |
| -v \<path to data\>:/config | Specify where the MusicIP library will be saved. |

