#!/bin/bash

# get pico sdk; don't need to init submodules
git clone https://github.com/raspberrypi/pico-sdk.git --branch master

mkdir temp
cd temp

# build and move move pioasm binary to root dir
cmake "../pico-sdk/tools/pioasm"
make
cp pioasm /

cd ..
