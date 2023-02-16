# Sample Lambda Local

## Installation

```bash
$ docker-compose up -d
```

## Usage

```bash
# create alias for container run
$ alias lambda="docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/lambda:/lambda --net=host raphaelbh/lambda"
```

```bash
# call invoke action
$ lambda invoke
```

```bash
# call update-code action
$ lambda update-code 'sample-function'
```