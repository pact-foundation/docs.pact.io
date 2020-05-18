start:
	docker-compose run --name docs-start --rm -p 3000:3000 --entrypoint /usr/bin/make dev-service _start

_build:
	cd website && yarn install && yarn run build

dev:
	docker-compose -f docker-compose-dev.yml run --name dev --rm --entrypoint /bin/sh dev-service

start:
	docker-compose run --name docs-start --rm -p 3000:3000 --entrypoint /usr/bin/make dev-service _start

stop:
	docker rm -f docs-start

_start:
	cd website && yarn start
