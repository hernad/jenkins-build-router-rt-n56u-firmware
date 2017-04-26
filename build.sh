#!/bin/bash

scripts/refresh_git.sh
if [ -f /opt/rt-n56u/toolchain-mipsel/toolchain-3.4.x/bin/mipsel-linux-uclibc-cpp ] ; then
        echo "-- toolchain already built --"
else
        scripts/build_toolchain.sh
fi


KERNEL_DIR=/opt/rt-n56u/trunk/linux-3.4.x
echo ------- kernel config /kernel.config -------------------

cd $KERNEL_DIR
make distclean
make savedefconfig 
cp -av .config /opt/rt-n56u/kernel_default_config

#/opt/rt-n56u/trunk/linux-3.4.x/scripts/kconfig/Makefile:33: recipe for target 'silentoldconfig' failed
#make[3]: *** [silentoldconfig] Error 1
#/opt/rt-n56u/trunk/linux-3.4.x/Makefile:489: recipe for target 'silentoldconfig' failed
#make[2]: *** [silentoldconfig] Error 2
#make[1]: *** No rule to make target 'include/config/auto.conf', needed by 'include/config/kernel.release'.  Stop.

#touch include/config/auto.conf

cp /kernel.config  $KERNEL_DIR/.config
make oldconfig

cd /
scripts/build_firmware.sh
