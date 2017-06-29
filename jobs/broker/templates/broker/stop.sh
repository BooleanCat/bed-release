#!/usr/bin/env bash
set -e

/sbin/start-stop-daemon \
  --pidfile /var/vcap/sys/run/broker.pid \
  --retry TERM/20/QUIT/1/KILL \
  --oknodo \
  --stop
