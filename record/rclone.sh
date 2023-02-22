#!/usr/bin/env bash
#Tạo thư mục lưu trữ theo ngày
mkdir /etc/record/camera/$(date +\%d-\%m-\%Y)
#Tự động sync lên cloud và chờ 1h sẽ xóa thư mục cũ
rclone sync /etc/record/camera/$(date +\%d-\%m-\%Y --date='last day')/ cam:camera/$(date +\%d-\%m-\%Y --date='last day') --auto-confirm --check-first -c
sleep 1h
rm -rf /etc/record/camera/$(date +\%d-\%m-\%Y --date='last day')
