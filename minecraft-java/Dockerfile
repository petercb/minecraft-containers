FROM amazoncorretto:17.0.4

ARG VERSION=1.19.2
ARG BUILD_ID=125

ARG VIAVERSION=4.4.1
ARG BETTER_SLEEP=4.0.2

ADD https://papermc.io/api/v2/projects/paper/versions/${VERSION}/builds/${BUILD_ID}/downloads/paper-${VERSION}-${BUILD_ID}.jar /minecraft.jar
ADD https://github.com/ViaVersion/ViaVersion/releases/download/${VIAVERSION}/ViaVersion-${VIAVERSION}.jar /plugins/ViaVersion.jar
ADD https://github.com/Nuytemans-Dieter/BetterSleeping/releases/download/v${BETTER_SLEEP}/BetterSleeping.jar /plugins/BetterSleeping.jar

EXPOSE 25565
EXPOSE 25575

COPY entrypoint.sh /

RUN \
    chmod a=r /minecraft.jar /plugins/*.jar && \
    echo "core: ${VERSION}" > /VERSION.txt

USER 1000

WORKDIR /minecraft

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--nogui"]
