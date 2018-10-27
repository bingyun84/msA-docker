#!/bin/bash
docker stop mesos-slave
docker rm mesos-slave
docker run -d --net=host --privileged \
  --name mesos-slave \
  --hostname=192.168.66.101 \
  -e MESOS_PORT=5051 \
  -e MESOS_MASTER=zk://192.168.31.14:2181/mesos \
  -e MESOS_SWITCH_USER=0 \
  -e MESOS_CONTAINERIZERS=docker,mesos \
  -e MESOS_LOG_DIR=/var/log/mesos \
  -e MESOS_WORK_DIR=/var/tmp/mesos \
  -v "$(pwd)/mesos/log/mesos:/var/log/mesos" \
  -v "$(pwd)/mesos/tmp/mesos:/var/tmp/mesos" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /sys:/sys \
  -v /usr/bin/docker:/usr/local/bin/docker \
  mesosphere/mesos-slave:1.7.0 --no-systemd_enable_support \
  --no-hostname_lookup --ip=192.168.66.101