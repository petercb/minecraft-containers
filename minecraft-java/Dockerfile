FROM adoptopenjdk:11-jre-hotspot

ARG SOURCE_URL=https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

WORKDIR /minecraft

ADD ${SOURCE_URL} /minecraft.jar

RUN java -jar /minecraft.jar --nogui --initSettings

EXPOSE 25565
EXPOSE 25575

VOLUME /minecraft

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/minecraft.jar"]
CMD ["--nogui"]
