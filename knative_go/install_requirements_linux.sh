#!/bin/bash

echo 'install kubectl'
snap install kubectl --classic
kubectl version --client

echo 'installing kind'
#Install kind
sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
sudo chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind create cluster --name kind-local

kind get clusters

kubectl cluster-info --context kind-local

echo 'installing cli'
#SEE https://knative.dev/docs/client/install-kn

sudo curl -Lo ./kn https://github.com/knative/client/releases/download/v0.23.1/kn-linux-amd64
sudo chmod +x kn
sudo mv ./kn /usr/local/bin/kn

kn version

echo 'installing istio ctl'

curl -Lo istio.tar.gz https://github.com/istio/istio/releases/download/1.10.1/istioctl-1.10.1-linux-amd64.tar.gz
sudo tar -xvf istio.tar.gz
sudo mv istioctl /usr/local/bin/istioctl

istioctl version
#kind delete cluster --name kind-local
