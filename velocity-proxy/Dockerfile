# syntax=docker/dockerfile:1.7

FROM amazoncorretto:25-alpine

ARG VELOCITY_VERSION=3.4.0
ARG BUILD_ID=558
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"

ADD --chmod=444 https://api.papermc.io/v2/projects/velocity/versions/${VELOCITY_VERSION}-SNAPSHOT/builds/${BUILD_ID}/downloads/velocity-${VELOCITY_VERSION}-SNAPSHOT-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
