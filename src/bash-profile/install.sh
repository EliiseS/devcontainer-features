#!/bin/sh
set -e

COMMAND="${COMMAND:-""}"
FILE="${FILE:-""}"

echo "${COMMAND}" >> "$FILE"
# Test if  $_REMOTE_USER_HOME/.bashrc can be set from env and still be exposed

echo "Done!"