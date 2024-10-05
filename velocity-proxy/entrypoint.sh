#!/bin/sh

echo "Running in $(pwd)"

command="java ${JAVA_OPTS:-} -jar ${JAR_FILE:-/velocity.jar} $*"

echo "Running: '${command}'"
exec ${command}
