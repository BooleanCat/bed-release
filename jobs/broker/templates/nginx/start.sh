#!/usr/bin/env bash
set -e

mkdir -p /var/vcap/sys/log/nginx
chown vcap:vcap /var/vcap/sys/log/nginx

/sbin/start-stop-daemon \
  --pidfile /var/vcap/sys/run/nginx.pid \
  --chuid vcap:vcap \
  --start \
  --exec /var/vcap/packages/bed-nginx/sbin/nginx \
  -- \
  -c /var/vcap/jobs/broker/config/nginx.conf
