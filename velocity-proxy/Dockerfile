# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG VELOCITY_VERSION=3.5.0
ARG BUILD_ID=576
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="1fd6eb76330a21cf8307b1517ce5edf8914669966f99148e5fec0b178ba77686"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
