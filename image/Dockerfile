FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

COPY build.sh "/opt/build_pioasm"
RUN "/opt/build_pioasm/build.sh"
ENV PIOASM_DIR="/opt/build_pioasm/pioasm"
