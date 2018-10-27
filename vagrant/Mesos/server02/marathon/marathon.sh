#!/bin/bash
docker stop marathon
docker rm marathon
docker run -d --net=host \
  --name marathon \
  mesosphere/marathon:v1.5.12 \
  --master zk://192.168.31.14:2181/mesos \
  --zk zk://192.168.31.14:2181/marathon