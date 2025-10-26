FROM debian:sid as compile

RUN apt-get update && apt-get -y install git autoconf automake autopoint autotools-dev binutils binutils-common binutils-x86-64-linux-gnu bsdextrautils build-essential bzip2 cpp cpp-13 cpp-13-x86-64-linux-gnu cpp-x86-64-linux-gnu debhelper debugedit dh-autoreconf dh-strip-nondeterminism dpkg-dev dwz file g++ g++-13 g++-13-x86-64-linux-gnu g++-x86-64-linux-gnu gcc gcc-13 gcc-13-base gcc-13-x86-64-linux-gnu gcc-x86-64-linux-gnu gettext gettext-base groff-base intltool-debian m4 make man-db patch perl po-debconf rpcsvc-proto xz-utils zip
COPY build-toybox.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/build-toybox.sh
RUN /usr/local/bin/build-toybox.sh

FROM python:3 AS rootfs

WORKDIR /usr/src/app

COPY build-rootfs.py .
COPY --from=compile /usr/local/src/toybox/toybox /toybox

RUN python build-rootfs.py

FROM scratch

COPY --from=rootfs /usr/src/app/rootfs/ /
COPY etc /etc

ENTRYPOINT [ "/bin/toybox", "sh" ]