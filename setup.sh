#!/bin/bash

/sbin/apachectl -f /etc/httpd/conf/webapp.conf  -d /var/www/html/   # -DFOREGROUND

/sbin/haproxy -f /etc/haproxy/haproxy.local -d

