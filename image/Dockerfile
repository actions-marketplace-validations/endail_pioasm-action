FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
RUN export PICO_SDK_PATH="$(pwd)/pico-sdk"

RUN /bin/bash -c 'cd pico-sdk && \
git submodule update --init && \
cd .. && \
mkdir pioasm_build && \
cd pioasm_build && \
cmake $PICO_SDK_PATH/tools/pioasm && \
make && \
cd ..'