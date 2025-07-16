#!/bin/bash

# --- ここでバージョン番号を指定 ---
export IMAGE_TAG="1.0.0" 
# --------------------------------

echo "Building and running image ros_dev:${IMAGE_TAG}..."

# Docker Composeを実行
docker-compose run --rm ros bash