#!/usr/bin/env bash
set -e
export REPO=$1-$2
#rm -rf workingdir/$REPO
if [ -d workingdir/$REPO ]; then
  git --git-dir=$(pwd)/workingdir/$REPO/.git --work-tree=$(pwd)//workingdir/$REPO pull
else 
  git -C workingdir clone --single-branch -b submit  https://github.com/UCF-GaiM/$REPO
fi
source ./.env
export UNITY_LICENSE_CONTENT=`cat Unity_v2019.x.ulf`
export UNITY_VERSION=2019.4.0f1
export IMAGE_NAME=gableroux/unity3d:$UNITY_VERSION
export TEST_PLATFORM=playmode
./docker_test_git.sh $REPO