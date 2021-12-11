#!/bin/bash

set -e
set -u

function cleanup {
    echo "Stopping builder"
    docker buildx stop container
}

trap cleanup EXIT

docker buildx create --driver docker-container --name container --node container0 --use

for image in bedrock-connect minecraft-java velocity-proxy
do
    pushd "${image}"
    docker buildx build --builder container --load --cache-from petercb/${image}:cache -t petercb/${image}:latest .
    container-structure-test test --config container-structure-test.yaml --image petercb/${image}:latest
    popd
done
