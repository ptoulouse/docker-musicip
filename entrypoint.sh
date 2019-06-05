#!/bin/sh

: ${PUID:=1000}
: ${PGID:=1000}

# Create user and group
groupadd -g $PGID musicip
useradd -u $PUID -g $PGID \
	-d /home/musicip/ \
        -c 'MusicIP' \
       musicip

# Create .MusicMagic folder in musicip home folder and copy mmm.ini there.
# MusicIP expect to find that file there.
mkdir -p /home/musicip/.MusicMagic
cp /opt/MusicIP/MusicMagicMixer/mmm.ini /home/musicip/.MusicMagic

# Change permissions on directories
chown -R musicip:musicip /home/musicip
chown -R musicip:musicip /config

exec runuser -u musicip -- /opt/MusicIP/MusicMagicMixer/MusicMagicServer -verbose start 
