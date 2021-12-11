FROM openjdk:17.0.1-slim-buster

ARG VERSION=1.12

ADD https://github.com/Pugmatt/BedrockConnect/releases/download/${VERSION}/BedrockConnect-1.0-SNAPSHOT.jar /BedrockConnect.jar

RUN chmod a=r /BedrockConnect.jar

EXPOSE 19132/udp

USER 1000

WORKDIR /brc

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/BedrockConnect.jar"]
CMD ["nodb=true"]
