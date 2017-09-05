FROM ubuntu:16.04

RUN mkdir -p /opt/app

RUN apt-get update

RUN apt-get install -y nginx

ADD https://nodejs.org/download/release/v6.6.0/node-v6.6.0-linux-x64.tar.gz /opt/

RUN tar -xzvf /opt/node-v6.6.0-linux-x64.tar.gz -C /opt/

RUN chmod -R 755 /opt/node-v6.6.0-linux-x64

RUN ln -s /opt/node-v6.6.0-linux-x64/bin/node /usr/bin/node

RUN ln -s /opt/node-v6.6.0-linux-x64/bin/npm /usr/bin/npm

RUN apt-get update

RUN apt-get install -y python

RUN apt-get install -y pkg-config make g++

WORKDIR /opt/app

ADD . /opt/app

RUN apt-get update

RUN apt-get install -y git

RUN npm install

EXPOSE 3001 5432 3000 80

CMD ["npm","start"]
