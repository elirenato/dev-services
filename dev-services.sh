#!/bin/bash

profile=$1

shift 

docker-compose -f ./docker-compose/$profile/docker-compose.yaml --env-file ./docker-compose/$profile/.env "$@"