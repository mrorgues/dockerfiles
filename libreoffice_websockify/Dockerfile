FROM mrorgues:libreoffice
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run Libre Office desktop app in a container ***
# Access: http://localhost:6080
#
# docker run --rm -it \
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
COPY supervisord.conf /root/supervisord.conf
ENV DISPLAY=:0 \
    SCREEN=0 \
    SCREEN_WIDTH=1280 \
    SCREEN_HEIGHT=1024 \
    SCREEN_DEPTH=24 \
    LOCAL_PORT=5900 \
    TARGET_PORT=6080
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
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html


#=============#
# Here we go! #
#=============#
WORKDIR /root
ENTRYPOINT ["/usr/bin/supervisord", "--configuration" ,"supervisord.conf"]
