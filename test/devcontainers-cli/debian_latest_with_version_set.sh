#!/bin/bash
set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check devcontainer CLI version is expected"  [ "$(devcontainer --version)" == "0.27.1" ]

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults