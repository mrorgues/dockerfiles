#!/usr/bin/env bash
set -e

# Variables
DOCKERFILE="Dockerfile"
DOCKER_REPO="mrorgues"
DOCKER_IMAGE="libreoffice"

# Computed Parameters
CURRENT_PATH=$(pwd -P)
echo -e "* Computing parameters ... \n"
FINAL_IMAGE=$DOCKER_REPO"/"$DOCKER_IMAGE
echo -e "FINAL_IMAGE: $FINAL_IMAGE\n"

# Docker: Building and pushing base image
echo -e "\n* Building docker main image ... It may take a while ...\n"
docker build -f $DOCKERFILE -t $FINAL_IMAGE .
echo -e "* Pushing docker main image ... It may take ages (or more) ...\n"
docker push $FINAL_IMAGE
echo -e "\n* The image $FINAL_IMAGE has been built successfully!\n"
