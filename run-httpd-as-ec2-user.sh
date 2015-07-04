#!/usr/bin/env bash

set -ex

service monit stop

sed -i -e "s/^user .*;$/user ec2-user ec2-user;/" /etc/nginx/nginx.conf
sed -i -e "s/^listen.owner .*$/listen.owner = ec2-user/" /etc/php-fpm.d/www.conf
sed -i -e "s/^listen.group .*$/listen.group = ec2-user/" /etc/php-fpm.d/www.conf
sed -i -e "s/^user .*$/user = ec2-user/" /etc/php-fpm.d/www.conf
sed -i -e "s/^group .*$/group = ec2-user/" /etc/php-fpm.d/www.conf
sed -i -e "s/nginx:nginx/ec2-user:ec2-user/g" /etc/monit.d/php-fpm
sed -i -e "s/nginx:nginx/ec2-user:ec2-user/g" /etc/monit.d/nginx

chown -R ec2-user:ec2-user /var/www/vhosts
chown -R ec2-user:ec2-user /var/tmp/php/session
chown -R ec2-user:ec2-user /var/lib/nginx

service php-fpm restart
service nginx restart
service monit start
