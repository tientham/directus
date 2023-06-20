#!/bin/sh
# Author: To Minh Tien (tien.tominh@gmail.com)

set +x

CONTAINER_ID="grf-directus"

echo "*** MANUALLY BUILD ***"

docker rm $(docker stop $(docker ps -a | grep "${CONTAINER_ID}" | cut -d " " -f 1))

docker build --tag ${CONTAINER_ID} .
docker run -p 8055:8055 -e KEY=255d861b-5ea1-5996-9aa3-922530ec40b1 -e SECRET=6116487b-cda1-52c2-b5b5-c8022c45e263 -t ${CONTAINER_ID}

echo "*** End ***"
