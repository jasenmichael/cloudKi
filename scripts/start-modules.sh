#!/bin/bash

STARTING_DIR=$PWD
# echo "$STARTING_DIR"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR
cd ../modules
echo "Configuring and starting Modules"
if [ ! -f ".configured" ]; then
    touch .configured
fi

for D in *; do
    if [ -d "${D}" ]; then
        # if [ grep -Fxq "${D}" .configured ]; then
        if grep -Fxq "${D}" .configured
        then
        #     echo "${D} configured"            
        # else
            echo "Configuring ${D}"
            if [ -f "${D}/package.json" ]; then
                echo "$D" >> .configured
                pm2 delete $D >/dev/null 2>&1
                # echo "$D"
                cd "${D}"
                npm install
                pm2 start -n "${D}" npm -- start >/dev/null 2>&1
                sleep 1
                cd ..
            fi
        fi
    fi
done

pm2 startup > tmp
sleep 1
echo "$(tail -n +3 tmp)"
eval "$(tail -n +3 tmp)" >/dev/null 2>&1
sleep 1
pm2 restart all
sleep 2
pm2 save
pm2 list
rm tmp
cd $STARTING_DIR
