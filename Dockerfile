FROM scratch
MAINTAINER Remon Lam [remon@containerstack.io]

ENV ALPINE_VERSION 3.5.0

ADD alpine-minirootfs-${ALPINE_VERSION}-x86_64.tar.gz /
CMD ["/bin/sh"]
