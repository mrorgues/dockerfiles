FROM ubuntu:cosmic
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run Chrome desktop app in a container ***
# Access: http://localhost:6080
#
# docker run --rm -d \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v $HOME/Downloads:$HOME/Downloads \
#   -v $HOME/.config/google-chrome:$HOME/.config/google-chrome \
#   -e "SCREEN_WIDTH=1920" \
#   -e "SCREEN_HEIGHT=1080" \
#   -e "SCREEN_DEPTH=24" \
#   -p 6080:6080 \
#   --name chrome_websockify \
#   mrorgues/chrome_websockify


#========#
# Basics #
#========#
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    TZ="Europe/Paris" \
    LANGUAGE="fr_FR.UTF-8" \
    LANG="fr_FR.UTF-8"
RUN apt-get update -qq && \
    apt-get install -qqy \
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
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    echo "${TZ}" > /etc/timezone && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen ${LANGUAGE} && \
    dpkg-reconfigure --frontend noninteractive locales



#========#
# Chrome #
#========#
# Please see: https://www.google.com/chrome/
RUN touch /etc/default/google-chrome && \
    echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update -qq && \
    apt-get install -qqy \
       google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*


#======================#
# NoVNC and Websockify #
#======================#
EXPOSE 6080
COPY resources/supervisord.conf /root/supervisord.conf
COPY resources/icon.ico /opt/noVNC/app/images/icons/icon.ico
COPY resources/index.html /tmp/index.html
ENV DISPLAY=:0 \
    SCREEN=0 \
    SCREEN_WIDTH=1280 \
    SCREEN_HEIGHT=1024 \
    SCREEN_DEPTH=24 \
    LOCAL_PORT=5900 \
    TARGET_PORT=6080 \
    APPLICATION_NAME=Chrome
RUN apt-get update && \
    apt-get install -qqy --no-install-recommends \
        net-tools \
        python-numpy \
        ratpoison \
        supervisor \
        x11vnc \
        xvfb && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/noVNC/utils/websockify && \
    wget -qO- "https://github.com/kanaka/noVNC/tarball/master" | tar -zx --strip-components=1 -C /opt/noVNC && \
    wget -qO- "https://github.com/kanaka/websockify/tarball/master" | tar -zx --strip-components=1 -C /opt/noVNC/utils/websockify && \
    mv /tmp/index.html /opt/noVNC/index.html && \
    sed -i 's,<title>noVNC</title>,<title>'$APPLICATION_NAME'</title>,g' /opt/noVNC/index.html && \
    sed -i 's,document.title = e.detail.name + " - noVNC";,document.title = "'$APPLICATION_NAME'";,g' /opt/noVNC/app/ui.js


#=============#
# Here we go! #
#=============#
WORKDIR /root
ENTRYPOINT ["/usr/bin/supervisord", "--configuration" ,"supervisord.conf"]
