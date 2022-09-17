echo "============================="
echo "          SSH Image          "
echo "============================="
echo "0. Workspace"
echo "1. Traefik"
echo "2. Nginx"
echo "3. Worker"
echo "4. Prometheus"
echo "5. Grafana"
echo "6. Redis"
echo "7. Mariadb"
read -r INPUT_STRING
case $INPUT_STRING in
  0)
    docker-compose exec workspace bash
  ;;
  1)
    docker-compose exec traefik bash
  ;;
  2)
    docker-compose exec nginx bash
  ;;
  3)
    docker-compose exec php-worker bash
  ;;
  4)
    docker-compose exec prometheus bash
  ;;
  5)
    docker-compose exec grafana bash
  ;;
  6)
    docker-compose exec redis bash
  ;;
  7)
    docker-compose exec mariadb bash
  ;;
esac
