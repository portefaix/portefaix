#!/usr/bin/env bash

# SPDX-FileCopyrightText: Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
# SPDX-License-Identifier: Apache-2.0

reset_color="\\e[0m"
color_red="\\e[31m"
color_green="\\e[32m"
color_blue="\\e[36m"

# SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function echo_fail { echo -e "${color_red}✖ $*${reset_color}"; }
function echo_success { echo -e "${color_green}✔ $*${reset_color}"; }
function echo_info { echo -e "${color_blue}\uf120 $*${reset_color}"; }

GITOPS_ARGOCD="./gitops/argocd"
STACKS_DIR="${GITOPS_ARGOCD}/stacks"
ARGOCD_NAMESPACE="gitops"

CLOUD=$1
[ -z "${CLOUD}" ] && echo_fail "Cloud provider not satisfied" && exit 1
echo_info "Cloud provider : ${CLOUD}" >&2

ENV=$2
[ -z "${ENV}" ] && echo_fail "Environment not satisfied" && exit 1
ENV="${ENV//-tailscale/}"
echo_info "Environment    : ${ENV}" >&2

APP=$3
[ -z "${APP}" ] && echo_fail "Application not satisfied" && exit 1
echo_info "Application    : ${APP}" >&2

CHOICE=$4
[ -z "${CHOICE}" ] && echo_fail "Helm action not satisfied" && exit 1
echo_info "Helm           : ${CHOICE}" >&2

echo_info "Namespace: ${ARGOCD_NAMESPACE}" >&2

if [ ! -d "${STACKS_DIR}" ]; then
    echo_fail "${STACKS_DIR} not exists."
    exit 1
fi

release=${APP}
pushd "${STACKS_DIR}" >/dev/null || exit 1
helm dependency build
case ${CHOICE} in
install)
    helm upgrade --install "${release}" . \
        --namespace "${ARGOCD_NAMESPACE}" \
        --values "values.yaml" \
        --values "values-${CLOUD}-${ENV}-${APP}.yaml"
    sleep 1
    echo_success "${APP} installed using Helm release: ${release}" >&2
    ;;
build)
    echo helm template "${release}" . \
        --namespace "${ARGOCD_NAMESPACE}" \
        --values "values.yaml" \
        --values "values-${CLOUD}-${ENV}-${APP}.yaml"
    ;;
*)
    echo_fail "Invalid extension: ${CHOICE}" >&2
    exit 1
    ;;
esac
popd >/dev/null || exit 1
