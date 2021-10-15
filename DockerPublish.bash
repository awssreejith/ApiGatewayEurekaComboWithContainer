#!/bin/bash
sudo docker tag apigateway awssreejith/apigateway:latest
sudo docker tag discovery-service awssreejith/discovery-service:latest
sudo docker tag reciever-service awssreejith/reciever-service:latest
sudo docker tag sender-service awssreejith/sender-service:latest

sudo docker push awssreejith/apigateway
sudo docker push awssreejith/discovery-service
sudo docker push awssreejith/reciever-service
sudo docker push awssreejith/sender-service

echo "Cleaning up images"
sudo docker rmi -f $(sudo docker images -a -q)
