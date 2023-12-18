FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install curl git krb5-user ansible -y

USER runner
