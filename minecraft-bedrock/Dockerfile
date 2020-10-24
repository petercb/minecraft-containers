FROM debian:10.3-slim AS build

ARG VERSION=1.16.40.02

WORKDIR /tmp

ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip server.zip
ADD https://github.com/itzg/set-property/releases/download/0.1.1/set-property_0.1.1_linux_amd64.tar.gz set-property.tar.gz

# Extract set-property
RUN \
    tar xf set-property.tar.gz \
    && chmod +x set-property

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

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libcurl4 \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY property-definitions.json /etc/bds-property-definitions.json
COPY --from=build /tmp/set-property /usr/bin/set-property
COPY --from=build /bedrock /bedrock

EXPOSE 19132/udp
VOLUME /bedrock/worlds

WORKDIR /bedrock
ENV LD_LIBRARY_PATH=/bedrock

ENTRYPOINT [ "/entrypoint.sh" ]
