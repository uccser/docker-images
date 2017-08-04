#!/bin/bash
function containsElement() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 1; done
  return 0
}

function build() {
  local image=$1
  local directory=$2

  echo "Building: ${directory}"
  docker build -t "uccser/${image}:`cat ${directory}/VERSION`" $directory
  local build_status=$?
  return ${build_status}
}

function main() {
  local todo=()
  local built=()
  for D in *; do
    if [ -d "${D}" ]; then
      todo+=(${D})
      for subD in ${D}/*; do
        if [ -d "${subD}" ]; then
          todo+=(${subD})
        fi
      done
    fi
  done

  local errored=()
  local backbuffer=()
  while [ ! ${#todo[@]} -eq 0 ]; do
    for D in ${todo[*]}; do
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
        if build ${D} ${D}; then
          built+=("${D}")
        else
          errored+=("${D}")
        fi
      else
        backbuffer+=("${D}")
      fi
    done
    local todo=( "${backbuffer[@]}" )
    local backbuffer=()
    echo "TODO: ${todo[*]}"
  done
  echo "-----------------------"
  echo "Built: ${built[*]}"
  echo "Errored: ${errored[*]}"
}

main
