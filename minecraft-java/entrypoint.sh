#!/bin/sh

echo "Running in $(pwd)"
echo "Accepting the EULA"
echo "eula=true" > eula.txt

command="java ${JAVA_OPTS:-} -jar ${JAR_FILE:-/minecraft.jar} $*"

echo "Running: '${command}'"
exec ${command}
