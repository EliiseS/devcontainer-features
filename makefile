
# Copy all features to the test devcontainer
copy-src:
	cp -r src/ test_devcontainer/.devcontainer

# Build the test devcontainer
# Before running this, copy the test_devcontainer/.devcontainer/devcontainer.example.json and remove the example.
# Then modify the new devcontainer.json to target your desired feature
build: copy-src
	devcontainer build --workspace-folder test_devcontainer/ --log-level trace --no-cache

# Start up the test devcontainer
up: build
	devcontainer up --workspace-folder test_devcontainer/ --log-level debug

# Exec into the test devcontainer
exec: clean-up up 
	docker exec -it dev-container-feature-test /bin/bash

# Remove previously started containers
clean-up:
	- docker rm -f -v $$(docker ps -aq)
	- docker rmi -f  $$(docker images -q)

# Run all tests
tests:
	devcontainer features test --features bash-profile  -i mcr.microsoft.com/devcontainers/base:debian .
	devcontainer features test --features devcontainers-cli  -i mcr.microsoft.com/devcontainers/base:debian .
