#!/bin/bash

# https://www.taniarascia.com/getting-started-with-git/
# this bash is used to compress picture by the args

Help()
{
    echo "Syntax: start.sh [-d|r|q]"
    echo "-d output directory"
    echo "-r resize percentage, the number should be from 0 - 100"
    echo "-q quality percentage, the number should be from 0 - 100"
}

while getopts "d:r:q:h" flag; 
do
    case $flag in
        d) OUTPUT=${OPTARG};;
        r) RESIZE=${OPTARG};;
        q) QUALITY=${OPTARG};;
        h) Help exit;;
    esac
done

OUTPUT=${OUTPUT:-"output"}
RESIZE=${RESIZE:-100}
QUALITY=${QUALITY:-75}

# run the docker build and bring the arguments
docker build -t node-compress-img --build-arg OUTPUT="$OUTPUT" --build-arg RESIZE="$RESIZE" --build-arg QUALITY="$QUALITY" .

docker run --name node-compress-img-container -it -d node-compress-img

sleep 5

docker cp node-compress-img-container:/app/${OUTPUT} ./ 

sleep 5

docker stop node-compress-img-container
docker container rm node-compress-img-container
docker image rm node-compress-img