FROM openjdk:17.0.1-slim-buster

ARG VERSION=3.1.0
ARG BUILD_ID=95

ADD https://papermc.io/api/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/952/artifact/bootstrap/velocity/target/Geyser-Velocity.jar /plugins/geyser.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/53/artifact/velocity/target/floodgate-velocity.jar /plugins/floodgate.jar

COPY entrypoint.sh /

RUN chmod +r /velocity.jar /plugins/*.jar

EXPOSE 25577
EXPOSE 19132/udp

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
