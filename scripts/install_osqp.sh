#!/usr/bin/env bash
set -e  # exit on first error
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UBUNTU_CODENAME=$(lsb_release -sc)

cd /tmp && rm -rf osqp && git clone --recursive --depth 1 --branch v0.4.1 https://github.com.cnpmjs.org/oxfordcontrol/osqp
cd osqp && mkdir -p build && cd build && cmake ..
make -j$(nproc)
  make install
  mkdir -p /usr/local/include/osqp/include
cd /usr/local/include/osqp &&   cp *.h include/
