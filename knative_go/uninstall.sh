#!/bin/bash

#SEE https://knative.dev/docs/uninstall/

kubectl delete -f https://github.com/knative/net-istio/releases/download/v0.23.0/net-istio.yaml

kubectl delete -f https://github.com/knative/net-istio/releases/download/v0.23.0/istio.yaml

kubectl delete -f https://storage.googleapis.com/knative-nightly/serving/latest/serving-core.yaml

kubectl delete -f https://storage.googleapis.com/knative-nightly/serving/latest/serving-crds.yaml

kubectl delete -f https://github.com/knative/eventing/releases/download/v0.23.0/in-memory-channel.yaml

kubectl delete -f https://storage.googleapis.com/knative-nightly/eventing/latest/eventing-core.yaml

kubectl delete -f https://storage.googleapis.com/knative-nightly/eventing/latest/eventing-crds.yaml

kubectl delete KnativeServing knative-serving -n knative-serving

kubectl delete KnativeEventing knative-eventing -n knative-eventing

kubectl delete -f https://github.com/knative/operator/releases/download/v0.23.0/operator.yaml
