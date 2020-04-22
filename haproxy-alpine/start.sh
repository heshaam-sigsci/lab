#!/bin/sh
/usr/sbin/httpd -f /etc/apache2/httpd.conf
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg
/sigsci-agent
