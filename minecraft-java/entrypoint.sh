#!/bin/sh

echo "Accepting the EULA"
echo "eula=true" > eula.txt

if [ -z "${JAVA_OPTS}" ] ; then
    JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"
fi

mkdir -p plugins
for plugin in /plugins/*.jar ; do
    ln -sf "${plugin}" plugins/
done

java "${JAVA_OPTS}" -jar "${JAR_FILE:-/minecraft.jar}" "$@"
