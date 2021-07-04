#!/bin/bash

set -v

docker pull erasmolpa/github-client:0.0.9

kubectl apply --filename ./service.yaml
