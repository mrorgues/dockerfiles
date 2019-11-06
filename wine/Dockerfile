FROM ubuntu:bionic
LABEL github "https://github.com/mrorgues"


#========#
# Basics #
#========#
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    TZ="Europe/Paris" \
    LANGUAGE="fr_FR.UTF-8" \
    LANG="fr_FR.UTF-8"
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        bzip2 \
        ca-certificates \
        gnupg \
        language-pack-en \
        language-pack-fr \
        locales \
        tzdata \
        wget \
        --no-install-recommends && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    echo "${TZ}" > /etc/timezone && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen ${LANGUAGE} && \
    dpkg-reconfigure --frontend noninteractive locales


#================#
# Wine (Staging) #
#================#
ENV USER=root \
    WINEPREFIX=/root/.wine
RUN dpkg --add-architecture i386 && \
    wget -nc -P /tmp https://dl.winehq.org/wine-builds/winehq.key && \
    apt-key add /tmp/winehq.key && \
    rm /tmp/winehq.key && \
    apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
    add-apt-repository ppa:cybermax-dexter/sdl2-backport && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -y \
        gettext \
        netcat \
        ttf-mscorefonts-installer \
        winbind \
        winehq-staging && \
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x winetricks && \
    mv winetricks /usr/bin/winetricks && \
    rm -rf /var/lib/apt/lists/*


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/bin/bash"]
