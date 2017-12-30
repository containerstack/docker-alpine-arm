FROM scratch
MAINTAINER Remon Lam [remon@containerstack.io]

ENV ALPINE_ARCH armhf
ENV ALPINE_VERSION 3.7.0

ADD alpine-minirootfs-${ALPINE_VERSION}-${ALPINE_ARCH}.tar.gz /
CMD ["/bin/sh"]
