#!/bin/bash

scripts/refresh_git.sh
if [ -f /opt/rt-n56u/toolchain-mipsel/toolchain-3.4.x/bin/mipsel-linux-uclibc-cpp ] ; then
        echo "-- toolchain already built --"
else
        scripts/build_toolchain.sh
fi


cd /opt/rt-n56u/trunk/linux-3.4.x
make oldconfig

cd /
scripts/build_firmware.sh

