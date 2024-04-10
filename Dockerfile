FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt-get update
RUN apt-get install curl git zip unzip rsync jq  -y
RUN apt-get install ansible krb5-user libkrb5-dev python3-pip  -y
RUN pip3 install pykerberos==1.2.4
RUN pip3 install passlib

RUN mkdir -p /usr/local/lib/docker/cli-plugins
RUN curl -SL https://github.com/docker/compose/releases/download/v2.24.1/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
RUN chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

USER runner
