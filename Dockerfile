FROM openjdk:8-alpine

# artifactory/tomcat scripts run bash
RUN apk update && \
    apk add bash

# don't run as root
RUN adduser -D -h /artifactory artifactory
USER artifactory
WORKDIR /artifactory

ARG ARTIFACTORY_VERSION=5.6.2
ARG ARTIFACTORY_DIST=jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip

RUN wget -O jfrog-artifactory-oss.zip https://dl.bintray.com/jfrog/artifactory/${ARTIFACTORY_DIST} && \
    unzip jfrog-artifactory-oss.zip && \
    rm -f jfrog-artifactory-oss.zip && \
    mv artifactory-oss-*/* /artifactory && \
    rmdir artifactory-oss-* && \
    mkdir data logs backup || true

# some volumes for data
VOLUME /artifactory/data /artifactory/logs /artifactory/backup

EXPOSE 8081

ENTRYPOINT bin/artifactory.sh
