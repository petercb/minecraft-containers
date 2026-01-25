#!/bin/bash

set -eu

export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

for dockerfile in ${1:-*}/Dockerfile
do
    image="$(dirname ${dockerfile})"
    echo "Building ${image}"
    pushd "${image}"
    if [ -f build-env.sh ]; then
        source build-env.sh
    fi

    docker build \
        --tag petercb/${image}:latest \
        --file Dockerfile \
        .
    container-structure-test test \
        --config container-structure-test.yaml \
        --image petercb/${image}:latest
    popd
done
