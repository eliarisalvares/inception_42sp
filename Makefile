# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: elraira- <elraira-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/10 03:49:33 by elraira-          #+#    #+#              #
#    Updated: 2023/10/10 03:49:46 by elraira-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Define colors
RED=\033[0;31m
GREEN=\033[0;32m
NC=\033[0m #

DATA_PATH=/home/elraira-
DOCKER_COMPOSE_CMD=sudo docker-compose -f ./srcs/docker-compose.yml

all: setup launch

setup:
	@echo "${GREEN}Initializing hosts...${NC}"
	@sudo chmod a+w /etc/hosts
	@sudo cat /etc/hosts | grep elraira-.42.fr || echo "127.0.0.1 elraira-.42.fr" >> /etc/hosts
	@sudo mkdir -p $(DATA_PATH)/data/wp-pages
	@sudo mkdir -p $(DATA_PATH)/data/wp-database

launch:
	$(DOCKER_COMPOSE_CMD) up -d

start-nginx:
	sudo mkdir -p $(DATA_PATH)/data/wp-pages
	$(DOCKER_COMPOSE_CMD) up -d nginx 

rebuild-nginx:
	$(DOCKER_COMPOSE_CMD) up -d --build --force-recreate nginx

stop-nginx:
	$(DOCKER_COMPOSE_CMD) down nginx

start-mariadb:
	sudo mkdir -p $(DATA_PATH)/data/wp-database
	$(DOCKER_COMPOSE_CMD) up -d mariadb 

rebuild-mariadb:
	$(DOCKER_COMPOSE_CMD) up -d --build --force-recreate mariadb

stop-mariadb:
	$(DOCKER_COMPOSE_CMD) down mariadb

start-wordpress:
	sudo mkdir -p $(DATA_PATH)/data/wp-pages
	$(DOCKER_COMPOSE_CMD) up -d wordpress 

rebuild-wordpress:
	$(DOCKER_COMPOSE_CMD) up -d --build --force-recreate wordpress

stop-wordpress:
	$(DOCKER_COMPOSE_CMD) down wordpress

shutdown:
	$(DOCKER_COMPOSE_CMD) down

purge:
	@echo "${RED}Purging data and containers...${NC}"
	@sudo rm -rf $(DATA_PATH)
	@$(DOCKER_COMPOSE_CMD) down -v --rmi all --remove-orphans

full-purge: purge
	@echo "${RED}Performing complete system cleanup...${NC}"
	@sudo docker system prune --volumes --all --force

restart: full-purge initialize

.PHONY: initialize
