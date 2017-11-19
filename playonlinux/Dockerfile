FROM ubuntu:trusty
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
    apt-get update -qq && \
    apt-get install -qqy \
        bzip2 \
        apt-transport-https \
        wget && \
    wget -q "https://dl.winehq.org/wine-builds/Release.key" -O- | apt-key add - && \
	echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ trusty main' >> /etc/apt/sources.list.d/wine.list && \
    wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add - && \
    echo 'deb http://deb.playonlinux.com/ trusty main' >> /etc/apt/sources.list.d/playonlinux.list && \
    apt-get update -qq && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -qqy \
        wine-staging \
        ttf-mscorefonts-installer && \
    echo export PATH="/opt/wine-staging/bin:$PATH" >> /root/.bashrc && \
    apt-get install -qqy \
        faketime \
        gettext \
        gnome-keyring \
        libcanberra-gtk-module \
        netcat \
        playonlinux \
        winbind && \
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x winetricks && \
    mv winetricks /usr/bin/winetricks && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/encoding = \"ascii\"/encoding = \"utf-8\"/g' /usr/lib/python2.7/site.py && \
    sed -i 's,exit,,g' /usr/share/playonlinux/lib/sources && \
    sed -i 's,if(os.popen("id -u").read() == "0\\n" or os.popen("id -u").read() == "0"):,if(os.popen("id -u").read() == "100000\\n" or os.popen("id -u").read() == "100000"):,g' /usr/share/playonlinux/python/mainwindow.py


#=============#
# Here we go! #
#=============#
ENV USER root
ENV WINEPREFIX /root/.wine
WORKDIR /root
ENTRYPOINT ["/usr/bin/playonlinux"]
