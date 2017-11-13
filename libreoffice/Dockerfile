FROM ubuntu:xenial
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Run Libre Office desktop app in a container ***
#
# docker run --rm -it \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   --device /dev/dri \
#   --device /dev/snd \
#   -v /dev/shm:/dev/shm \
#   -v $HOME/Documents:/root/Documents \
#   -v /path/additional/fonts:/root/.fonts \
#   --name libreoffice \
#   mrorgues/libreoffice 
# 
# This image is quite huge. It includes a lot of fonts.


#==============#
# Libre Office #
#==============#
ENV LANGUAGE=fr
COPY fonts /usr/share/fonts
RUN echo 'deb http://ppa.launchpad.net/libreoffice/libreoffice-5-4/ubuntu xenial main' >> /etc/apt/sources.list.d/libreoffice-ubuntu-libreoffice-5-4-xenial.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 83FBA1751378B444 && \
    apt-get update && \
    apt-get install -qqy \
        libcanberra-gtk-module \
        libreoffice \
        libreoffice-l10n-${LANGUAGE} \
        myspell-${LANGUAGE} \
        mythes-${LANGUAGE} \
        openclipart-libreoffice && \
    rm -rf /var/lib/apt/lists/*


#=============#
# Here we go! #
#=============#
ENTRYPOINT ["/usr/bin/libreoffice"]
CMD ["--writer"]
