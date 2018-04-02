FROM mrorgues/playonlinux
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run Captvty desktop app in a container ***
#
# Please see: http://v3.captvty.fr/
#
# docker run --rm -d \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   -v /home/Documents/videos:/opt/captvty/videos \
#   --name captvty \
#   mrorgues/captvty


#=========#
# Captvty #
#=========#
ENV WINEARCH=win64 \
    PATH=$PATH:/opt/captvty
RUN apt-get update -qq && \
    apt-get install -qqy \
        libwine-gecko-2.21 \
        mesa-utils \
        unzip && \
    apt-get install -qqy \
        libp11-kit-gnome-keyring:i386 \
        p11-kit:i386 && \
    DOWNLOAD_LINK=$(curl -c /tmp/cookie http://v3.captvty.fr/ | sed -n 's/.*href="\([^"]*\).*/\1/p' | grep zip) && \
    DOWNLOAD_LINK="http:"${DOWNLOAD_LINK} && \
    curl -fLo /tmp/captvty.zip  -b /tmp/cookie ${DOWNLOAD_LINK} && \
    rm /tmp/cookie && \
    mkdir /opt/captvty && \
    unzip /tmp/captvty.zip -d /opt/captvty && \
    rm /tmp/captvty.zip  && \
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x winetricks && \
    mv winetricks /usr/bin/winetricks && \
    winetricks -q win7 && \
    winetricks -q dotnet452 && \
    sed -i 's,Vidéos,videos,g' /opt/captvty/Captvty.exe.config && \
    rm -rf /var/lib/apt/lists/*
COPY config/Captvty.settings /opt/captvty/Captvty.settings


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/opt/wine-staging/bin/wine", "/opt/captvty/Captvty.exe"]
