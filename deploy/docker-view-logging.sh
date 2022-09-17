echo "============================="
echo "         View Logs           "
echo "============================="
echo "1. Traefik"
echo "2. Nginx"
echo "3. Worker"
echo "4. Prometheus"
echo "5. Grafana"
read -r INPUT_STRING
case $INPUT_STRING in
  1)
    docker-compose logs -f --tail 100 traefik
  ;;
  2)
    docker-compose logs -f --tail 100 nginx
  ;;
  3)
    docker-compose logs -f --tail 100 php-worker
  ;;
  4)
    docker-compose logs -f --tail 100 prometheus
  ;;
  5)
    docker-compose logs -f --tail 100 grafana
  ;;
esac
