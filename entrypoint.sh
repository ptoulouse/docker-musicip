#!/bin/sh

: ${PUID:=1000}
: ${PGID:=1000}

# Create user and group
groupadd -g $PGID musicip
useradd -u $PUID -g $PGID \
        -c 'MusicIP' \
       musicip

# Change permissions on directories created in the Dockerfile
chown -R musicip:musicip /home/musicip
chown -R musicip:musicip /config

exec runuser -u musicip -- /opt/MusicIP/MusicMagicMixer/MusicMagicServer -verbose start 
