#!/bin/bash -x

REPO=cuda-torch
TAG_PREFIX=
DATE=$(date +"%y%m%d-%H%M%S")

nvidia-docker build --no-cache=true -t ${REPO}:${TAG_PREFIX}latest \
             -t ${REPO}:${TAG_PREFIX}${DATE} . && \
docker login && \
docker push -t ${REPO}:${TAG_PREFIX}latest \
            -t ${REPO}:${TAG_PREFIX}${DATE} .
