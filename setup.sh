#!/usr/bin/env bash
#cài đặt các pack: ntp, epel, unzip, wget, ffmpeg, rclone
sudo yum install -y ntpdate
sudo ln -f -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
sudo ntpdate vn.pool.ntp.org
sudo yum -y install epel-release
sudo yum -y install unzip
sudo yum -y install wget
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum install ffmpeg ffmpeg-devel -y
curl https://rclone.org/install.sh | sudo bash
#tạo thư mục và chmod
sudo mkdir /etc/record
sudo mkdir /etc/record/camera
sudo chmod -R 777 /etc/record
sudo chmod -R 777 /etc/record/camera
sudo wget --no-check-certificate -P /etc/record/ "https://toantinh.net/tools/setup.zip"
sudo unzip -d /etc/record /etc/record/setup.zip
sudo unzip /etc/record/setup.zip
sudo chmod -R 777 /etc/record/record.sh
sudo chmod -R 777 /etc/record/rclone.sh
cron_job="0 * * * * /etc/record/record.sh"
cron_job2="0 0 * * * /etc/record/rclone.sh"
echo "$cron_job" >> /tmp/new_cron_job
echo "$cron_job2" >> /tmp/new_cron_job
# Add the new cron job to the crontab
crontab /tmp/new_cron_job
rm /tmp/new_cron_job