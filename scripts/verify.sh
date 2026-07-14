#!/usr/bin/env bash

set -Eeuo pipefail

kubectl get pods -n qa

kubectl get svc -n qa

kubectl get deploy -n qa