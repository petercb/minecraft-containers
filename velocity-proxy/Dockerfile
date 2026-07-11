# syntax=docker/dockerfile:1

FROM amazoncorretto:26-alpine

ARG VELOCITY_VERSION=3.6.0
ARG BUILD_ID=613
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="a87eea534bd483209aa5ccb03822cb14d5006796d9c18a59e6e34cfd3c28b5b0"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
