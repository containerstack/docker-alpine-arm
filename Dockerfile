FROM scratch
LABEL maintainer="Remon Lam [remon@containerstack.io]" architecture="ARM32v7/armhf"

ENV ALPINE_ARCH armhf
ENV ALPINE_VERSION 3.7.0

ADD alpine-minirootfs-${ALPINE_VERSION}-${ALPINE_ARCH}.tar.gz /
CMD ["/bin/sh"]
