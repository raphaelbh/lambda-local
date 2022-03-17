#!/bin/bash
set -e

[ -z "$1" ] && echo "!!! function name not informed !!!" && exit

################# Setting up local aws account #################
aws configure set aws_access_key_id localstack > /dev/null
aws configure set aws_secret_access_key localstack > /dev/null
aws configure set region us-east-1 > /dev/null

################ Updating lambda function code #################
lambda_name=${1}
lambda_directory="./lambda"

(cd ${lambda_directory} && rm -f -r -- __pycache__ && rm -f -- lambda.zip && zip -r lambda.zip ./*) > /dev/null
aws lambda update-function-code --endpoint-url http://localhost:4566 --function-name ${lambda_name} --zip-file fileb://${lambda_directory}/lambda.zip
(cd ${lambda_directory} && rm -f -- lambda.zip) > /dev/null

echo "===> Lambda code updated"