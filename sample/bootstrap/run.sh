#!/bin/bash
set -e

echo "################################# AWS STARTUP #################################"

endpoint_url="http://localstack:4566"


echo -ne "===> Setting up local aws account"
aws configure set aws_access_key_id localstack > /dev/null
aws configure set aws_secret_access_key localstack > /dev/null
aws configure set region us-east-1 > /dev/null
echo "... Done"


echo -ne "===> Creating resources"
aws cloudformation create-stack --endpoint-url ${endpoint_url} --stack-name sample-app --template-body file://bootstrap/template.yaml > /dev/null
aws cloudformation wait stack-create-complete --endpoint-url ${endpoint_url} --stack-name sample-app > /dev/null
echo "... Done"


echo "################################# AWS STARTUP #################################"