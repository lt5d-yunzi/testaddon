ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache curl bash

ENV MTX_VERSION=0.19.4
RUN curl -L -o /usr/bin/mediamtx \
  https://github.com/bluenviron/mediamtx/releases/download/v${MTX_VERSION}/mediamtx_linux_amd64 && \
  chmod +x /usr/bin/mediamtx

#COPY mediamtx.yml /etc/mediamtx/mediamtx.yml

WORKDIR /etc/mediamtx

CMD ["/usr/bin/mediamtx", "/etc/mediamtx/mediamtx.yml"]
