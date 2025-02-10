#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

NO_COLOR="\033[0m"
# DEBUG_COLOR="\e[34m"
INFO_COLOR="\e[32m"
# ERROR_COLOR="\e[31m"
# WARN_COLOR="\e[35m"

STEP=${STEP:-step}

CLOUD=$1
[ -z "${CLOUD}" ] && echo "Cloud not satisfied" && exit 1
ENV=$2
[ -z "${ENV}" ] && echo "Environment not satisfied" && exit 1

SECRETS_DIR=".secrets/${CLOUD}/${ENV}/linkerd"
echo -e "${INFO_COLOR}Generate secrets into: ${SECRETS_DIR}${NO_COLOR}"

echo -e "${INFO_COLOR}Trust anchor certificate${NO_COLOR}"
${STEP} certificate create root.linkerd.cluster.local \
    "${SECRETS_DIR}/ca.crt" "${SECRETS_DIR}/ca.key" \
    --profile root-ca --no-password --insecure

echo -e "${INFO_COLOR}Issuer certificate and key${NO_COLOR}"
${STEP} certificate create identity.linkerd.cluster.local \
    "${SECRETS_DIR}/issuer.crt" "${SECRETS_DIR}/issuer.key" \
    --profile intermediate-ca --not-after 8760h --no-password --insecure \
    --ca "${SECRETS_DIR}/ca.crt" --ca-key "${SECRETS_DIR}/ca.key"

crtExpiry=$(date -d '+8760 hour' +"%Y-%m-%dT%H:%M:%SZ")

echo -e "${INFO_COLOR}Create Kubernetes secret${NO_COLOR}"
kubectl --namespace=linkerd create secret generic linkerd-certs \
    --from-literal="crtExpiry=${crtExpiry}" \
    --from-file="${SECRETS_DIR}/ca.crt" \
    --from-file="${SECRETS_DIR}/issuer.crt" \
    --from-file="${SECRETS_DIR}/issuer.key" \
    --dry-run=client -o yaml >secrets.yaml
