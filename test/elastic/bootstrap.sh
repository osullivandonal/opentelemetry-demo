#!/usr/bin/env bash
set -euo pipefail
# Place your common test setup here

set -a
source .env.override
set +a

if [[ -n "${INTEGRATION_TEST_IMAGE_NAME:-}" ]]; then
  export IMAGE_NAME="$INTEGRATION_TEST_IMAGE_NAME"
fi

if [[ -n "${INTEGRATION_TEST_DEMO_VERSION:-}" ]]; then
  export DEMO_VERSION="$INTEGRATION_TEST_DEMO_VERSION"
fi

CURRENT_DIR=$(pwd)
export CURRENT_DIR
export START_LOCAL_DIR="${CURRENT_DIR}/elastic-start-local"
export START_LOCAL_ENV_PATH="${START_LOCAL_DIR}/.env"
export START_LOCAL_UNINSTALL_FILE="${START_LOCAL_DIR}/uninstall.sh"
