echo "============================="
echo "       Restart Images        "
echo "============================="
echo "0. All"
echo "1. Traefik and Nginx"
echo "2. Traefik"
echo "3. Nginx"
echo "4. Worker"
echo "5. Prometheus"
echo "6. Grafana"
read -r INPUT_STRING
case $INPUT_STRING in
  0)
    docker-compose restart
  ;;
  1)
    docker-compose stop traefik && echo Y | docker-compose rm traefik && docker-compose build traefik
    docker-compose stop nginx && echo Y | docker-compose rm nginx && docker-compose build nginx
  ;;
  2)
    docker-compose stop traefik && echo Y | docker-compose rm traefik && docker-compose build traefik
  ;;
  3)
    docker-compose stop nginx && echo Y | docker-compose rm nginx && docker-compose build nginx
  ;;
  4)
    docker-compose restart php-worker
  ;;
  5)
    docker-compose restart prometheus
  ;;
  6)
    docker-compose stop grafana && echo Y | docker-compose rm grafana && docker-compose build grafana
  ;;
esac
docker-compose up -d --remove-orphans
