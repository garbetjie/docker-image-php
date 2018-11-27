#!/usr/bin/env bash
set -ex

# Log into Docker registry.
echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_LOGIN" --password-stdin

# Push images.
docker push ${DOCKER_HUB_REPO}/php:${VERSION}-onbuild
docker push ${DOCKER_HUB_REPO}/php:${VERSION}-onbuild-${SHORT_COMMIT}

docker push ${DOCKER_HUB_REPO}/php:${VERSION}
docker push ${DOCKER_HUB_REPO}/php:${VERSION}-${SHORT_COMMIT}
