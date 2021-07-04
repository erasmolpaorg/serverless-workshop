#!/bin/bash

set -v

npm install

serverless deploy

serverless invoke -f hello
