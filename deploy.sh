#!/bin/bash
docker stop curso
docker run --rm --name curso -e JAVA_OPTS="-Dspring.profiles.active=ic" --link sql-server:sql-server --link some-redis:some-redis -p 8080:8080 -d curso-ic:0.0.1-SNAPSHOT
