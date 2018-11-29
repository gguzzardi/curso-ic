#!/bin/bash

docker stop curso
docker rm curso
docker run --name curso -e JAVA_OPTS="-Dspring.profiles.active=ic" --link sql-server:sql-server -p 8080:8080 -d curso-ic:0.0.1-SNAPSHOT