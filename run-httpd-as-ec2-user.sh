#!/usr/bin/env bash

set -ex

service monit stop

echo "{
"nginx" : { "config" : { "user" : "ec2-user" } },
"php" : { "config" : { "user" : "ec2-user" } },
"run_list" : [ "recipe[amimoto]" ]
}" > /opt/local/amimoto.json

/opt/local/provision
chown -R ec2-user:nginx /var/www/vhosts
