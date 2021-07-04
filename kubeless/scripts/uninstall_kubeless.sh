#!/bin/bash
echo 'Removing Kubeless in your local Cluster.....'
kubectl delete ns kubeless
sudo rm -r /usr/local/bin/kubeless