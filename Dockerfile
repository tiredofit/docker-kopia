ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.17"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG KOPIA_VERSION

ENV KOPIA_VERSION=${KOPIA_VERSION:-"v0.12.1"} \
    KOPIA_REPO_URL=https://github.com/kopia/kopia \
    KOPIA_CHECK_FOR_UPDATES=FALSE \
    IMAGE_NAME=tiredofit/kopia \
    IMAGE_REPO_URL=https://github.com/tireofit/docker-kopia

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -g 51115 kopia && \
    adduser -S -D -G kopia -u 51115 -h /dev/null kopia && \
    package update && \
    package upgrade && \
    package install .kopia-build-deps \
               go \
               git \
               make \
               && \
    \
    package install .kopia-run-deps \
               openssl \
               fuse3 \
               rclone \
               && \
    \
    clone_git_repo "${KOPIA_REPO_URL}" "${KOPIA_VERSION}" && \
    make -j$(nproc) install && \
    cp /root/go/bin/kopia /usr/sbin && \
    ln -s /usr/bin/fusermount3 /usr/sbin/fusemount && \
    package del .kopia-build-deps && \
    package cleanup && \
    rm -rf /root/.cache \
           /root/.go  \
           /root/go \
           /tmp/* \
           /usr/src/*

COPY install /
