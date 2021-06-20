#!/bin/bash

set -v


# Build the container on your local machine
docker build -t erasmolpa/rest-api-go .

# Push the container to docker registry
docker push erasmolpa/rest-api-go 

kn service create rest-api-go --image=docker.io/erasmolpa/rest-api-go --env TARGET="REST Go Sample v1"

kubectl get ksvc

#echo 'debug ingress status' 
#echo 'debug ingress status' 
#kubectl get svc -n istio-system istio-ingressgateway
#kubectl describe svc istio-ingressgateway -n istio-system
#kubectl get ingresses.networking.internal.knative.dev -o=custom-columns='NAME:.metadata.name,LABELS:.metadata.labels'
