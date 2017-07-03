#!/usr/bin/env bash
set -e

mkdir -p /var/vcap/sys/log/broker
chown vcap:vcap /var/vcap/sys/log/broker

/sbin/start-stop-daemon \
  --pidfile /var/vcap/sys/run/broker.pid \
  --chuid vcap:vcap \
  --start \
  --exec /var/vcap/packages/bed-broker/bin/uwsgi \
  -- \
  --ini /var/vcap/jobs/broker/config/uwsgi.ini
