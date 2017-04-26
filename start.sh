#!/bin/bash

if [ ! -d /opt/rt-n56u/trunk ] ; then
   cd /opt/rt-n56u
   git init
   git remote add upstream https://bitbucket.org/padavan/rt-n56u.git
   git fetch upstream
   git merge upstream/master
   
else
   cd /opt/source/rt-n56u
   git checkout -f master
   git pull
fi
   
