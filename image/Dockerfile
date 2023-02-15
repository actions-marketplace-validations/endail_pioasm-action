FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

COPY build.sh build_pioasm/
RUN /bin/bash -c "$WORKDIR/build_pioasm/build.sh"
ENV PIOASM_PATH="$WORKDIR/build_pioasm/pioasm"
