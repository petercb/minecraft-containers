#!/bin/bash

set -e
set -u

for image in bedrock-connect minecraft-java velocity-proxy
do
    pushd "${image}"
    docker build -t petercb/${image} .
    container-structure-test test --config container-structure-test.yaml --image petercb/${image}
    popd
done
