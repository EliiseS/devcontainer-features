#!/bin/bash

set -e

source dev-container-features-test-lib

check "Check enviorment variable is set as expected: HELLO:$HELLO" [ "$(echo $HELLO)" == "USER_PROFILE" ]

reportResults