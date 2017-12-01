# Remove all docker images, volumes and containers
# Just run these a few times each in varying orders...
sudo docker rmi $(docker images -f dangling=true -q)
sudo docker rmi $(docker images -a -q)
sudo docker stop $(docker ps -a -q)
sudo docker rm $(docker ps -a -q)
sudo docker volume rm $(docker volume ls -f dangling=true -q)
