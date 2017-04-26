#!/bin/bash

scripts/refresh_git.sh
if [ -f /opt/rt-n56u/toolchain-mipsel/toolchain-3.4.x/bin/mipsel-linux-uclibc-cpp ] ; then
        echo "-- toolchain already built --"
else
        scripts/build_toolchain.sh
fi


scripts/build_firmware.sh

