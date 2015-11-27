FROM ubuntu
MAINTAINER Laurens Stötzel <l.stoetzel@meeva.de>

# Install OptiPNG
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y optipng

RUN mkdir -p /source
WORKDIR /source

ENTRYPOINT [ "/usr/bin/optipng" ]
CMD [ "-quiet", "-o7", "*.png" ]
