#!/bin/bash

##SEE https://knative.dev/docs/install/collecting-metrics/
kubectl create namespace metrics

kubectl apply --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml

kubectl patch --namespace knative-serving configmap/config-observability \
  --type merge \
  --patch '{"data":{"metrics.backend-destination":"opencensus","request-metrics-backend-destination":"opencensus","metrics.opencensus-address":"otel-collector.metrics:55678"}}'
kubectl patch --namespace knative-eventing configmap/config-observability \
  --type merge \
  --patch '{"data":{"metrics.backend-destination":"opencensus","metrics.opencensus-address":"otel-collector.metrics:55678"}}'

#echo 'kubectl port-forward --namespace metrics deployment/otel-collector 8889'

kubectl apply --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml

#kubectl apply --filename prometheus.yaml

#echo 'kubectl port-forward --namespace metrics service/prometheus-operated 9090'

#kubectl get pods --namespace metrics -w 

