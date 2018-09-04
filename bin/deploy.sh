#!/usr/bin/env bash
set -ex

# Log into Docker registry.
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Push images.
docker push garbetjie/php:${VERSION}-onbuild
docker push garbetjie/php:${VERSION}
