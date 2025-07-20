ARG BUILD_FROM=ghcr.io/hassio-addons/base:12.2.7
FROM ${BUILD_FROM}

ENV LANG C.UTF-8
ENV MTX_VERSION=1.13.0

WORKDIR /opt

# 下载并解压 ARM64 静态编译版本
RUN apk add --no-cache curl tar && \
    curl -L -o mediamtx.tar.gz https://github.com/bluenviron/mediamtx/releases/download/v${MTX_VERSION}/mediamtx_v${MTX_VERSION}_linux_arm64.tar.gz && \
    tar -xzf mediamtx.tar.gz && \
    mv mediamtx /usr/bin/mediamtx && \
    chmod +x /usr/bin/mediamtx && \
    rm -rf mediamtx.tar.gz

COPY run.sh /run.sh
COPY mediamtx.yml

RUN chmod +x /run.sh

CMD [ "/run.sh" ]
