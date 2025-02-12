#!/usr/bin/env bash

set -e

docker run \
  -e "UNITY_LICENSE_CONTENT=$UNITY_LICENSE_CONTENT" \
  -e "TEST_PLATFORM=$TEST_PLATFORM" \
  -e "UNITY_USERNAME=$UNITY_USERNAME" \
  -e "UNITY_PASSWORD=$UNITY_PASSWORD" \
  -w /project/ \
  -v $(pwd)/ci:/ci \
  -v $(pwd)/workingdir/$1:/project/ \
  $IMAGE_NAME \
  /bin/bash -c "/ci/before_script.sh && /ci/simple_test.sh && /ci/print_log.sh"
