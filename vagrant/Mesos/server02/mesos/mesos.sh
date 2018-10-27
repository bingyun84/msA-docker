#!/bin/bash
docker stop mesos
docker rm mesos
docker run -d --net=host \
  --name mesos \
  --hostname=192.168.66.102 \
  -e MESOS_PORT=5050 \
  -e MESOS_ZK=zk://192.168.31.14:2181/mesos \
  -e MESOS_QUORUM=1 \
  -e MESOS_REGISTRY=in_memory \
  -e MESOS_LOG_DIR=/var/log/mesos \
  -e MESOS_WORK_DIR=/var/tmp/mesos \
  -v "$(pwd)/mesos/log/mesos:/var/log/mesos" \
  -v "$(pwd)/mesos/tmp/mesos:/var/tmp/mesos" \
  mesosphere/mesos-master:1.7.0 --no-hostname_lookup --ip=192.168.66.102