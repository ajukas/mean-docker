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
  apt-get install -y wget &&  \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs
RUN /usr/bin/npm install -g node-pre-gyp
RUN /usr/bin/npm install -g gulp

# Install app dependencies
RUN wget -P /tmp/phantomjs/ https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2
COPY /app/package.json ./
RUN npm install

VOLUME ["/app"]
CMD ["gulp", "serve"]
