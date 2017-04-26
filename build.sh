#!/bin/bash

scripts/refresh_git.sh
if [ -f /opt/rt-n56u/toolchain-mipsel/toolchain-3.4.x/bin/mipsel-linux-uclibc-cpp ] ; then
        echo "-- toolchain already built --"
else
        scripts/build_toolchain.sh
fi


KERNEL_DIR=/opt/rt-n56u/trunk/linux-3.4.x
echo ------- kernel config /kernel.config -------------------
cp /kernel.config  $KERNEL_DIR/.config

cd /
scripts/build_firmware.sh

