#!/bin/bash
docker stop marathon-lb
docker rm marathon-lb
docker run -d -p 9090:9090 \
  --name marathon-lb
  -e PORTS=9090 \
  mesosphere/marathon-lb:v1.12.3 sse \
  --group external \
  --marathon http://192.168.66.102:8080
