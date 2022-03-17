#!/bin/bash

COMMAND=$1

if [ $COMMAND != "invoke" ] && [ $COMMAND != "update-code" ]; then
  echo "!!! command not found !!!"
  exit
fi

sh "commands/$COMMAND.sh" $2
