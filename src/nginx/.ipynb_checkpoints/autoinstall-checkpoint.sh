#! /bin/bash
echo "Begin to install Nginx surpporint https"
sudo docker build -t auto_nginx:latest ./ 

echo "Begin to output container"
current_time=`date +%H%M%S`
container_name="nginx_"$current_time

work_dir=$(cd $(dirname $0); pwd)
html_dir=$work_dir"/www"
conf_dir=$work_dir"/conf/nginx.conf"
log_dir=$work_dir"/logs"



sudo docker run -d -p 80:80 -p 443:443 --name $container_name -v $html_dir:/usr/share/nginx/html -v $conf_dir:/etc/nginx/nginx.conf -v $log_dir:/var/log/nginx auto_nginx
