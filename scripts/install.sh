#!/bin/bash

sleep 1

#  check dependencies
without_sudo="true"
verify(){
    # echo "yo $1"
    # check=`echo "$1" | grep -E ^\-?[0-9]*\.?[0-9]+$`
    check=`command -v $1`
    if [ "$check" != '' ]; then
        $2
    else
        echo "$1 not installed"
        if [ "$1" = "pm2" ]; then
            echo "installing $1"
            if [ "$without_sudo" = "true" ]; then
                echo "installing without sudo"
                echo "npm install -g pm2"
                $without_sudo=false
                npm install -g pm2
                verify pm2 "pm2 -v"
            else
                echo "installing with sudo"
                echo "sudo npm install -g pm2"
                sudo npm install -g pm2
                verify pm2 "pm2 -v"
            fi
        fi
        exit 1
    fi
}

checkDependencies() {
    echo "Checking dependencies..."
    echo "Node Version"
    verify node "node -v"
    echo "NPM Version"
    verify npm "npm -v"
    echo "PM2 Version"
    verify pm2 "pm2 -v"
    echo "Git Version"
    verify git
    git --version | tr -d 'git version '
    echo "Dependencies met.."
}

installModules(){
    echo "Installing Modules"
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    $SCRIPT_DIR/install-modules.sh
    echo "Dependencies met"
}

checkDependencies
installModules
echo "installation complete"
