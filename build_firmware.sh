#!/bin/bash


cd /opt/rt-n56u/trunk

echo n56u_aria.config
cp configs/templates/n56u_aria.config .config

if [ -f kernel.config ] ; then
  cp /kernel.config configs/boards/RT-N56U/kernel-3.4.x.config 
fi




cp build_firmware my_build_firmware

sed -e 's/make dep/echo dummy 1/' my_build_firmware -i
sed -e 's/make/echo dummy 2/' my_build_firmware -i

echo 
 

. ./my_build_firmware

func_enable_kernel_param "CONFIG_NET_IPIP"
#func_enable_kernel_param "CONFIG_NET_IPGRE_BROADCAST"
func_enable_kernel_param "CONFIG_NET_IPGRE"

make dep
make

