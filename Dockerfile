# Ikaros on Linux

#FROM ubuntu:14.04
FROM debian:wheezy

MAINTAINER Pooya Parsa <pooya@pi0.ir>


# Install dependencies
RUN \
 apt-get update && apt-get install -y \
 cmake \
 g++ \
 libjpeg-turbo8-dev \
 libgsl0-dev \
 libpng-dev \
 libblas-dev \
 curl \
 libavcodec-dev \
 libavformat-dev \
 libswscale-dev \
 tar \
 wget


# Download the Ikaros source
RUN \
 wget http://github.com/ikaros-project/ikaros/archive/master.tar.gz -O - | \
 tar -xzf - && \ 
 mv ikaros-master ikaros


# Build Ikaros
RUN \
 cd ikaros/Build && \
 cmake .. && \
 make && \
 ln -fvs /ikaros/Bin/ikaros /usr/local/bin && \
 ln -fvs /ikaros/Examples /Examples

# SlimDown Container
RUN \
 apt-get clean \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*

# Entry point
ENTRYPOINT [ "/ikaros/Bin/ikaros" ] 


# Expose default webserver port
EXPOSE 8000:8000

