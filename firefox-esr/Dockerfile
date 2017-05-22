FROM alpine:3.5
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run firefox-esr in a container ***
#
# docker run --rm -it \
#   --net host \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v /etc/fonts:/etc/fonts \
#   -v /etc/machine-id:/etc/machine-id \
#   -v /usr/share/fonts:/usr/share/fonts \
#   -v $HOME/.mozilla:/root/.mozilla \
#   --ipc="host" \
#   --name firefox-esr \
#   mrorgues/firefox-esr


#=========#
# Firefox #
#=========#
RUN apk update && \
    apk upgrade && \
    apk add \
        ca-certificates \
        firefox-esr \
        libcanberra-gtk2 && \
    rm -rf /tmp/* /var/cache/apk/*


#=============#
# Here we go! #
#=============#
ENTRYPOINT [ "/usr/bin/firefox" ]
