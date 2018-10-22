#!/usr/bin/env bash

source ~/.bash_profile

docker build -t hub.idig88.com:8888/micro-service/message-thrift-python-service:latest .
docker push hub.idig88.com:8888/micro-service/message-thrift-python-service:latest