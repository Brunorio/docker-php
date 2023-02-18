docker container rm -f $(docker container ls -a -q) &&
docker image rm -f  $(docker image ls -a -q) && 
docker volume rm -f $(docker volume ls -q)