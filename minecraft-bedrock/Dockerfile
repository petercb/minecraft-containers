FROM debian:10.3-slim AS build

WORKDIR /tmp

# Download Bedrock server
ARG VERSION=1.16.220.02
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip server.zip

# Install unzip
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# Extract bedrock server
WORKDIR /bedrock
RUN \
    unzip /tmp/server.zip \
    && chmod +x bedrock_server \
    && rm -f *.debug


## Runtime
FROM debian:10.3-slim AS runtime

# Add set-property bin
COPY --from=itzg/set-property:0.1.1 /set-property /bin/set-property

COPY entrypoint.sh /entrypoint.sh
COPY property-definitions.json /etc/bds-property-definitions.json
COPY --from=build /bedrock /bedrock

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libcurl4 \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 19132/udp
VOLUME /bedrock/worlds

WORKDIR /bedrock
ENV LD_LIBRARY_PATH=/bedrock

ENTRYPOINT [ "/entrypoint.sh" ]
