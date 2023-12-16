# Minecraft Bedrock Connect Server

Run a [Bedrock Connect](https://github.com/Pugmatt/BedrockConnect) server for
Minecraft in a container.

## Introduction

This Docker image packages a specific version of Bedrock Connect

## Usage

```bash
docker run -d -e EULA=TRUE -p 19132:19132/udp --name minecraft petercb/bedrock-connect
```
