FROM ubuntu:latest

RUN apt update
RUN apt install -y git make cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential

COPY build.sh "$WORKDIR/build_pioasm"
RUN "$WORKDIR/build_pioasm/build.sh"
ENV PIOASM_DIR="$WORKDIR/build_pioasm/pioasm"
