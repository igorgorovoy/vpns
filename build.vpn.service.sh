#!/bin/bash
##
sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove -y
docker -v
##
if [ $? -gt 0 ]
then
  echo "Need install docker"
  snap install docker
else
  echo  "Docker in  system"
fi
##
image_name=`echo 'anBldGF6em8vZG9ja3Zwbgo=' | base64 --decode`
container_name=`echo 'bWVnYV92cG4K' | base64 --decode`
##start install service
ContainerID=$(docker run -d --privileged -p 1194:1194/udp -p 443:443/tcp $image_name)
## run image
docker run -t -i -p 4444:8080 --name $container_name --volumes-from $ContainerID $image_name serveconfig
## go get ovpn file

