FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install curl git zip unzip jq  -y
RUN apt install ansible krb5-user libkrb5-dev python3-pip  -y
RUN pip3 install pykerberos==1.2.4

USER runner
