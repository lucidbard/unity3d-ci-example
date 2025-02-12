#!/usr/bin/env bash

set -x

echo "Testing for $TEST_PLATFORM"

PACKAGE_MANIFEST_PATH="Packages/manifest.json"

${UNITY_EXECUTABLE:-xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity} \
  -runTests \
  -testPlatform $TEST_PLATFORM \
  -testResults /project/$TEST_PLATFORM-results.xml \
  -logFile /project/Editor.log \
  -stackTraceLogType Full \
  -batchmode

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

cat /project/$TEST_PLATFORM-results.xml | grep test-run | grep Passed
exit $UNITY_EXIT_CODE
