#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Run postgres_user
docker run  --name ${CABLES_DOCKER_RUN_NAME} --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${LOCAL_POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -d --volumes-from ${CABLES_DOCKER_VOLUME} ${CABLES_DOCKER_ORG_NAME}/${CABLES_DOCKER_IMAGE_NAME}
