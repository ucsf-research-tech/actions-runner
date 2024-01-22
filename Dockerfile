FROM ghcr.io/actions/actions-runner:latest

USER root

RUN for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
RUN apt-get update
RUN apt-get install ca-certificates curl gnupg
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN apt-get install curl git zip unzip rsync jq  -y
RUN apt-get install ansible krb5-user libkrb5-dev python3-pip  -y
RUN pip3 install pykerberos==1.2.4

USER runner
