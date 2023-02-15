#!/bin/bash

# get the pico sdk
git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
export PICO_SDK_PATH="$(pwd)"
cd ..

# build pioasm
mkdir pioasm_build
cd pioasm_build
cmake "$PICO_SDK_PATH/tools/pioasm"
make
cd ..

# if $2 is empty, set outpath to current dir of piofile
if [ ! -z $2 ]; then
    outpath="."
else
    outpath=$2
fi

for piofile in $1; do

    if [ ! -f "$piofile" ]; then
        echo "$piofile not found; skipping"
        continue
    fi

    pioasm_build/pioasm "$piofile" >> "$outpath/$piofile.h"

    echo "pioasm compiled file written to $outpath/$piofile.h"

done
