#!/bin/bash


cd /opt/rt-n56u/trunk

echo n56u_aria.config
cp configs/templates/n56u_aria.config .config

cp /kernel.config configs/boards/RT-N56U/kernel-3.4.x.config 

./build_firmware


