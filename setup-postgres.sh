#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
CABLES_DOCKER_VOLUME="$3"

# Build image
./build.sh ${CABLES_DOCKER_IMAGE_NAME}

# Create docker network
./create-net.sh ${NET_NAME}

# Create postres container volume
./build-volume-postgres.sh ${NET_NAME} ${DNS_IP} ${CABLES_DOCKER_VOLUME}
