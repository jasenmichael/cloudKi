#!/bin/bash

without_sudo="true"
not_met=""
verify(){
    check=`command -v $1`
    if [ "$check" != '' ]; then
        $2
    else
        echo "$1 not installed"
        if [ "$not_met" = "" ]; then
            not_met="$1"
        else
            not_met="$not_met, $1"
            echo "$1"
        fi
        
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
    if [ "$not_met" != "" ]; then
        echo "Unmet dependencies - $not_met"
        echo "exiting"
        exit 1
    else
        echo "Dependencies met.."
    fi
    
}
checkDependencies
echo "installation complete"
