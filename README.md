# toybox-image

Multi arch container image with [toybox](https://landley.net/toybox/).

[Image on DockerHub](https://hub.docker.com/repository/docker/fwilhe2/toybox).

Running the container without arguments will provide a shell:

```
$ docker run -it --rm fwilhe2/toybox
# ls --help
Toybox 0.8.7 multicall binary (see toybox --help)

usage: ls [-ACFHLRSZacdfhiklmnpqrstuwx1] [--color[=auto]] [FILE...]
```