#!/bin/bash

set -v

#cd helloworld-go

# Build the container on your local machine
#FIXME MAKEFILE docker build -t erasmolpa/knative-go:v0 -f ./helloworld-go/Dockerfile 

# Push the container to docker registry
#FIXME MAKEFILE docker push erasmolpa/knative-go:v0

kubectl apply --filename ./helloworld-go/service.yaml

#with cli --> kn service create helloworld-go --image=docker.io/erasmolpa/knative-go:v0 --env TARGET="Go Sample v1"

kubectl get ksvc helloworld-go  --output=custom-columns=NAME:.metadata.name,URL:.status.url
