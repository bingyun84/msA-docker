#!/usr/bin/env bash

source ~/.bash_profile
mvn package
docker build -t hub.idig88.com:8888/micro-service/course-dubbo-service:latest .
docker push hub.idig88.com:8888/micro-service/course-dubbo-service:latest