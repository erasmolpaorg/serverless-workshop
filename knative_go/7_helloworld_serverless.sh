#!/bin/bash
set -v

serverless login

serverless deploy

serverless invoke -f helloworld-go

#serverless remove