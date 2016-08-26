# Node.js app Docker file

FROM ubuntu:16.04


RUN apt-get update && apt-get install libpng12-0 nodejs nodejs-legacy npm -y

RUN mkdir -p /opt/neteoc-ui
RUN mkdir -p /opt/neteoc-server
WORKDIR /opt/neteoc-ui


COPY ./package.json /opt/neteoc-ui
RUN npm install && npm install -g webpack

COPY . /opt/neteoc-ui
RUN webpack




