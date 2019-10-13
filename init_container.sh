#!/bin/sh

# Get environment variables to show up in SSH session
 eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

# starting sshd process
 sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config

 echo "starting SSH over port 2222"
 service ssh start

 echo "starting apache over port 80"
 /usr/sbin/apache2ctl -D FOREGROUND