FROM gcr.io/spectro-images-public/release/spectro-registry:3.3.0 as server

FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/spectrocloud/tutorials"
LABEL org.opencontainers.image.description "An image containing all the Spectro Cloud tutorials and required tools."

ADD  terraform/ /terraform
ADD  static/defaults/htpasswd-basic /auth/htpasswd-basic

ARG SPECTRO_CLI_VERSION=3.3.0

ENV REGISTRY_LOG_LEVEL=info
ENV REGISTRY_AUTH=htpasswd
ENV REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm"
ENV REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd-basic

COPY --from=server /registry /usr/local/bin/
COPY --from=server /etc/spectro/config.yml /etc/spectro/config.yml


RUN adduser -H -u 1002 -D appuser appuser && \
    apk add --no-cache bash curl git terraform openssl jq bind-tools wget ca-certificates nano

RUN  wget https://software.spectrocloud.com/spectro-registry/v$SPECTRO_CLI_VERSION/cli/linux/spectro && \
        mv spectro /usr/local/bin/spectro && \
        chmod +x /usr/local/bin/spectro && \
        wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
        tar -xvzf ngrok-v3-stable-linux-amd64.tgz && \
        mv ngrok /usr/local/bin/ngrok && \
        chmod +x /usr/local/bin/ngrok && \
        rm -rf ngrok-v3-stable-linux-amd64.tgz && \
        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
        chmod +x ./kubectl && \
        mv ./kubectl /usr/local/bin/kubectl



EXPOSE 5000 


CMD ["/bin/bash"]