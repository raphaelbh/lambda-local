#!/bin/bash
set -e

payload=${1:-'{}'}

docker rm -f lambda 2> /dev/null || true
docker build -t lambda /lambda > /dev/null
docker run -d --net=host --name lambda --env-file /lambda/.env lambda > /dev/null

response=$(curl -X POST "http://localhost:8080/2015-03-31/functions/function/invocations" -H 'Content-Type: application/json' -d $payload)

printf "\n===> Logs\n"
docker logs --details lambda

printf "\n===> Response\n"
echo $response | jq '.'

docker rm -f lambda > /dev/null