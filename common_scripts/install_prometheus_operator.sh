#!/bin/bash

##SEE https://knative.dev/docs/install/collecting-metrics/
echo "Creating namespace ..."
kubectl create namespace metrics

#kubectl -n knative-serving patch cm config-observability --patch "$(cat ./config/config-observability-patch.yaml)"

# install prometheus
echo "Updating helm repo prometheus"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "Installing prometheus stack"
helm install prometheus-stack --namespace metrics ./kube-prometheus-stack