FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

RUN git clone https://github.com/raspberrypi/pico-sdk.git --branch master
