#!/usr/bin/env bash

source ~/.bash_profile
mvn package
docker build -f ./Dockerfile-hub -t zhugeaming/course-edge-service:latest .
docker push zhugeaming/course-edge-service:latest