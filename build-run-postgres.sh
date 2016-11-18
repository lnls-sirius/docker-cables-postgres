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

# Create volume
./build-volume-postgres.sh

# Run postgres
./run-postgres.sh
