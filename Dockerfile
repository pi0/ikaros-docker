# Ikaros on Linux

FROM ubuntu:14.04
MAINTAINER Pooya Parsa <pooya@pi0.ir>

# Get software list
RUN sudo apt-get update

# Install dependencies
RUN sudo apt-get install
 cmake \
 g++
 libjpeg-turbo8-dev \
 libgsl0-dev \
 libpng-dev \
 libblas-dev \
 curl \
 libavcodec-dev \
 libavformat-dev \
 libswscale-dev \
 build-essential \
 git


# Download the Ikaros source
RUN git clone http://github.com/ikaros-project/ikaros.git

# Build Ikaros
RUN cd ikaros/Build \
 cmake .. \
 make