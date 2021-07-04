#!/bin/bash

##SEE https://knative.dev/docs/install/collecting-metrics/
kubectl create namespace metrics

kubectl -n knative-serving patch cm config-observability --patch "$(cat ./config/config-observability-patch.yaml)"

# Installing Collector
# collector example of knative
# kubectl apply --filename https://raw.githubusercontent.com/knative/docs/master/docs/install/collecting-metrics/collector.yaml
# collector open telemitry
kubectl apply -f https://raw.githubusercontent.com/open-telemetry/opentelemetry-collector/main/examples/k8s/otel-config.yaml -n metrics

kubectl patch --namespace knative-serving configmap/config-observability \
  --type merge \
  --patch '{"data":{"metrics.backend-destination":"opencensus","request-metrics-backend-destination":"opencensus","metrics.opencensus-address":"otel-collector.metrics:55678"}}'
kubectl patch --namespace knative-eventing configmap/config-observability \
  --type merge \
  --patch '{"data":{"metrics.backend-destination":"opencensus","metrics.opencensus-address":"otel-collector.metrics:55678"}}'

kubectl port-forward --namespace metrics deployment/otel-collector 8889