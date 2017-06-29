#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RELEASE_DIR="$( dirname "$DIR" )"

find_bash_scripts() {
  find \
    "${RELEASE_DIR}/jobs" \
    "${RELEASE_DIR}/packages" \
    "${RELEASE_DIR}/scripts" \
    "${RELEASE_DIR}/src" \
    -type f -print0 \
    | xargs -0 grep -l '^#!/usr/bin/env bash$'
}

find_bash_scripts | xargs shellcheck
