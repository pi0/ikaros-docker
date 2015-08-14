# Ikaros on Linux

FROM ubuntu:14.04

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
 wget https://github.com/ikaros-project/ikaros/archive/master.tar.gz && \
 tar -xzf master.tar.gz && \
 mv ikaros-master ikaros

# Build Ikaros
RUN \
 cd ikaros/Build && \
 cmake .. && \
 make && \
 ln -fvs /ikaros/Bin/ikaros /usr/local/bin && \
 ln -fvs /ikaros/Examples /Examples

# Entry point
ENTRYPOINT [ "/ikaros/Bin/ikaros" ] 

# Expose default webserver port
EXPOSE 8000:8000