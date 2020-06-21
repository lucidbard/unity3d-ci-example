#!/usr/bin/env bash
set -e
export REPO=$ASSIGNMENT-$GITUSER
#rm -rf workingdir/$REPO
if [ -d workingdir/$REPO ]; then
git -C workingdir checkout -b submit --single-branch https://github.com/UCF-GaiM/$REPO
fi
source ./.env
export UNITY_LICENSE_CONTENT=`cat Unity_v2019.x.ulf`
export UNITY_VERSION=2019.4.0f1
export IMAGE_NAME=gableroux/unity3d:$UNITY_VERSION
export TEST_PLATFORM=editmode
./docker_test_git.sh