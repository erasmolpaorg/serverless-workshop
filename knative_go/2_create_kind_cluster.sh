
brew install kind

# Create cluster
echo 'Create cluster with 1 worker'
kind create cluster --name kind-knative --config ./config/clusterconfig.yaml

kind get clusters

