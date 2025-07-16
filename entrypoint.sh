#!/bin/bash
set -e

# ROSの環境設定を読み込む
source /opt/ros/noetic/setup.bash

# このスクリプトに渡されたコマンドを実行する（通常は "bash"）
exec "$@"