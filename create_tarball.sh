#!/usr/bin/env bash
set -e

# Variables
BRANCH_OR_TAG="2.0.17"

# Computed Parameters
CURRENT_PATH=$(pwd -P)

# Building and creating a tarball
echo -e "\n* Building and creating a tarball ... \n"
rm -f $CURRENT_PATH/harviewer.tar.gz
docker run -e BRANCH_OR_TAG=$BRANCH_OR_TAG -v $PWD:/src mrorgues/har_viewer_builder
echo -e "\n* Tarball Created! \n"
