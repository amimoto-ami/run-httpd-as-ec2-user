# Run HTTPD as ec2-user

Run Nginx & PHP-FPM( or HHVM) as `ec2-user`

## What's AMIMOTO

[AMIMOTO is a High Performance WordPress Cloud Hosting on Amazon Web Services.](http://amimoto-ami.com/)

## How to use

### SSH into your instance

```
ssh ec2-user@<ip-address>
```

### Then run the following command on your instance

```
curl -L https://raw.githubusercontent.com/amimoto-ami/run-httpd-as-ec2-user/master/run-httpd-as-ec2-user.sh | sudo bash
```
