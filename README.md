# docker-artifactory-oss

Simple deployment of [JFrog Artifactory OSS](https://www.jfrog.com/open-source/#artifactory) using the bundled Tomcat container.

This image is based on [openjdk:8-alpine](https://hub.docker.com/_/openjdk/), Tomcat (currently 8.5) running on OpenJDK 8.

## Pull

## Run

```none
docker run -d -p 8081:8081 \
  --volume artifactory-data:/artifactory/data \
  --volume artifactory-logs:/artifactory/logs \
  --volume artifactory-backup:/artifactory/backup \
  --name artifactory artifactory
```

## Access

[http://localhost:8081](http://localhost:8081)

## Build
```none
docker build -t artifactory .
```

See [Dockerfile](Dockerfile).
