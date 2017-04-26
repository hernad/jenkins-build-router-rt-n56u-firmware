#!/bin/bash

cd /opt/rt-n56u/toolchain-mipsel
sudo ./clean_sources
sudo ./build_toolchain

cat /opt/rt-n56u/readme.eng.txt
