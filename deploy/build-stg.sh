#!/bin/sh

echo "Deploy directory"

while :
do
  echo "0. All"
  echo "1. Api"
  echo "2. Admin"
  echo "3. Shop"
  echo "4. Pickup Portal"
  echo "5. Tracking"
  echo "6. Docker"
  echo "Please select image to build (number) ..."
  read -r INPUT_STRING
  BRANCH="staging"
  export BRANCH
  case $INPUT_STRING in
    0)
      PROJECT="api"
      export PROJECT
      sh ./up-api.sh
      PROJECT="admin"
      export PROJECT
      cd ../
      docker-compose stop
      docker-compose up -d workspace
      cd deploy || exit
      sh ./up-fe-fast.sh
      docker-compose up -d
      PROJECT="shop"
      export PROJECT
      sh ./up-fe-fast.sh
      PROJECT="pickup-portal"
      export PROJECT
      sh ./up-fe-fast.sh
      PROJECT="tracking"
      export PROJECT
      sh ./up-fe-fast.sh
      PROJECT="docker"
      export PROJECT
      sh ./docker.sh
      cd ../
      docker-compose up -d
      cd deploy || exit
      break
      ;;
    1)
      PROJECT="api"
      export PROJECT
      sh ./up-api.sh
      ;;
    2)
      cd ../
      docker-compose stop
      docker-compose up -d workspace
      cd deploy || exit
      PROJECT="admin"
      export PROJECT
      sh ./up-fe-fast.sh
      cd ../
      docker-compose up -d
      cd deploy || exit
      ;;
    3)
      PROJECT="shop"
      export PROJECT
      sh ./up-fe-fast.sh
      ;;
    4)
      PROJECT="pickup-portal"
      export PROJECT
      sh ./up-fe-fast.sh
      ;;
    5)
      PROJECT="tracking"
      export PROJECT
      sh ./up-fe-fast.sh
      ;;
    6)
      PROJECT="docker"
      export PROJECT
      sh ./docker.sh
      ;;
    *)
      echo "Sorry, I don't understand"
      break
      ;;
  esac
done
echo "Done"
