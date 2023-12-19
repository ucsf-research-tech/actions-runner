FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt update
RUN apt install curl git unzip jq krb5-user ansible python3-winrm python3-kerberos -y

USER runner
