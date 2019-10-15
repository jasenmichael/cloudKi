#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR

STARTING_DIR=$PWD
cd $SCRIPT_DIR

echo "installing static server"
cd ../modules/static-server
# echo $PWD
npm install

echo "installing pm2-ui"
cd ../pm2-ui
# echo $PWD
npm install

echo "installing cloud client"
cd ../cloud-client
# echo $PWD
npm install

# echo $PWD
cd $STARTING_DIR