#!/bin/bash

set -v

export KNATIVE_SERVING_VERSION="0.23.1"

export KNATIVE_EVENTING_VERSION="0.23.2"


echo 'there are more installation topics. Please , take a look to the following site https://knative.dev/docs/install/install-extensions/ '

# SEE https://knative.dev/docs/install/install-extensions/


#SEE https://knative.dev/docs/install/knative-with-operators/
echo 'installing knative operator....'
kubectl apply -f "https://github.com/knative/operator/releases/download/v${KNATIVE_SERVING_VERSION}/operator.yaml"


kubectl apply -f "https://github.com/knative/serving/releases/download/v${KNATIVE_SERVING_VERSION}/serving-crds.yaml"

# Install Serving Core Components
kubectl apply -f "https://github.com/knative/serving/releases/download/v${KNATIVE_SERVING_VERSION}/serving-core.yaml"

# Install Istio
#kubectl apply -f "https://github.com/knative/net-istio/releases/download/v${KNATIVE_SERVING_VERSION}/istio.yaml"

# Install Knative Istio Controller
#kubectl apply -f "https://github.com/knative/net-istio/releases/download/v${KNATIVE_SERVING_VERSION}/net-istio.yaml"

# Check pods have STATUS 'Running'
#kubectl get pods -n istio-system

# Optional: Setup Magic DNS (xip.io)
kubectl apply -f "https://github.com/knative/serving/releases/download/v${KNATIVE_SERVING_VERSION}/serving-default-domain.yaml"



# Check pods have STATUS 'Running'
kubectl get pods -n knative-serving

# Install Eventing CRDs
kubectl apply -f "https://github.com/knative/eventing/releases/download/v${KNATIVE_EVENTING_VERSION}/eventing-crds.yaml"


# Install Eventing Core
kubectl apply -f "https://github.com/knative/eventing/releases/download/v${KNATIVE_EVENTING_VERSION}/eventing-core.yaml"

# Install default in-memory channel (not suitable for production)
kubectl apply -f "https://github.com/knative/eventing/releases/download/v${KNATIVE_EVENTING_VERSION}/in-memory-channel.yaml"

# Install default Broker
kubectl apply -f "https://github.com/knative/eventing/releases/download/v${KNATIVE_EVENTING_VERSION}/mt-channel-broker.yaml"

# Install Sugar Controller
kubectl apply -f "https://github.com/knative/eventing/releases/download/v${KNATIVE_EVENTING_VERSION}/eventing-sugar-controller.yaml"

#Install HPA 
# SEE THIS DOCUMENTATION https://knative.dev/docs/install/installation-files/
kubectl apply -f "https://github.com/knative/serving/releases/download/v${KNATIVE_EVENTING_VERSION}/serving-hpa.yaml"

# Check pods have STATUS 'Running'
kubectl get pods -n knative-eventing

