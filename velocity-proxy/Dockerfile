FROM amazoncorretto:17

ARG VERSION=3.3.0-SNAPSHOT
ARG BUILD_ID=320

ADD https://api.papermc.io/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN \
    chmod a=r /velocity.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
