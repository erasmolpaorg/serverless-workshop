
brew install kind

kind create cluster --name kind-local

kind get clusters

kubectl cluster-info --context kind-kind-local

echo 'installing cli'
#SEE https://knative.dev/docs/client/install-kn

brew install knative/client/kn

kn version

echo 'installing istio ctl'
brew install istioctl

