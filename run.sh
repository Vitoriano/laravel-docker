#!/bin/bash

echo Uploading Application container
docker-compose up -d --build

#echo Copying the configuration example file
#docker exec -it <app-name>-app cp .env.example .env

#echo Install dependencies
#docker exec -it <app-name>-app composer install

#echo Generate key
#docker exec -it <app-name>-app php artisan key:generate

echo Make migrations
docker exec -it laraveldocker_laravel-app_1 php artisan migrate

echo Make seeds
docker exec -it laraveldocker_laravel-app_1 php artisan db:seed

echo Information of new containers
docker ps
