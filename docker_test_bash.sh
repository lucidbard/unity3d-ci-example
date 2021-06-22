#!/usr/bin/env bash

set -e
set

docker run -it \
  -e "UNITY_LICENSE_CONTENT=$UNITY_LICENSE_CONTENT" \
  -e "TEST_PLATFORM=$TEST_PLATFORM" \
  -e "UNITY_USERNAME=$UNITY_USERNAME" \
  -e "UNITY_PASSWORD=$UNITY_PASSWORD" \
  -w /project/ \
  -v $(pwd)/ci:/ci \
  -v $(pwd)/workingdir/$ASSIGNMENT-$GITUSER:/project/ \
  $IMAGE_NAME \
  bash