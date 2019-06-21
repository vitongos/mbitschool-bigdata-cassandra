#!/bin/bash

docker run -d --name cassandra1 cassandra:latest

sleep 20

docker run -d -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' cassandra1)" --name cassandra2 cassandra:latest
