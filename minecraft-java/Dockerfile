FROM amazoncorretto:21

ARG VERSION=1.20.4
ARG BUILD_ID=489

ADD https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds/${BUILD_ID}/downloads/paper-${VERSION}-${BUILD_ID}.jar /minecraft.jar

EXPOSE 25565
EXPOSE 25575

COPY entrypoint.sh /

RUN \
    chmod a=r /minecraft.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

USER 1000

WORKDIR /minecraft

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--nogui"]
