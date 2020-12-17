#!/bin/sh
/usr/sbin/sigsci-agent &

cd /flask

gunicorn --bind 0.0.0.0:5000 wsgi
