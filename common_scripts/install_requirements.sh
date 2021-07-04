#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then

brew update
brew install node
npm --version

brew install knative/client/kn
kn version

echo 'installing istio ctl'
brew install istioctl
istioctl --version

brew install helm
helm --version

brew install --cask lens

brew install kind
kind --help

brew install kubectx

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    snap install kubectl --classic
    echo 'installing kind'
#Install kind
sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
sudo chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
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
fi

