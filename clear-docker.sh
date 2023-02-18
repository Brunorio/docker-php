echo "Remove All Containers";
docker container rm -f $(docker container ls -a -q);
echo "Remove All Images";
docker image rm -f  $(docker image ls -a -q);
echo "Remove All Volumes";
docker volume rm -f $(docker volume ls -q);