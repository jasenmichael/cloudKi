#!/usr/bin/env bash

# exit if no url passed
if [ -z "$1" ]
then
    echo "No URL supplied"
    echo "Example"
    echo "$0 https://cloudKi.io"
    exit 1
fi

if [[ $1 != http?(s)://* ]]; then
    echo "Invalid URL"
    exit 1
fi

openboxenv=/etc/xdg/openbox/environment

if grep -Fxq "export KIOSK_URL=$1" $openboxenv
then
    # same var do nothing
    echo "KIOSK_URL same, exiting"
    exit 1
else
    echo "setting kiosk boot url to - $1"
    # if var found but diff
    if grep -q "export KIOSK_URL=" "$openboxenv";
    then
        # echo "KIOSK_URL exist"
        sed -i "/KIOSK_URL/c\export KIOSK_URL=$1" $openboxenv
        sleep 1
        if [ $2 == "-r" ]
        then
            echo "Rebooting..."
            reboot
        fi
    else
        # echo "KIOSK_URL not exist"
        echo "export KIOSK_URL=$1" >> $openboxenv
    fi
fi

# pm2 start -n static:8080 npm -- start
# sudo cloudKiPi/scripts/setkioskurl.sh "http://localhost:8080"
# tmpdir=$PWD && cd ~/cloudKiPi/apps/express-static/  && pm2 start -n static-8080 npm -- start && cd $tmpdir
# sudo ~/cloudKiPi/scripts/setkioskurl.sh "http://localhost"
