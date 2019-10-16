#!/usr/bin/env bash

# echo "Installing Modules"
# echo "starting dir $PWD"
STARTING_DIR=$PWD

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# echo "script dir $SCRIPT_DIR"

cd $SCRIPT_DIR
cd ../
git submodule sync >/dev/null 2>&1
git submodule update --init --recursive >/dev/null 2>&1

# cd scripts

# echo "Installing static server"
# cd ../modules/static-server
# # echo $PWD
# npm install

# echo "Installing pm2-ui"
# cd ../pm2-ui
# # echo $PWD
# npm install

# echo "Installing cloud client"
# cd ../cloud-client
# # echo $PWD
# npm install

# echo $PWD
cd $STARTING_DIR
echo "Modules installed..."
