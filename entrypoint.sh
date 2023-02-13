#!/bin/bash

apt update
apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
git submodule update --init

export PICO_SDK_PATH="$(pwd)"
cd ..

mkdir pioasm_build
cd pioasm_build
cmake $PICO_SDK_PATH/tools/pioasm
make

cd ..

pioasm_build/pioasm -o "$1" "$2" >> out.pio.h
echo "out=$(<out.pio.h)" >> $GITHUB_OUTPUT
