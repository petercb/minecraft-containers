# syntax=docker/dockerfile:1

# hadolint ignore=DL3006
FROM cgr.dev/chainguard/wolfi-base AS build

WORKDIR /tmp

# Download Bedrock server
ARG VERSION=1.21.132.3
ADD https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-${VERSION}.zip server.zip

# Install unzip
# hadolint ignore=DL3018
RUN apk add --no-cache unzip

COPY --chmod=444 property-definitions.json bds-property-definitions.json

# Extract bedrock server
WORKDIR /bedrock
RUN \
    unzip /tmp/server.zip && \
    chmod 555 bedrock_server && \
    rm -f ./*.debug && \
    mkdir -p worlds && \
    chown -R nonroot.nonroot server.properties worlds


FROM itzg/set-property:0.1.1 AS set-property

## Runtime
# hadolint ignore=DL3006
FROM cgr.dev/chainguard/wolfi-base AS runtime

# Add set-property bin
COPY --from=set-property /set-property /bin/set-property

COPY --chmod=555 entrypoint.sh /entrypoint.sh
COPY --from=build /tmp/bds-property-definitions.json /etc/bds-property-definitions.json
COPY --from=build /bedrock /bedrock

# hadolint ignore=DL3018
RUN <<-EOF
    apk add --no-cache libcurl4
    echo "core: ${VERSION}" > /VERSION.txt
EOF

EXPOSE 19132/udp

USER nonroot

VOLUME /bedrock/worlds

WORKDIR /bedrock
ENV LD_LIBRARY_PATH=/bedrock

ENTRYPOINT [ "/entrypoint.sh" ]
