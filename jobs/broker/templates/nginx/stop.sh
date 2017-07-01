#!/usr/bin/env bash
set -e

/sbin/start-stop-daemon \
  --pidfile /var/vcap/sys/run/nginx.pid \
  --retry TERM/20/QUIT/1/KILL \
  --oknodo \
  --stop
