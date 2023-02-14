FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
RUN cd pico-sdk
RUN git submodule update --init

RUN export PICO_SDK_PATH="$(pwd)"
RUN cd ..

RUN mkdir pioasm_build
RUN cd pioasm_build
RUN cmake $PICO_SDK_PATH/tools/pioasm
RUN make
RUN cd ..
