#!/usr/bin/env bash
source scripts/include/setup.sh

require_tools helm kubectl xargs_no_run_if_empty

helm delete "${KUBECF_RELEASE}" --namespace "${KUBECF_NS}"
kubectl get --namespace "${KUBECF_NS}" pvc --output name | \
    xargs_no_run_if_empty kubectl delete --namespace "${KUBECF_NS}"
