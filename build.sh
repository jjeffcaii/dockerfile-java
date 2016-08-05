#! /bin/sh
IMG="jjeffcaii/java"
if [ -z "$1" ]; then
    echo "usage: build.sh <version>"
    exit 1
fi

docker build -f `dirname $0`/Dockerfile-$1 -t $IMG:$1 . && docker push $IMG:$1
