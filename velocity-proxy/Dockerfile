FROM amazoncorretto:17

ARG VERSION=3.2.0-SNAPSHOT
ARG BUILD_ID=296

ADD https://api.papermc.io/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN \
    chmod a=r /velocity.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577
EXPOSE 19132/udp

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
