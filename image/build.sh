#!/bin/bash

# get pico sdk; don't need submodules
git clone https://github.com/raspberrypi/pico-sdk.git --branch master

mkdir pioasm
cd pioasm
cmake "../pico-sdk/tools/pioasm"
make
cd ..
