#!/usr/bin/env bash

mvn package
docker build -t user-thrift-service:latest .