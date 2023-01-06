#!/bin/bash
set -e

# npm version for Dev Container CLI
DEVCONTAINERS_CLI_VERSION=${VERSION:-"latest"}

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi
check_packages() {
  echo "Checking for missing packages: $@"
  if ! dpkg -s "$@" > /dev/null 2>&1; then
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
      echo "Running apt-get update..."
      apt-get update -y
    fi
    echo "Installing missing packages..."
    apt-get -y install --no-install-recommends "$@"
  fi
}

install_via_npm() {
    PACKAGE=$1
    
    echo "Checking if node and npm are installed..."
    if ! type npm >/dev/null 2>&1; then
        echo "Installing node and npm..."
        check_packages curl ca-certificates
        VERSION=lts
        curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | $SHELL
        export NVM_DIR=/usr/local/share/nvm
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    fi
    echo "Installing npm package: $PACKAGE"
    npm install -g --omit=dev $PACKAGE
}

if [ "$DEVCONTAINERS_CLI_VERSION" != "none" ]; then
	if [ "$DEVCONTAINERS_CLI_VERSION" = "latest" ]; then
		npm_package="@devcontainers/cli"
	else
		npm_package="@devcontainers/cli@$DEVCONTAINERS_CLI_VERSION"
	fi
	install_via_npm ${npm_package}
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
