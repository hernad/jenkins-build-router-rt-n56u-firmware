#!/bin/bash

echo ========= build-firmware =====================

TRUNK_DIR=/opt/rt-n56u/trunk
KERNEL_DIR=$TRUNK_DIR/linux-3.4.x

cd $KERNEL_DIR
make savedefconfig 
cp -av .config /opt/rt-n56u/kernel_default_config


cd $TRUNK_DIR

echo n56u_aria.config
cp configs/templates/n56u_aria.config .config

if [ -f kernel.config ] ; then
  cp /kernel.config configs/boards/RT-N56U/kernel-3.4.x.config 
fi


#cp build_firmware my_build_firmware

#sed -e 's/make dep/echo dummy 1/' my_build_firmware -i
#sed -e 's/make/echo dummy 2/' my_build_firmware -i

#. ./my_build_firmware

func_enable_kernel_param "CONFIG_NET_IPIP"
#func_enable_kernel_param "CONFIG_NET_IPGRE_BROADCAST"
func_enable_kernel_param "CONFIG_NET_IPGRE"

./build_firmware
#make dep
#make

