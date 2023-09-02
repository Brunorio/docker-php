#!/bin/bash

echo "Remove All Containers";
docker container rm -f $(docker container ls -a -q) > /dev/null 2>&1;
echo "Remove All Images";
docker image rm -f  $(docker image ls -a -q) > /dev/null 2>&1;
echo "Remove All Volumes";
docker volume rm -f $(docker volume ls -q) > /dev/null 2>&1;