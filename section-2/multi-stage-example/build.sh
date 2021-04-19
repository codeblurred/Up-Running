#!/bin/sh
echo Building vamsdock/react:build 

docker build -t vamsdock:build . -f Dockerfile.build 

docker create --name extract vamsdock:build

docker cp extract:/app/build ./app 

docker rm -f extract 

echo Building vamsdock/react:latest

docker build --no-cache -t vamsdock/react:latest . -f Dockerfile.main