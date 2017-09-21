#!/bin/bash
#
# Runs unit_tests
#
set -exo pipefail

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BIN_DIR/set_git_env_vars.sh

TEST_IMAGE_TAG="mozmeao/nucleus:${GIT_COMMIT}"
docker run --rm --env-file docker/envfiles/test.env "$TEST_IMAGE_TAG" bin/run-tests.sh
