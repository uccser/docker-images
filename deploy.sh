#!/bin/bash

function main() {
  ./build.sh

  docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"

  for D in *; do
    if [ -d "${D}" ]; then
      local image=${D}
      local version=`cat ${D}/VERSION`

      docker tag ${DOCKER_USERNAME}/${image}:${version} $DOCKER_USERNAME/${image}:latest
      docker push ${DOCKER_USERNAME}/${image}:latest
      docker push ${DOCKER_USERNAME}/${image}:${version}

      for subD in ${D}/*; do
        if [ -d "${subD}" ]; then
          local version=`cat ${subD}/VERSION`
          docker push ${DOCKER_USERNAME}/${image}:${version}
        fi
      done
    fi
  done
}

main
