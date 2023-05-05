#! /bin/bash

if [ ! -d node_modules ]; then
    npm install
fi

haxe -D test build.hxml