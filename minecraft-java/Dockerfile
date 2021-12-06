FROM azul/zulu-openjdk-alpine:17.0.1-jre-headless

ARG VERSION=1.17.1
ARG BUILD_ID=391

ADD https://papermc.io/api/v2/projects/paper/versions/${VERSION}/builds/${BUILD_ID}/downloads/paper-${VERSION}-${BUILD_ID}.jar /minecraft.jar
ADD https://github.com/ViaVersion/ViaVersion/releases/download/4.1.1/ViaVersion-4.1.1.jar /plugins/ViaVersion.jar
ADD https://github.com/Nuytemans-Dieter/BetterSleeping/releases/download/v4.0.0/BetterSleeping.jar /plugins/BetterSleeping.jar

EXPOSE 25565
EXPOSE 25575

COPY entrypoint.sh /

USER 1000

WORKDIR /minecraft

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--nogui"]
