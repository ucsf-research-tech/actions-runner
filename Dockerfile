FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install curl git unzip jq  -y
RUN apt install krb5-user libkrb5-dev python3-pip  -y
RUN pip3 install --include-deps ansible

USER runner
