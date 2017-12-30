# docker-alpine

A super small Docker image based on [Alpine Linux][alpine]. The image is only 5 MB and has access to a package repository that is much more complete than other BusyBox based images.

## Why?

Docker images today are big. Usually much larger than they need to be. There are a lot of ways to make them smaller, but the Docker populace still jumps to the `ubuntu` base image for most projects. The size savings over `ubuntu` and other bases are huge:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
containerstack/alpine   latest              e6efe7544e54        18 minutes ago      3.97MB
debian                  latest              a25c1eed1c6f        3 days ago          123MB
centos                  latest              3bee3060bfc8        5 days ago          193MB
ubuntu                  latest              7b9b13f7b9c0        8 days ago          118MB
fedora                  latest              15895ef0b3b2        7 weeks ago         231MB
```

There are images such as `progrium/busybox` which get us very close to a minimal container and package system. But these particular BusyBox builds piggyback on the OpenWRT package index which is often lacking and not tailored towards generic everyday applications. Alpine Linux has a much more complete and up to date [package index][alpine-packages]:

## Usage

Stop doing this:

```dockerfile
FROM ubuntu-debootstrap:14.04
RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qy mysql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt
ENTRYPOINT ["mysql"]
```
This took 19 seconds to build and yields a 164 MB image. Eww. Start doing this:

```dockerfile
FROM containerstack/alpine:3.7.0
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]
```

Only 3 seconds to build and results in a 36 MB image! Hooray!

## Other helpfull stuf
Links to usefull websites <br>
[alpine]: http://alpinelinux.org/ <br>
[alpine-packages]: http://pkgs.alpinelinux.org/ <br>
[alpine-about]: https://www.alpinelinux.org/about/ <br>
[issues]: https://github.com/containerstack/docker-alpine/issues <br>
[hub]: https://hub.docker.com/r/containerstack/alpine/
