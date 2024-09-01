#!/usr/bin/env bash

function start() {
  echo "starting $1"
  ("/etc/shepard/$1" & && \
  sleep 2 && \
  PID=$(ps ax | grep "$1" | grep -v grep | head -1 | awk '{print $1}') && \
  echo "$1 started with PID of $PID" && \
  echo "started $1 ["$(tput setaf 2)'OK'$(tput sgr0)"]") || \
  echo "started $1 ["$(tput setaf 1)'NOT OK'$(tput sgr0)"]"
}

function stop() {
  echo "stopping $1"
  PID=$(ps ax | grep "$1" | grep -v grep | head -1 | awk '{print $1}')
  (kill "$PID" && \
  echo "$1 stopped ["$(tput setaf 2)'OK'$(tput sgr0)"]") || \
  echo "$1 stopped ["$(tput setaf 1)'NOT OK'$(tput sgr0)"]"
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
