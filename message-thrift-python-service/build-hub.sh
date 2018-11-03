#!/usr/bin/env bash

source ~/.bash_profile

docker build -f ./Dockerfile -t zhugeaming/message-thrift-python-service:latest .
docker push zhugeaming/message-thrift-python-service:latest