# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

ARG PALETTE_VERSION

FROM gcr.io/spectro-images-public/release/spectro-registry:${PALETTE_VERSION} as server

FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/spectrocloud/tutorials"
LABEL org.opencontainers.image.description "An image containing all the Spectro Cloud tutorials and required tools."

ADD  terraform/ /terraform
ADD  packs/ /packs
ADD  edge/ /edge
ADD  static/defaults/htpasswd-basic /auth/htpasswd-basic
ADD  static/defaults/ngrok.yml /auth/ngrok.yml
ADD  static/defaults/registry-config.yml etc/spectro/config.yml


ARG PALETTE_CLI_VERSION
ARG PALETTE_EDGE_VERSION
ARG PACKER_VERSION
ARG ORAS_VERSION
ARG TERRAFORM_VERSION

ENV REGISTRY_LOG_LEVEL=info
ENV REGISTRY_AUTH=htpasswd
ENV REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm"
ENV REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd-basic

COPY --from=server /registry /usr/local/bin/
COPY --from=server /etc/spectro/config.yml /etc/spectro/config.yml

RUN adduser -H -u 1002 -D appuser appuser && \
    apk update && \
    apk add --no-cache bash curl git openssl jq bind-tools wget ca-certificates nano aws-cli xorriso govc podman

RUN  wget https://software.spectrocloud.com/spectro-registry/cli/v$PALETTE_CLI_VERSION/linux/spectro && \
        mv spectro /usr/local/bin/spectro && \
        chmod +x /usr/local/bin/spectro && \
        wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
        tar -xvzf ngrok-v3-stable-linux-amd64.tgz && \
        mv ngrok /usr/local/bin/ngrok && \
        chmod +x /usr/local/bin/ngrok && \
        rm -rf ngrok-v3-stable-linux-amd64.tgz && \
        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
        chmod +x ./kubectl && \
        mv ./kubectl /usr/local/bin/kubectl && \
        mkdir -p ~/.config/ngrok && \ 
        cp /auth/ngrok.yml ~/.config/ngrok/ngrok.yml  && \
        wget https://software.spectrocloud.com/palette-cli/v$PALETTE_CLI_VERSION/linux/cli/palette && \
        mv palette /usr/local/bin/palette && \
        chmod +x /usr/local/bin/palette && \
        wget https://software.spectrocloud.com/stylus/v$PALETTE_EDGE_VERSION/cli/linux/palette-edge && \
        mv palette-edge /usr/local/bin/palette-edge && \
        chmod +x /usr/local/bin/palette-edge && \
        wget https://github.com/oras-project/oras/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz && \
        mkdir -p oras-install/ && \
        tar -zxf oras_${ORAS_VERSION}_*.tar.gz -C oras-install/ && \
        mv oras-install/oras /usr/local/bin/ && \
        rm -rf oras_${ORAS_VERSION}_*.tar.gz oras-install/ && \
        git clone https://github.com/spectrocloud/CanvOS.git && \
        rm -rf /var/cache/apk/* && \
        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
        rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip /usr/local/sbin/
RUN unzip /usr/local/sbin/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/sbin && \
    rm -rf /usr/local/sbin/packer_${PACKER_VERSION}_linux_amd64.zip
EXPOSE 5000

CMD ["/bin/bash"]