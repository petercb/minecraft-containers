#!/bin/sh

echo "Running in $(pwd)"
echo "Accepting the EULA"
echo "eula=true" > eula.txt

echo "Initializing plugins"
mkdir -p plugins
for plugin in /plugins/*.jar ; do
    ln -sfv "${plugin}" plugins/
done

command="java"
if [ -z "${JAVA_OPTS}" ] ; then
    command="${command} -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
else
    command="${command} ${JAVA_OPTS}"
fi
command="${command} -jar ${JAR_FILE:-/minecraft.jar} $*"

echo "Running: '${command}'"
exec ${command}
