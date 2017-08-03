#!/bin/bash
function containsElement() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function build() {
  local image=$1
  local directory=$2

  docker build -t "uccser/${image}:`cat ${directory}/VERSION`" $directory
  local build_status=$?
  return ${build_status}
}

todo=()
built=()
for D in *; do
  if [ -d "${D}" ]; then
    if build ${D} ${D}; then
      built+=("${D}")
    fi

    # for subD in ${D}/*; do
    #   if [ -d "${subD}" ]; then
    #     docker build -t "uccser/${D}:`cat ${D}/${subD}/VERSION`" ${subD}
    #     built += ("${D}/${subD}")
    #   fi
    # done
  fi
done
echo "Built: ${built[*]}"
