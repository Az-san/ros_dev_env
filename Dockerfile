FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8 \
    NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics

# apt-get install に不足していたROSパッケージを追加
RUN apt-get update && apt-get install -y \
      locales \
      ros-noetic-desktop-full \
      ros-noetic-urdf \
      ros-noetic-slam-karto \ 
      ros-noetic-move-base \ 
      python3.9 python3-pip python3.9-dev \
      git vim nano \
      python3-catkin-tools \
      x11-apps \
 && locale-gen ja_JP.UTF-8 \
 && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

WORKDIR /home/ros/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY requirements.txt .
RUN pip3 install -r requirements.txt

# numpyを強制的に再インストールする
RUN pip3 install --force-reinstall numpy # <-- この行を追加

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]