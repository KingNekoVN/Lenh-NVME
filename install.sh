#!/bin/bash
echo "Code By MinhNeko"
# Tải package bổ sung vào để tải
apt-get update && apt-get install -y --no-install-recommends \
    qemu-system-x86 \
    qemu-utils \
    sudo \
    cloud-image-utils \
    software-properties-common \
    genisoimage \
    novnc \
    websockify \
    curl \
    unzip \
    python3-pip \
    openssh-client \
    net-tools \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/* && apt clean

# Tạo thư mục bên trong noVNC
mkdir -p /data /novnc /opt/qemu /cloud-init

# Tải Astro OS
curl -L https://archive.org/download/astro-os-11-24-h-2/AstroOS%2011%2024H2.iso

# Tạo file IMG
qemu-img create -f raw /content/disk.img 112G

# Setup noVNC
curl -L https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.zip -o /tmp/novnc.zip && \
unzip /tmp/novnc.zip -d /tmp && \
mv /tmp/noVNC-1.3.0/* /novnc && \
rm -rf /tmp/novnc.zip /tmp/noVNC-1.3.0

# Cài đặt ngrok
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com bookworm main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok
# Token cho ngrok
ngrok config add-authtoken 2xB1jLlRuHFhvqas7ZDdc4K8G23_4iTdz9zAYYFk3K2YGtiNL

# Tải file start.sh để bắt đầu khởi chạy
wget -O start.sh https://github.com/Snhvn/Ubuntu123/raw/refs/heads/main/start1.sh
clear
echo "Đang chạy vui lòng đừng tắt"
chmod +x start.sh && \
bash start.sh
