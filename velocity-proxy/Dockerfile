# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG VELOCITY_VERSION=3.4.0
ARG BUILD_ID=561
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="3ed5b6ffba88cd9758f6220d230e812721ba64a381c0e95465a57d0ce0aaf252"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
