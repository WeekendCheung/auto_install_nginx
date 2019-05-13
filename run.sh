#! /bin/bash
echo "Begin to install Nginx surpport https"
sudo docker build -t auto_nginx:latest -f ./src/nginx/Dockerfile ./src/nginx

echo "Begin to output container"
current_time=`date +%H%M%S`
container_name="nginx_"$current_time

work_dir=$(cd $(dirname $0); pwd)
html_dir=$work_dir"/src/nginx/www"
conf_dir=$work_dir"/src/nginx/conf/nginx.conf"
myconf_dir=$work_dir"/src/nginx/conf/myconf"
log_dir=$work_dir"/src/nginx/logs"

#if you want to keep this container running after testing, use this script
sudo docker run -d -p 80:80 -p 443:443 --name $container_name -v $html_dir:/usr/share/nginx/html -v $conf_dir:/etc/nginx/nginx.conf -v $myconf_dir:/etc/nginx/conf.d -v $log_dir:/var/log/nginx auto_nginx

#if you just create this container for testing and want to remove it after testing, use this script
#sudo docker run -d --rm -p 80:80 -p 443:443 --name $container_name -v $html_dir:/usr/share/nginx/html -v $conf_dir:/etc/nginx/nginx.conf -v $myconf_dir:/etc/nginx/conf.d -v $log_dir:/var/log/nginx auto_nginx
echo "Build successfully"

echo "Begin to install apachebench"
sudo docker build -t my_apachebench:latest -f ./src/Apachebench/Dockerfile ./src/Apachebench

echo "Begin to test performance of nginx-ssl"
sudo docker run --name ab_test --network host --rm apachebench -c 10 -n 100 localhost/index.html
