#!/usr/bin/env bash

set -Eeuo pipefail

NAMESPACE="qa"

echo "======================================"
echo " Deploying Mesh Platform to QA"
echo "======================================"

kubectl get ns ${NAMESPACE} >/dev/null 2>&1 || kubectl create ns ${NAMESPACE}

APPS=(
  frontend
  payment
  inventory
  notification
)

for APP in "${APPS[@]}"
do
    echo ""
    echo "Deploying ${APP}..."

    helm dependency update applications/${APP}

    helm upgrade --install ${APP} \
      applications/${APP} \
      --namespace ${NAMESPACE}

    kubectl rollout status deployment/${APP} \
      -n ${NAMESPACE} \
      --timeout=120s
done

echo ""
echo "======================================"
echo " QA deployment completed successfully"
echo "======================================"