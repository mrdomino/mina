#!/bin/sh
set -e
CODA_VERSION="1.0.5-feature-int-test-ingress-race-4fde13b"
docker build -f Dockerfile-coda-daemon-puppeteered -t puppet --build-arg "CODA_VERSION=$CODA_VERSION" .
docker run -it puppet daemon -seed -generate-genesis-proof true -rest-port 3085
