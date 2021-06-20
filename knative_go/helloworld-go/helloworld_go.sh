#!/bin/bash

set -v

cd helloworld-go

# Build the container on your local machine
docker build -t erasmolpa/knative-go:v0 .

# Push the container to docker registry
docker push erasmolpa/knative-go:v0

kn service create helloworld-go --image=docker.io/erasmolpa/knative-go:v0 --env TARGET="Go Sample v1"

kubectl get ksvc

#echo 'debug ingress status' 
#echo 'debug ingress status' 
#kubectl get svc -n istio-system istio-ingressgateway
#kubectl describe svc istio-ingressgateway -n istio-system
#kubectl get ingresses.networking.internal.knative.dev -o=custom-columns='NAME:.metadata.name,LABELS:.metadata.labels'

