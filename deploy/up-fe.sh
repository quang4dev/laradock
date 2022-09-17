#!/bin/sh

echo "============================="
echo "Go to project $PROJECT folder"
echo "============================="
cd "../../../$PROJECT" || exit
echo GIT Stash
git stash
echo Pull from "$BRANCH" branch
git pull origin "$BRANCH"

echo "Go to docker folder"
cd "../docker/" || exit

echo "Docker stop $PROJECT"
docker-compose stop $PROJECT
echo "Docker remove $PROJECT"
echo y | docker-compose rm $PROJECT
echo "Docker build $PROJECT"
docker-compose build $PROJECT
echo Docker up
docker-compose up -d
echo Clean docker
echo Y | docker system prune
