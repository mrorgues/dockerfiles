FROM ubuntu:16.04
LABEL github "https://github.com/mrorgues"


#============================#
# Information & Requirements #
#============================#
# *** Create a tarball ***
#
# 1. chmod +x create_tarball.sh
# 2. ./create_tarball.sh.sh
#
# *** Related Projects ***
#
# 1. Original Project: https://github.com/janodvarko/harviewer
# 2. Viewer: https://github.com/mrorgues/dockerfiles/blob/master/har_viewer/Dockerfile


#============================#
# Install Build Dependencies #
#============================#
COPY build.sh /tmp
RUN \
  apt-get update -y -qq && \
  apt-get install -y -qq \
    ant \
    curl \
    git \
    tar \
    --no-install-recommends && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y -qq \
    nodejs \
    --no-install-recommends && \
  rm -rf /var/lib/apt/lists/* && \
  chmod +x /tmp/build.sh


#=======#
# Build #
#=======#
ENTRYPOINT [ "/tmp/build.sh" ]


#=======#
# Notes #
#=======#
# 1. Can't use debian:stretch-slim .
#    Indeed, we can't install openjdk-8-jre-headless.
#    Please see: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=851667
