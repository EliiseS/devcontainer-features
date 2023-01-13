#!/bin/sh
set -e

COMMAND="${COMMAND:-""}"
FILE="${FILE:-""}"

echo "FILEEEEEEEEE"
echo "$FILE"
echo "${COMMAND}" >> "$FILE"

echo "Done!"