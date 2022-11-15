FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Install 32 bits libraries
RUN apt-get update && \
    apt-get install -yq libc6-i386 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy and extract MusicIP archive
ADD MusicMixer_x86_1.8.tgz /opt

# Replace default index page with Spicefly's index page (spicefly.com)
COPY index.html /opt/MusicIP/MusicMagicMixer/server/index.html

# Edit mmm.ini file.
# - Disable TIVO
# - Indicate that the DB will be located in the /config volume. This is
#   required for persistence, otherwise music has to be scanned again
#   when restarting
RUN sed -i -e 's/tivo=1/tivo=0/' -e 's_cache=.*_cache=/config/default.m3lib_' /opt/MusicIP/MusicMagicMixer/mmm.ini

VOLUME /music /config
EXPOSE 10002

COPY entrypoint.sh /entrypoint.sh 
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
