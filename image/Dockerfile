FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master

#RUN mkdir pioasm_build
#RUN cd pioasm_build
#RUN cmake ..pico-sdk/tools/pioasm
#RUN make

RUN --mount=type=bind,target=/pioasm_build,source=pioasm_build \
    mkdir pioasm_build && cd pioasm_build && cmake ../pico-sdk/tools/pioasm && make
