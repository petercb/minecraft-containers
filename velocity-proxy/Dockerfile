FROM openjdk:17.0.1-slim-buster

ARG VERSION=3.1.1
ARG BUILD_ID=98

ARG GEYSER_BUILD=960
ARG FLOODGATE_BUILD=53

ADD https://papermc.io/api/v2/projects/velocity/versions/${VERSION}/builds/${BUILD_ID}/downloads/velocity-${VERSION}-${BUILD_ID}.jar /velocity.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/${GEYSER_BUILD}/artifact/bootstrap/velocity/target/Geyser-Velocity.jar /plugins/geyser.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/${FLOODGATE_BUILD}/artifact/velocity/target/floodgate-velocity.jar /plugins/floodgate.jar

COPY entrypoint.sh /

RUN chmod a=r /velocity.jar /plugins/*.jar

EXPOSE 25577
EXPOSE 19132/udp

USER 1000

WORKDIR /velocity

ENTRYPOINT ["/entrypoint.sh"]
