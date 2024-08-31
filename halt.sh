#!/usr/bin/env bash

kill -s SIGPWR 1

PS="$(ps fax | awk '{print $1}')"

for ps in "$PS"; do
  kill -s SIGSTOP $ps
done

sleep 8
PS="$(ps fax | awk '{print $1}')"

for ps in "$PS"; do
  kill $ps
done
