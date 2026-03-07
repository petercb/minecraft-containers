# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG PAPER_VERSION=1.21.11
ARG BUILD_ID=126
ARG VERSION="${PAPER_VERSION}-${BUILD_ID}"
ARG UUID="367f5088c7cc5c8f83cbededf4760622d4a27425be45611d3db6f11c75fac901"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/paper-${PAPER_VERSION}-${BUILD_ID}.jar /minecraft.jar

EXPOSE 25565
EXPOSE 25575

COPY entrypoint.sh /

# hadolint ignore=DL3018
RUN <<-EOF
    apk --no-cache add libudev-zero libstdc++
    echo "core: ${PAPER_VERSION}" > /VERSION.txt
EOF

USER 1000

WORKDIR /minecraft

ENV JAVA_OPTS="-XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+ParallelRefProcEnabled -XX:+PerfDisableSharedMem -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1HeapRegionSize=8M -XX:G1HeapWastePercent=5 -XX:G1MaxNewSizePercent=40 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1NewSizePercent=30 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -XX:MaxGCPauseMillis=200 -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--nogui"]
