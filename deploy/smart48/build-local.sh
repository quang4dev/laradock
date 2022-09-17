#!/bin/sh

echo "Deploy directory"

while :
do
  echo "0. All"
  echo "1. App"
  echo "9. Docker"
  echo "Please select image to build (number) ..."
  read -r INPUT_STRING
  BRANCH="staging"
  export BRANCH
  case $INPUT_STRING in
    0)
      PROJECT="app"
      export PROJECT
      sh ./../up-api.sh
      PROJECT="docker"
      export PROJECT
      sh ./../docker.sh
      cd deploy || exit
      break
      ;;
    1)
      PROJECT="api"
      export PROJECT
      sh ./../up-api.sh
      ;;
    9)
      PROJECT="docker"
      export PROJECT
      sh ./../docker.sh
      ;;
    *)
      echo "Sorry, I don't understand"
      break
      ;;
  esac
done
echo "Done"
