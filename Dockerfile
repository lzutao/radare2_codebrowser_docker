# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

LABEL maintainer="lzutao https://github.com/lzutao/radare2_codebrowser_docker.git"

# Set the working directory to /root
WORKDIR /root

ENV LANG="C.UTF-8"

# Install packages for building ibus-unikey
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update -qq && apt-get install -qq \
    wget \
    llvm-4.0 \
 && wget -O woboq.deb https://download.opensuse.org/repositories/home:/pansenmann:/woboq/Debian_9.0/amd64/woboq-codebrowser_2.1_amd64.deb \
 && dpkg -i woboq.deb \
 && rm woboq.deb \
 && apt-get purge wget \
 && apt-get clean \
 && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /usr/share/man/?? /usr/share/man/??_* /usr/share/man/??.* \
 && find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} +

# Run command when the container launches
#CMD ["echo", "hello world!"]
