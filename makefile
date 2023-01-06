copy-src:
	cp -r src/ test_devcontainer/.devcontainer

build: copy-src
	devcontainer build --workspace-folder test_devcontainer/ --log-level trace --no-cache

up: build
	devcontainer up --workspace-folder test_devcontainer/ --log-level debug

exec: kill up 
	docker exec -it dev-container-feature-test /bin/bash

kill:
	docker rm -f -v $$(docker ps -aq)
	docker rmi -f  $$(docker images -q)

tests:
	devcontainer features test --features bash-profile  -i mcr.microsoft.com/devcontainers/base:debian .
