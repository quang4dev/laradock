#!/bin/sh

echo "============================="
echo "Go to project $PROJECT folder"
echo "============================="
cd "../../../$PROJECT" || exit
echo GIT Stash
git stash
echo Pull from "$BRANCH" branch
git pull origin "$BRANCH"

echo "Build $PROJECT"
yarn install && yarn build
