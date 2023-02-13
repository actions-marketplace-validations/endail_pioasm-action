#!/bin/bash

git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
git submodule update --init

export PICO_SDK_PATH="$(pwd)"
cd ..

sudo apt update
sudo apt install -y cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

mkdir pioasm_build
cd pioasm_build
cmake $PICO_SDK_PATH/tools/pioasm
make

./pioasm -o "$1" "$2" >> temp
echo "out=$(cat temp)" >> $GITHUB_OUTPUT
