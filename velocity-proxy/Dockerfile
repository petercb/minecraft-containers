FROM openjdk:17.0.1-slim-buster

ARG VERSION=3.1.2-SNAPSHOT
ARG BUILD_ID=110

ADD https://papermc.io/api/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar

COPY Geyser-Velocity.jar /plugins/geyser.jar
COPY floodgate-velocity.jar /plugins/floodgate.jar

COPY entrypoint.sh /

RUN \
    chmod a=r /velocity.jar /plugins/*.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577
EXPOSE 19132/udp

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
