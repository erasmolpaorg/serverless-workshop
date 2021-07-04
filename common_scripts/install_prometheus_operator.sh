#!/bin/bash

##SEE https://knative.dev/docs/install/collecting-metrics/
kubectl create namespace metrics

kubectl -n knative-serving patch cm config-observability --patch "$(cat ./config/config-observability-patch.yaml)"

# install prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus-stack --namespace metrics prometheus-community/kube-prometheus-stack