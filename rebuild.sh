#!/bin/sh

docker build -t "youtube-dl-server" .
docker stop youtube-dl
docker rm youtube-dl
docker run -d --restart=always -p 6060:8080 --name youtube-dl -v /media/Malaga:/youtube-dl:z youtube-dl-server
docker system prune
