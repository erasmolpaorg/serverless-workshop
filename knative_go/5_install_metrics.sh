#!/bin/bash

##SEE https://knative.dev/docs/install/collecting-metrics/
kubectl create namespace metrics

kubectl apply --filename https://raw.githubusercontent.com/knative/docs/master/docs/install/collecting-metrics/collector.yaml


#kubectl port-forward --namespace metrics deployment/otel-collector 8889

