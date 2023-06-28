#!/usr/bin/env bash

set -ex

UNITY_VERSION=2022.3.0f1
UNITY_MODULES=("windows-mono")
UNITY_CHANGESET=fb119bb0b476
GAME_CI_VERSION=1.1.2 # https://github.com/game-ci/docker/releases
MY_USERNAME=daithi

IMAGE_TO_PUBLISH=${MY_USERNAME}/editor:ubuntu-${UNITY_VERSION}-${UNITY_MODULES}-${GAME_CI_VERSION}
docker build --build-arg version=${UNITY_VERSION} --build-arg changeSet=${UNITY_CHANGESET} --build-arg module=${UNITY_MODULES} . -t ${IMAGE_TO_PUBLISH}

# uncomment the following to publish the built images to docker hub
#  docker push ${IMAGE_TO_PUBLISH}
exit