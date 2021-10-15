#!/bin/bash

while getopts u:b:f: flag
do
    case "${flag}" in
        b) dockerbuild=${OPTARG};;
    esac
done

if [ "$dockerbuild" == "docker" ]
then

echo "Cleaning up older images"
sudo docker rm -vf $(sudo docker ps -a -q)
sudo docker rmi -f $(sudo docker images -a -q)

sudo docker pull awssreejith/sender-service:latest
sudo docker pull awssreejith/reciever-service:latest
sudo docker pull awssreejith/discovery-service:latest
sudo docker pull awssreejith/apigateway:latest

sudo docker run -d -p 8761:8761 -v /tmp/sreejith:/tmp/log awssreejith/discovery-service
## give 5 second delay for Eureka to come up
sleep 5
sudo docker run -d -p 38000 -v /tmp/sreejith:/tmp/log awssreejith/reciever-service

#sudo docker run -d -p 38000:38000 -v /tmp/sreejith:/tmp/log awssreejith/catalog-service

sudo docker run -d -p 8080:8080 -v /tmp/sreejith:/tmp/log awssreejith/apigateway

else

  java -jar ./artifacts/eureka-server-1.0.0.jar --spring.profiles.active=test --log.file.path=/tmp/log &
  sleep 5
  java -jar ./artifacts/auth-service-1.0.0.jar --spring.profiles.active=test --log.file.path=/tmp/log &
  java -jar ./artifacts/catalog-service-1.0.0.jar --spring.profiles.active=test --log.file.path=/tmp/log &
  java -jar ./artifacts/user-service-1.0.0.jar --spring.profiles.active=test --log.file.path=/tmp/log &
fi
