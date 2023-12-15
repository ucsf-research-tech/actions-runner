FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install -y git

USER runner
