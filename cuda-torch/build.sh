#!/bin/bash -x

REPO=danielsig727/cuda-torch
TAG_PREFIX=
DATE=$(date +"%y%m%d-%H%M%S")

nvidia-docker build --no-cache=true -t ${REPO}:${TAG_PREFIX}latest \
             -t ${REPO}:${TAG_PREFIX}${DATE} . && \
docker push -t ${REPO}:${TAG_PREFIX}latest \
            -t ${REPO}:${TAG_PREFIX}${DATE} .
