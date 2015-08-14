# Ikaros on Linux

FROM ubuntu:14.04

MAINTAINER Pooya Parsa <pooya@pi0.ir>

# Get software list
RUN sudo apt-get update

# Install dependencies
RUN sudo apt-get install -y \
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
 build-essential \
 git

# Disable strict host checking for git clone
# RUN mkdir -p ~/.ssh && echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
 
# Download the Ikaros source
RUN git clone http://github.com/ikaros-project/ikaros.git

# Build Ikaros
RUN cd ikaros/Build && \
 cmake .. && \
 make && \
 ln -fvs /ikaros/Bin/ikaros /usr/local/bin && \
 ln -fvs /ikaros/Examples /Examples

# Entry point
ENTRYPOINT [ "/ikaros/Bin/ikaros" ] 

# Expose default webserver port
EXPOSE 8000:8000