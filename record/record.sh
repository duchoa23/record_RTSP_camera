#!/bin/bash
# Kiểm tra thư mục tạo chưa
directory="/etc/record/camera"
date=`date +\%d-\%m-\%Y`
path="$directory/$date"
# Check if the directory exists
if [ ! -d "$path" ]; then
    # If the directory does not exist, create it
    mkdir "$path"
    echo "Directory created: $path"
else
    echo "Directory already exists: $path"
fi
#chờ 3s và bắt đầu record video trong tầm 1h, vị trí lưu video trong /etc/record/camera
sleep 3
sudo ffmpeg -i rtsp://user:pass@tenmiendns:port/profile0 -vcodec copy -r 60 -t 3580 -y /etc/record/camera/$(date +\%d-\%m-\%Y)/$(date +\%d-\%m-\%Y--\%H-\%M).mp4
