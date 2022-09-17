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

echo "Build $PROJECT"
docker-compose exec workspace bash -c  "cd $PROJECT && yarn install && yarn build"
