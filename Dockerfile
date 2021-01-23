FROM ubuntu:16.04

LABEL maintainer="i0z0mu@gmail.com"

RUN apt-get update && apt-get install -y \
    wget \
    perl \
    gawk \
    build-essential \
    texinfo \
    xz-utils \
    lbzip2 \
    build-essential \
    libncurses5-dev \
    qemu-user-static

CMD chmod +x config.sh prepare.sh build.sh
CMD ./prepare.sh
CMD ./build.sh
CMD rm -r ~/archives ~/build
