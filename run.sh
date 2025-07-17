#!/bin/bash

# バージョン番号を指定
export IMAGE_TAG="1.0.0"

# 毎回変わる現在時刻（秒）をキャッシュ無効化用の変数に設定
export CACHE_BUSTER=$(date +%s)

echo "Building and running image ros_dev:${IMAGE_TAG} with cache buster ${CACHE_BUSTER}..."

# Docker Composeを実行
docker-compose run --build --rm ros bash