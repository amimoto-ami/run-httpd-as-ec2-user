#!/usr/bin/env bash

set -e

if hhvm --version ; then
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
echo '@reboot /bin/sh /opt/local/provision > /dev/null 2>&1; chown -R ec2-user /var/www/vhosts/' | crontab

if hhvm --version ; then
    sudo service hhvm restart
else
    sudo service php-fpm restart
fi
