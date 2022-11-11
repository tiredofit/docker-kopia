FROM docker.io/tiredofit/alpine:3.16
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV KOPIA_VERSION=v0.12.1 \
    KOPIA_REPO_URL=https://github.com/kopia/kopia \
    KOPIA_CHECK_FOR_UPDATES=FALSE \
    IMAGE_NAME=tiredofit/kopia \
    IMAGE_REPO_URL=https://github.com/tireofit/docker/kopia

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -g 51115 kopia && \
    adduser -S -D -G kopia -u 51115 -h /dev/null kopia && \
    apk update && \
    apk upgrade && \
    apk add -t .kopia-build-deps \
               go \
               git \
               make \
               && \
    \
    apk add -t .kopia-run-deps \
               fuse3 \
               rclone \
               && \
    \
    clone_git_repo "${KOPIA_REPO_URL}" "${KOPIA_VERSION}" && \
    make -j$(nproc) install && \
    cp /root/go/bin/kopia /usr/sbin && \
    #
    apk del .kopia-build-deps && \
    rm -rf /usr/src/* && \
    rm -rf /root/.cache && \
    rm -rf /root/.go && \
    rm -rf /root/go && \
    rm -rf /tmp/* /var/cache/apk/*

COPY install /