#!/bin/bash

if [ ! -d /opt/source/rt-n56u ] ; then
   git clone https://bitbucket.org/padavan/rt-n56u.git
else
   cd /opt/source/rt-n56u
   git pull
   git checkout -f
fi
   
