#!/bin/bash

##Lets run build with test so that any bean failure can be found out during compile time itslf

while getopts u:b:f: flag
do
    case "${flag}" in
        b) dockerbuild=${OPTARG};;
    esac
done
## mvn clean install -Dmaven.test.skip=true
mvn clean install package
echo "SenderReciever product Build started"

## give a 5 seconds sleep for all maven threads to exit
echo "Build complete...Sleeping for 5 seconds"
sleep 5
if [ "$dockerbuild" == "docker" ]
then
 echo "Cleaning up older images"
sudo docker rmi -f $(sudo docker images -a -q)

echo "Creating new images"
pushd ./discovery
sudo docker build -t discovery-service .
popd

pushd ./apigateway
sudo docker build -t apigateway .
popd

pushd ./reciever
sudo docker build -t reciever-service .
popd

pushd ./sender
sudo docker build -t sender-service .
popd

else
 rm -rf artifacts
 mkdir ./artifacts
 cp ./apigateway/target/*.jar ./artifacts
 cp ./discovery/target/*.jar ./artifacts
 cp ./reciever/target/*.jar ./artifacts
 cp ./sender/target/*.jar ./artifacts
fi


echo "Docker Build complete..."

