#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check empty line is added to .bashrc when command is not set" [ "$(tail -1 /root/.bashrc |  tr -d ' \n\r\t ' | wc -c)" -eq 0 ]


# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults