FROM scratch
MAINTAINER Remon Lam [remon@containerstack.io]

ENV ALPINE_ARCH armhf
ENV ALPINE_VERSION 3.5.1

ADD alpine-minirootfs-${ALPINE_VERSION}-${ALPINE_ARCH}.tar.gz /
CMD ["/bin/sh"]
