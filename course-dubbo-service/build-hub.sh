#!/usr/bin/env bash

source ~/.bash_profile
mvn package
docker build -f ./Dockerfile-hub -t zhugeaming/course-dubbo-service:latest  .
docker push zhugeaming/course-dubbo-service:latest