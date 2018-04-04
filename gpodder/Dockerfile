FROM debian:stretch-slim
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run gPodder in a container ***
#
# Please see: https://gpodder.github.io/
#
# docker run --rm -it \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --name gpodder \
#   mrorgues/gpodder


#=========#
# gPodder #
#=========#
RUN apt-get update -y -qq && \
    apt-get install -y -qq \
        ca-certificates \
        dbus-x11 \
        git \
        gir1.2-gtk-3.0 \
        libgtk-3-dev \
        python3-dbus \
        python3-gi \
        python3-gi-cairo \
        --no-install-recommends && \
    cd /usr/local/bin/; git clone https://github.com/gpodder/gpodder.git && \
    python3 /usr/local/bin/gpodder/tools/localdepends.py


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/usr/local/bin/gpodder/bin/gpodder"]
