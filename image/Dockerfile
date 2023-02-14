FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
#RUN cd pico-sdk
RUN git submodule update --init pico-sdk

RUN export PICO_SDK_PATH="$(pwd)/pico-sdk"
#RUN cd ..

RUN mkdir pioasm_build
#RUN cd pioasm_build
RUN cmake pioasm_build/$PICO_SDK_PATH/tools/pioasm
RUN make pioasm_build
#RUN cd ..
