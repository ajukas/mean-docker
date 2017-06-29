FROM ubuntu:16.04

MAINTAINER Ajukas

WORKDIR /app

# Install Node.
ADD setup_6.x /tmp/setup_6.x
RUN bash /tmp/setup_6.x

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN /usr/bin/npm install -g node-pre-gyp
RUN /usr/bin/npm install -g gulp

VOLUME ["/app"]
CMD ["gulp", "serve"]
