#!/bin/bash

# get pico sdk; don't need submodules
git clone https://github.com/raspberrypi/pico-sdk.git --branch master

mkdir temp
cd temp
cmake "../pico-sdk/tools/pioasm"
make
cd ..
