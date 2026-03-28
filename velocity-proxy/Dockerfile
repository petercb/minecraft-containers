# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG VELOCITY_VERSION=3.5.0
ARG BUILD_ID=584
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="4334a3577a4c6daac264d1ff3be73d27ec1f4f9b3339af683bdcf3099f66402b"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
