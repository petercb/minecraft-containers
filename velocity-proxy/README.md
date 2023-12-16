# Velocity Proxy Server

Run a Minecraft [Velocity Proxy](https://papermc.io/software/velocity) server in
a container.

## Introduction

This Docker image packages a specific version of Velocity Proxy and allows it to
be configured by environment variables.

## Usage

```bash
docker run -d -p 25577:25577 --name minecraft petercb/velocity-proxy
```

## Environment Variables

JAVA_OPTS : Specify Java options, defaults to a performance tuned set for
minecraft

JAR_FILE : Override the Jar file to run

## Breaking Changes

This container used to ship with some default plugins, it no longer does. You
are now expected to manage your plugins out of band.
