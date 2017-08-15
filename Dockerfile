FROM ubuntu
MAINTAINER Laurens Stötzel <l.stoetzel@meeva.de>

RUN apt-get update -qqy && \
    apt-get install --no-install-recommends -qqy lsb-release && \
    \
    # Install OptiPNG
    echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list && \
    apt-get update -qqy && \
    apt-get install -qqy --no-install-recommends optipng && \
    \
    # cleanup
    apt-get remove -qqy lsb-release && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /source
WORKDIR /source

ENTRYPOINT [ "/usr/bin/optipng" ]
CMD [ "-quiet", "-o7", "*.png" ]
