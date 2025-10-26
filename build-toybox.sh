#!/bin/bash

cd /usr/local/src
git clone --depth=1 https://github.com/landley/toybox
cd toybox
export LDFLAGS=--static
make defconfig
echo CONFIG_SH=y >> .config
make toybox
