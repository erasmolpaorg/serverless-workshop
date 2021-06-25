
brew install kind

# Create cluster
echo 'Create cluster with 1 worker'
kind create cluster --name knative --config ./config/clusterconfig.yaml

kind get clusters

kubectl cluster-info --context kind-kind-local

