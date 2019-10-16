#!/bin/bash

STARTING_DIR=$PWD
# echo "$STARTING_DIR"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR
cd ../modules
echo "Configuring and Starting Modules"
if [ ! -f ".configured" ]; then
    touch .configured
fi

for D in *; do
    if [ -d "${D}" ]; then
        echo "Configuring ${D}"
        # if [ grep -Fxq "${D}" .configured ]; then
        if grep -Fxq "${D}" .configured
        then
            echo "${D} already configured"
        else
            if [ -f "${D}/package.json" ]; then
                echo "$D"
                echo "$D" >> .configured
                pm2 delete $D >/dev/null 2>&1
                # echo "$D"
                cd "${D}"
                npm install
                pm2 start -n "${D}" npm -- start >/dev/null 2>&1
                sleep 1
                echo "${D} configured"
                cd ..
            fi
        fi
    fi
done

pm2 startup > tmp
sleep 1
echo "---------------------"
echo "Now installing modules at startup(password may be required)"
echo "$(tail -n +3 tmp)"
eval "$(tail -n +3 tmp)" >/dev/null 2>&1
sleep 2
pm2 save -f >/dev/null 2>&1
sleep 2
pm2 restart all >/dev/null 2>&1
sleep 1
pm2 list
rm tmp
cd $STARTING_DIR

lanip="$(hostname --ip-address)"
cat << EOF
Modules started susessfully

UI locally at
   http://localhost:8081
UI over lan at
   http://${lanip}:8081

Static Server locally at
   http://localhost:8080
Static Server over lan at
   http://${lanip}:8080

EOF