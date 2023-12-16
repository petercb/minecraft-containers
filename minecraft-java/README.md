# Minecraft Java Server

Run a Minecarft Java Edition dedicated server in a container.

Currently using [PaperMC](https://papermc.io/)

## Introduction

This Docker image packages a specific version of the Minecraft server and allows it to be configured by environment variables.

## Usage

```bash
docker run -d -p 25565:25565 --name minecraft petercb/minecraft-java
```

## Environment Variables

JAVA_OPTS : Specify Java options, defaults to a performance tuned set for minecraft

JAR_FILE : Override the Jar file to run

## Breaking Changes

This container used to ship with some default plugins, it no longer does. You are now expected to manage your plugins out of band.
