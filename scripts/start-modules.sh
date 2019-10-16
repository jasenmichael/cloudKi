#!/bin/bash

STARTING_DIR=$PWD
# echo "$STARTING_DIR"
cd ../modules
if [ ! -f ".configured" ]; then
    touch .configured
fi

for D in *; do
    if [ -d "${D}" ]; then
        if [ grep -Fxq "${D}" .configured ]; then
            echo "Configuring ${D}"
            if [ -f "${D}/package.json" ]; then
                echo "$D" > .configured
                cd "${D}"
                npm install
                pm2 start -n "${D}" npm -- start
                cd ..
            fi
        fi
    fi
done
pm2 startup > tmp
echo "$(tail -n +3 tmp)"
eval "$(tail -n +3 tmp)" >/dev/null 2>&1
pm2 save
rm tmp

cd $STARTING_DIR
