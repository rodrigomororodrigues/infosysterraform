#!/bin/bash

# Create mount volume for logs
  sudo su - root
  mkfs.ext4 /dev/sdf
  mount -t ext4 /dev/sdf /var/log

# Install & Start nginx server
  yum search nginx 
  amazon-linux-extras install nginx1 -y
  systemctl start nginx
  systemctl enable nginx
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  yum install python3 -y
  yum install python3-pip -y
  pip3 install boto3
  aws configure set aws_access_key_id 'AKIASZKKVZKPDK5AEY43'
  aws configure set aws_secret_access_key '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'

  aws s3 cp  s3://flugelbucket/file.py  /usr/share/nginx/html/
  aws s3 cp --recursive s3://flugelbucket/assets/  /usr/share/nginx/html/assets
  aws s3 cp --recursive s3://flugelbucket/images/  /usr/share/nginx/html/images
  sudo chmod +x /usr/share/nginx/html/file.py
  sudo python3 /usr/share/nginx/html/file.py


# Print the hostname which includes instance details on nginx homepage  
#sudo echo Flugel  from `hostname -f` > /usr/share/nginx/html/index.html

  

  