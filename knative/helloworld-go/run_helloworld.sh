#!/bin/bash

set -v

#cd helloworld-go

# Build the container on your local machine
#FIXME MAKEFILE 
#docker build -t knativeserving/helloworld-go .

# Push the container to docker registry
#FIXME MAKEFILE 

kubectl apply --filename ./helloworld-go/service.yaml

#with cli --> kn service create helloworld-go --image=docker.io/erasmolpa/knative-go:v0 --env TARGET="Go Sample v1"

kubectl get ksvc helloworld-go  --output=custom-columns=NAME:.metadata.name,URL:.status.url

kubectl get routes
kubectl get ksvc
kubectl get configurations
kubectl -n knative-serving  get cm config-autoscaler -o yaml
