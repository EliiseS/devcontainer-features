#!/bin/bash
set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check devcontainer CLI is installed" devcontainer --version
check "Check node version is expected" [[ $(node -v) == v16.* ]] # * is used for pattern matching

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults