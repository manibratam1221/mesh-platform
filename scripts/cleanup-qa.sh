#!/usr/bin/env bash

set -Eeuo pipefail

for APP in frontend payment inventory notification
do
    helm uninstall ${APP} -n qa || true
done