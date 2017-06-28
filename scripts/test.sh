#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELEASE_DIR="$( dirname "$DIR" )"

shellcheck "${DIR}/test.sh"
find "${RELEASE_DIR}/packages" -name packaging -print0 | xargs -0 shellcheck
shellcheck "${RELEASE_DIR}/jobs/broker/templates/python"
