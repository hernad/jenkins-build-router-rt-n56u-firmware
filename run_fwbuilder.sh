#!/bin/bash

#sudo zfs create green/fwbuilder -o mountpoint=/data/fwbuilder

VOLUME_BASE=/data/fwbuilder

sudo mkdir -p $VOLUME_BASE/git

docker rm -f fwbuilder

docker run \
   --name fwbuilder \
   -v $VOLUME_BASE/git:/opt/rt-n56u \
   -it \
   fwbuilder  /bin/bash

