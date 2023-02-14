FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
ADD pioasm_build /pioasm_build
ENV PIOASM_PATH=/pioasm_build
