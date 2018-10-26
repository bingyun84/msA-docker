#!/bin/bash
cur_dir=`pwd`
docker stop redis
docker rm redis
docker run -idt -p 6379:6379  -v ${cur_dir}/data:/data --name redis -v ${cur_dir}/redis.conf:/usr/local/etc/redis/redis.conf --restart always redis:latest