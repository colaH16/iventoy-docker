#!/usr/bin/zsh

TAG=cola16/iventoy-suse:tumbleweed-2023-1220-1
IVENTOY_VERSION=1.0.19
docker build --rm --build-arg="IVENTOY_VERSION_NS=$IVENTOY_VERSION" --tag=$TAG .
docker push $TAG
