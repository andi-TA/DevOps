NAME=DevOps

WEBSITE_PATH=srcs/website

COMPOSE_PATH=srcs/docker-compose.yml

all: ${NAME}

logs:
	docker compose -f ${COMPOSE_PATH} logs -f

${NAME}:
	@sh ssl/script.sh
	docker compose -f ${COMPOSE_PATH} up --build

exec:
	docker compose -f ${COMPOSE_PATH} exec website /bin/bash

stop:
	docker compose -f ${COMPOSE_PATH} stop

start:
	docker compose -f ${COMPOSE_PATH} start

fclean: clean
	docker image prune -f
	docker system prune -f

clean:
	docker compose -f ${COMPOSE_PATH} down --remove-orphans -v --rmi all

re: fclean all

.PHONY: all fclean clean all re