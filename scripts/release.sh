#!/usr/bin/env bash

rm -rf ${PWD##*/} > /dev/null
tar --exclude=node_modules --exclude=*.tar --exclude=*node_modules --exclude=node_modules  -cf ${PWD##*/}.tar . > /dev/null
echo "compressed repository to ${PWD##*/}.tar"