#!/usr/bin/env bash
export UNITY_LICENSE_CONTENT=`cat Unity_v2019.x.ulf`
export UNITY_VERSION=2019.4.0f1
export IMAGE_NAME=gableroux/unity3d:$UNITY_VERSION
source ./.env
export TEST_PLATFORM=editmode
./docker_test.sh