#!/usr/bin/env bash
set -e

# Clone Project
echo -e "** Cloning HAR Viewer Project ...\n"
cd /tmp
git clone https://github.com/janodvarko/harviewer.git
cd harviewer
git checkout $BRANCH_OR_TAG
echo -e "** Done.\n"

# Build
echo -e "** Building ...\n"
ant build
echo -e "** Build complete.\n"

# Create Tarball
echo -e "** Creating a tarball ... \n"
cd webapp-build
tar -zcvf /src/harviewer.tar.gz .
echo -e "** Tarball created! \n"
