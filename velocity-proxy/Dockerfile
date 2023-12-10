FROM amazoncorretto:17

ARG VERSION=3.2.0-SNAPSHOT
ARG BUILD_ID=296

ARG VIAVERSION=4.9.2
ARG VIABACKWARDS=4.9.1

ARG GEYSER=2.2.0
ARG GEYSER_BUILD_ID=389

ARG FLOODGATE=2.2.2
ARG FLOODGATE_BUILD_ID=85

ADD https://api.papermc.io/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar
ADD https://github.com/ViaVersion/ViaVersion/releases/download/${VIAVERSION}/ViaVersion-${VIAVERSION}.jar /plugins/ViaVersion.jar
ADD https://github.com/ViaVersion/ViaBackwards/releases/download/${VIABACKWARDS}/ViaBackwards-${VIABACKWARDS}.jar /plugins/ViaBackwards.jar
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
