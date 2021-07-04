#!/bin/bash

set -v

npm install

serverless deploy

serverless invoke -f serverless-fwk-example
