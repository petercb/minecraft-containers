# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG VELOCITY_VERSION=3.5.0
ARG BUILD_ID=585
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="d9f6feb5b257d3f8d889978d55d0cfdc2f5fa3d01240dc7cd495d74fbb75cd8d"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
