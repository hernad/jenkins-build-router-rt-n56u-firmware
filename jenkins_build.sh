#!/bin/bash

VOLUME_BASE=$(pwd)

./build_docker_image.sh

sudo mkdir -p $VOLUME_BASE/rt-n56u

docker rm -f fwbuilder

vol_2=""

if [ -f $(pwd)/kernel.config ] ; then
  vol_2="-v $(pwd)/kernel.config:/kernel.config"
fi
   
docker run \
   --name fwbuilder \
   -v $VOLUME_BASE/rt-n56u:/opt/rt-n56u \
   $vol_2 \
   -t \
   fwbuilder  /
   /build_toolchain.sh

docker exec -t fwbuilder /build_firmware.sh

