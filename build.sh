#!/bin/sh

docker rmi -f fwbuilder
docker build -t fwbuilder .
