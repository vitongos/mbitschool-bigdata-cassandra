#!/bin/bash

docker run -d -v /home/centos/cassandra-src:/cassandra --name cassandra1 cassandra:latest

sleep 20

docker run -d -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' cassandra1)"  -v /home/centos/cassandra-src:/cassandra --name cassandra2 cassandra:latest
