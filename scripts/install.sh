#!/bin/bash

STARTING_DIR=$PWD

#  check path passed else set default cloudKi
if [ -z "$1" ]; then
  DIR=cloudKi
else
  DIR=$1  
fi

# check if scripts and modules directory exist
if [ -d "cloudKi" ]; then
    cd cloudKi
fi

if [ -d "scripts" ] && [ -d "apps" ]; then
    echo >/dev/null 2>&1
else
    git clone git@github.com:jasenmichael/cloudKi-iot-rp4.git cloudKi
    cd $DIR
fi
./scripts/install-dependencies.sh
./scripts/install-modules.sh
./scripts/start-modules.sh
echo "---------------------"
echo "Installation complete"
cd $STARTING_DIR