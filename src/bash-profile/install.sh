#!/bin/sh
set -e

COMMAND="${COMMAND:-""}"
FILE="${FILE:-""}"

echo "${COMMAND}" >> "$FILE"

echo "Done!"