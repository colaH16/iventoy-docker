#!/usr/bin/zsh

TAG=cola16/iventoy-fedora:Fedora-`uname -m`-2023-1220-3
IVENTOY_VERSION=1.0.19
docker build --rm --build-arg="IVENTOY_VERSION_NS=$IVENTOY_VERSION" --tag=$TAG .
docker push $TAG
