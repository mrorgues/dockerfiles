FROM ubuntu:xenial
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run LibreProject desktop app in a container ***
# https://sourceforge.net/projects/projectlibre
#
# docker run --rm -d \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#	  -e DISPLAY=unix$DISPLAY \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v $HOME/Documents/projectlibre:/root/Documents \
#   --name libreproject \
#   mrorgues/libreproject


#==============#
# ProjectLibre #
#==============#
RUN DOWNLOAD_URL="https://sourceforge.net/projects/projectlibre/files/ProjectLibre/1.7/projectlibre_1.7.0-1.deb/download" && \
    buildDeps="curl" && \
    set -x && \
    apt-get update && apt-get install -qqy $buildDeps ca-certificates-java openjdk-8-jre --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sSL "${DOWNLOAD_URL}" > /tmp/projectlibre.deb && \
    dpkg -i /tmp/projectlibre.deb && \
    rm -rf /tmp/projectlibre.deb && \
    apt-get autoremove --purge -qqy $buildDeps && \
    apt-get clean


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/usr/bin/projectlibre"]
