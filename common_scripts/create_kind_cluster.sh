#!/bin/bash
set -o nounset
set -x

CLUSTER_NAME=${1:-kind-cluster}

# Create cluster
echo 'Create cluster with 1 worker'

kind create cluster --name ${CLUSTER_NAME} --config ./clusterconfig.yaml

kind get clusters

echo 'cluster nodes'
kubectl get nodes
