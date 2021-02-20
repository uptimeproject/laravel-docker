#!/bin/bash
set -e

AUTHOR="uptimeproject"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

MODE=${1:--local}

function print_info {
  printf $GREEN
  printf "$1\n"
  printf $NC
}
function print_error {
  printf $RED
  printf "$1\n"
  printf $NC
}

function deploy {
  CONTEXT=$1
  FILE="$1/$2"
  IMAGE="$AUTHOR/$1"
  TAG=$(printf $2 | sed 's/\.[^.]*$//')
  print_info "Building image $IMAGE:$TAG"
  docker build -t $IMAGE:$TAG --file $FILE $CONTEXT
  if [ "$MODE" = "--release" ]; then
    print_info "Releasing image $IMAGE:$TAG"
    docker push $IMAGE:$TAG
  fi
}

# Run
if [ "$MODE" = "--release" ]; then
  print_info "\nBUILD AND RELEASE CONTAINERS\n"
else
  print_info "\nBuild containers locally\n"
fi

for build_context in *; do
  if [ -d "$build_context" ]; then
    print_info "Checking build context '$build_context' for dockerfiles.."
    cd $build_context
    for dockerfile in *.dockerfile; do
      if [ -f "$dockerfile" ]; then
        cd ..
        deploy $build_context $dockerfile
        cd $build_context
      fi
    done
    cd ..
  fi
done
