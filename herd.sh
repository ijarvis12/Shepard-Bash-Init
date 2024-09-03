#!/usr/bin/env bash

function start() {
  echo "starting $1"
  (chmod +x "/etc/shepard/$1" && \
  /etc/shepard/$1 & && \
  sleep 2 && \
  pid=$(ps ax | grep "$1" | grep -v grep | tail -1 | awk '{print $1}') && \
  echo "$1 started with PID of $pid" && \
  echo "started $1 [ "$(tput setaf 2)'OK'$(tput sgr0)" ]") || \
  echo "started $1 [ "$(tput setaf 1)'NOT OK'$(tput sgr0)" ]"
}

function stop() {
  echo "stopping $1"
  chmod -x "/etc/shepard/$1"
  pid=$(ps ax | grep "$1" | grep -v grep | tail -1 | awk '{print $1}')
  (kill "$pid" && \
  echo "$1 stopped [ "$(tput setaf 2)'OK'$(tput sgr0)" ]") || \
  echo "$1 stopped [ "$(tput setaf 1)'NOT OK'$(tput sgr0)" ]"
}

function reload() {
  kill -s SIGHUP 1
}

case "$1" in
  start) start "$2" ;;
  stop)  stop "$2" ;;
  reload) reload ;;
  *) echo "usage $0 start|stop [service] or reload" >&2
     exit 1
     ;;
esac
