NAME=DevOps

WEBSITE_PATH=srcs/website

COMPOSE_PATH=srcs/docker-compose.yml

ELK_PATH=elk/docker-compose.yml

GENERATE_SSL=./ssl/script.sh

all: ${NAME} elk

SERVICE=kibana

COMPOSE=${ELK_PATH}

logs:
	@docker compose -f ${COMPOSE_PATH} logs -f

elk:
	@docker compose -f ${ELK_PATH} up --build -d

${NAME}:
# 	@sh ${GENERATE_SSL}
	@docker compose -f ${COMPOSE_PATH} up --build -d

ps:
	@echo "-----------------------SRCS------------------------"
	@echo
	@docker compose -f ${COMPOSE_PATH} ps -a
	@echo
	@echo "-----------------------SRCS------------------------"
	@echo
	@echo "-----------------------ELK------------------------"
	@echo
	@docker compose -f ${ELK_PATH} ps -a
	@echo
	@echo "-----------------------ELK------------------------"

infoWith:
	@docker compose -f ${COMPOSE} logs ${SERVICE}

exec:
	@docker compose -f ${COMPOSE_PATH} exec website /bin/bash

stop:
	@docker compose -f ${COMPOSE_PATH} stop
	@docker compose -f ${ELK_PATH} stop

start:
	@docker compose -f ${COMPOSE_PATH} start
	@docker compose -f ${ELK_PATH} start

rmVolume:
	@docker volume rm -f $$(docker volume ls -q)

clean:
	@docker compose -f ${COMPOSE_PATH} down --remove-orphans -v --rmi all
	@docker compose -f ${ELK_PATH} down --remove-orphans -v --rmi all

fclean: clean
	@docker image prune -f
	@docker system prune -f

re: fclean all

.PHONY: all fclean clean all re elk