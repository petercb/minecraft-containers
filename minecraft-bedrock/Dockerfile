FROM debian:12-slim AS build

WORKDIR /tmp

# Download Bedrock server
ARG VERSION=1.20.73.01
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip server.zip

# Install unzip
# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
    && rm -rf /var/lib/apt/lists/*

COPY property-definitions.json bds-property-definitions.json
RUN chmod a=r bds-property-definitions.json

# Extract bedrock server
WORKDIR /bedrock
RUN \
    unzip /tmp/server.zip && \
    chmod +x bedrock_server && \
    rm -f ./*.debug && \
    mkdir -p worlds && \
    chown -R 1000 server.properties worlds


FROM itzg/set-property:0.1.1 AS set-property

## Runtime
FROM debian:12-slim AS runtime

# Add set-property bin
COPY --from=set-property /set-property /bin/set-property

COPY entrypoint.sh /entrypoint.sh
COPY --from=build /tmp/bds-property-definitions.json /etc/bds-property-definitions.json
COPY --from=build /bedrock /bedrock

# hadolint ignore=DL3008
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        libcurl4 && \
    rm -rf /var/lib/apt/lists/*

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 19132/udp

USER 1000

VOLUME /bedrock/worlds

WORKDIR /bedrock
ENV LD_LIBRARY_PATH=/bedrock

ENTRYPOINT [ "/entrypoint.sh" ]
