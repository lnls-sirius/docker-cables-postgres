#!/usr/bin/env bash

#NET_NAME="postgres-cables"
NET_NAME="dockerrbaccomposed_postgres-rbac"
DNS_IP="10.0.0.72"
POSTGRES_PORT=5432
LOCAL_POSTGRES_PORT=5436
POSTGRES_USER="cabledb"
POSTGRES_PASSWORD="cabledb"

CABLES_DOCKER_ORG_NAME=lnls
CABLES_DOCKER_RUN_NAME=cables-postgres
CABLES_DOCKER_RUN_NAME_PSQL=${CABLES_DOCKER_RUN_NAME}-psql
CABLES_DOCKER_IMAGE_NAME=docker-${CABLES_DOCKER_RUN_NAME}

CABLES_DOCKER_VOLUME=dockercablescomposed_cables-postgres-volume
