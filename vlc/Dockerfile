FROM alpine:3.5
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run vlc in a container ***
#
# docker run --rm -it \
#   -v $HOME:/home/vlc/Documents:rw \
#   -v $HOME/.config/vlc:/home/vlc/.config/vlc:rw \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/snd \
#   --device /dev/dri \
#   -v /dev/shm:/dev/shm \
#   -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
#   -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
#   --group-add $(getent group audio | cut -d: -f3) \
#   --group-add $(getent group video | cut -d: -f3) \
#   --name vlc \
#  mrorgues/vlc


#==============#
# Basics & VLC #
#==============#
RUN apk update && \
    apk upgrade && \
    apk add dbus \
            dbus-libs \
            dbus-x11 \
            libxcb \
            libxv \
            mesa-dricore \
            mesa-dri-ati \
            mesa-dri-intel \
            mesa-dri-nouveau \
            mesa-dri-swrast \
            mesa-dri-vmwgfx \
            ttf-freefont \
            vlc \
            vlc-qt \
            xkeyboard-config && \
    dbus-uuidgen --ensure=/etc/machine-id && \
    ln -sf /etc/machine-id /var/lib/dbus/machine-id && \
    rm -rf /tmp/* /var/cache/apk/*


#=====================#
# VLC: Dedicated User #
#=====================#
ENV HOME /home/vlc
RUN adduser -h $HOME -D vlc && \
    addgroup vlc audio && \
    addgroup vlc video && \
    chown -R vlc:vlc $HOME
WORKDIR $HOME
USER vlc


#=============#
# Here we go! #
#=============#
ENTRYPOINT [ "/usr/bin/vlc" ]
