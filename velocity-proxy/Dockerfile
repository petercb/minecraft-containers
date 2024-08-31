# syntax=docker/dockerfile:1.7

FROM amazoncorretto:21-alpine

ARG VERSION=3.3.0-SNAPSHOT
ARG BUILD_ID=416

ADD --chmod=444 https://api.papermc.io/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar

COPY entrypoint.sh /

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 25577

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
