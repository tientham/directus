#!/bin/sh
# Author: To Minh Tien (tien.tominh@gmail.com)

set +x

CONTAINER_ID="grf-directus"

echo "*** MANUALLY BUILD ***"

docker rm $(docker stop $(docker ps -a | grep "${CONTAINER_ID}" | cut -d " " -f 1))

docker build --tag ${CONTAINER_ID} .
docker run -p 8055:8055 -t ${CONTAINER_ID}

echo "*** End ***"
