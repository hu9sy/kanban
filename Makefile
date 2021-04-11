up:
	docker-compose up -d
down:
	docker-compose down --remove-orphans
stop:
	docker-compose stop
build:
	docker-compose build --no-cache --force-rm
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
fresh:
	docker-compose exec app php artisan migrate:fresh --seed
init:
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan storage:link
	@make fresh
restart:
	@make down
	@make up
web:
	docker-compose exec web sh
app:
	docker-compose exec app bash
db:
	docker-compose exec db bash
sql:
	docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
migration:
	docker-compose exec app php artisan migrate