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