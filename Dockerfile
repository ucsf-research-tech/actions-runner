FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt-get update
RUN apt-get install curl git zip unzip rsync jq  -y
RUN apt-get install ansible krb5-user libkrb5-dev python3-pip  -y
RUN pip3 install pykerberos==1.2.4

#RUN DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
RUN DOCKER_CONFIG=/usr/local/lib/docker
RUN mkdir -p $DOCKER_CONFIG/cli-plugins
RUN curl -SL https://github.com/docker/compose/releases/download/v2.24.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
RUN chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
RUN sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

USER runner
