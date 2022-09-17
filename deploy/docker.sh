echo "============================="
echo "Go to project $PROJECT folder"
echo "============================="
cd "../../docker/" || exit
echo "0. Build"
echo "1. Docker-compose ps"
echo "2. View Logs"
echo "3. Restart Image"
echo "4. SSH Docker Image"
echo "5. Bash command"
echo "9. Back"
read -r INPUT_STRING
case $INPUT_STRING in
  0)
    git stash
    echo Pull from master branch
    git pull origin master
    sudo docker-compose up -d
  ;;
  1)
    docker-compose ps
  ;;
  2)
    sh ./deploy/docker-view-logging.sh
  ;;
  3)
    sh ./deploy/docker-restart-images.sh
  ;;
  4)
    sh ./deploy/docker-ssh.sh
  ;;
  5)
    sh ./deploy/docker-bash.sh
  ;;
  9)
    sh ~/build.sh
  ;;
  *)
    echo 'done'
  ;;
esac
sh ./deploy/docker.sh
