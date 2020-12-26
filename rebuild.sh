#!/bin/sh

docker build --pull -t "youtube-dl-server" .
docker stop youtube-dl
docker rm youtube-dl
docker run -d --restart=always -p 6060:8080 --name youtube-dl --log-opt max-size=10m --log-opt max-file=5 -v /media/Malaga:/youtube-dl:z youtube-dl-server
docker system prune
