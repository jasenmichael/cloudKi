#!/usr/bin/env bash

echo "installing"
sleep 1

#  check dependencies
checkdependencies() {
    echo "Node Version - node -v"
    node -v
    echo "NPM Version - npm -v"
    npm -v
    echo "PM2 Version - pm2 -v"
    pm2 -v
    echo "Git Version - git --version"
    git --version | tr -d 'git version '
}

#  get repository
getrepo() {
    echo "Gitting repo"
    # get repo
}

checkdependencies
echo "Dependencies met, doing next thing....."
getrepo
echo "installation complete"

# todo:
#   install wpa_supplicant
#      sh -c 'wpa_passphrase SSID passphrase >> /etc/wpa_supplicant/wpa_supplicant.conf' 
#   install node and npm
#   install pm2
#   install git
#   install openbox
#   install and config nginx
#   clone cloudKi repo
#   git sub-modules
#   npm install
#   enable sudoers setkioskurl.sh without password
#   set openbox env vars(KIOSK_URL)
#   config pm2
#     run init service
#     start pm2-ui
#     start cloudKiStatic
#     save for restart
#   create public dir, and symlink modules/static/public
#   build startup script, will set wifi, kiosk url