FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install git krb5-user ansible -y

USER runner
