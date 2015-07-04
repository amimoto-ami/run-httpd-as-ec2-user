#!/usr/bin/env bash

set -e

hhvm --version

if [ $? == 0 ]; then
echo '{
"nginx" : { "config" : { "user" : "ec2-user" } },
"php" : { "config" : { "user" : "ec2-user" } },
"hhvm" : { "enabled" : true, "config" : { "user" : "ec2-user" } },
"run_list" : [ "recipe[amimoto]" ]
}' > /opt/local/amimoto.json
else
echo '{
"nginx" : { "config" : { "user" : "ec2-user" } },
"php" : { "config" : { "user" : "ec2-user" } },
"run_list" : [ "recipe[amimoto]" ]
}' > /opt/local/amimoto.json
fi

/opt/local/provision
chown -R ec2-user:nginx /var/www/vhosts
