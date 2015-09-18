#!/bin/bash


cd /opt/rt-n56u/trunk

echo n56u_aria.config
cp configs/templates/n56u_aria.config .config
./build_firmware


