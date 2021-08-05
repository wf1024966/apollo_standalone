#!/usr/bin/env bash
cd /tmp && rm -rf tinyxml2
git clone https://github.com.cnpmjs.org/leethomason/tinyxml2.git
cd tinyxml2 && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
make -j$(nproc)
  make install
  mkdir -p /usr/local/include/tinyxml2
  cp /usr/local/include/tinyxml2.h /usr/local/include/tinyxml2
