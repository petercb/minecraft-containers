FROM debian:11.1-slim AS build

WORKDIR /tmp

# Download Bedrock server
ARG VERSION=1.18.2.03
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip server.zip

# Install unzip
# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Extract bedrock server
WORKDIR /bedrock
RUN \
    unzip /tmp/server.zip \
    && chmod +x bedrock_server \
    && rm -f ./*.debug

FROM itzg/set-property:0.1.1 AS set-property

## Runtime
FROM debian:11.1-slim AS runtime

# Add set-property bin
COPY --from=set-property /set-property /bin/set-property

COPY entrypoint.sh /entrypoint.sh
COPY property-definitions.json /etc/bds-property-definitions.json
COPY --from=build /bedrock /bedrock

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libcurl4 \
    && rm -rf /var/lib/apt/lists/*

RUN echo "core: ${VERSION}" > /VERSION.txt

EXPOSE 19132/udp

USER 1000

VOLUME /bedrock/worlds

WORKDIR /bedrock
ENV LD_LIBRARY_PATH=/bedrock

ENTRYPOINT [ "/entrypoint.sh" ]
