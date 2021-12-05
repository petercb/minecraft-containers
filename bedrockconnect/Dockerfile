FROM openjdk:17.0.1-slim-buster

WORKDIR /brc

ARG VERSION=1.12

ADD https://github.com/Pugmatt/BedrockConnect/releases/download/${VERSION}/BedrockConnect-1.0-SNAPSHOT.jar BedrockConnect.jar

EXPOSE 19132/udp

ENTRYPOINT ["java", "-jar", "BedrockConnect.jar"]
CMD ["nodb=true"]
