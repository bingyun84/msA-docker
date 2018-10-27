#!/usr/bin/env bash

source ~/.bash_profile
mvn package
docker build -f ./Dockerfile-hub -t zhugeaming/gataway-zuul:latest .
docker push zhugeaming/gataway-zuul:latest