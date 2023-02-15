# Lambda Local

[![Project Status](https://img.shields.io/static/v1?label=project%20status&message=complete&color=success&style=flat-square)](#)

Docker image for invoke lambda locally.

> AWS Lambda is a serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers. You can trigger Lambda from over 200 AWS services and software as a service (SaaS) applications, and only pay for what you use. [Documentation](https://aws.amazon.com/lambda)

https://hub.docker.com/r/raphaelbh/lambda


Available actions:
- invoke ${event}
- update-code ${lambda-name}


`update-code`: update lambda code created in the [localstack](https://localstack.cloud/)


## Requirements

[![docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

## Installation

```bash
$ docker build -t raphaelbh/lambda:latest .
```

## Usage

A folder with the lambda function must be informed through a volume:
`{your_folder}:/lambda`

Important:
- `/var/run/docker.sock` should be shared as volume
- Local network should be shared `--net=host`

```bash
# create alias for container run
alias lambda="docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/sample/lambda:/lambda --net=host raphaelbh/lambda"
```

```bash
# call invoke action
$ lambda invoke '{"key":"value"}'
or
$ lambda invoke $(cat sample/events/event.json | tr -d " \t\n\r")
```

```bash
# call update-code action
$ lambda update-code 'LambdaFunctionName'
```


## Tech Stack

[![docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![shellscript](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.shellscript.sh/)

## Reference

- https://docs.aws.amazon.com/lambda/latest/dg/images-create.html

## Feedback

If you have any feedback, please contact me at raphaeldias.ti@gmail.com

[![github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/raphaelbh)
[![linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/raphaelbh/)
