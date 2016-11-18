#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Create volume container
docker create -v /var/lib/postgresql/data --name ${CABLES_DOCKER_VOLUME} \
    --net ${NET_NAME} --dns ${DNS_IP} postgres 2>/dev/null || true
