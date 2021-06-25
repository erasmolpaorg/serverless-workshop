#!/bin/bash

# Install kourier
## Optional (if you don't have it) 
## SEE https://knative.dev/blog/1/01/01/how-to-set-up-a-local-knative-environment-with-kind-and-without-dns-headaches/#step-3-set-up-networking-using-kourier
## curl -Lo kourier.yaml https://github.com/knative-sandbox/net-kourier/releases/download/v0.15.0/kourier.yaml
echo 'Installing kourier'
kubectl apply --filename ./config/kourier.yaml

echo 'Set Kourier as the default networking layer for Knative Serving'
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'

kubectl describe configmap/config-network --namespace knative-serving

echo 'add a “magic” DNS provider (localhost)'
kubectl patch configmap/config-domain \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"127.0.0.1.sslip.io":""}}'

kubectl describe configmap/config-domain --namespace knative-serving

echo 'Get pods of Knative Serving'
kubectl get pods --namespace knative-serving

echo 'Check kourier ports'
kubectl --namespace kourier-system get service kourier
