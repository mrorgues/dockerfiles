FROM debian:stretch-slim
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run OpenSC2K in a container ***
#
# Please see: https://github.com/rage8885/OpenSC2K
#
# docker run --rm -it \
#   -p 3000:3000 \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --name opensc2k \
#   mrorgues/opensc2k


#==========#
# OpenSC2K #
#==========#
RUN apt-get update -y -qq && \
    buildDeps="apt-transport-https build-essential curl git gnupg python-pip python-setuptools" && \
    apt-get install -y -qq $buildDeps ca-certificates --no-install-recommends && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y -qq \
        libasound2 \
        libcanberra-gtk-module \
        libgconf-2-4 \
        libgtk2.0-0 \
        libnss3 \
        libx11-xcb1 \
        libxss1 \
        libxtst6 \
        nodejs \
        yarn \
        --no-install-recommends && \
    cd /root;git clone https://github.com/rage8885/OpenSC2K;cd OpenSC2K;yarn install


#=======================#
# Fix: Azerty keyboards #
#=======================#
ENV KEYBOARD_TYPE="AZERTY"
COPY config/change_controls_for_azerty_keyboards.sh /tmp/change_controls_for_azerty_keyboards.sh
RUN chmod +x /tmp/change_controls_for_azerty_keyboards.sh && \
    bash /tmp/change_controls_for_azerty_keyboards.sh && \
    rm /tmp/change_controls_for_azerty_keyboards.sh



#=============#
# Here we go! #
#=============#
WORKDIR /root/OpenSC2K
ENTRYPOINT ["/usr/bin/yarn", "start"]
