#!/bin/sh

/usr/sbin/sigsci-agent &

export KONG_NGINX_DAEMON=off
kong start

curl -i -X POST --url http://localhost:8001/plugins/ --data 'name=signalsciences'

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=example-service' \
  --data 'url=http://mockbin.org'

curl -i -X POST \
  --url http://localhost:8001/services/example-service/routes \
  --data 'hosts[]=example.com'
