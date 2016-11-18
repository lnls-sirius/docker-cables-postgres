#!/usr/bin/env bash

set -a
set -u
set -e

. ./env-vars.sh

docker build -t ${CABLES_DOCKER_ORG_NAME}/${CABLES_DOCKER_IMAGE_NAME} .
