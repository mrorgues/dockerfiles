FROM debian:jessie
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run PlayOnLinux desktop app in a container ***
#
# docker run --rm -it \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v $HOME/games:/root/games \
#   --name playonlinux \
#   mrorgues/playonlinux
# 
# WORK IN PROGRESS !


#=============#
# PlayOnLinux #
#=============#
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 && \
    sed -i 's,deb http://deb.debian.org/debian jessie main,deb http://deb.debian.org/debian jessie main non-free contrib,g' /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -qqy \
        bzip2 \
        apt-transport-https \
        wget && \
    wget -q "https://dl.winehq.org/wine-builds/Release.key" -O- | apt-key add - && \
	echo 'deb https://dl.winehq.org/wine-builds/debian/ jessie main' >> /etc/apt/sources.list.d/wine.list && \
    wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add - && \
    echo 'deb http://deb.playonlinux.com/ jessie main' >> /etc/apt/sources.list.d/playonlinux.list && \
    apt-get update -qq && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -qqy \
        wine-staging \
        ttf-mscorefonts-installer && \
    apt-get install -qqy \
        faketime \
        gettext \
        gnome-keyring:i386 \
        libcanberra-gtk-module \
        netcat \
        playonlinux \
        p11-kit-modules:i386 \
        winbind && \
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x winetricks && \
    mv winetricks /usr/bin/winetricks && \
    apt-get install -qqy --no-install-recommends \
        libgl1-mesa-dri:i386 \
        libgl1-mesa-glx:i386 \
        xserver-xorg-core:i386 && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/encoding = \"ascii\"/encoding = \"utf-8\"/g' /usr/lib/python2.7/site.py && \
    sed -i 's,exit,,g' /usr/share/playonlinux/lib/sources && \
    sed -i 's,if(os.popen("id -u").read() == "0\\n" or os.popen("id -u").read() == "0"):,if(os.popen("id -u").read() == "100000\\n" or os.popen("id -u").read() == "100000"):,g' /usr/share/playonlinux/python/mainwindow.py


#=============#
# Here we go! #
#=============#
ENV USER root
ENV WINEPREFIX /root/.wine
ENTRYPOINT ["/usr/bin/playonlinux"]
