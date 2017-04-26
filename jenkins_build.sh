#!/bin/bash

VOLUME_BASE=$(pwd)

./build_docker_image.sh

sudo mkdir -p $VOLUME_BASE/source

docker rm -f fwbuilder

vol_2=""

if [ -f $(pwd)/kernel.config ] ; then
  vol_2="-v $(pwd)/kernel.config:/kernel.config"
fi
   
docker run \
   -t \
   --name fwbuilder \
   -v $VOLUME_BASE/source:/opt/source \
   $vol_2 \
   fwbuilder /start.sh

docker exec -t fwbuilder  /build_toolchain.sh

docker exec -t fwbuilder /build_firmware.sh

