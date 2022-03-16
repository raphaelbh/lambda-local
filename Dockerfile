FROM alpine
LABEL maintainer="raphaeldias.ti@gmail.com"

RUN apk update
RUN apk add --update docker openrc
RUN apk --no-cache add curl
RUN apk --no-cache add jq

COPY entrypoint.sh .
COPY /commands /commands

ENTRYPOINT [ "sh", "entrypoint.sh" ]