# syntax=docker/dockerfile:1.7

FROM amazoncorretto:21-alpine

ARG VERSION=1.21
ARG BUILD_ID=107

ADD https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds/${BUILD_ID}/downloads/paper-${VERSION}-${BUILD_ID}.jar /minecraft.jar

EXPOSE 25565
EXPOSE 25575

COPY entrypoint.sh /

# hadolint ignore=DL3018
RUN <<-EOF
    apk --no-cache add libudev-zero libstdc++
    chmod a=r /minecraft.jar
    echo "core: ${VERSION}" > /VERSION.txt
EOF

USER 1000

WORKDIR /minecraft

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--nogui"]
