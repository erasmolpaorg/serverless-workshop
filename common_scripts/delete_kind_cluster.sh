#!/bin/bash
set -o nounset
set -x

CLUSTER_NAME=${1:-kind-cluster}

kind delete cluster --name ${CLUSTER_NAME}