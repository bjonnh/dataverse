#!/bin/bash

cd /dataverse
git pull
# We skip tests because surefire fails when run in docker. Don't know why
mvn package -Dmaven.test.skip=true
true
