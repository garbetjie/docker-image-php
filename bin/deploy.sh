#!/usr/bin/env bash
set -e

# Log into Docker registry.
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Push images.
docker push garbetjie/php:${VERSION}-onbuild
docker push garbetjie/php:${VERSION}-newrelic
docker push garbetjie/php:${VERSION}
