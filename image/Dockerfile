FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN /bin/bash -c 'git clone https://github.com/raspberrypi/pico-sdk.git --branch master && \
cd pico-sdk && \
export PICO_SDK_PATH="$(pwd)" && \
git submodule update --init && \
cd .. && \
mkdir pioasm_build && \
cd pioasm_build && \
cmake "$PICO_SDK_PATH/tools/pioasm" && \
make && \
export PIOASM_PATH="$(pwd)" && \
cd ..'
