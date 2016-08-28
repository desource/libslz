#!/bin/sh
#
# Download and build libslz
set -euo pipefail

version=1.0.0
sha256=4696da81bc4ac5ec5bbc36a62c168bdca4d35f4fbe63da76b2d9cf54be857a45

build=${PWD}/libslz
out=${PWD}/libslz-build

mkdir -p ${build}

curl -OL https://github.com/haproxy/libslz/archive/v${version}.tar.gz
echo "${sha256}  v${version}.tar.gz" | sha256sum -c
tar -C ${build} --strip-components 1 -xf v${version}.tar.gz

cd ${build}
make
make install PREFIX=${out}
