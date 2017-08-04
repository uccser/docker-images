#!/bin/bash
function containsElement() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 1; done
  return 0
}

function build() {
  local image=$1
  local directory=$2
  local username=${DOCKER_USERNAME:-uccser}
  echo "Building: ${directory}"
  docker build -t "${username}/${image}:`cat ${directory}/VERSION`" $directory
  local build_status=$?
  return ${build_status}
}

function main() {
  declare -A todo=()
  local built=()
  for D in *; do
    if [ -d "${D}" ]; then
      todo+=(["${D}"]=${D})
      for subD in ${D}/*; do
        if [ -d "${subD}" ]; then
          todo+=(["${subD}"]=${D})
        fi
      done
    fi
  done

  local errored=()
  local delete_keys=()
  local previous=2147483648
  while [ ! ${#todo[@]} -eq 0 ]; do
    for D in ${!todo[@]}; do
      local ready=1
      FILE="${D}/REQUIRES"
      if [ -f ${FILE} ]; then
        local requires=`cat ${FILE}`
        readarray -t ADDR <<<"$requires"

        for i in "${ADDR[@]}"; do
          if containsElement "${i}" "${built[@]}"; then
            ready=0
          fi
        done
      fi

      if [ ${ready} -eq 1 ]; then
        local image=${todo["${D}"]}
        if build ${image} ${D}; then
          built+=("${D}")
          delete_keys+=("${D}")
        else
          errored+=("${D}")
        fi
      fi
    done

    for i in ${delete_keys[@]}; do
      unset todo["${i}"]
    done
    unset delete_keys
    local delete_keys=()

    if [ ${#todo[@]} -eq ${previous} ]; then
      echo "Error: could not build anymore images."
      for D in ${!todo[@]}; do
        errored+=("${D}")
      done
      unset todo
    else
      echo "Images to build: ${todo[*]}"
    fi
    previous=${#todo[@]}
  done
  echo "-----------------------"
  echo "Built: ${built[*]}"
  echo "Errored: ${errored[*]}"

  if [ ${#errored[*]} -gt 0 ]; then
    return 1
  else
    return 0
  fi
}

main
