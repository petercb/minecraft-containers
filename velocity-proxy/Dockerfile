# syntax=docker/dockerfile:1

FROM amazoncorretto:26-alpine

ARG VELOCITY_VERSION=4.3.0
ARG BUILD_ID=44
ARG VERSION="${VELOCITY_VERSION}-${BUILD_ID}"
ARG UUID="85be73b90f295acd8d5d45a00ad10bac791d4b72b7554172612a89565ebaaa8f"

ADD --chmod=444 https://fill-data.papermc.io/v1/objects/${UUID}/velocity-${VELOCITY_VERSION}-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENV JAVA_OPTS="-XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15"

ENTRYPOINT ["/entrypoint.sh"]
