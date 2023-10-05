all: setup up

setup:
	@sudo echo "Setting hosts..."
	@sudo chmod a+w /etc/hosts
	@sudo cat /etc/hosts | grep elraira-.42.fr || echo "127.0.0.1 elraira-.42.fr" >> /etc/hosts
	@sudo mkdir -p /home/elraira-/data/wp-pages
	@sudo mkdir -p /home/elraira-/data/wp-database

up:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

nginx:
	sudo mkdir -p /home/elraira-/data/wp-pages
	sudo docker-compose -f ./srcs/docker-compose.yml up -d nginx 

build-nginx:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build --force-recreate nginx

down-nginx:
	sudo docker-compose -f ./srcs/docker-compose.yml down nginx

mariadb:
	sudo mkdir -p /home/elraira-/data/wp-database
	sudo docker-compose -f ./srcs/docker-compose.yml up -d mariadb 

build-mariadb:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build --force-recreate mariadb

down-mariadb:
	sudo docker-compose -f ./srcs/docker-compose.yml down mariadb

wordpress:
	sudo mkdir -p /home/elraira-/data/wp-pages
	sudo docker-compose -f ./srcs/docker-compose.yml up -d wordpress 

build-wordpress:
	sudo docker-compose -f ./srcs/docker-compose.yml up -d --build --force-recreate wordpress

down-wordpress:
	sudo docker-compose -f ./srcs/docker-compose.yml down wordpress

down:
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@sudo rm -rf /home/elraira-
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean: clean
	@sudo docker system prune --volumes --all --force

re: fclean all

.PHONY: all
