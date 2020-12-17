#!/bin/sh

export AGENT_IP=`nslookup sigsciagent 127.0.0.11 | grep sigsciagent | grep -oe "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+"`
# sed -i 's/sigsciagent/'$AGENT_IP'/g' /opt/sigsci/nginx/sigsci.conf
sed "s/sigsciagent/${AGENT_IP}/g" /opt/sigsci/nginx/sigsci.conf > /opt/sigsci/nginx/sigsci.new.conf
nginx -g 'daemon off;'