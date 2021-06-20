#!/bin/bash

#SEE https://knative.dev/docs/install/knative-with-operators/
echo 'installing knative operator....'
kubectl apply -f https://github.com/knative/operator/releases/download/v0.23.0/operator.yaml

# SEE https://knative.dev/docs/install/install-serving-with-yaml/
echo 'installing istio as networking provider.......'
kubectl apply -f https://github.com/knative/net-istio/releases/download/v0.23.0/istio.yaml


kubectl apply -f https://github.com/knative/net-istio/releases/download/v0.23.0/net-istio.yaml


kubectl --namespace istio-system get service istio-ingressgateway

kubectl get pods --namespace knative-serving


#echo 'installing DNS...'
#kubectl apply -f https://github.com/knative/serving/releases/download/v0.23.0/serving-default-domain.yaml

#SEE https://knative.dev/docs/install/install-eventing-with-yaml/
echo 'installing kative servicing CRD and CORE....'
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.23.0/eventing-crds.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.23.0/eventing-core.yal
kubectl get pods --namespace knative-eventing

echo 'installing broker layer...'

kubectl apply -f https://github.com/knative/eventing/releases/download/v0.23.0/in-memory-channel.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/v0.23.0/mt-channel-broker.yaml

echo 'installing cli'
#SEE https://knative.dev/docs/client/install-kn

brew install knative/client/kn

kn version

echo 'installing istio ctl'
brew install istioctl


echo 'there are more installation topics. Please , take a look to the following site https://knative.dev/docs/install/install-extensions/ '

# SEE https://knative.dev/docs/install/install-extensions/

