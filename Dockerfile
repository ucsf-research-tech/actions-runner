FROM ghcr.io/actions/actions-runner:2.311.0

USER root

RUN apt update
RUN apt install -y git

USER runner
