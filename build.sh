#!/bin/bash
#
# Compile extension. If need installing build-esential on Ubuntu.
# Usage:
#	./build.sh
#   ./build.sh install
#

if [ "`lsb_release -i -s`" = "Ubuntu" ];then
    dpkg -l build-essential > /dev/null || apt install -y build-essential
fi

export USE_PGXS=1
make

if [ -n "$1" ];then
    make $1
fi
