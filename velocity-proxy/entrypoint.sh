#!/bin/bash

echo "Running in $(pwd)"

command="java"
if [ -z "${JAVA_OPTS}" ] ; then
    command="${command} -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled \
        -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
else
    command="${command} ${JAVA_OPTS}"
fi
command="${command} -jar ${JAR_FILE:-/velocity.jar} $*"

echo "Running: '${command}'"
exec ${command}
