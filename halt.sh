#!/usr/bin/env bash

kill -s SIGPWR 1

PS="$(ps ax | awk '{print $1}')"

for ps in "$PS"; do
  kill -s SIGSTOP "$ps"
done

sleep 8
PS="$(ps ax | awk '{print $1}')"

for ps in "$PS"; do
  kill "$ps"
done

for dev in "$(ls -1 /media)"; do
  umount "$dev"
done

for dev in "$(ls -1 /mnt)"; do
  umount "$dev"
done

umount /boot

umount /
