echo "============================="
echo "Go to project $PROJECT folder"
echo "============================="
cd "../../../$PROJECT" || exit
echo GIT Stash
git stash
echo Pull from "$BRANCH" branch
git pull origin "$BRANCH"

echo Go to docker folder
cd "../docker/" || exit
echo Docker up
docker-compose up -d
echo Install and clear cache
docker-compose exec workspace bash -c "cd api && npm install && composer install"
sudo docker-compose exec workspace bash -c "cd $PROJECT && php artisan clear-compiled && php artisan config:clear && php artisan config:cache && php artisan cache:clear && php artisan route:clear && php artisan route:cache && php artisan optimize && composer dumpautoload"
echo Storage link
sudo docker-compose exec workspace bash -c "cd $PROJECT && php artisan storage:link"
echo Migrate data
docker-compose exec workspace bash -c "cd api && echo Y | php artisan migrate"
echo Generate docs
docker-compose exec workspace bash -c "cd api && php artisan apiato:apidoc"
echo Clean docker
echo Y | docker system prune
echo Change logs permissions
docker-compose exec workspace bash -c "cd api && chmod -R 775 storage bootstrap/cache && chmod -R 777 storage"
