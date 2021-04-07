FROM adoptopenjdk:11-jre-hotspot

ARG VERSION=1.1.4

WORKDIR /velocity

ADD https://versions.velocitypowered.com/download/${VERSION}.jar /velocity.jar

EXPOSE 25577

VOLUME /velocity

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/velocity.jar"]
