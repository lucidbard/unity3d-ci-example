UNITY_VERSION=2019.4.0f1
docker run -it --rm \
-e "UNITY_USERNAME=john@lucidbard.com" \
-e "UNITY_PASSWORD=68rW8DBsfAXUUg" \
-e "TEST_PLATFORM=linux" \
-e "WORKDIR=/root/project" \
-v "$(pwd):/root/project" \
gableroux/unity3d:$UNITY_VERSION \
bash