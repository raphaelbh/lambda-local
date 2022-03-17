FROM alpine
LABEL maintainer="raphaeldias.ti@gmail.com"

RUN apk update

RUN apk add --no-cache \ 
    python3 \
    py3-pip \
    curl \
    zip \
    unzip \
    jq

RUN apk add --update docker openrc

RUN pip3 install --upgrade pip
RUN pip3 install awscli

RUN rm -rf /var/cache/apk/*

COPY entrypoint.sh .
COPY /commands /commands

ENTRYPOINT [ "sh", "entrypoint.sh" ]