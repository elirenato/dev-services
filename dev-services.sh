#!/bin/bash

profile=$1

shift 

if [[ ! -d "./profiles/$profile" ]];
then
   echo "Profile $profile does not exists"
   exit 1
fi

if [[ "$profile" == "keycloak-only" && "$1" == *"up"* ]];
then
    echo "Checking Postgresql availability"
    for i in {1..40}
    do
        healthStatus=$(docker ps --filter name=postgresql --format='{{json .Status}}')
        if [[ "$healthStatus" == *"healthy"* ]];
        then
            echo -n "Postgresql is available"
            break
        elif [[ "$healthStatus" == *"unhealthy"* ]]; 
    	then
            echo "Postgresql is NOT available"
            exit 1
        fi
        echo -n "."
        sleep 3
    done
    echo ""
fi

docker-compose -f ./profiles/$profile/docker-compose.yaml --env-file ./profiles/$profile/.env "$@"
