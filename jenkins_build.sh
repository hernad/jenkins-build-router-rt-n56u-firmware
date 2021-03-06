#!/bin/bash

VOLUME_BASE=$(pwd)

./build_docker_image.sh

sudo mkdir -p $VOLUME_BASE/rt-n56u

docker rm -f fwbuilder-1

vol_2=""

if [ -f $(pwd)/kernel.config ] ; then
  vol_2="-v $(pwd)/kernel.config:/kernel.config"
fi
   
docker run \
   --rm \
   --name fwbuilder-1 \
   -v $VOLUME_BASE/rt-n56u:/opt/rt-n56u \
   -v $(pwd)/build.sh:/build.sh \
   -v $(pwd)/scripts:/scripts \
   $vol_2 \
   fwbuilder /build.sh


cp -av rt-n56u/trunk/images/RT-N56U_3.4*.trx RT-N56U_3.4_$(date +"%Y-%m-%d").trx

