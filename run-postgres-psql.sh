#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Run postgres
docker run --name ${CABLES_DOCKER_RUN_NAME_PSQL} --net ${NET_NAME} --dns ${DNS_IP} \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -it postgres psql -h ${CABLES_DOCKER_IMAGE_NAME} -U ${POSTGRES_USER}
