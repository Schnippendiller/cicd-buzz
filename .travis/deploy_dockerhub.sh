#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker tag cicd-buzz schnippendiller/cicd-buzz:latest
docker build -f Dockerfile -t schnippendiller/cicd-buzz:latest .
docker push schnippendiller/cicd-buzz:latest
