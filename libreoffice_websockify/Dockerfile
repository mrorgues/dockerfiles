FROM mrorgues/libreoffice
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run Libre Office desktop app in a container ***
# Access: http://localhost:6080
#
# docker run --rm -d \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v $HOME/Documents:/root/Documents \
#   -v /path/additional/fonts:/root/.fonts \
#   -e "SCREEN_WIDTH=1920" \
#   -e "SCREEN_HEIGHT=1080" \
#   -e "SCREEN_DEPTH=24" \
#   --name libreoffice_websockify \
#   mrorgues/libreoffice_websockify
# 
# This image is quite huge. It includes a lot of fonts.


#==============#
# Libre Office #
#==============#
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
    APPLICATION_NAME=LibreOffice
RUN apt-get update && \
    apt-get install -qqy --no-install-recommends \
        net-tools \
        python-numpy \
        ratpoison \
        supervisor \
        x11vnc \
        xvfb \
        wget && \
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
