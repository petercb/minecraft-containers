#!/bin/bash

if [[ "${EULA=FALSE}" != "TRUE" ]]; then
    echo
    echo "EULA must be set to TRUE to indicate agreement with the Minecraft End User License"
    echo "See https://minecraft.net/terms"
    echo
    echo "Current value is '${EULA}'"
    echo
    exit 1
fi

set-property --file /bedrock/server.properties --bulk /etc/bds-property-definitions.json

exec /bedrock/bedrock_server
