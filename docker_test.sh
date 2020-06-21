#!/usr/bin/env bash

set -e
set

docker run \
  -e "UNITY_LICENSE_CONTENT=$UNITY_LICENSE_CONTENT" \
  -e "TEST_PLATFORM=$TEST_PLATFORM" \
  -e "UNITY_USERNAME=$UNITY_USERNAME" \
  -e "UNITY_PASSWORD=$UNITY_PASSWORD" \
  -w /project/ \
  -v $(pwd):/project/ \
  $IMAGE_NAME \
  /bin/bash -c "/project/ci/before_script.sh && /project/ci/simple_test.sh"
