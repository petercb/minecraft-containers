FROM adoptopenjdk:11-jre-hotspot AS base

ARG VERSION=1.1.4

WORKDIR /velocity

ADD https://versions.velocitypowered.com/download/${VERSION}.jar velocity.jar

EXPOSE 25565

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "velocity.jar"]



FROM base AS geyser

ADD https://repo.opencollab.dev/artifactory/maven-snapshots/org/geysermc/bootstrap-velocity/1.2.0-SNAPSHOT/bootstrap-velocity-1.2.0-20210315.185000-143.jar plugins/geyser.jar

EXPOSE 19132/udp
