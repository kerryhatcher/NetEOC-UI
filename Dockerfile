# Node.js app Docker file

FROM ubuntu:16.04


RUN apt-get update

#RUN curl -sL -o nodeinstall.sh https://deb.nodesource.com/setup_6.x && chmod +x nodeintall.sh && ./nodeinstall.sh



RUN mkdir -p /opt/neteoc-ui
RUN mkdir -p /opt/neteoc-server
WORKDIR /opt/neteoc-ui

COPY ./scripts/nodesetup.sh /opt/neteoc-ui
RUN ./nodesetup.sh && apt-get install -y nodejs

COPY ./package.json /opt/neteoc-ui
RUN npm install && npm install -g webpack

COPY . /opt/neteoc-ui
RUN webpack




