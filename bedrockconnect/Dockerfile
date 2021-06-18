FROM adoptopenjdk:11-jre-hotspot

WORKDIR /brc

ARG VERSION=1.7

ADD https://github.com/Pugmatt/BedrockConnect/releases/download/${VERSION}/BedrockConnect-1.0-SNAPSHOT.jar BedrockConnect.jar

EXPOSE 19132/udp

ENTRYPOINT ["java", "-jar", "BedrockConnect.jar"]
CMD ["nodb=true"]
