FROM amazoncorretto:17

ARG VERSION=3.2.0-SNAPSHOT
ARG BUILD_ID=294

ARG VIAVERSION=4.8.1

ARG GEYSER=2.2.0
ARG GEYSER_BUILD_ID=363

ARG FLOODGATE=2.2.2
ARG FLOODGATE_BUILD_ID=85

ADD https://api.papermc.io/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar
ADD https://github.com/ViaVersion/ViaVersion/releases/download/${VIAVERSION}/ViaVersion-${VIAVERSION}.jar /plugins/ViaVersion.jar
ADD https://download.geysermc.org/v2/projects/geyser/versions/${GEYSER}/builds/${GEYSER_BUILD_ID}/downloads/velocity /plugins/geyser.jar
ADD https://download.geysermc.org/v2/projects/floodgate/versions/${FLOODGATE}/builds/${FLOODGATE_BUILD_ID}/downloads/velocity /plugins/floodgate.jar

COPY entrypoint.sh /

RUN \
    chmod a=r /velocity.jar /plugins/*.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577
EXPOSE 19132/udp

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
