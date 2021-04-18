FROM adoptopenjdk:11-jre-hotspot

ARG VERSION=1.1.4
ARG GEYSER_VERSION=1.2.1
ARG GEYSER_BUILD_ID=20210416.154342-10
ARG FLOODGATE_URL=https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/4/artifact/velocity/target/floodgate-velocity.jar

WORKDIR /app

ADD https://versions.velocitypowered.com/download/${VERSION}.jar velocity.jar
ADD https://repo.opencollab.dev/artifactory/maven-snapshots/org/geysermc/bootstrap-velocity/${GEYSER_VERSION}-SNAPSHOT/bootstrap-velocity-${GEYSER_VERSION}-${GEYSER_BUILD_ID}.jar plugins/geyser.jar
ADD ${FLOODGATE_URL} plugins/floodgate.jar

EXPOSE 25577
EXPOSE 19132/udp

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "velocity.jar"]
