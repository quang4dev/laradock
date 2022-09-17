#!/bin/sh

echo "Deploy directory."

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
  BRANCH="master"
  export BRANCH
  case $INPUT_STRING in
    0)
      PROJECT="api"
      export PROJECT
      sh ./up-api.sh
      PROJECT="admin"
      export PROJECT
      sh ./up-fe-fast.sh
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
      break
      ;;
    1)
      PROJECT="api"
      export PROJECT
      sh ./up-api.sh
      ;;
    2)
      PROJECT="admin"
      export PROJECT
      sh ./up-fe-fast.sh
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
