#!/usr/bin/env bash

set -a
set -e
set -u

# Source env vars
. ./env-vars.sh

# Build postgres
./build.sh

# Create docker network
./create-net.sh ${NET_NAME}

# Run postgres
./run-postgres-psql.sh
