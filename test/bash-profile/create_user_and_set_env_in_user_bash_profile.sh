#!/bin/bash

set -e

source dev-container-features-test-lib

check "Check enviorment variable is set as expected: HELLO:$HELLO" [ "$(echo $HELLO)" == "VSCODE_USER_PROFILE" ]

reportResults