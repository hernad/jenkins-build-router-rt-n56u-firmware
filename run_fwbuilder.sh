#!/bin/bash

#sudo zfs create green/fwbuilder -o mountpoint=/data/fwbuilder

VOLUME_BASE=/data/fwbuilder

sudo mkdir -p $VOLUME_BASE/rt-n56u

docker rm -f fwbuilder

vol_2=""

if [ -f $(pwd)/kernel.config ] ; then
  vol_2="-v $(pwd)/kernel.config:/kernel.config"
fi
   
docker run \
   --name fwbuilder \
   -v $VOLUME_BASE/rt-n56u:/opt/rt-n56u $vol_2 \
   -it \
   fwbuilder  /bin/bash

