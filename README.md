# ROS Noetic 開発環境 (Docker + WSL2)

## 概要

win11ではxサーバ系のアプリとしてxmingやvcxservではなくWSLgが推奨されている。これはWSL上でしか動かないため、WSLからdockerコンテナを作成する必要がある。
WSLgはWSL2に標準搭載されているので、WSLのインストールが終わっているならば特に追加設定は必要ない。
本リポジトリは、DockerfileをもとにUbuntu 20.04, ROS Noeticのコンテナを作成することができるファイルである。
DockerfileではROS Noeticや標準的なコマンドのインストールを行わせている。
docker-compose.ymlでは、コンテナを起動する際の設定を含む。
WSL上にROSのワークスペースをおき、それをdockerとマウントする形が有用と考えたためこのようなプログラムとなっている。

実行の仕方は
docker-compose run --build --rm ros bash
でランする
その後ビルドの必要がなければ
./run.sh
で起動できる
起動中のコンテナに入る方法は
docker exec -it "コンテナID" bash

---

## 使用方法

### 1. 前提条件

-   Windows 11
-   WSL2 (Ubuntu 20.04推奨)
-   Docker Desktop for Windows (WSL2 integration有効化)
-   Git

### 2. 環境構築

#### ① リポジトリのクローン

まず、本リポジトリをWSLのホームディレクトリなどにクローンする。

```bash
git clone [https://github.com/Az-san/ros-dev-env.git](https://github.com/Az-san/ros-dev-env.git)
cd ros-dev-env