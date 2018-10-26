#!/bin/bash
cur_dir=`pwd`
docker stop mysql
docker rm mysql
docker run --name mysql -v ${cur_dir}/conf:/etc/mysql/conf.d -v ${cur_dir}/data:/var/lib/mysql --restart always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest