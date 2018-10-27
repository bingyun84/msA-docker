#!/usr/bin/env bash
source ~/.bash_profile
mvn package
docker build -f ./Dockerfile-hub -t zhugeaming/user-edge-service:latest .
docker push zhugeaming/user-edge-service:latest